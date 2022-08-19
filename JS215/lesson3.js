// 1
/*
Consider a character set consisting of letters, a space, and a point. Words consist of one or more but at most 20 letters. An input text consists of one or more words separated from each other by one or more spaces and terminated by zero or more spaces followed by a point. Input should be read from and including the first letter of the first word, up to and including the terminating point. The output text is to be produced such that successive words are separated by a single space with the last word being terminated by a single point. Odd words are copied in reverse order while even words are merely echoed.

input string:
'whats the matter with kansas.'
becomes:
'whats eht matter htiw kansas.'
*/



/*
--------------------------PROBLEM----------------------------------------
Input: an input string
- one or more words
- separated by one or more spaces
- terminated by:
  - zero or more spaces
    - followed by a point
- words: one or more characters up to 20
- possible characters in input - letters, spaces, point

Output: a modified output string --- can't modify the caller since strings are immutable
- sentence of words with ever other word reversed
- words separated by one space
- sentence terminated by zero spaces then a point

---------------------------RULES-----------------------------------------
Explicit:
- words are 1-20 letters
- input text is 1 or more words separated by one or more spaces and terminated by zero ore more spaces followed by a .
- output text should be separated by a single space and end with a .
- odd words are reversed, even words stay the same
Implicit:
- sentence should be trimmed of extraneous spaces
- last word should end with a . -- edge case where last word is odd and is reversed
- odd and even is based on a word's index in the string (not by character count)
- no other punctuation to worry about - only an ending period

--------------------------EXAMPLES---------------------------------------
selectiveReversal('whats the matter with kansas.') // 'whats eht matter htiw kansas.'
selectiveReversal('whats    the    matter    with kansas   .') // 'whats eht matter htiw kansas.'
selectiveReversal('whats    the.') // 'whats eht.'
----------------------------ALGO-----------------------------------------
- split the string into an array of words
  -- this will take out punctuation which is acceptable
- filter this array to take out spaces
- create a new array to hold the new words
- iterate over the array -- if index is odd, reverse the string
  - push result to new array
- join and return the new array
*/

// function selectiveReversal(str) {
//   let words = str.split(' ');

//   let justWords = words.filter(word => word.length > 1);

//   let resultArray = [];

//   for (let i = 0; i < justWords.length; i += 1) {
//     if (i % 2 === 0) {
//       resultArray.push(justWords[i]);
//     } else if (i % 2 === 1) {
//       resultArray.push(justWords[i].split('').reverse().join(''));
//     }
//   }

//   let length = resultArray.length;

//   if (length % 2 === 0) {
//     resultArray[length-1] = resultArray[length-1].slice(1, length + 2);
//     return resultArray.join(' ') + '.';
//   } else if (length % 2 === 1) {
//     let finalString = resultArray.join(' ');
//     if (finalString.includes('.')) {
//       return finalString;
//     } else {
//       return finalString + '.';
//     }
//   }
// }


// console.log(selectiveReversal('whats the matter with kansas.')); // 'whats eht matter htiw kansas.'
// console.log(selectiveReversal('whats    the    matter    with kansas   .')); // 'whats eht matter htiw kansas.'
// console.log(selectiveReversal('whats    the.')); // 'whats eht.'





