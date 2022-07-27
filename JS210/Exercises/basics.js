// 1
// const paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
//                 ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
//                 dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
//                 ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
//                 diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \
//                 hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
// console.log(paragraph);


// 2
// const myBoolean = true;
// const myString = 'hello';
// const myArray = [];
// const myOtherString = '';

// if (myBoolean) {
//   console.log('Hello');
//   // truthy
// }

// if (!myString) {
//   console.log('World');
//   // falsy
// }

// if (!!myArray) {
//   console.log('World');
//   // truthy
// }

// if (myOtherString || myArray) {
//   console.log('!');
//   // truthy
// }

// 5
// const sync = require("readline-sync");

// console.log(`Enter the first number`);
// let num1 = sync.prompt();

// console.log(`Enter the second number`);
// let num2 = sync.prompt();

// console.log(`${num1} + ${num2} = ${num1+num2}`);
// console.log(`${num1} - ${num2} = ${num1-num2}`);
// console.log(`${num1} * ${num2} = ${num1*num2}`);
// console.log(`${num1} / ${num2} = ${num1/num2}`);
// console.log(`${num1} ** ${num2} = ${num1**num2}`);

// // 6
// const sync = require("readline-sync");

// console.log(`Enter a phrase`);
// let ogPhrase = sync.prompt()
// let phrase = ogPhrase.match(/[A-Z]/gi).length;

// console.log(`There are ${phrase} characters in ${ogPhrase}`);
// alternate solution
// const prompt = require("prompt-sync")
// const input = prompt('enter a phrase:');
// const numChar = String(input.length);
// console.log(`There are ${numChar} characters in ${input}`);

// // 7
// const DIGITS = {
//   '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
//   '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
// };

// let stringToInteger = string => {
//   let value = 0;
//   const numbers = stringToNumbers(string)
//   for (let i = 0; i < numbers.length; i += 1) {
//     value = (10 * value) + numbers[i];
//   }

//   console.log(value);
// }

// let stringToNumbers = string => {
//   const result = [];

//   for (let i = 0; i < string.length; i += 1) {
//     result.push(DIGITS[string[i]]);
//   }

//   return result;
// }
// // stringToInteger('4321');      // 4321
// // stringToInteger('570');       // 570

// // 8

// let stringToSignedInteger = string => {
//   if (string[0] === '-') {
//     return -stringToInteger(string.slice(1));
//   } else if (string[0] === '+') {
//     return stringToInteger(string.slice(1));
//   } else {
//     return stringToInteger(string);
//   }
// }


// stringToSignedInteger('4321');      // 4321
// stringToSignedInteger('-570');      // -570
// stringToSignedInteger('+100');      // 100

// // 9
// const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

// function integerToString(number) {
//   let result = '';

//   do {
//     let remainder = number % 10;
//     number = Math.floor(number / 10);

//     result = DIGITS[remainder] + result;
//   } while (number > 0);

//   return result;
// }
// // integerToString(4321);      // "4321"
// // integerToString(0);         // "0"
// // integerToString(5000);      // "5000"

// // 10
// let signedIntegerToString = num => {
//   if (num > 0) {
//     console.log('+' + integerToString(num));
//   } else if (num < 0) {
//     console.log('-' + integerToString(-num));
//   } else if (num === 0) {
//     console.log("0");
//   }
// }


// signedIntegerToString(4321);      // "+4321"
// signedIntegerToString(-123);      // "-123"
// signedIntegerToString(0);         // "0"

