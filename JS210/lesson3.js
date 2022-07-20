// 1 - Odd Numbers
// Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive). All numbers should be logged on separate lines.

// function logOddNumbers(num) {
//   for (let currentNum = 1; currentNum <= num; currentNum += 1) {
//     if (currentNum % 2 === 0) {
//       continue
//     }
//     console.log(currentNum)
//   }
// }

// function logOddNumbers(num) {
//   for (let currentNum = 1; currentNum <= num; currentNum += 2) {
//     console.log(currentNum)
//   }
// }

// logOddNumbers(19);

// 2 - multiples of 3 and 5
// Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.

// function multiples() {
//   for (let currentNum = 1; currentNum < 101; currentNum += 1) {
//     if (currentNum % 5 === 0 && currentNum % 3 === 0) {
//       console.log(String(currentNum) + '!');
//     } else if (currentNum % 5 === 0 || currentNum % 3 === 0) {
//       console.log(String(currentNum));
//     }
//   }
// }

// function multiple(num1, num2) {
//   for (let currentNum = num1; currentNum <= num2; currentNum += 1) {
//     if (currentNum % 5 === 0 && currentNum % 3 === 0) {
//       console.log(String(currentNum) + '!');
//     } else if (currentNum % 5 === 0 || currentNum % 3 === 0) {
//       console.log(String(currentNum));
//     }
//   }
// }

// multiple(1, 15);

// 3 - print multiples
// function logMultiples(num) {
//   for (let currentNum = 0; currentNum <= 100; currentNum += 1) {
//     if (currentNum % num === 0 && currentNum % 2 === 1) {
//       console.log(currentNum);
//     }
//   }
// }

// function logMultiples(num) {
//   let largest = Math.floor(100/num) * num
//   for (let currentNum = 0; currentNum <= largest; currentNum += 1) {
//     if (currentNum % num === 0 && currentNum % 2 === 1) {
//       console.log(currentNum);
//     }
//   }
// }

// logMultiples(17);

// 4 - fizz buzz
// function fizzbuzz() {
//   for (let num = 0; num <= 100; num += 1) {
//     let message = num;

//     if (num % 5 === 0 && num % 3 === 0) {
//       message = "FizzBuzz";
//     } else if (num % 5 === 0) {
//       message = "Buzz";
//     } else if (num % 3 === 0) {
//       message = "Fizz";
//     }

//     console.log(message);
//   }
// }

// fizzbuzz();

// 5 prime check
// function isPrime(num) {
//   if (num <= 1) {
//     return false
//   }

//   for (let currentNum = 2; num > currentNum; currentNum += 1) {
//     if (num % currentNum === 0) {
//       return false;
//     }

//     return true;
//   }
// }
// alternative solution

// function isPrime(num) {
//   if (num <= 1 || (num > 2 && num % 2 === 0)) {
//     return false;
//   }

//   let divisor = 3;

//   while (divisor < num) {
//     if (num % divisor === 0) {
//       return false;
//     }

//     divisor += 2;
//   }

//   return true;
// }

// console.log(isPrime(11));

// 6 xor
// function isXor(arg1, arg2) {
//   if ((!!arg1 === true && !!arg2 === false) || (!!arg2 === true && !!arg1 === false)) {
//     return true;
//   } else {
//   return false;
//   }
// }

// console.log(isXor(false, true));     // true
// console.log(isXor(true, false));     // true
// console.log(isXor(false, false));    // false
// console.log(isXor(true, true));      // false


// console.log(isXor(false, 3));        // true
// console.log(isXor('a', undefined));  // true
// console.log(isXor(null, ''));        // false
// console.log(isXor('2', 23));         // false

// 7 guess the password
// const PASSWORD = 'password';
// let failedAttempts = 0;

// while (true) {
//   let guess = prompt('What is the password:');

//   if (guess === PASSWORD) {
//     console.log('You have successfully logged in.');
//     break;
//   }

//   failedAttempts += 1;

//   if (failedAttempts === 3) {
//     console.log('You have been denied access.');
//     break;
//   }
// }

// 9 divisor
// function gcd(num1, num2) {
//   let arr = [];
//   for (let n = 1; n < num1; n += 1) {
//     if ((num1 % n === 0) && (num2 % n === 0)) {
//       arr.push(n);
//     }
//   }
//   console.log(Number(arr.slice(-1)));
// }

