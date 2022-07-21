// 1
// function lastInArray(arr) {
//   let num = arr.length - 1
//   return arr[num]
// }

// let lastinArray = arr => arr[arr.length - 1]

// 2
// const NAMES = ['Steve', 'Martha', 'Pat'];

// function rollCall(arr) {
//   for (let i = 0; i < arr.length; i += 1) {
//     console.log(arr[i]);
//   }
// }

// rollCall(NAMES);

// 3
// const NUMBERS = [1, 2, 3, 4, 5];

// function reverse(arr) {
//   let new_arr = [];
//   for (let i = arr.length - 1; i >= 0; i -= 1) {
//     new_arr.push(arr[i]);
//   }
//   console.log(new_arr);
// }

// reverse(NUMBERS);

// 4
// const ARR = [1, 2, 3, ];

// function toString(arr) {
//   let newStr = "";
//   for (let i = 0; i < arr.length; i +=1) {
//     newStr += String(arr[i]);
//   }
//   console.log(newStr);
// }

// toString(ARR);

// PUSH
// let count = [0, 1, 2];

// function push(arr, val) {
//   let num = arr.length;
//   arr.length = num;
//   arr[num] = val;
//   return arr.length;
// }
// console.log(push(count, 3));         // 4
// console.log(count);                  // [ 0, 1, 2, 3 ]

// POP
// const pop = arr => {
//   let last = arr[arr.length-1]
//   arr.length = arr.length-1
//   console.log(last);
// }

// let count = [1, 2, 3];
// pop(count);             // 3
// console.log(count);                  // [ 1, 2 ]

// UNSHIFT
// const unshift = (arr, val) => {
//   for (let i = arr.length; i > 0; i -=1) {
//     arr[i] = arr[i - 1];
//   }

//   arr[0] = val;
//   return arr.length;
// }

// let count = [1, 2, 3];
// unshift(count, 0);      // 4
// console.log(count);

// SHIFT
// const shift = arr => {
//   let first = arr[0];

//   if (arr.length === 0) {
//     return undefined;
//   }

//   for (let i = 0; i < arr.length - 1; i += 1) {
//     arr[i] = arr[i + 1];
//   }

//   arr.length = arr.length - 1;
//   return first;
// }

// let count = [1, 2, 3];
// shift(count);           // 1
// count;                  // [ 2, 3 ]

// indexOf
// const indexOf = (arr, val) => {
//   let new_arr =[];

//   for (let i = 0; i < arr.length; i += 1) {
//     if (arr[i] === val) {
//       new_arr.push(i);
//     }
//   }

//   if (new_arr.length > 0) {
//     console.log(new_arr[0]);
//   } else {
//     console.log(-1);
//   }
// }

// indexOf([1, 2, 3, 3], 3);         // 2
// indexOf([1, 2, 3], 4);            // -1

// lastIndexOf
// const lastIndexOf = (arr, val) => {
//   let new_arr =[];

//   for (let i = arr.length - 1; i > 0; i -= 1) {
//     if (arr[i] === val) {
//       new_arr.push(i);
//     }
//   }

//   if (new_arr.length > 0) {
//     console.log(new_arr[0]);
//   } else {
//     console.log(-1);
//   }
// }

// lastIndexOf([1, 2, 3, 3], 3);     // 3
// lastIndexOf([1, 2, 3], 4);        // -1

// slice
// const slice = (arr, start, end) => {
//   let new_arr = [];

//   for (let i = start; i < end; i += 1) {
//     new_arr.push(arr[i])
//   }
//   console.log(new_arr);
// }

// slice([1, 2, 3, 4, 5], 0, 2);                      // [ 1, 2 ]
// slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3);  // [ 'b', 'c' ]

// splice

// const splice = (arr, start, length) => {
//   let removed = [];

//   for (let i = 0; i < length; i += 1) {

//     removed.push(arr[start]);
//     start += 1;
//   }

//   console.log(removed);
// }

// let count = [1, 2, 3, 4, 5, 6, 7, 8];
// splice(count, 2, 5);                   // [ 3, 4, 5, 6, 7 ]
// count;                                 // [ 1, 2, 8 ]


// concat
// const concat = (arr1, arr2) => {
//   let new_arr = [];

//   for (let i = 0; i < arr1.length; i += 1) {
//     new_arr.push(arr1[i])
//   }

//   for (let i = 0; i < arr2.length; i += 1) {
//     new_arr.push(arr2[i])
//   }

//   console.log(new_arr);
// }

// concat([1, 2, 3], [4, 5, 6]);       // [ 1, 2, 3, 4, 5, 6 ]

// join
// const join = (arr, str) => {
//   let newStr = "";
//   for (let i = 0; i < arr.length; i += 1) {
//     if (i === arr.length - 1) {
//       newStr += String(arr[i]);
//     } else {
//       newStr += (String(arr[i]) + str);
//     }
//   }
//   console.log(newStr);
// }

// join(['bri', 'tru', 'wha'], 'ck ');       // 'brick truck wha'
// join([1, 2, 3], ' and ');                 // '1 and 2 and 3'

