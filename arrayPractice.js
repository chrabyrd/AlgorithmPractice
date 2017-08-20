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
       if (!retKey || hash[key] > hash[retKey]) retKey = key;
    });

    return parseInt(retKey);
};

const generateMatrix = function(n) {
    if (n === 0) return [];

    const retArr = [];
    let count = Math.pow(n, 2);

    const padLeft = () => {
        if (count === 0) return;
        retArr.forEach(subArr => subArr.unshift(count--));
    };

    const padBottom = () => {
        if (count === 0) return;
        const subArr = [];
        while (subArr.length < retArr[0].length) {
            subArr.push(count--);
        }

        retArr.push(subArr);
    };

    const padRight = () => {
        if (count === 0) return;

        retArr.forEach((_, idx) => retArr[(retArr.length - 1 - idx)].push(count--));
    };

    const padTop = () => {
        if (count === 0) return;
        const subArr = [];
        while (subArr.length < retArr[0].length) {
            subArr.unshift(count--);
        }

        retArr.unshift(subArr);
    };

    {
        retArr.push([count]);
        count--;
    }

    do {
        padLeft();
        padBottom();
        padRight();
        padTop();
    } while (count > 0)

    return (n % 2 === 0) ? retArr.map(subArr => subArr.reverse()).reverse() : retArr
};
