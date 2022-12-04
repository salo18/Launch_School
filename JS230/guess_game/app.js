document.addEventListener('DOMContentLoaded', () => {
  let answer;
  let input = document.querySelector('#guess');
  let form = document.querySelector('form');
  let p = document.getElementById('text');
  let link = document.querySelector('a');
  let button = document.querySelector('[type="submit"]')
  let guesses;

  function newGame() {
    answer = Math.floor(Math.random() * 100) + 1;
    guesses = 0;
    p.textContent = 'Guess a number between 1 and 100.';
    button.disabled = false;
    form.reset();
  }

  function validGuess(num) {
    // if (parseInt(num, 10) >= 1 && parseInt(num, 10) <= 100) {
    if (Number(num) >= 1 && Number(num) <= 100) {
      return true;
    } else {
      return false;
    }
  }

  form.addEventListener('submit', event => {
    event.preventDefault();
    let guess;
    let message;

    if (validGuess(input.value)) {
      guess = parseInt(input.value, 10);
      guesses += 1;

      if (guess === answer) {
        message = `You guessed it! It took you ${guesses} guesses.`;

        button.disabled = true;
        // button.style.color = 'yellow';

      } else if (guess > answer) {
        message = `Your guess of ${guess} is higher than the number. Try again.`;
        p.style.color = 'green';

      } else if (guess < answer) {
        message = `Your guess of ${guess} is lower than the number. Try again.`;
        p.style.color = 'blue';
      }

    } else {
      message = 'Invalid guess, try again';
      p.style.color = 'red';
    }

    p.textContent = message;

    input.textContent = '';
  });

  link.addEventListener('click', event => {
    event.preventDefault();
    newGame();
  });

  newGame();
});

// clear the value in the form on each guess