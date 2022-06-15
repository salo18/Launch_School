// if (x === 3) {                          // Example 1
//   console.log("x is 3");
// }

// if (x === 3) {                          // Example 2
//   console.log("x is 3");
// } else {
//   console.log("x is NOT 3");
// }

// if (x === 3) console.log("x is 3");     // Example 3

// if (x === 3)                            // Example 4
//   console.log("x is 3");

// if (x === 3)                            // Example 5
//   console.log("x is 3");
// else
//   console.log("x is NOT 3");

// if (x === 3) {                          // Example 6
//   console.log('x is 3');
// } else {
//   if (x === 4) {
//     console.log('x is 4');
//   } else {
//     console.log('x is NOT 3 or 4');
//   }
// }

// if (x === 3) {                          // Example 7
//   console.log("x is 3");
// } else if (x === 4) {
//   console.log("x is 4");
// } else {
//   console.log('x is NOT 3 or 4');
// }

// let a = 5;

// switch (a) {
//   case 5:
//   case 6:
//   case 7:
//     console.log("a is either 5, 6 or 7")
//     break;
//   case 8:
//   case 9:
//     console.log("a is either 8 or 9")
//     break;
//   default:
//     console.log("a is not 5-9")
//     break;
//   }

// 1
// false || (true && false);
// // false

// true || (1 + 2);
// // true

// (1 + 2) || true;
// // 3

// true && (1 + 2);
// // 3

// false && (1 + 2);
// // false

// (1 + 2) && true;
// // true

// (32 * 4) >= 129;
// // false

// false !== !true;
// // false

// true === 4;
// // false

// false === (847 === '847');
// // true

// false === (847 == '847');
// // false

// (!true || (!(100 / 5) === 20) || ((328 / 4) === 82)) || false;
// // true

// 2
// Write a function, evenOrOdd, that determines whether its argument is an even number. If it is, the function should log 'even' to the console; otherwise, it should log 'odd'. For now, assume that the argument is always an integer.

// function evenOrOdd(num) {
//   (num % 2 === 0) ? console.log(`${num} is even`) : console.log(`${num} is odd`)
// }

// function evenOrOdd(num) {
//   if (!Number.isInteger(num)) {
//     console.log(`${num} is not an integer. try again`)
//     return;
//   }

//   if (num % 2 === 0) {
//     console.log(`${num} is even`)
//   } else {
//     console.log(`${num} is odd`)
//   }
// }

// evenOrOdd('abc')

// 4
// return foo() ? 'bar' : qux();

// if (foo()) {
//   return 'bar';
// } else {
//   return qux();
// }


// // 7
// function supYo(string) {
//   if (string.length > 10) {
//     return string.toUpperCase();
//   } else {
//     return string;
//   }
// }

// console.log(supYo('is s long'));

// 8
// function numberRange(num) {
//   switch(num) {
//     case (num < 0 ):
//       console.log(`${num} is less than 0`);
//       break;
//     case (num >= 0  && num <= 50):
//       console.log(`${num} is between 0 and 50`);
//       break;
//     case (num > 50 && num <= 100):
//       console.log(`${num} is between 51 and 100`);
//       break;
//     case (num > 100):
//       console.log(`${num} is greater than 100`);
//       break;
//   }
// }