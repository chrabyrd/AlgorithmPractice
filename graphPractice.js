var pathSum = function(root, sum) {
    if (root === null) return;

    const retArr = [];

    const findSum = (node, numArr = []) => {
        if (node === null) return;

        const dupArr = [...numArr];

        dupArr.push(node.val);

        const currentVal = dupArr.reduce((sum, val) => sum + val);

        if (currentVal === sum) {
            retArr.push(dupArr);
            return;
        } else if (currentVal > sum) {
            return;
        } else {
            findSum(node.left, dupArr);
            findSum(node.right, dupArr);
        }
    };

    findSum(root);

    return retArr;
};

var intersection = function(nums1, nums2) {
    const retHash = {};
    const hash = {};

    nums1.forEach(num => hash[num] = true);

    nums2.forEach(num => {
       if (hash[num]) retHash[num] = true;
    });

    return Object.keys(retHash).map(val => parseInt(val));
};