// DIAMONDS
/*
Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

examples:
diamond(1);
// logs
*

diamond(3);
// logs
 *
***
 *

diamond(9);
// logs
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

--------------------------PROBLEM----------------------------------------
Input:
- an odd integer

Output:
- a star pattern

Questions?
---------------------------RULES-----------------------------------------
Explicit:
- integer passed in is always odd

Implicit:
- the 'center' of the star contains input number of stars
- each row of stars always contains input number of characters
- each row contains an odd number of stars
  - stars are incremented by two for each row
  - longest row contains all stars
  - increments back down to 1 star
- there are input number of rows

--------------------------EXAMPLES---------------------------------------
----------------------------ALGO-----------------------------------------
- iterate from 1 - input number
- on each iteration, find the number of stars
  - stars is the index + counter (counter increments by 2 on each iteration)
    - 1st iteration, i === 0 , counter === 1
      - spaces - 4 + * + 4
    - 2nd iteration, i === 1, counter === 3
      - spaces - 3 + * + 3
    - 3rd iteration, i === 2, counter === 5
      - spaces - 2 + * + 2
    - 4th iteration, i === 3, counter === 7
      - spaces - 1 + * + 1
    - 5th iteration, i === 4, counter === 9
      - spaces - 0 + * + 0
    do this until counter === input number
    - iterate back down until counter === 1

SPACES
  - (input number - 1) / 2 per side of the stars
*/

// function diamond(num) {
//   if (num === 1) {
//     console.log('*')
//   }

//   const half = (num - 1) / 2;
//   let upcounter = 1;
//   let upspaces = (num - 1) / 2;
//   for (let i = 0; i <= half; i += 1) {
//     console.log(' '.repeat(upspaces) + '*'.repeat(upcounter) + ' '.repeat(upspaces));
//     upcounter += 2;
//     upspaces -= 1;
//   }

//   let downcounter = num - 2;
//   let downspaces = 1;

//   for (let i = half; i > 0; i -= 1) {
//     console.log(' '.repeat(downspaces) + '*'.repeat(downcounter) + ' '.repeat(downspaces));
//     downcounter -= 2;
//     downspaces += 1;
//   }

// }

// diamond(1);
// diamond(3);
// diamond(9);



// COMPARING VERSION NUMBERS
/*
Legal version numbers
1
1.0
1.2
3.2.3
3.0.0
4.2.3.0

Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

If version1 > version2, we should return 1.
If version1 < version2, we should return -1.
If version1 === version2, we should return 0.
If either version number contains characters other than digits and the . character, we should return null.


--------------------------PROBLEM----------------------------------------
Input:
- two version numbers containing numbers and .
Output:
- if v1 > v2 === 1
- if v1 < v2 === -1
- if v1 === v2 === 0
- null - characters other than digits and .

Questions?
- are version numbers always two digits?
  - is 1.123.1 valid?
- do we need to deal with too many periods? 1..0.1?
- what about empty string inputs?
- what about more than two inputs?


---------------------------RULES-----------------------------------------
Explicit:
- version numbers are separated by a period (only one period, not multiple)
- any character other than a number or . is invalid and returns null

Implicit:
- 1 and 1.0 are the same
- 1 < 1.1
- 1 and 1.0.0.0 are the same

- compare the version numbers by decimal place 'position'
  - compare numbers to the left of the .
  - 0.1 < 1 // 0 < 1
  - if the first position is the same, continue to the second position
    - 1.0 === 1.0.0.0
    - it doesn't matter if there are more positions so long as the numbers are the same
  -
--------------------------EXAMPLES---------------------------------------
0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

Edge cases:
- empty input: null, empty string, empty array etc
- boundary conditions
- repeat or duplicate values
- data type specific considerations
  - strings -- case sensitive?
- worry about failure or bad input?
  - need to validate input?
  - how to respond to bad input?
----------------------------ALGO-----------------------------------------
- convert each input string into an array of numbers
- find the length of the longest array
- if the arrays are not equal size, 'pad' the shortest array to include x amount of 0 elements to enable a continuous comparison
- iterate over the longest array
- compare the indexes of each array
- if a position is greater than the other, break the loop and return the appropriate value
*/

// function compareVersions(v1, v2) {
//   if (/\.\./.test(v1) || /\.\./.test(v2)) {
//     return null;
//   } else if (/[^0-9.]/.test(v1) || /[^0-9.]/.test(v2)) {
//     return null;
//   } else if (/^\.[0-9]/.test(v1) || /^\.[0-9]/.test(v2)) {
//     return null;
//   } else if (/[0-9]\.$/.test(v1) || /[0-9]\.$/.test(v2)) {
//     return null;
//   }

