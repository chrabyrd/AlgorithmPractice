function npmCalculator() {

  let numbers = [];
  let total = 0;

  return function(val) {
    if (Number.isInteger(val)) {
      numbers.push(val);
    } else if (numbers.length > 0){

      switch (val) {
        case '+':
          numbers.forEach(num => total += num);
          break;
        case "-":
          numbers.forEach(num => total -= num);
          break;
        case "*":
          numbers.forEach(num => total *= num);
          break;
        case "/":
          numbers.forEach(num => total /= num);
          break;
        default:
          return "ERROR"
      }

      numbers = [];      
      console.log(total);
      return total;
    }
  };
};


const calculator = npmCalculator();
calculator(3);
calculator(6);
calculator('+');
calculator('+');
calculator(6);
calculator('-');
calculator(4);
calculator('*');
calculator(2);
calculator('-');
