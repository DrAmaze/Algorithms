// Quick sort has average case time complexity O(nlogn), but worst
// case O(n**2).

// Not in-place. Uses O(n) memory.
Array.prototype.sort1 = function() {

};

// In-place.
Array.prototype.sort2 = function(start = 0, length = this.length, cb) {


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
    console.log(this);
    if(cb(this[idx], this[start]) === 1) {
      temp = this[idx];
      this[idx] = this[pivotIdx];
      this[pivotIdx] = temp;
      pivotIdx++;
    }
  }

  pivotIdx--;
  temp = this[start];
  this[start] = this[pivotIdx];
  this[pivotIdx] = temp;
  return pivotIdx;
};
