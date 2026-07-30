String calculate(double num1,String op,double num2 ){
  double total = 0;
  switch(op){
    case '+':
      total = num1 + num2 ;
      break;
    case '-':
      total = num1 - num2;
      break;
    case '*':
      total = num1 * num2;
      break;
    case '/':
      if (num2 == 0){
        return "Error: Can't divide by 0";
      }
      total = num1 / num2;
      break;

    default:
      return "Error: Invalid operator";
  }

  return total.toString();
}
