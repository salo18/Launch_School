// 2
// let myArray = [1, 3, 6, 11, 4, 2, 4, 9, 17, 16, 0];
// // myArray.forEach (num => if num.even console.log(num));
// myArray.forEach(function(value) {
//   if (value % 2 === 0) {
//     console.log(value)
//   }
// });

// 3

// let myArray = [
//   [1, 3, 6, 11],
//   [4, 2, 4],
//   [9, 17, 16, 0],
// ];

// // for (let i = 0; i < myArray.length; i += 1) {
// //   for (let j = 0; j < myArray[i].length; j += 1) {
// //     let value = myArray[i][j];
// //     if (value % 2 == 0) {
// //       console.log(value);
// //     }
// //   }
// // }

// myArray.forEach(function(nestedArray) {
//   nestedArray.forEach(function(value) {
//     if (value % 2 == 0) {
//       console.log(value);
//     }
//   });
// });

// // 4
// let myArray = [
//   1, 3, 6, 11,
//   4, 2, 4, 9,
//   17, 16, 0,
// ];

// // let newArr = myArray.map(function(value) {
// //   if (value % 2 === 0) {
// //     return 'even';
// //   } else {
// //     return 'odd';
// //   }
// // });

// // console.log(newArr);

// let newArr = [];

// for (let i = 0; i < myArray.length; i += 1) {
//   let value = myArray[i];
//   if (value % 2 === 0) {
//     newArray.push('even');
//   } else {
//     newArray.push('odd');
//   }
// }

// 5
// let things = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];

// function findIntegers(array) {
//   return array.filter(function(element) {
//     return Number.isInteger(element);
//   });
// }

// let integers = findIntegers(things);
// console.log(integers); // => [1, 3, -4]

// 6
// let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];

// function oddLengths(arr) {
//   let lengths = arr.map(function(el) {
//     return el.length;
//   });
//   let oddLengths = lengths.filter((number) => number % 2 == 1);
//   // newArr.filter(function(el) {
//   //   if (el % 2 ===0 ) {
//   //     return el;
//   //   }
//   // });
//   return oddLengths;
// }
// console.log(oddLengths(arr)); // => [1, 5, 3]


// 7
// let array = [3, 5, 7];

// function sumOfSquares(arr) {
//   let newArr = arr.reduce(function(el) {
//     el ** el
//   });
//   return newArr;
// }
// console.log(sumOfSquares(array)); // => 83

// 9
// let numbers1 = [1, 3, 5, 7, 9, 11];
// let numbers2 = [];
// let numbers3 = [2, 4, 6, 8];

// console.log(numbers1.includes(3));

// 10
let arr = [
  ["hello", "world"],
  ["example", "mem", null, 6, 88],
  [4, 8, 12]
];

arr[1][3] = 606;
console.log(arr);