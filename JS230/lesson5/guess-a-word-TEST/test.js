/*
- start with an array of words
- user picks a letter
- if correct, letter gets added to the position of the word
- if incorrect, letter gets added to Guesses list
- after 5 failed guesses, the game ends
- user gets the option to try again with a new word from the array
- after x amount of games, the game is over since the user has used all the words
- make the 'play another game' link only show up when the game ends


Extend the app ---
- rather than pick a word from a predefined array, use an API to pull in a random word
- if the user loses the game, tell the user the word that they were trying to guess
- add animation to the apples
- for every wrong guess, make a little alert box letting the user know
  - you've already used that letter (and incorrect letter lights up red in the list of guesses)
  - or the letter is not included in the word and the letter gets added to the guesses list
- make a reset button -- rest the game halfway through

*/

const randomWord = (array, length) => {
  let index = Math.floor(Math.random() * length);

  let word = array[index];
  array.splice(index, 1);
  return word;
}

document.addEventListener('DOMContentLoaded', () => {
  let words = ['RELUCTANCE', 'OCCUPATION', 'COMPREHENSIVE', 'EMBARRASSMENT', 'INVESTIGATION', 'REVOLUTIONARY'];

  let word = randomWord(words, words.length);

  let wordH2 = document.getElementById('word');
  let guessesH2 = document.getElementById('guesses');

  console.log(word);

  word.split('').forEach(letter => {
    let newSpan = document.createElement('span');
    wordH2.appendChild(newSpan);
  });

  let wordArr = wordH2.querySelectorAll('span');
  let guessesArr = guessesH2.querySelectorAll('span');

  let guesses = [];

  let guessCounter = 0;

  document.addEventListener('keydown', (e) => {
    e.preventDefault();

    const letter = e.key.toUpperCase();
    const code = e.keyCode;

    let newSpan = document.createElement('span'); // only use for guesses since the word already has span elements from first event listener

    let newContent = document.createTextNode(letter);

    if (word.includes(letter)) {
      word.split('').forEach((le, idx) => {
        if (le === letter) {
          wordArr[idx].textContent = le;
        }
      });

      if (!guesses.includes(letter)) {
        guesses.push(letter);
        // console.log(guesses);
        newSpan.appendChild(newContent);
        guessesH2.appendChild(newSpan);
      }
    } else if (!word.includes(letter) && !guesses.includes(letter) && code >= 65 && code <= 90) {
        // /[A-Z]/.test(letter)
        guesses.push(letter);
        newSpan.appendChild(newContent);
        guessesH2.appendChild(newSpan);

        guessCounter += 1;
        const apples = document.getElementById('apples');
        apples.classList.add(`guess${guessCounter}`);
      }
  });

  // create a reset function
  //  - resets the word
  //  - resets the guess count
  //  - resets the guesses array



  class Game {
    constructor() {

    }


  }


  // randomWord(words, words.length);
  // randomWord(words, words.length);
  // randomWord(words, words.length);
  // randomWord(words, words.length);
  // randomWord(words, words.length);

});



// if (!guesses.includes(letter) && code >= 65 && code <= 90 ) {
      //   // /[A-Z]/.test(letter)
      //   guesses.push(letter);
      //   newSpan.appendChild(newContent);
      //   guessesH2.appendChild(newSpan);

      //   guessCounter += 1;
      //   const apples = document.getElementById('apples');
      //   apples.classList.add(`guess${guessCounter}`);

      // }
    // }