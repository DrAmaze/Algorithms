describe('QuickSort', () => {

  describe('partition', () => {
    let arr;
    let pivotIdx;

    it('partitions the whole array properly', () => {
      arr = [3, 1, 5, 2, 4];
      pivotIdx = arr.partition(0, 5);

      expect(arr[0] && arr[1]).toBeLessThan(arr[2]);
      expect(arr[3] && arr[4]).toBeGreaterThan(arr[2]);
      expect(pivotIdx).toEqual(2);
    });

    it('partitions a portion of the array', () => {
      arr = [4, 3, 2, 1, 7, 5, 8, 6];
      pivotIdx = arr.partition(4, 4);
      // Should not touch left half of the array
      expect(arr.slice(0, 4)).toEqual([4, 3, 2, 1]);

      expect(arr[4] && arr[5]).toBeLessThan(arr[6]);
      expect(arr[7]).toBeGreaterThan(arr[6]);
      expect(pivotIdx).toEqual(6);
    });
  });

  describe('sort2', () => {
    let arr;
    it('sorts an array', () => {
      arr = [5, 3, 4, 2, 1, 6];
      arr.sort2();
      expect(arr).toEqual([1, 2, 3, 4, 5, 6]);
    });

    it('makes the right number of comparisons (good case)', () => {
      arr = [4, 2, 1, 3, 6, 5, 7];
      let num = 0;
      let cb = function(x, y) {
        num += 1;
        return x > y ? 1 : 0;
      };
      arr.sort2(cb(num));
      expect([10, 11]).toContain(num);
    });

    it('makes the right number of comparisons (worst case)', () => {
      arr = [1, 2, 3, 4, 5];
      let num = 0;
      let cb = function(x, y) {
        num += 1;
        return x > y ? 1 : 0;
      };
      arr.sort2(cb(num));
      expect([8, 10]).toContain(num);
    });
  });
});