//   let arr1 = v1.split('');
//   let arr2 = v2.split('');
//   let len1 = arr1.length;
//   let len2 = arr2.length;

//   if (len1 === 1 && len2 === 1) {
//     if (arr1[0] === arr2[0]) {
//       return 0;
//     } else if (arr1[0] > arr2[0]) {
//       return 1;
//     } else if (arr1[0] < arr2[0]) {
//       return -1;
//     }
//   }

//   let lengthDifference;

//   if (len1 > len2) {
//     lengthDifference = Math.abs(len1 - len2);
//     for (let i = 1; i < lengthDifference; i += 1) {
//       arr2.push('.');
//       arr2.push('0');
//     }
//   } else if (len2 > len1) {
//     lengthDifference = Math.abs(len1 - len2);
//     for (let i = 1; i < lengthDifference; i += 1) {
//       arr1.push('.');
//       arr1.push('0');
//     }
//   }

//   let maxLength = Math.max(arr1.length, arr2.length);

//   for (let i = 0; i < maxLength; i += 1) {
//     //  console.log('arr1 is', arr1[i]);
//     //  console.log('arr2 is', arr2[i]);

//      while (arr1[i] !== arr2[i]) {
//       if (arr1[i] > arr2[i] && arr1[i] !== '.' && arr2[i] !== '.') {
//         return 1;
//       } else if (arr1[i] < arr2[i] && arr1[i] !== '.' && arr2[i] !== '.') {
//         return -1;
//       } else if (arr1[i] === arr2[i] && arr1[i] !== '.' && arr2[i] !== '.') {
//         return 0;
//       }
//     }
//   }

//   return 0;
// }

// // console.log(compareVersions('1', '1.0') === 0); // happy path
// // console.log(compareVersions('0.1', '1.0') === -1); // happy path
// // console.log(compareVersions('3.2.3', '3.2.0') === 1); // happy path
// // console.log(compareVersions('1.2', '1.2.0.0') === 0); // happy path
// // console.log(compareVersions('0.1!', '1.0') === null); // invalid character
// // console.log(compareVersions('1.a', '1.0') === null); // invalid character
// // console.log(compareVersions('0.1', '1..0') === null); // too many periods
// // console.log(compareVersions('0.1', '') === null); // empty string input
// // console.log(compareVersions('0.1', '1.0', '2.0') === null); // more than two inputs?
// // console.log(compareVersions('0.1', '1.123.1') === null); // version number larger than 2 digits?
// // console.log(compareVersions('.1', '1.') === null); // invalid inputs

// console.log(compareVersions('1', '1'));            // 0
// console.log(compareVersions('1.1', '1.0'));        // 1
// console.log(compareVersions('2.3.4', '2.3.5'));    // -1
// console.log(compareVersions('1.a', '1'));          // null
// console.log(compareVersions('.1', '1'));           // null
// console.log(compareVersions('1.', '2'));           // null
// console.log(compareVersions('1..0', '2.0'));       // null
// console.log(compareVersions('1.0', '1.0.0'));      // 0
// console.log(compareVersions('1.0.0', '1.1'));      // -1
// console.log(compareVersions('1.0', '1.0.5'));      // -1



/*
Given the following problem:
Write a function called doubler that doubles every value in an array
- how should we treat 0?
- what if the array contains non numeric elements?
  - what to do with strings?
- should we mutate the caller?
- what about empty strings?
- what about empty slots in a sparse array?
- what about object properties?
- what about an empty array?
- what to do with multiple arguments?
- what if the argument is a string?
- what if the argument is a non negative integer?
- what if the argument is an object?


*/


