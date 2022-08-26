// 1
// function sum(num) {
//   console.log(String(num).split('').map(x => Number(x)).reduce((acc, val) => acc + val));
// }

// sum(23);           // 5
// sum(496);          // 19
// sum(123456789);    // 45

// 2

// zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

/*
Write a function that takes an array of integers between 0 and 19 and returns an array of those integers sorted based on the English word for each number:
- create an object to store key value pairs of numbers and their names
- iterate through input array and transform each number into its name
- sort the array of names
- transform the array of names into their corresponding number
*/
// const numbers = {
//   'zero': 0,
//   'one': 1,
//   'two': 2,
//   'three': 3,
//   'four': 4,
//   'five': 5,
//   'six': 6,
//   'seven': 7,
//   'eight': 8,
//   'nine': 9,
//   'ten': 10,
//   'eleven': 11,
//   'twelve': 12,
//   'thirteen': 13,
//   'fourteen': 14,
//   'fifteen': 15,
//   'sixteen': 16,
//   'seventeen': 17,
//   'eighteen': 18,
//   'nineteen': 19,
// }

// function getObjKey(obj, value) {
//   return Object.keys(obj).find(key => obj[key] === value);
// }

// function alphabeticNumberSort(arr) {
//   let names = arr.map(num => getObjKey(numbers, num));
//   let sortedNames = names.sort();
//   console.log(sortedNames.map(x => numbers[x]));
// }

// alphabeticNumberSort(
//   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]);
// // [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]


// 3
/*
- find the length of the longest arr
- iterate through the longest array
- multiply each number by the elements of the other array (keep track with an exterior count variable)
- push up the results to a new array
- sort the new array by ascending order
*/

// function multiplyAllPairs(arr1, arr2) {
//   let longest = (arr1.length > arr2.length) ? arr1.length : arr2.length;
//   let resultArr = [];

//   // for (let i = 0; i < longest; i += 1) {
//   //   for (let j = 0; j < longest; j += 1) {
//   //     resultArr.push(arr1[i] * arr2[j]);
//   //   }
//   // }
//   // console.log(resultArr.filter(x => Number(x) === x).sort((a, b) => a - b));

//   // arr1.forEach(num1 => {
//   //   console.log(num1);
//   //   arr2.forEach(num2 => {
//   //     console.log(num2);
//   //   })
//   // })
// }

// multiplyAllPairs([2, 4], [4, 3, 1, 2]);    // [2, 4, 4, 6, 8, 8, 12, 16]


// 4
/*
- make a nested array of arrays containing each subsequence
- map over the array and reduce each one
- final array should contain sum of each sub array
- reduce the final array
// */
// function sumOfSums(arr) {
//   let newArr = [];
//   for (let i = 0; i < arr.length; i += 1) {
//     newArr.push(arr.slice(0, i + 1));
//   }
//   let sums = newArr.map(a => a.reduce((acc, val) => acc +val)).reduce((acc, val) => acc +val);
//   console.log(sums);
// }

// sumOfSums([3, 5, 2]);        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
// sumOfSums([1, 5, 7, 3]);     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
// sumOfSums([4]);              // 4
// sumOfSums([1, 2, 3, 4, 5]);  // 35

// // 5
// function leadingSubstrings(str) {
//   let arr = [];
//   for (let i = 0; i < str.length; i += 1) {
//     arr.push(str.substring(0, i + 1));
//   }
//   console.log(arr);
// }
// leadingSubstrings('abc');      // ["a", "ab", "abc"]
// leadingSubstrings('a');        // ["a"]
// leadingSubstrings('xyzzy');    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// 6
// function substrings(str) {
//   let arr = [];
//   for (let i = 0; i < str.length; i += 1) {
//     for (let j = 0; j < str.length; j += 1) {
//       arr.push(str.substring(i, j+1));
//     }
//   }
//   console.log(arr.filter(x => x.length > 0));
// }

