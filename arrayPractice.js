const majorityElement = function(nums) {
    const hash = {};
    let retKey = null;

    nums.forEach(num => {
       let strNum = num.toString();

       if (hash[strNum]) {
           hash[strNum] += 1;
       } else {
           hash[strNum] = 1;
       }
    });

    Object.keys(hash).forEach(key => {
       if (!retKey || hash[key] > hash[retKey]) {
           retKey = key;
       }
    });

    return parseInt(retKey);
};