// PROBLEM 1
/*
Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

If the phone number is less than 10 digits, assume that it is a bad number.
If the phone number is 10 digits, assume that it is good.
If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
If the phone number is 11 digits and the first number is not 1, then it is a bad number.
If the phone number is more than 11 digits, assume that it is a bad number.
For bad numbers, just a return a string of 10 0s.

--------------------------PROBLEM-------------------
- sanitize a user phone number

------------ **Explicit Requirements** -------------
Rules:
- number less than ten digits are invalid
- number with 10 digits is valid
- number with 11 digits is valid if it starts with a 1 - use the remaining ten digits
  - number with 11 digits not starting with 1 is invalid
- number with more than 11 digits is invalid
- ignore any special characters - space, dash, dot and parenthesis

Inputs:
- a string containing x amount of digits and x amount of special characters to ignore

Output:
- return the sanitized number
- if its an invalid number, return a string of 10 0's

------------ **Implicit Requirements** -------------
- duplicate numbers are allowed
- special characters ignored

------------- **Clarifying Questions** -------------
- is the input going to be a string or a number?
- digits means you don't have to worry about decimals
- problem states that the input contains digits and special characters -- can I assume that letters won't be included?
- what to do with empty input?


------------ Examples/Test Cases/Edge Cases ------------
Happy path:
sanitize('123-456-7890') === '1234567890'
sanitize('1-123-456-7890') === '1234567890' // first 1 is ignored
sanitize('1-123-4!5.6-(7890)') === '1234567890' // first 1 is ignored
sanitize('-123-456-7890') === '1234567890' // first number of 11 digit number is not 1

Edge Cases:
sanitize('2-123-456-7890') === '0000000000' // first number of 11 digit number is not 1
sanitize('s23-456-7890') === '0000000000' // non digit character is invalid
sanitize('s123-456-7890') === '0000000000' // non digit character is invalid
sanitize('456-7890') === '0000000000' // number less than ten digits is invalid
sanitize('') === '0000000000' // empty string is invalid
sanitize('2-111123-456-7890') === '0000000000' // number longer than 11 digits

-------------------- Algorithm ---------------------
- conver the string into an array of characters
- filter the array for just digits
- if the array is longer than 11 or shorter than 10, invalid
- if the array is 11 digits, check if it starts with 1 -- if not invalid
- return either the characters in the array converted to a string or 10 0's
*/

// function sanitize(str) {
//   let arr = str.split('');
//   let filtered = arr.filter(x => /\d/.test(x));

//   if (/[a-zA-Z]/.test(str)) {
//     return '0000000000';
//   }

//   if (filtered.length > 11 || filtered.length < 10) {
//     return '0000000000';
//   }

//   let resultEleven = [];

//   if (filtered.length === 11 && filtered[0] !== '1') {
//       return '0000000000';
//   } else if (filtered.length === 10) {
//       return filtered.join('');
//   } else if (filtered.length === 11) {
//     for (let i = 1; i < filtered.length; i += 1) {
//       resultEleven.push(filtered[i]);
//     }
//     return resultEleven.join('');
//   }

// }

// // console.log(sanitize('123-456-7890')=== '1234567890');
// console.log(sanitize('1-123-456-7890')  === '1234567890'); // first 1 is ignored
// console.log(sanitize('1-123-4!5.6-(7890)') === '1234567890'); // first 1 is ignored
// // console.log(sanitize('-123-456-7890') === '1234567890'); // first number of 11 digit number is not 1

// console.log(sanitize('2-123-456-7890') === '0000000000'); // first number of 11 digit number is not 1
// console.log(sanitize('s23-456-7890') === '0000000000'); // non digit character is invalid
// console.log(sanitize('s123-456-7890') === '0000000000'); // non digit character is invalid
// console.log(sanitize('456-7890') === '0000000000'); // number less than ten digits is invalid
// console.log(sanitize('') === '0000000000'); // empty string is invalid
// console.log(sanitize('2-111123-456-7890') === '0000000000'); // number longer than 11 digits