// substrings('abcde');

// // returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

// 7
// function substrings(str) {
//   let arr = [];
//   for (let i = 0; i < str.length; i += 1) {
//     for (let j = 0; j < str.length; j += 1) {
//       arr.push(str.substring(i, j+1));
//     }
//   }
//   return arr.filter(x => x.length > 0);
// }

// function isPalindrome(word) {
//   return word.length > 1 && word === word.split('').reverse().join('');
// }

// function palindromes(str) {
//   let substr = substrings(str);
//   // console.log(substr);

//   let palis = substr.filter(isPalindrome);

//   // let uniques = [];

//   // palis.forEach(word => {
//   //   if (!uniques.includes(word)) {
//   //     uniques.push(word);
//   //   }
//   // });
//   console.log(palis);

// }

// palindromes('abcd');       // []
// palindromes('madam');      // [ "madam", "ada" ]

// palindromes('hello-madam-did-madam-goodbye');
// // returns
// // [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
// //   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
// //   "-madam-", "madam", "ada", "oo" ]

// palindromes('knitting cassettes');
// // returns
// // [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]

// 8
// function buyFruit(nestedArr) {
//   let arr = [];

//   // for (let i = 0; i < nestedArr.length; i += 1) {
//   //   for (let j = nestedArr[i][1]; j > 0; j -= 1) {
//   //     arr.push(nestedArr[i][0]);
//   //   }
//   // }

//   nestedArr.forEach(a => {
//     for (let i = a[1]; i > 0; i -= 1) {
//       arr.push(a[0]);
//     }
//   })

//   console.log(arr);
// }

// buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]);
// // returns ["apple", "apple", "apple", "orange", "banana", "banana"]

// 9
// function transactionsFor(id, arr) {
//   return arr.filter(obj => obj.id === id );
// }

// const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
//                        { id: 105, movement: 'in',  quantity: 10 },
//                        { id: 102, movement: 'out', quantity: 17 },
//                        { id: 101, movement: 'in',  quantity: 12 },
//                        { id: 103, movement: 'out', quantity: 15 },
//                        { id: 102, movement: 'out', quantity: 15 },
//                        { id: 105, movement: 'in',  quantity: 25 },
//                        { id: 101, movement: 'out', quantity: 18 },
//                        { id: 102, movement: 'in',  quantity: 22 },
//                        { id: 103, movement: 'out', quantity: 15 }, ];

// console.log(transactionsFor(101, transactions));
// // returns
// // [ { id: 101, movement: "in",  quantity:  5 },
// //   { id: 101, movement: "in",  quantity: 12 },
// //   { id: 101, movement: "out", quantity: 18 }, ]

// 10

// function transactionsFor(id, arr) {
//   return arr.filter(obj => obj.id === id );
// }

// function isItemAvailable(id, arr) {
//   let quantities = [];

//   transactionsFor(id, arr).forEach(obj => {
//     if (obj.movement === 'in') {
//       quantities.push(obj.quantity);
//     } else {
//       quantities.push(-obj.quantity);
//     }
//   });

//   let num = quantities.reduce((acc, val) => acc + val);
//   return num > 0;
// }

// const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
//                        { id: 105, movement: 'in',  quantity: 10 },
//                        { id: 102, movement: 'out', quantity: 17 },
//                        { id: 101, movement: 'in',  quantity: 12 },
//                        { id: 103, movement: 'out', quantity: 15 },
//                        { id: 102, movement: 'out', quantity: 15 },
//                        { id: 105, movement: 'in',  quantity: 25 },
//                        { id: 101, movement: 'out', quantity: 18 },
//                        { id: 102, movement: 'in',  quantity: 22 },
//                        { id: 103, movement: 'out', quantity: 15 }, ];

// console.log(isItemAvailable(101, transactions));     // false
// console.log(isItemAvailable(105, transactions));     // true