// arraysEqual
// const arraysEqual = (arr1, arr2) => {
//   if (arr1.length !== arr2.length) {
//     console.log(false);
//     return false;
//   }

//   for (let i = 0; i < arr1.length; i += 1) {
//     if (arr1[i] !== arr2[i]) {
//       console.log(false);
//       return false;
//     }
//   }
//   console.log(true);
//   return true;
// }

// arraysEqual([1], [1]);                               // true
// arraysEqual([1], [2]);                               // false
// arraysEqual([1, 2], [1, 2, 3]);                      // false
// arraysEqual([1, 'hi', true], [1, 'hi', true]);       // true
// arraysEqual([1, 'hi', true], [1, 'hi', false]);      // false
// arraysEqual([1, 'hi', true], [1, 'hello', true]);    // false
// arraysEqual([1, 'hi', true], [2, 'hi', true]);       // false

// BASIC ARRAY USES
// 1
// function firstElementOf(arr) {
//   console.log(arr[0])
// }

// firstElementOf(['U', 'S', 'A']);  // returns "U"

// 2
// function firstElementOf(arr) {
//   console.log(arr[arr.length-1])
// }

// firstElementOf(['U', 'S', 'A']);  // returns "U"

// 3
// function nthElementOf(arr, index) {
//   console.log(arr[index]);
// }

// let digits = [4, 8, 15, 16, 23, 42];

// nthElementOf(digits, 3);   // returns 16
// nthElementOf(digits, 8);   // what does this return?
// nthElementOf(digits, -1);  // what does this return?

// 4
// function firstNOf(arr, count) {
//   let new_arr = [];

//   for (let i = 0; i < count; i += 1) {
//     new_arr.push(arr[i]);
//   }

//   console.log(new_arr);
// }

// let digits = [4, 8, 15, 16, 23, 42];
// firstNOf(digits, 3);    // returns [4, 8, 15]

// 5
// function lastNOf(arr, count) {
//   return arr.slice(arr.length - count);
// }

// 6
// function lastNOf(arr, count) {
//   if (count > arr.length) {
//     let newArr = arr;
//     return newArr;
//   } else {
//     return arr.slice(arr.length - count);
//   }
// }

// 7
// function endsOf(beginningArr, endingArr) {
//   let newArr = [];
//   newArr.push(beginningArr[0]);
//   newArr.push(endingArr[endingArr.length - 1]);
//   console.log(newArr);
// }

// endsOf([4, 8, 15], [16, 23, 42]);  // returns [4, 42]

// INTERMEDIATE ARRAY USES
// 1
// function oddElementsOf(arr) {
//   let newArr = [];
//   for (let i = 1; i < arr.length; i += 2) {
//     newArr.push(arr[i]);
//   }
//   console.log(newArr);
// }

// let digits = [4, 8, 15, 16, 23, 42];

// oddElementsOf(digits);    // returns [8, 16, 42]

// // 2
// const sameReverse = arr => {
//   let newArr = [];
//   for (let i = 0; i < arr.length; i += 1) {
//     newArr.push(arr[i]);
//   }

//   for (let i = arr.length - 1; i > -1; i -= 1) {
//     newArr.push(arr[i]);
//   }

//   console.log(newArr);
// }

// sameReverse([1, 2, 3]);

// // 3
// function sortDescending(arr) {
//   let arrCopy = arr.slice();
//   return arrCopy.sort((a, b) => b - a);
// }

// let array = [23, 4, 16, 42, 8, 15];
// let result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
// console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
// console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]

// 4
// function matrixSums(arr) {
//   let newArr = [];
//   for (let i = 0; i < arr.length; i += 1) {
//     let sum = 0;
//     for (let k = 0; k < arr[i].length; k += 1) {
//       sum += arr[i][k];
//     }
//     newArr.push(sum);
//     sum = null;
//   }
//   console.log(newArr);
// }

// matrixSums([[2, 8, 5], [12, 48, 0], [12]]);  // returns [15, 60, 12]

// 5
// function uniqueElements(arr) {
//   let newArr = [];
//   for (let i = 0; i < arr.length; i += 1) {
//     if (newArr.includes(arr[i]) === false) {
//       newArr.push(arr[i]);
//     }
//   }
//   console.log(newArr);
// }

// uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]);  // returns [1, 2, 4, 3, 5]

// 6
// const missing = arr => {
//   if (arr.length < 2) {
//     console.log([]);
//     return [];
//   }

//   let newArr = [];

//   let end = arr[arr.length - 1];
//   let start = arr[0];

//   if (arr.length !== end) {
//     for (let i = start + 1; i < end; i += 1) {
//       if (arr.includes(i) === false) {
//         newArr.push(i);
//       }
//     }
//   } else {
//       console.log([]);
//       return [];
//   }

//   console.log(newArr);
// }

// missing([-3, -2, 1, 5]);                  // [-1, 0, 2, 3, 4]
// missing([1, 2, 3, 4]);                    // []
// missing([1, 5]);                          // [2, 3, 4]
// missing([6]);                             // []