// PROBLEM 2
/*
--------------------------PROBLEM-------------------
Implment a Luhn formula to validate an id number
------------ **Explicit Requirements** -------------
Rules:
- counting from the rightmost digit and moving left, double the value of every second digit
- for any digit that becomes > 9, subtract 9 from the result
- add all the digits together
- if the result doesn't end in 0, (modulo 10) it is invalid
- ignore all non numeric characters

Inputs:
- number represented as a string

Output:
- true or false

------------ **Implicit Requirements** -------------
- a digit of 0 is acceptable
- ignore spaces

------------- **Clarifying Questions** -------------
- test case given shows a string of four 'sets' of numbers
- what about an empty string?
- should we ignore additional arguments?
- does each set of numbers have to have four digits?
  - does this work as a valid input? "23 20 77 35" or "2323 2005"?


------------ Examples/Test Cases/Edge Cases ------------
1111 becomes 2121
8763 becomes 7733
>> can iterate from index 0 and change every even index instead of going backwards

1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6 -- invalid
8763 becomes 7733, and 7 + 7 + 3 + 3 is 20 --- valid

validLuhn("2323 2005 7766 3554") === true
2323 2005 7766 3554
4343 4005 5736 6514
14    9   21    16 === 60 -- ends with 0 so valid

Happy path:
validLuhn("2323 2005 7766 3554") === true

validLuhn("232aa!3 20!!05 776cc6 355d4") === true // Ignore non numeric characters

validLuhn("") === false // return false because that is not a valid number

validLuhn("2323 2005 7766 3554", anotherArg) === true // ignore additional arguments?
validLuhn("2323 2005 7766 3554.1") === false // ignore fractions but this is missing the last element

what about shorter or longer inputs?
validLuhn("23 20 77 35") === ?? //
validLuhn("2323 2005 ") ===  ?? //

------------------ Data Structure ------------------


-------------------- Algorithm ---------------------
- filter out non digit characters from the string
- check that each set has four digits in it??
- separate the string into an array of sets (split the string by a space)
- convert each set accoding to the specifications
  - double every even indexed integer
- sum up all the individual sets
- sum up the four numbers to get a result
  - if result ends in 0, valid, else invalid
---------------------- Notes -----------------------

// */

// function validLuhn(str) {
//   // let arr = str.split(' ');
//   // let filteredArr = arr.map(x => x.replace(/\D/g, ''));
//   // console.log(filteredArr);

//   // for (let i = 0; i < filteredArr.length; i += 1) {
//   //   if (filteredArr[i]. length < 4) {
//   //     return false;
//   //   }
//   // }

//   let filtered = str.replace(/\D/g, '');
//   let resultArr = [];
//   for (let i = 0; i < filtered.length; i += 1) {
//     if (i % 2 === 0 ) {
//       if (filtered[i] * 2 > 9 ) {
//         resultArr.push((filtered[i] * 2) - 9);
//       } else {
//         resultArr.push(filtered[i] * 2);
//       }
//     } else {
//       resultArr.push(Number(filtered[i]));
//     }
//   }

//   let result = resultArr.reduce((acc, val) => acc + val);

//   let counter = 0;
//   if (result % 10 !== 0) {
//     while (result % 10 !== 0) {
//       counter += 1;
//       result += 1;
//     }
//     resultArr.push(counter);
//   }


//   return resultArr.join('');

//   // let resultStr = String(result);
//   // if (resultStr[resultStr.length - 1] === '0') {
//   //   return true;
//   // } else {
//   //   return false;
//   // }
//   // console.log(result);
// }

// // console.log(validLuhn("2323 2005 7766 3554") === true);
// // console.log(validLuhn("232aa!3 20!!05 776cc6 355d4") === true);
// console.log(validLuhn("232aa!3 20!!05 776cc6 355d4  ")); //

// // console.log(validLuhn("2323 2005 7766 3554"));// === true);

