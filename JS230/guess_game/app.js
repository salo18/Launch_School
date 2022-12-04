document.addEventListener('DOMContentLoaded', () => {
  let answer;
  let input = document.querySelector('#guess');
  let form = document.querySelector('form');
  let p = document.getElementById('text');
  let link = document.querySelector('a');

  function newGame() {
    answer = Math.floor(Math.random() * 100) + 1;
    guesses = 0;
    p.textContent = 'New game started. Try guessing again';
  }

  form.addEventListener('submit', event => {
    event.preventDefault();
    let guess = parseInt(input.value, 10);
    console.log('guess was', guess);
    let message;

    guesses += 1;

    if (guess === answer) {
      message = `You guessed it! You took ${guesses} guesses`;

    } else if (guess > answer) {
      message = `Your guess of ${guess} is higher than the number. Try again.`;
      message.styles.color = 'green';

    } else if (guess < answer) {
      message = `Your guess of ${guess} is lower than the number. Try again.`;
      message.style.color = 'red';
    }

    p.textContent = message;
  });

  link.addEventListener('click', event => {
    event.preventDefault();
    newGame();
  });

  newGame();
});

// document.addEventListener('DOMContentLoaded', function() {
//   let form = document.querySelector('form');
//   let input = document.querySelector('#guess');
//   let paragraph = document.querySelector('p');
//   let link = document.querySelector('a');
//   let answer;
//   let guesses;

//   function newGame() {
//     answer = Math.floor(Math.random() * 100) + 1;
//     guesses = 0;
//     paragraph.textContent = 'Guess a number from 1 to 100';
//   }

//   form.addEventListener('submit', event => {
//     event.preventDefault();

//     let guess = parseInt(input.value, 10);
//     let message;

//     guesses += 1;

//     if (guess === answer) {
//       message = `You guessed it! It took you ${guesses} guesses.`;
//     } else if (guess > answer) {
//       message = `My number is lower than ${guess}`;
//     } else {
//       message = `My number is higher than ${guess}`;
//     }

//     paragraph.textContent = message;
//   });

//   link.addEventListener('click', event => {
//     event.preventDefault();
//     newGame();
//   });

//   newGame();
// });