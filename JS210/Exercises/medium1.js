// // 1
// (false && undefined); // false
// (false || undefined); // undefined
// ((false && undefined) || (false || undefined)); // undefined
// ((false || undefined) || (false && undefined)); // false
// ((false && undefined) && (false || undefined)); // false
// ((false || undefined) && (false && undefined)); // false
// ('a' || (false && undefined) || ''); // 'a'
// ((false && undefined) || 'a' || ''); // 'a'
// ('a' && (false || undefined) && ''); // false
// ((false || undefined) && 'a' && ''); // false

// 2
// let i = 0;
// while (i < 10) {
//   if (i % 3 === 0) {
//     console.log(i);
//   }
//     i += 1;
// }

// // 3
// function padLeft(number) {
//   const stringNumber = String(number);
//   switch (stringNumber.length) {
//     case 1:  return `  ${stringNumber}`;
//     case 2:  return ` ${stringNumber}`;
//     default: return stringNumber;
//   }
// }

// for (let i = 1; i < 10; i += 1) {
//   let row = '';
//   for (let j = 1; j <= 10; j += 1) {
//     row += `${padLeft(i * j)} `;
//   }

//   console.log(row);
// }

// 4
// function getSelectedColumns(numbers, cols) {
//   var result = [];

//   for (let i = 0, length = numbers.length; i < length; i += 1) {
//     for (let j = 0, length = cols.length; j < length; j += 1) {
//       if (!result[j]) {
//         result[j] = [];
//       }

//       result[j][i] = numbers[i][cols[j]];
//     }
//   }

//   console.log(result);
// }

// // given the following arrays of number arrays
// const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
// const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// // `array1` in row/column format
// // [[1, 2, 3],
// //  [4, 5, 6],
// //  [7, 8, 9]]

// getSelectedColumns(array1, [0]);     // [[1]];            expected: [[1, 4, 7]]
// getSelectedColumns(array1, [0, 2]);  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
// getSelectedColumns(array2, [1, 2]);  // [[2, 2], [3, 3]]; expected: [[2, 2, 2], [3, 3, 3]]

// 5

// #1
// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + String(counter * rate));

// function counter(count) {

// }

// // after hoisting:
// function counter(count) {
//   // ...
// }
// var rate;

// rate = 3;
// counter = 5;
// console.log('The total value is ' + String(counter * rate));
// // variables that point to functions can be reassigned to point to any other type so the code runs as expected

// // #2
// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// var counter = 5;
// var rate = 3;
// // after hoisting:

// function counter(count) {
//   // ...
// }
// var rate;

// console.log('The total value is ' + String(counter * rate));

// counter = 5;
// rate = 3;
// // error -- can't access undeclared variables
// // wrong... logs The total value is NaN

// // #3
// var counter = 5;
// var rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// // after hoisting:
// function counter(count) {
//   // ...
// }

// var rate;

// counter = 5;
// rate = 3;

// console.log('The total value is ' + String(counter * rate));
// // normal output since counter is reassigned to point to a number

// // #4
// let counter = 5;
// let rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// // after hoisting:
// function counter(count) {
//   // ...
// }

// let rate;

// counter = 5;
// rate = 3;

// console.log('The total value is ' + String(counter * rate));
// // this also works because the variable is reassigned to a number

// // syntax error because you can't declare a variable with let if it has already been declared

// 6
// function debugIt() {
//   const status = 'debugging';
//   function logger() {
//     console.log(status);
//   }

//   logger();
// }

// debugIt();

// 7
// function invoiceTotal(amount1, amount2, amount3, amount4) {
//   return amount1 + amount2 + amount3 + amount4;
// }

// invoiceTotal(20, 30, 40, 50);          // works as expected
// invoiceTotal(20, 30, 40, 50, 40, 40);  // does not work; how can you make it work?

// refactor to take any number of arguments
// function invoiceTotal(...args) {
//   sum = 0;
//   for (let i = 0; i < args.length; i += 1) {
//     sum += args[i];
//   }
//   console.log(sum);
//   // return amount1 + amount2 + amount3 + amount4;
// }

// invoiceTotal(20, 30, 40, 50);          // works as expected
// invoiceTotal(20, 30, 40, 50, 40, 40);  // does not work; how can you make it work?

// 8
// function productOfSums(array1, array2) {
//   let result = total(array1) * total(array2);
//   console.log(result);
// }

// function total(numbers) {
//   let sum = 0;

//   for (let i = 0; i < numbers.length; i += 1) {
//     sum += numbers[i];
//   }

//   return sum;
// }

// productOfSums([1, 2, 3], [4, 5, 6]);