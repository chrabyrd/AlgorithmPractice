const binarySearch = (arr, targ) => {
  if (arr.length === 0) return "NOT FOUND";

  const midpoint = Math.floor(arr.length / 2);
  const midVal = arr[midpoint];

  if (midVal === targ) {
    return midpoint;
  } else if (midVal > targ) {
    return binarySearch(arr.slice(0, midpoint), targ);
  } else {
    const answer = binarySearch(arr.slice(midpoint + 1), targ);
    if (answer === "NOT FOUND") return "NOT FOUND";

    return midpoint + answer + 1;
  }

};

const arr = [1, 2, 6, 7, 9, 12, 33, 56, 76, 888, 1234];

console.log(binarySearch(arr, 76));