// // console.log(validLuhn("") === false);
// // console.log(validLuhn("2323 2005 7766 3554", anotherArg) === true);
// // console.log(validLuhn("2323 2005 7766 3554.1") === false);
// console.log(validLuhn("23 20 77 35")); //===  //
// console.log(validLuhn("2323 2005 ")); //===  ?? //



//  PROBLEM 3
/*
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Examples:
isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true

--------------------------PROBLEM-------------------
- try to spell a word using "blocks"

------------ **Explicit Requirements** -------------
Rules:
- a block can only be used once
- if a block is used, only one letter can be used, the other letter is now unavailable
- blocks are uppercase letters but lowercase letters are valid inputs
Inputs:
- string

Output:
- boolean

------------ **Implicit Requirements** -------------
- the block contains each letter of the alphabet only once
  --- this means that matched letter can be taken out

------------- **Clarifying Questions** -------------
- what do to about an empty string input?
- what about other types of inputs?
- what if there are numbers? should they just be ignored?
- should the function modify the caller or log anything?
- is the block a constant or can it be changed?
  - is the letter only included once in the block or will that change?

------------ Examples/Test Cases/Edge Cases ------------

isBlockWord('BaTcH');       // true // case doesn't matter

don't worry about these, just creative thinking
isBlockWord(' ');       // false //
isBlockWord('B9ATCH');      // true

------------------ Data Structure ------------------
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

const blocks = [[B, O], [X, K]]
{'B': 'O', }
keys and values array based on object?



-------------------- Algorithm ---------------------
- convert the string to uppercase
- iterate through the string
  - check if each letter is present in the array or object?
    - if it is, delete that sub array from the main array
    - if the letter is NOT present, return false
- otherwise return true

---------------------- Notes -----------------------
*/

// const outerBlocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']];

// function isBlockWord(str) {
//   let blocks = outerBlocks.slice();
//   let upperCaseStr = str.toUpperCase();

//   let counter = 0;

//   // let junkArr = [];
//   let extra;

//   for (let i = 0; i < str.length; i += 1) {
//     for (let j = 0; j < blocks.length; j += 1) {
//       // console.log(`string index is ${i}`, `letter is ${upperCaseStr[i]}`);
//       // console.log(`array index is ${j}`, `array element is ${blocks[j]}`);

//       if (blocks[j].includes(upperCaseStr[i])) {
//         // extra = blocks.splice(j, 1);
//         blocks.splice(j, 1);
//         // junkArr.push(extra);
//         counter += 1;
//         continue;
//       }
//     }
//     // console.log(blocks);
//     // console.log(junkArr);
//   }

//   if (counter === str.length) {
//     return true;
//   } else if (counter !== str.length) {
//     // console.log(junkArr);
//     return false;
//   }
// }

// console.log(isBlockWord('BATCH'));      // true
// console.log(isBlockWord('BUTCH'));    // false // reusing letters from the same block
// console.log(isBlockWord('jest'));       // true // case doesn't matter
// console.log(isBlockWord('jestasdf'));       // false // case doesn't matter


// PROBLEM 4

