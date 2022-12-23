/*
pedac:
// - on form submit, save the variables for both operands and the sign
// - convert the strings into numbers
// - perform the appropriate calculations
// - replace the text with the result of the most recent calculation

extend the functionality
// - save recent operations below the calculator form
- perform an operation on the results of the past 10
  - example - add/subtract/multiply/divide the answers for the last 10 results
- click on a previous operation and load it back into the calculator as an "easy repeat" feature
  - add option to repeat operation when hovering over the operation
- change the theme / colors for each operation
  - red for +, yellow for -, etc

*/


document.addEventListener('DOMContentLoaded', () => {

  const form = document.querySelector('form');
  const resultElement = document.querySelector('#result p');

  const history = document.querySelector('#history');

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const operand1 = Number(document.getElementById('operand1').value);
    const operand2 = Number(document.getElementById('operand2').value);
    const operator = document.getElementById('operator').value;

    let result;

    switch (operator) {
      case '+':
        result = operand1 + operand2;
        break;
      case '-':
        result = operand1 - operand2;
        break;
      case '*':
        result = operand1 * operand2;
        break;
      case '/':
        result = operand1 / operand2;
        break;
    }

    resultElement.textContent = result;

    const newHistory = document.createElement('li');
    const newLink = document.createElement('a');
    newLink.href = '#';
    newLink.appendChild(document.createTextNode(`${operand1} ${operator} ${operand2} = ${result}`));
    newHistory.appendChild(newLink);
    history.appendChild(newHistory);

    // const o1 = document.getElementById('#operand1');
    // const o2 = document.getElementById('#operand2');
    // const ooperator = document.getElementById('operator').value;

    // console.log(o1)

  });

  // WHEN CLICK ON SPECIFIC LINK, auto populate the form inputs with the correct values -- parse the innerText of the link and assign to the form input values?

  history.addEventListener('click', (e) => {
    e.preventDefault();

  });

});
