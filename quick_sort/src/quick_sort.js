// Quick sort has average case time complexity O(nlogn), but worst
// case O(n**2).

// Not in-place. Uses O(n) memory.
Array.prototype.sort1 = function(comparator) {
  if (this.length <= 1) return this;

  if (typeof comparator !== "function") {
    comparator = (x, y) => {
      if (x === y) {
        return 0;
      } else if (x < y) {
        return -1;
      } else {
        return 1;
      }
    };
  }

  const pivot = this[0];
  const left = [];
  const right = [];

  for (let i = 1; i < this.length; i++) {
    if (comparator(this[i], pivot) === -1) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  return left.sort1(comparator).
    concat([pivot]).
    concat(right.sort1(comparator));
};

// In-place.
Array.prototype.sort2 = function(start = 0, length = this.length, cb) {
  if (this.length <= 1) return this;

  if (typeof cb !== "function") {
    cb = (x, y) => {
      if (x === y) {
        return 0;
      } else if (x < y) {
        return -1;
      } else {
        return 1;
      }
    };
  }

  let pivotIdx = this.partition(start, length, cb);

  this.sort2(start, pivotIdx - start, cb);
  this.sort2(pivotIdx + 1, length - (pivotIdx + 1), cb);
  return this;
};

Array.prototype.partition = function(start, length, cb) {
  if (cb === undefined) {
    cb = function(x, y) {
      if(x > y) {
        return 1;
      } else {
        return 0;
      }
    };
  }

  let pivotIdx = start + 1;
  let temp;

  for(let idx = start + 1; idx < (start + length); idx++) {
    if(cb(this[idx], this[start]) === 1) {
      pivotIdx++;
    } else {
      temp = this[idx];
      this[idx] = this[pivotIdx];
      this[pivotIdx] = temp;
    }
  }

  if (start === 0) {
    pivotIdx--;
  }

  temp = this[start];
  this[start] = this[pivotIdx];
  this[pivotIdx] = temp;
  return pivotIdx;
};
