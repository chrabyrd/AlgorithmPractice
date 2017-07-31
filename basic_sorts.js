function binarySearch(sortedArray, target) {
  if (sortedArray.length === 0) return "NOT FOUND";

  const midpoint = parseInt(sortedArray.length / 2);
  const midVal = sortedArray[midpoint];

  if (target === midVal) {
    // possibleLeft = binarySearch(sortedArray.slice(0, midpoint), target);
    // return (possibleLeft === "NOT FOUND") ? midpoint : possibleLeft;

    possibleRight = binarySearch(sortedArray.slice(midpoint + 1), target);
    return (possibleRight === "NOT FOUND") ? midpoint : possibleRight + midpoint + 1;

  } else if (target < midVal) {
    return binarySearch(sortedArray.slice(0, midpoint), target);
  } else {
    idx = binarySearch(sortedArray.slice(midpoint + 1), target);
    if (idx === "NOT FOUND") return "NOT FOUND";
    return idx + midpoint + 1;
  }
}

const ans = binarySearch([1, 1, 1, 1, 2, 3, 4, 7, 8, 9, 15, 25, 88, 88, 88], 1);
console.log(ans);
