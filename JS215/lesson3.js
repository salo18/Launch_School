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
