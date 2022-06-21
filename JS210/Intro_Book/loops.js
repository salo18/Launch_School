// let counter = 1;
// while (counter <= 10) {
//   console.log(counter);
//   counter = counter + 1;
// }

// while loop
// let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
// let upperNames = [];
// let index = 0;

// while (index < names.length) {
//   let upperCaseName = names[index].toUpperCase();
//   upperNames.push(upperCaseName);
//   index += 1;
// }

// console.log(upperNames);

// // do/while loop
// let answer;
// do {
//   answer = prompt('Do you want to do that again?');
// } while (answer === 'y');

// for loop
// let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
// let upperNames = [];

// for (let index = 0; index < names.length; index += 1) {
//   let upperCaseName = names[index].toUpperCase();
//   upperNames.push(upperCaseName);
// }

// console.log(upperNames);

// let array = [3, 1, 5, 9, 2, 6, 4, 7];
// let indexOfFive = -1;

// for (let i = 0; i < array.length; i += 1 ) {
//   if (array[i] === 5) {
//     indexOfFive = i;
//     break;
//   }
// }

// console.log(indexOfFive);


// 1
// let sync = require('readline-sync');
// let age = sync.question('How old are you?');
// age = parseInt(age);
// console.log(`You are ${age} years old`);
// for (let future = 10; future <= 40; future += 10) {
//   console.log(`In ${future} years, you will be ${age + future} years old.`)
// }

// 2
// function factorial(number) {
//   let result = 1;
//   for (let counter = number; counter > 0; counter -= 1) {
//     result *= counter
//   }
//   return result;
// }

// console.log(factorial(5));

// 4
// for (let i = 0; i < 5;) {
//   console.log(i += 1);
// }

// 5
// function randomNumberBetween(min, max) {
//   return Math.floor(Math.random() * (max - min + 1) + min);
// }

// let tries = 0;
// let result;

// do {
//   result = randomNumberBetween(1, 6);
//   tries += 1;
// } while (result <= 2);

// console.log('It took ' + String(tries) + ' tries to get a number greater than 2');

// // 6
// function factorial(number) {
//   if (number === 1) {
//     return 1;
//   }

//   return number * factorial(number - 1);
// }

