// 1
/*
input -- string with duplicated chars
output - string with duplicates removed (only if they are consecutive duplicates)

algorith
- iterate through the str
- if the character before the current index === the character at the current index, do nothing
- if the character before the current index !== the character at the current index, add to the result str
*/

// function crunch(str) {
//   // let resultStr = '';

//   // for (let i = 0; i < str.length; i += 1) {
//   //   if (str[i] !== str[i-1]) {
//   //     resultStr += str[i];
//   //   }
//   // }

//   let resultStr = str.split('');
//   resultStr = resultStr.filter((char, index) => char !== str[index -1]);
//   console.log(resultStr.join(''));
// }


// crunch('ddaaiillyy ddoouubbllee');    // "daily double"
// crunch('4444abcabccba');              // "4abcabcba"
// crunch('ggggggggggggggg');            // "g"
// crunch('a');                          // "a"
// crunch('');                           // ""

// edge cases to consider:
// crunch('ddaaiillyy    ddoouubbllee'); // should multiple spaces be considered duplicate?
// crunch('stoop'); // what about words with repeating characters?
// crunch('ddaa??? ddoouubbllee....'); // should we worry about non alphanumeric chars?
// crunch('Ddaaiillyy dDoOuUbbllee'); // is it case sensitive?
// crunch(['ddaaiillyy ddoouubbllee']); // do we need to validate input?

// 2
/*
Write a function that will take a short line of text, and write it to the console log within a box.

input - a string containing 0 or more characters
ouput - a box encasing the string

rules:
- baseline box is
// +--+
// |  |
// |  |
// |  |
// +--+
- need to add an additional dash at the top and bottom of the line for each character


edge cases to consider:
- does the box at any point wrap and go down a line? or will the box always stay the same height?
- do i need to consider non string input?

algorith:
- create an outline of the box
- interporlate the string into the middle position of the box
- get the string length and add x amount of dashes to the top and bottom of the box based on the string length

*/

// function logInBox(str) {
//   let num = str.length + 1 || 1;
//   let dashes = '-'.repeat(num);
//   let spaces = ' '.repeat(num);
//   console.log(`+-${dashes}+`);
//   console.log(`| ${spaces}|`);
//   console.log(`| ${str} |`);
//   console.log(`| ${spaces}|`);
//   console.log(`+-${dashes}+`);
// }


// logInBox('To boldly go where no one has gone before.');
// // +--------------------------------------------+
// // |                                            |
// // | To boldly go where no one has gone before. |
// // |                                            |
// // +--------------------------------------------+

// // logInBox('');
// // +--+
// // |  |
// // |  |
// // |  |
// // +--+


// // 3
// function stringy(num) {
//   let str = '';
//   for (let i = 0; i < num; i += 1) {
//     if (i % 2 === 0) {
//       str += '1';
//     } else if (i % 2 === 1) {
//       str += '0';
//     }
//   }
//   console.log(str);
// }

// stringy(6);    // "101010"
// stringy(9);    // "101010101"
// stringy(4);    // "1010"
// stringy(7);    // "1010101"


// 5
// edge cases... 0, negative number, invalid input
// function triangle(num) {
//   let spaces = num - 1;
//   let stars = num - spaces;
//   for (let i = 0; i < num; i += 1) {
//     console.log(' '.repeat(spaces), '*'.repeat(stars));
//     spaces -= 1;
//     stars += 1;
//   }
// }

// triangle(5);

// //     *
// //    **
// //   ***
// //  ****
// // *****

// triangle(9);

// //         *
// //        **
// //       ***
// //      ****
// //     *****
// //    ******
// //   *******
// //  ********
// // *********


// 6
// function madlib() {
//   let readlineSync = require('readline-sync');
//   console.log('Enter a noun:');
//   let noun = readlineSync.prompt();
//   console.log('Enter a verb:');
//   let verb = readlineSync.prompt();
//   console.log('Enter a adjective:');
//   let adjective = readlineSync.prompt();
//   console.log('Enter a adverb:');
//   let adverb = readlineSync.prompt();
//   console.log(`Do you ${verb} your ${adjective} ${noun} ${adverb}?`);
// }

// madlib();

// 7
/*
A double number is an even-length number whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, and 7676 are all double numbers, whereas 444, 334433, and 107 are not.

Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number; otherwise, return the double number as-is.

input - a number
output - input doubled or the double number

requirements:
- a double number is an even length number whose left side digits are the same as the right side

edge cases:
- what about 0 ?
- what about invalid input ? string, array, object, etc

algorithm:
- if double number, return input, else return double the number
- double number...
  - convert the number into a string and split it into an array
  - slice the array into a first and second half based on the length
  - join each array and compare the values (arrays can't be compared unless they are the same object)
*/

// function twice(num) {
//   let str = String(num);

//   if (doubleNum(str)) {
//     return num;
//   } else {
//     return num * 2;
//   }
// }

// function doubleNum(str) {
//   if (str.length % 2 === 1) {
//     return false;
//   }

//   let arr = str.split('');
//   let length = arr.length / 2;
//   // console.log(arr.slice(0, length));
//   let first = arr.slice(0, length).join('');
//   let second = arr.slice(length).join('');

//   return first === second;
// }

// console.log(twice(37));          // 74
// console.log(twice(44));          // 44
// console.log(twice(334433));      // 668866
// console.log(twice(444));         // 888
// console.log(twice(107));         // 214
// console.log(twice(103103));      // 103103
// console.log(twice(3333));        // 3333
// console.log(twice(7676));        // 7676

// // 8
// function getGrade(gr1, gr2, gr3) {
//   let avg = (gr1 + gr2 + gr3) / 3;
//   if (avg >= 90) {
//     return 'A';
//   } else if (avg >= 80) {
//     return 'B';
//   } else if (avg >= 70) {
//     return 'C';
//   } else if (avg >= 60) {
//     return 'D';
//   }
// }

// console.log(getGrade(95, 90, 93));    // "A"
// console.log(getGrade(50, 50, 95));    // "D"

// 9
// function cleanUp(str) {
//   let cleaned = str.replace(/\W/g, ' ');

//   let newStr = '';

//   for (let i = 0; i < cleaned.length; i += 1) {
//     if (cleaned[i] === ' ' && cleaned[i-1] === ' ') {
//       continue;
//     }
//     newStr += cleaned[i];
//   }
//   console.log(newStr);

// }

// cleanUp("---what's my +*& line?");    // " what s my line "
