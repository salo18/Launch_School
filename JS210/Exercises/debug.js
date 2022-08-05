// // 1
// function randomGreeting() {
//   const words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
//                'Greetings', 'Salutations', 'Good to see you'];

//   const idx = Math.floor(Math.random() * words.length);

//   return words[idx]; // need an explicit return
// }

// function greet(...args) {
//   const names = Array.prototype.slice.call(args);

//   for (let i = 0; i < names.length; i++) {
//     const name = names[i];
//     const greeting = randomGreeting(); // not properly invoking the function -- need ()

//     console.log(`${greeting}, ${name}!`);
//   }
// }

// greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');


// 2
// function includesFalse(list) {
//   for (let i = 0; i < list.length; i++) {
//     let element = list[i];

//     if (element == false) { // need === instead of ==
//       return true;
//     }
//   }

//   return false;
// }
//                                                                   // returns:
// includesFalse([8, null, 'abc', true, 'launch', 11, false]);       // true
// includesFalse(['programming', undefined, 37, 64, true, 'false']); // false
// includesFalse([9422, 'lambda', true, 0, '54', null]);             // true

// 3
// function placeABet(guess) {
//   (function generateRandomInt() { // function expression needs to be converted to function declaration
//     return Math.floor(Math.random() * 25) + 1;
//   });

//   const winningNumber = generateRandomInt();

//   if (guess < 1 || guess > 25) {
//     return 'Invalid guess. Valid guesses are between 1 and 25.';
//   }

//   if (guess === winningNumber) {
//     return "Congratulations, you win!";
//   } else {
//     return "Wrong-o! You lose.";
//   }
// }

// const userGuess = parseInt(prompt('Input a guess between 1-25'), 10);
// alert(placeABet(userGuess));

// // 4
// function wantToVisit(museum, city) {
//   // if (city === 'Amsterdam' || museum.includes('Andy Warhol')) {
//   //   return true;
//   // } else {
//   //   return museum.includes('Computer')
//   //     || museum.includes('Science')
//   //     && !(
//   //       museum.includes('Modern')
//   //       && museum.includes('Art')
//   //     );
//   // }
//   function wantToVisit(museum, city) {
//     return  museum.includes('Computer')
//          || museum.includes('Science')
//          || (museum.includes('Modern')
//             && museum.includes('Art')
//             && (museum.includes('Andy Warhol')
//                || city === 'Amsterdam'));
//   }
// }


// // Tests (should all print 'true')

// console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
// console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
// console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
// console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
// console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
// console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
// console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
// console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
// console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
// console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);

// // 5
// const transactionLog = [];

// function processInput(input) {
//   const numericalData = parseFloat(input);

//   if (Number.isNaN(numericalData)) {
//     throw (new Error('Data could not be converted to numerical amount.'));
//   }

//   return numericalData;
// }

// function logTransaction() {
//   let data = prompt('Please enter the transaction amount: ');

//   try {
//     data = processInput(data);
//     transactionLog.push(data);

//     alert('Thank you. Data accepted.');
//   } catch {
//     alert(error.message);
//   }
// }

// function transactionTotal() {
//   let total = 0;

//   for (let i = 0; i < transactionLog.length; i++) {
//     total += transactionLog[i];
//   }

//   return total;
// }

// logTransaction();
// logTransaction();
// logTransaction();

// console.log(transactionTotal());

// 6
// const species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
// const isMidnight = true;
// const isFullmoon = true;

// function isTransformable(species) {
//   return species[0] === 'w';
// }

// function transform(species) {
//   return `were${species}`;
// }

// for (let index = 0; index < species.length; index++) {
//   const thisSpecies = species[index];
//   var newSpecies; // change to let from var

//   if (isMidnight && isFullmoon && isTransformable(thisSpecies)) {
//     newSpecies = transform(thisSpecies);
//   }

//   if (newSpecies) {
//     console.log(`Beware of the ${newSpecies}!`);
//   }
// }

// 7
// Roles (salary still to be determined)

// const ceo = {
//   tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
//   salary: 0,
// };

// const developer = {
//   tasks: ['turn product vision into code'],
//   salary: 0,
// };

