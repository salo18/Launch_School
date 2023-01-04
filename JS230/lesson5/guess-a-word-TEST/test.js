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

document.addEventListener('DOMContentLoaded', () => {
  class Game {
    constructor() {
      this.words = ['RELUCTANCE', 'OCCUPATION', 'COMPREHENSIVE', 'EMBARRASSMENT', 'INVESTIGATION', 'REVOLUTIONARY'];
      this.word = this.randomWord(this.words, this.words.length);

      this.guesses = [];

      this.guessCounter = 0;

      this.createWord();
      this.playGame();
      console.log(this.word);
    }

    randomWord(array, length) {
      let index = Math.floor(Math.random() * length);
      let word = array[index];
      array.splice(index, 1);
      return word;
    }

    createWord() {
      let wordH2 = document.getElementById('word');
      this.word.split('').forEach(letter => {
        let newSpan = document.createElement('span');
        wordH2.appendChild(newSpan);
      });
    }

    playGame() {
      let replay = document.getElementById('replay');
      replay.addEventListener('click', (e) => {
        e.preventDefault();

        location.reload();
      });

      console.log(this.word);
      let wordH2 = document.getElementById('word');
      let guessesH2 = document.getElementById('guesses');


      let wordArr = wordH2.querySelectorAll('span');
      let guessesArr = guessesH2.querySelectorAll('span');

      let message = document.getElementById('message');
      message.textContent = 'You have 6 guesses left!';

      document.addEventListener('keydown', (e) => {
        e.preventDefault();

        const letter = e.key.toUpperCase();
        const code = e.keyCode;

        let newSpan = document.createElement('span'); // only use for guesses since the word already has span elements from first event listener

        let newContent = document.createTextNode(letter);


        // console.log(this.guessCounter);
        if (this.guessCounter > 5) {
          // console.log('game over')
          // e.stopImmediatePropagation();
          // e.removeEventListener();

          this.gameOver();
        }

        if (this.word.includes(letter)) {
          this.word.split('').forEach((le, idx) => {
            if (le === letter) {
              wordArr[idx].textContent = le;
            }
          });

          if (!this.guesses.includes(letter)) {
            this.guesses.push(letter);
            newSpan.appendChild(newContent);
            guessesH2.appendChild(newSpan);
          }
        } else if (!this.word.includes(letter) && !this.guesses.includes(letter) && code >= 65 && code <= 90) {
          // if (this.guessCounter === 5) {
          //   e.stopPropagation();
          // }

            this.guesses.push(letter);
            newSpan.appendChild(newContent);
            guessesH2.appendChild(newSpan);

            this.guessCounter += 1;
            const apples = document.getElementById('apples');
            apples.classList.add(`guess${this.guessCounter}`);
            console.log(this.guessCounter);
            if (6 - this.guessCounter > 1 ) {
              message.textContent = `You have ${6 - this.guessCounter} guesses left!`;
            } else if (6 - this.guessCounter === 1) {
              message.textContent = `You have ${6 - this.guessCounter} guess left!`;
            } else if (6 - this.guessCounter < 1) {
              message.textContent = `You lose!`;
            }

          }

      });
    }

    gameOver() {
      console.log('you lose!');
      let message = document.getElementById('message');
      message.textContent = `Game over!`;
    }
  }

  let game = new Game;
});