/*
You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

"1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
"1-3, 1-2" --> 1, 2, 3, 11, 12
"1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
"104-2" --> 104, 105, ... 112
"104-02" --> 104, 105, ... 202
"545, 64:11" --> 545, 564, 565, .. 611

--------------------------PROBLEM-------------------
- convert short hand notation into a full list of numbers

------------ **Explicit Requirements** -------------
Rules:
- numbers are always increasing
  - 1-3, 1-2 === 1, 2, 3, 11, 12
  - if a number already exists in the range, add to it until the new number is greater than the last digit in the list -- check that the new number ends with the range
- comma separates ranges that need be dealt with separately
  - 1-3, 1-2 === 1, 2, 3, 11, 12
  - 1:5:12 ===  1, 2, 3, 4, 5, 6, ... 12
- : - or .. connote a range
- add to the most recent number in the range until the end of the range matches the number
  - "104-2" --> 104, 105, ... 112
    - add to the number until the new number ends with 2
  - "104-02" --> 104, 105, ... 202
    - add to the number until the new number ends with 02
- starting number is the start of the range but is an island... range must restart at a number larger than the last
  - "545, 64:11" --> 545, 564, 565, .. 611
  - "545, 40:11" --> 545, 640 .. 711

Inputs:
- a string of numbers separated by - : or .. that represents a range of numbers

Output:
- an array containing the full range of numbers

------------ **Implicit Requirements** -------------

------------- **Clarifying Questions** -------------
- what about bad inputs? empty strings?
- do i ignore non integers and non connectors .. : - ?


------------ Examples/Test Cases/Edge Cases ------------
console.log(shortHand("1, 3, 7, 2, 4, 1")); // 1, 3, 7, 12, 14, 21
console.log(shortHand("1-3, 1-2")); // 1, 2, 3, 11, 12
console.log(shortHand("10-3, 1-2")); // 10, 11, 12, 13, 21, 22
console.log(shortHand("1:5:2")); // 1, 2, 3, 4, 5, 6, ... 12
console.log(shortHand("104-2")); // 104, 105, ... 112
console.log(shortHand("104-02")); // 104, 105, ... 202
console.log(shortHand("545, 64:11")); // 545, 564, 565, .. 611
console.log(shortHand("545, 40:11")); // 545, 640 .. 711

- test string with letters?

-------------------- Algorithm ---------------------
- split the string by commas... this will give us the ranges to work with.
- if there are ranges, destroy them and make the arr of strings represent the numbers represented by the ranges
- if no ranges (test case 1), push each number into a result array
  - if the next number in the split array is smaller than the number at the highest index of the result array, increment the number until it is greater than the highest index number of the result AND it ends with the number 7, 2 ==> 12

// - if there is a range, split the range by : .. or -
//   - for each range, increment the result array by 1 until the last number is greater than the higest index of the array and it ends with the higher limit of the range


*/

function shortHand(string) {
  let arrOfStringNumbers = string.replace(/-+|\.+/g, ':').split(', ');

  let newElements;
  // let originalLength = arrOfStringNumbers.length;

  // for (let i = 0; i < originalLength; i += 1) {
  //   if (/:/.test(arrOfStringNumbers[i])) {
  //     newElements = arrOfStringNumbers[i].split(':');
  //     console.log(newElements);
  //     arrOfStringNumbers.splice(i, 1);
  //     newElements.forEach(x => arrOfStringNumbers.push(x));
  //   }
  // }

  arrOfStringNumbers.map(element => {
    if (/:/.test(element)) {
      // console.log(element.split(':'));
      return element.split(':');
    }
  });

  // STUCK TRYING TO CONVERT RANGES INTO PROPERLY FORMATTED ARRAY OF STRING NUMBERS !!!

  // arrOfStringNumbers.forEach((element, index) => {
  //   console.log(element);
  //   if (/:/.test(element)) {
  //     newElements = element.split(':');
  //     console.log(newElements);
  //     arrOfStringNumbers.splice(index, 1);
  //     newElements.forEach(x => arrOfStringNumbers.push(x));
  //   }
  // });

  console.log(arrOfStringNumbers);
  // .map(x => Number(x)));
}

// console.log(shortHand("1, 3, 7, 2, 4, 1")); // 1, 3, 7, 12, 14, 21
console.log(shortHand("1-3, 1-2")); // 1, 2, 3, 11, 12
console.log(shortHand("10-3, 1-2")); // 10, 11, 12, 13, 21, 22
// console.log(shortHand("1:5:2")); // 1, 2, 3, 4, 5, 6, ... 12
// // console.log(shortHand("104-2")); // 104, 105, ... 112
// console.log(shortHand("104-02")); // 104, 105, ... 202
// console.log(shortHand("545, 64-11")); // 545, 564, 565, .. 611
// console.log(shortHand("545, 40:11")); // 545, 640 .. 711