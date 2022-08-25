// 2

// function union(...args) {
//   let newArr = [];
//   // console.log(args);
//   for (let i = 0; i < args.length; i += 1) {
//     args[i].forEach(num  => {
//       if (!newArr.includes(num)) {
//         newArr.push(num);
//       }
//     });
//   }
//   console.log(newArr);

// }

// union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]

// 3
// function halvsies(arr) {
//   let separator = Math.ceil(arr.length /2);

//   if (arr.length > 1) {
//     let first = arr.slice(0, separator);
//     let second = arr.slice(separator);
//     return [first, second];
//   } else if (arr.length > 0) {
//     return [arr];
//   } else  {
//     return [[], []];
//   }
//   // console.log(first);
// }

// console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
// console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
// console.log(halvsies([5]));                // [[5], []]
// console.log(halvsies([]));                 // [[], []]

// 4
// function findDup(arr) {
//   for (let i = 0; i < arr.length; i += 1) {
//     // console.log(arr.slice(0, i));
//     if (arr.slice(0, i).includes(arr[i])) {
//       return arr[i];
//     }
//   }
// }

// console.log(findDup([1, 5, 3, 1]));                                // 1
// console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
//          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
//          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
//          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
//          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
//          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
//          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
//          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
//          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
//           7, 34, 57, 74, 45, 11, 88, 67,  5, 58]));    // 73

// 5
// function interleave(arr1, arr2) {
//   let newArr = [];
//   for (let i = 0; i < arr1.length; i += 1) {
//     newArr.push(arr1[i]);
//     newArr.push(arr2[i]);
//   }
//   console.log(newArr);
// }
// interleave([1, 2, 3], ['a', 'b', 'c']);    // [1, "a", 2, "b", 3, "c"]

// // 6
// function showMultiplicativeAverage(arr) {
//   let multiply = arr.reduce((acc, val) => acc * val);
//   let avg = multiply / arr.length;
//   console.log(String(avg.toFixed(3)));
// }

// showMultiplicativeAverage([3, 5]);                   // "7.500"
// showMultiplicativeAverage([2, 5, 7, 11, 13, 17]);    // "28361.667"

// // 7
// function multiplyList(arr1, arr2) {
//   let newArr = [];
//   for (let i = 0; i < arr1.length; i += 1) {
//     newArr.push(arr1[i] * arr2[i]);
//   }
//   console.log(newArr);
// }

// multiplyList([3, 5, 7], [9, 10, 11]);    // [27, 50, 77]

// // 8
// function digitList(num) {
//   console.log(String(num).split('').map(x => Number(x)));
// }
// digitList(12345);       // [1, 2, 3, 4, 5]
// digitList(7);           // [7]
// digitList(375290);      // [3, 7, 5, 2, 9, 0]
// digitList(444);         // [4, 4, 4]

// 9
// const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
//                 'motorcycle', 'motorcycle', 'car', 'truck'];

// function countOccurrences(arr) {
//   let obj = {};
//   arr.forEach(el => {
//     if (obj[el]) {
//       obj[el] += 1;
//     } else {
//       obj[el] = 1;
//     }
//   });

//   for (let item in obj) {
//     console.log(`${item} => ${obj[item]}`)
//   }
//   // console.log(obj);
// }

// countOccurrences(vehicles);

// // console output
// // car => 4
// // truck => 3
// // SUV => 1
// // motorcycle => 2

// 10
// function average(arr) {
//   console.log(Math.floor(arr.reduce((acc, val) => acc + val)/arr.length));
// }

// average([1, 5, 87, 45, 8, 8]);       // 25
// average([9, 47, 23, 95, 16, 52]);    // 40