// gcd(12, 4);   // 4
// gcd(15, 10);  // 5
// gcd(9, 2);    // 1

// 10
// let isPrime = function(number) {
//   if (number < 2) {
//     return false;
//   }

//   for (let firstNumber = 2; firstNumber < number; firstNumber += 1) {
//     if (number % firstNumber === 0) {
//       return false;
//     }
//   }

//   return true;
// };

// function findSums(num) {
//   if (num % 2 == 1 || num < 4 ) {
//     console.log(null);
//     return;
//   }

//   let num1 = 1;
//   let num2;

//   do {
//     num1 += 1;
//     num2 = num - num1;
//     if (isPrime(num1) && isPrime(num2)) {
//       console.log(num1, num2);
//     }
//   } while (num1 !== num2)
// }

// findSums(100);

// // console.log(isPrime(65));

// 11 pattern generation
// function generatePattern(num) {
//   let arr = [];

//   for (let i = 1; i <= num; i += 1) {
//     arr.push(i);
//   }

//   let size = arr.join('').length

//   arr.forEach(function(num, index) {
//     let numbers = arr.slice(0, num).join('');
//     let numbersSize = numbers.length
//     let stars = '*'.repeat(size - numbersSize);

//     console.log(`${numbers}${stars}`);
//   });

// generatePattern(20);

// 13
function trim(str) {
  let first = null;
  let last = null;

  let arr = []
  for (i = 0; i < str.length; i += 1) {
    arr.push(str[i]);
  }

  first = arr.findIndex((element) => element !== " ");

  for (let i = (str.length - 1); i >= 0; i -= 1) {
    // if arr.slice(i, (str.length - 1)).includes
  }

  let regex = /a-z/;
  last = arr.lastIndexOf(/a-z/)
  console.log(last);
}

// function trim(string) {
//   let trimmed = trimLeft(string);
//   trimmed = trimRight(trimmed);

//   console.log(trimmed);
// }

// function trimLeft(string) {
//   let newString = '';
//   let copyMode = false;

//   for (let index = 0; index < string.length; index += 1) {
//     if (string[index] !== ' ') {
//       copyMode = true;
//     }

//     if (copyMode) {
//       newString += string[index];
//     }
//   }

//   return newString;
// }

// function trimRight(string) {
//   let newString = '';
//   let copyMode = false;

//   for (let index = string.length - 1; index >= 0; index -= 1) {
//     if (string[index] !== ' ') {
//       copyMode = true;
//     }

//     if (copyMode) {
//       newString = string[index] + newString;
//     }
//   }

//   return newString;
// }


// trim('  abc  ');  // "abc"
// trim('abc   ');   // "abc"
// trim(' ab c');    // "ab c"
// trim(' a b  c');  // "a b  c"
// trim('      ');   // ""
// trim('');         // ""

// // 14

// function splitString(str, delimiter) {
//   if (delimiter == undefined) {
//     console.log('Error... no delimiter');
//     return;
//   }

//   let tempString = '';
//   for (let i = 0; i < str.length; i += 1) {
//     if (str[i] === delimiter) {
//       console.log(tempString);
//       tempString = '';
//     } else if (delimiter === '') {
//       console.log(str[i]);
//     } else {
//       tempString += str[i];
//     }
//   }

//   if (tempString) {
//     console.log(tempString);
//   }

// }


// splitString('abc,123,hello world', ',');
// // logs:
// // abc
// // 123
// // hello world

// splitString('hello');
// // logs:
// // ERROR: No delimiter

// splitString('hello', '');
// // logs:
// // h
// // e
// // l
// // l
// // o

// splitString('hello', ';');
// // logs:
// // hello

// splitString(';hello;', ';');
// // logs:
// //  (this is a blank line)
// // hello

// 15
// function repeat(string, times) {
//   let newString = ''
//   if ((Number.isInteger(times) === false) || times < 0) {
//     console.log(undefined);
//   } else if (times === 0) {
//     console.log('');
//   } else if (times > 0) {
//     for (i = 1; i <= times; i += 1) {
//       newString += string
//     }
//     console.log(newString);
//   }
// }

// repeat('abc', 1);       // "abc"
// repeat('abc', 2);       // "abcabc"
// repeat('abc', -1);      // undefined
// repeat('abc', 0);       // ""
// repeat('abc', 'a');     // undefined
// repeat('abc', false);   // undefined
// repeat('abc', null);    // undefined
// repeat('abc', '  ');    // undefined

