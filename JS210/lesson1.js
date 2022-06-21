// VARIABLES AND NUMBERS

// let numerator = 10;

// const DENOMINATOR = 2;

// let answer = numerator / DENOMINATOR;
// console.log(answer);

// let incrementer = 1;

// let start = incrementer;

// let end;
// let difference;

// incrementer += 1;
// incrementer += 1;
// incrementer += 1;

// incrementer++;
// incrementer++;

// end = incrementer;
// difference = end - start;
// console.log(end);
// console.log(difference);

// answer = (11 + 31) * 3;
// console.log(answer);


// let arr = [1, 2, 3];
// arr.forEach((num, num2) => {
//   console.log(num)
// });

// PRIMITIVE TYPS AND COERCION
// let x = '13';
// let y = 9;

// console.log(Number(x) + y);

// console.log(x * y);

// let npa = 212;
// let nxx = 555;
// let num = 1212;

// console.log(String(npa) + String(nxx) + String(num));


// let bool = true;
// let arr = [1, 2, 3];

// console.log(bool.toString());

// OPERATORS AND CONDITIONALS
// let apples = 3;
// let bananas = 3;
// let areEqual = (apples === bananas);
// // if (apples === bananas) {
// //   console.log("That's true!");
// // } else if (apples == bananas) {
// //   console.log('they are equal but not strictly equal')
// // } else {
// //   console.log("Try again...");
// // }

// if areEqual {
//   console.log("That's true!");
// } else if (apples == bananas) {
//   console.log('they are equal but not strictly equal')
// } else {
//   console.log("Try again...");
// }


let apples = 3;
let bananas = undefined;
let eitherOr = apples || bananas;
console.log(eitherOr);

bananas = 1;
eitherOr = apples || bananas;
console.log(eitherOr);

let lastName = 'Smith';
let familyMessage = lastName === 'Smith' ? "You're part of the family" : "Sorry, you aren't";