// const scrumMaster = {
//   tasks: ['organize scrum process', 'manage scrum teams'],
//   salary: 0,
// };

// // Team -- we're hiring!

// const team = {};

// // let ceo1 = 'ceo';
// team.ceo = 'Kim'; // need to define the variables
// // trying to add key value pairs but the variables don't reference anything
// // need to use a unique name since ceo and other roles have been assigned to a const variable
// team.scrumMaster = 'Alice';
// team.developer = undefined;

// const company = {
//   name: 'Space Design',
//   team,
//   projectedRevenue: 500000,
// };

// // need to make the keys strings to be accessible
// console.log(`----{ ${company.name} }----`);
// console.log(`CEO: ${company.team['ceo']}`);
// console.log(`Scrum master: ${company.team['scrumMaster']}`);
// console.log(`Projected revenue: $${company.projectedRevenue}`);

// ----{ Space Design }----
// CEO: undefined
// Scrum master: undefined
// Projected revenue: $500000


// 8
// The shopping cart is a list of items, where each item
// is an object { name: <string>, amount: <number> }.
// let shoppingCart = [];

// // Currently available products with prices.
// const prices = {
//   'notebook': 9.99,
//   'pencil': 1.70,
//   'coffee': 3.00,
//   'smoothie': 2.10,
// };

// function price({name}) {
//   return prices[name];
// }

// // Adding an item to the shopping cart.
// // The amount is optional and defaults to 1.
// // If the item is already in the cart, its amount is updated.
// function updateCart(name, amount) {
//   amount = amount || 1;

//   let alreadyInCart = false;

//   for (let i = 0; i < shoppingCart.length; i += 1) {
//     let item = shoppingCart[i];

//     if (item.name === name) {
//       item.amount = amount;
//       alreadyInCart = true;
//       break;
//     }
//   }

//   if (!alreadyInCart) {
//     shoppingCart.push({ name, amount });
//   }
// }

// // Calculating the price for the whole shopping cart.
// function total() {
//   let total = 0;

//   for (let i = 0; i < shoppingCart.length; i += 1) {
//     let item = shoppingCart[i];

//     total += (item.amount * price(item));
//   }

//   return total.toFixed(2);
// }

// function pay() {
//   // omitted

//   console.log(`You have been charged $${total()}.`);
// }

// function checkout() {
//   pay();
//   shoppingCart = [];
// }

// // Example purchase.

// updateCart('notebook');
// updateCart('pencil', 2);
// updateCart('coffee', 1);
// // "Oh, wait, I do have pencils..."
// updateCart('pencil', 0); // MISTAKE OCCURS HERE -- 0 is falsy so amount is set to point to 1, so a pencil is added to the cart

// checkout();
// // You have been charged $14.69.

// //


// 9
// const totalPages = 364;
// let energy = 100;
// let currentPage = 1;

// function read() {
//   while (energy > 0 && currentPage < totalPages) {
//     currentPage += 1;
//     energy -= (5 + (currentPage * 0.1));
//   }

//   console.log(`Made it to page ${String(currentPage)}.`);

//   // Drink a cup of coffee.
//   energy = 100;

//   // Continue reading.
//   if (currentPage < totalPages) {
//     read(); // MISTAKE HAPPENS HERE
//     // we are calling the read function from within the read function so currentPage is always reassigned to 1
//   } else {
//     console.log('Done!');
//   }
// }

// read();





// function test() {
//   console.log(arr); // hoisting will bring up the var declaration to the top of the function scope. the value will be set to undefined and thus the code logs undefined (no error)
//   var arr; //= "asdf";

//   function doSomething() {
//     console.log(str); // hoisting will bring up the let declaration to the top of the function scope but the value will be unset and thus in the Temporal Dead Zone, causing a ReferrenceError to log
//     let str;
//     console.log(str); // if line 6 is commented out this line logs undefined because skipping Temporal dead zone of hoisting and variable set to undefined.
//     str = 'hi';
//     arr = [1, 2, 3]
//   }

//   doSomething();

//   console.log(str);
// }

// test();


let x;
if (x = 5) {
  console.log('reassigned');
} else {
  console.log('its undefined');
}