// 1
// function teddy(min, max) {
//   min = Math.ceil(min);
//   max = Math.floor(max);
//   let num = Math.floor(Math.random() * (max-min +1) + min);
//   console.log(`Teddy is ${num} years old`);
// }

// teddy(20, 200);

// 2
// let readlineSync = require('readline-sync');
// let num;
// let arr = [];

// console.log('Enter the 1st number:');
// num = readlineSync.prompt();
// arr.push(Number(num));

// console.log('Enter the 2nd number:');
// num = readlineSync.prompt();
// arr.push(Number(num));

// console.log('Enter the 3rd number:');
// num = readlineSync.prompt();
// arr.push(Number(num));

// console.log('Enter the 4th number:');
// num = readlineSync.prompt();
// arr.push(Number(num));

// console.log('Enter the 5th number:');
// num = readlineSync.prompt();
// arr.push(Number(num));

// console.log('Enter the last number:');
// let lastNum = readlineSync.prompt();

// if (arr.includes(lastNum)) {
//   console.log(`The number ${lastNum} appears in`, arr);
// } else {
//   console.log(`The number ${lastNum} does not appear in`, arr);
// }


// 3
// let readlineSync = require('readline-sync');
// console.log('what is your age?');
// let age = Number(readlineSync.prompt());

// console.log('At what age would you like to retire?');
// let retirementAge = Number(readlineSync.prompt());

// let yearsLeft = retirementAge - age;

// let date = new Date();
// let year = date.getFullYear();
// console.log(`It's ${year}, you will retire in ${year + yearsLeft}`);
// console.log(`You only have ${yearsLeft} years of work to go!`);

// 4

// function isPalindrome(str) {
//   let arr = str.split('')
//   let revStr = arr.reverse().join('');
//   return revStr === str;
// }

// // isPalindrome('madam');               // true
// // isPalindrome('Madam');               // false (case matters)
// // isPalindrome("madam i'm adam");      // false (all characters matter)
// // isPalindrome('356653');              // true

// // 5

// function isRealPalindrome(str) {
//   let newStr = str.toLowerCase().replace(/\W/g, '');
//   console.log(isPalindrome(newStr));
//   return isPalindrome(newStr);
// }

// isRealPalindrome('madam');               // true
// isRealPalindrome('Madam');               // true (case does not matter)
// isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
// isRealPalindrome('356653');              // true
// isRealPalindrome('356a653');             // true
// isRealPalindrome('123ab321');            // false

// 6
// function isPalindromicNumber(num) {
//   let str = String(num);
//   let reversedStr = str.split('').reverse().join('');
//   console.log(reversedStr === str);
// }
// isPalindromicNumber(34543);        // true
// isPalindromicNumber(123210);       // false
// isPalindromicNumber(22);           // true
// isPalindromicNumber(5);            // true

// 7
// function runningTotal(arr) {
//   let counter = 0;
//   let newArr = arr.map(x => {
//     counter += x;
//     return counter;
//   });

//   console.log(newArr);
// }

// runningTotal([2, 5, 13]);             // [2, 7, 20]
// runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
// runningTotal([3]);                    // [3]
// runningTotal([]);                     // []

// 8
// function swap(str) {
//   let arr = str.split(' ');
//   let first;
//   let last;
//   let newArr = arr.map(word => {
//     arrOfChars = word.split('');
//     first = arrOfChars[0];
//     last = arrOfChars[arrOfChars.length -1];
//     arrOfChars[0] = last;
//     arrOfChars[arrOfChars.length - 1] = first;
//     return arrOfChars.join('');
//   });
//   console.log(newArr.join(' '));
// }

// swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
// swap('Abcde');                          // "ebcdA"
// swap('a');                              // "a"

// 9
/*
Write a function that takes a string consisting of one or more space separated words and returns an object that shows the number of words of different sizes.

Words consist of any sequence of non-space characters.

input - a string of words of different sizes
  - words are a sequence of non space characters
- output - an object containing the number of lengths of words

algorithm:
- intiailize and declare an object
- for each word, determine its length
  - check to see if the object has a key with the String version of the length
    - if it does, += 1
    - if it doesn't create a new key value pair
*/

function wordSizes(str) {
  if (str.length === 0) {
    return {};
  }
  let obj = {};
  let sanitized = str.replace(/[^A-Za-z0-9\s]/g, '');
  sanitized.split(' ').forEach(word => {
    let numStr = String(word.length);
    if (obj[numStr]) {
      obj[numStr] += 1;
    } else {
      obj[numStr] = 1;
    }
  });
  console.log(obj);
}

wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "2": 1, "4": 1, "6": 1 }
wordSizes('');                                            // {}


// 10
