// 1
// for (let i = 1; i <100; i += 2) {
//   console.log(i);
// }

// 2
// for (let i = 0; i <100; i += 2) {
//   console.log(i);
// }

// 3

// let readlineSync = require("readline-sync");
// const SQMETERS_TO_SQFEET = 10.7639;

// console.log("Enter the length of the room in meters:");
// let length = readlineSync.prompt();
// length = parseInt(length, 10);

// console.log("Enter the width of the room in meters:");
// let width = readlineSync.prompt();
// width = parseInt(width, 10);

// let areaInMeters = (length * width);
// let areaInFeet = (areaInMeters * SQMETERS_TO_SQFEET);

// console.log(
//   `The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`
// );

// 4
// let readlineSync = require('readline-sync');
// console.log('What is the bill?');
// let bill = Number(readlineSync.prompt());

// console.log('What is the tip percentage?');
// let tipPercentage = Number(readlineSync.prompt())/100;
// let tip = tipPercentage * bill;
// let total = bill + tip;

// console.log(`The tip is ${tip}`);
// console.log(`The total is ${total}`);

// 5
// let readlineSync = require('readline-sync');
// console.log('Please enter an integer greater than 0:');
// let num;

// if (num < 1) {
//   console.log('that is not a valid number');
// } else {
//   num = readlineSync.prompt();
// }

// let arr = [];
// for (let i = 1; i <= num; i += 1) {
//   arr.push(i);
// }

// console.log('Enter "s" to compute the sum, or "p" to compute the product.');
// let sP = readlineSync.prompt();

// let value;
// if (sP === 's') {
//   value = arr.reduce((acc, val) => acc + val);
//   console.log(`The sum of the integers between 1 and ${num} is ${value}`);
// } else {
//   value = arr.reduce((acc, val) => acc * val);
//   console.log(`The product of the integers between 1 and ${num} is ${value}`);
// }


// // 6
// function shortLongShort(str1, str2) {
//   if (str1.length > str2.length) {
//     return `${str2}${str1}${str2}`;
//   } else {
//     return `${str1}${str2}${str1}`;
//   }
// }

// console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
// console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
// console.log(shortLongShort('', 'xyz'));         // "xyz"

// 7
// function isLeapYear(year) {
//   if (year < 1752 && year % 4 === 0) {
//     return true;
//   } else if (year % 400 === 0) {
//     return true;
//   } else if (year % 100 === 0) {
//     return false;
//   } else {
//     return year % 4 === 0;
//   }
// }

// isLeapYear(2016);      // true
// isLeapYear(2015);      // false
// isLeapYear(2100);      // false
// isLeapYear(2400);      // true
// isLeapYear(240000);    // true
// isLeapYear(240001);    // false
// isLeapYear(2000);      // true
// isLeapYear(1900);      // false
// isLeapYear(1752);      // true
// isLeapYear(1700);      // true
// isLeapYear(1);         // false
// isLeapYear(100);       // true
// isLeapYear(400);       // true

// 8
/*
input - number
output - sum of multiples of 3 or 5 up to the number
*/
// function multisum(num) {
//   let arr = [];
//   for (let i = 1; i <= num; i += 1) {
//     if (i % 3 === 0 || i % 5 === 0) {
//       arr.push(i);
//     }
//   }
//   return arr.reduce((acc, val) => acc + val);
// }

// console.log(multisum(3));       // 3
// console.log(multisum(5));       // 8
// console.log(multisum(10));      // 33
// console.log(multisum(1000));    // 234168


// // 9
// function utf16Value(str) {
//   if (str === '') {return 0}
//   let arr = Array.from(str);
//   let mapped = arr.map(el => el.charCodeAt(0)).reduce((acc, val) => acc + val);
//   return mapped;
// }

function utf16Value(str) {
  let sum = 0;

  for (let idx = 0; idx < str.length; idx += 1) {
    sum += str.charCodeAt(idx);
  }
  return sum;
  
}
console.log(utf16Value('Four score'));         // 984
console.log(utf16Value('Launch School'));      // 1251
console.log(utf16Value('a'));                  // 97
console.log(utf16Value(''));                   // 0

// The next three lines demonstrate that the code
// works with non-ASCII characters from the UTF-16
// character set.
const OMEGA = "\u03A9";             // UTF-16 character 'Ω' (omega)
console.log(utf16Value(OMEGA));                  // 937
console.log(utf16Value(OMEGA + OMEGA + OMEGA));  // 2811