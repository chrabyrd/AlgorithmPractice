
const quickSort = arr => {
  if (arr.length <= 1) return arr;

  const pivot = arr[0];

  const left = arr.slice(1).filter(val => val <= pivot);
  const right = arr.slice(1).filter(val => val > pivot);

  const sortedLeft = quickSort(left);
  const sortedRight = quickSort(right);

  return sortedLeft.concat(pivot, sortedRight);
}

const mergeSort = arr => {
  if (arr.length <= 1) return arr;

  const midpoint = arr.length / 2;
  const sortedLeft = mergeSort(arr.slice(0, midpoint));
  const sortedRight = mergeSort(arr.slice(midpoint));

  return merge(sortedLeft, sortedRight);
}

const merge = (leftArr, rightArr) => {
  const retArr = [];

  while (leftArr.length !== 0 && rightArr.length !== 0) {
    if (leftArr[0] < rightArr[0]) {
      retArr.push(leftArr.shift());
    } else {
      retArr.push(rightArr.shift());
    }
  }

  return retArr.concat(leftArr, rightArr);
}

const arr = [2, 3, 5, 1, 3, 7, 4, 3, 8, 8, 9, 4, 3, 2, 7, 4];

console.log(quickSort(arr));
console.log(mergeSort(arr));