// // 16
// function startsWith(string, searchString) {
//   let size = searchString.length;
//   let arr = Array.from(string);

//   if (arr.slice(0, size).join('') === searchString) {
//     console.log(true);
//   } else {
//     console.log(false);
//   }
// }

// let str = 'We put comprehension and mastery above all else';
// startsWith(str, 'We');              // true
// startsWith(str, 'We put');          // true
// startsWith(str, '');                // true
// startsWith(str, 'put');             // false

// let longerString = 'We put comprehension and mastery above all else!';
// startsWith(str, longerString);      // false

// 17
// // const isUpperCase = (string) => /^[A-Z]*$/.test(string);
// function isUpperCase(string) {
//   return /^[A-Z]*$/.test(string);
// }

// function toLowerCase(string) {
//   let arr = Array.from(string);
//   newString = "";
//   arr.forEach((val) => {
//     let num = val.charCodeAt(0) + 32;
//     if (isUpperCase(val)) {
//       newString += String.fromCharCode(num);
//     } else {
//       newString += val;
//     }

//   });
//   console.log(newString);
// }

// toLowerCase('ALPHABET');    // "alphabet"
// toLowerCase('123');         // "123"
// toLowerCase('abcDEF');      // "abcdef"

// 18

// The start argument is the starting index. If negative, treat it as strLength + start where strLength is the length of the string. For example, if start is -3, treat it as strLength - 3.

// The length argument is the maximum length of the desired substring. If length exceeds the number of characters available, just use the available characters.

// function substr(string, start, length) {

//   if (start < 0) {
//     start = string.length + start;
//   }

//   let newString = '';
//   for (let counter = 0; counter < length; counter += 1) {
//     let index = start + counter;

//     if (string[index] === undefined) {
//       break;
//     }

//     newString += string[index];
//   }

//   console.log(newString);

// }

// let string = 'hello world';

// substr(string, 2, 4);      // "llo "
// substr(string, -3, 2);     // "rl"
// substr(string, 8, 20);     // "rld"
// substr(string, 0, -20);    // ""
// substr(string, 0, 0);      // ""

// //  19

// function substring(string, start, end) {
//   let newString = '';
//   if (start > 0 && end > 0 && (start < end) &&  (start < string.length && end < string.length)) {
//     for (i = start; i < end; i += 1) {
//       newString += string[i];
//     }
//   } else if (start > 0 && end > 0 && (end < start) &&  (start < string.length && end < string.length)) {
//     [start, end] = [end, start];

//     for (i = start; i < end; i += 1) {
//       newString += string[i];
//     }
//   }

//   // if (start < 0) {
//   //   start = string.length + start;
//   // }

//   // let newString = '';
//   // for (let counter = 0; counter < length; counter += 1) {
//   //   let index = start + counter;

//   //   if (string[index] === undefined) {
//   //     break;
//   //   }

//   //   newString += string[index];
//   // }

//   console.log(newString);

// }

// let string = 'hello world';

// substring(string, 2, 4);    // "ll"
// substring(string, 4, 2);    // "ll"
// substring(string, 0, -1);   // ""
// // substring(string, 2);       // "llo world"
// // substring(string, 'a');     // "hello world"
// // substring(string, 8, 20);   // "rld"

//  ROT 13 Cipher
// const lower = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];

// const upper = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

// function rot13(str) {
//   let newStr = '';

//   for (let i = 0; i < str.length; i += 1) {
//     let idx;
//     if (str[i].toLowerCase() === str[i] && lower.includes(str[i])) {
//       idx = lower.indexOf(str[i]) + 13;
//       if (idx > 25) {
//         idx = idx - 26;
//       }

//       newStr += lower[idx];
//     } else if (str[i].toUpperCase() === str[i] && upper.includes(str[i])) {
//       idx = upper.indexOf(str[i]) + 13;
//       if (idx > 25) {
//         idx = idx - 26;
//       }

//       newStr += upper[idx];
//     } else if (lower.includes(str[i]) === false || upper.includes(str[i]) === false) {
//       newStr += str[i];
//     }
//   }

//   return newStr;
// }

// console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// // console.log(rot13('Teachers open.'));


