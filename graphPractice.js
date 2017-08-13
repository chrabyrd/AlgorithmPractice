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
