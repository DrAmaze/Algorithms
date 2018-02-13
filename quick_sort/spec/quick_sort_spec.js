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


});
