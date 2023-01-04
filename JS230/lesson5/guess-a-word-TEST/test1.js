
// document.addEventListener('DOMContentLoaded', () => {
//   class Game {
//     constructor() {
//       this.fetchWord();
//     }

//     fetchWord() {
//       let number = Math.floor(Math.random() * 1154);

//       fetch(`https://pokeapi.co/api/v2/pokemon/${number}`)
//       .then(res => res.json())
//       .then(res => this.poke = res.name)
//       .catch(err => console.error(err));

//       setTimeout(() => {
//         console.log(this.poke); // after two seconds, this logs a random pokemon name
//       }, 2000)
//     }

//     printWord() {
//       console.log(this.poke); // logs undefined
//     }
//   }

//   let game = new Game;
//   game.printWord();
//   console.log(this.poke); // logs undefined
// });


  // fetchWord() {
    //   let poke;

    //   let number = Math.floor(Math.random() * 1154);

    //   fetch(`https://pokeapi.co/api/v2/pokemon/${number}`)
    //   .then(res => res.json())
    //   .then(res => poke = res);

    //   setTimeout(() => {
    //     this.poke = poke.name;
    //     // console.log(this.poke);
    //   }, 2000)

    //   // const options = {
    //
    //   // };

    //   // let result;

    //   // fetch('', options)
    //   //   .then(response => response.text())
    //   //   .then(function(result){

    //   //   })
    //   //   // .then(res => result = res)
    //   //   .catch(err => console.error(err));
    // }


document.addEventListener('DOMContentLoaded', () => {
  let poke;

  async function fetchWord() {
    let number = Math.floor(Math.random() * 1154);

    poke = await fetch(`https://pokeapi.co/api/v2/pokemon/${number}`)
    .then(res => res.json())
    .then(res => res.name)
    .catch(err => console.error(err));
  }

  fetchWord();
  console.log(poke);
});
