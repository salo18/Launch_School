
/*
--------------------------PROBLEM----------------------------------------
Input:
Output:
Questions?
---------------------------RULES-----------------------------------------
Explicit:
Implicit:
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO-----------------------------------------


Questions:
- should the function modify the caller?

Edge cases:
- inputs
  - empty input: null, empty string, empty array etc
  - can the function handle different types of inputs? numbers, strings, booleans, objects?
  - what about multiple arguments if we are only expecting one?
- special values
  - numbers
    - does it work with zero, negative numbers, fractional numbers (0.567) or special values (NaN, Infinity)?
  - arrays
    - does it work with a sparse array [1, , 2] or an array with an object property [1, 2, a: "A"]
    - array elements
      - what if the array elements are booleans, null / undefined, empty objects, functions, regex, NaN, Infinity, -Infinity?
    - should non-primitive elements have their reference duplicated or their value?
    - what about elements that appear more than once?
    - what about nested arrays or objects?
    - how to treat empty slots of a sparse array
    - what about object properties?
    - what about an empty array?
    - what if the argument is a string, number or object instead of array?
  - strings
    - is it case sensitive?
- valid inputs
  - what should we consider as invalid input and what to do with them?
  - should we return a specific value like null or undefined if the input is invalid?
- boundary conditions
- repeat or duplicate values
- worry about failure or bad input?
  - what do we do if an input has been omitted?
    - issue an error message?
    - return a specific value?
    - set that input to a default value and execute the function normally?
  - need to validate input?
  - how to respond to bad input?




*/




/*
Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors.
For instance, if the target is 20, and the factors are 3 and 5, that gives us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.
If no factors are given, use 3 and 5 as the default factors.


Problem:
- convert a number into the sum of multiples up to that number
Input:
- a natural number // optional factors of 3 and 5 if no factors are provided
Output:
- the sum of the natural factors up to the target number

Explicit requirements:
- find numbers that are a factor of the target -- target % factor === 0

Implicit requirements:
- positive numbers only
- target number not included
- only unique values

Examples and test cases:
factorSum(20) === 78 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18)
factorSum(1) === ?? --- target is too small  to have factors?
factorSum(11) === 'error message' --- target is a prime number and doesn't have factors
factorSum(9, 2) === 'error message?' target is not divisible by factor
factorSum(-2) === what to do with negative numbers
factorSum('str' // [] // {}) === what to do with invalid input?
factorSum(9, 2, 3, 4) === 'error message?' some factors are not divisible but some are

Algorith:
- create an array of arguments
- if array is empty, create an array containing 3 and 5 (default parameters)
- declare and initialize a new array to hold all the factorials
- iterate 1 - target number of times
  - for each iteration, check if the number is divisible by all the arguments
  - if true, save to the array
- sum and return the values held in the array
*/

// function factorSum(target, ...args) {
//   let nums = [];
//   if (args.length === 0) {
//     args = [3, 5];
//   }

//   for (let i = 1; i < target; i += 1) {
//     for (let j = 0; j < args.length; j += 1) {
//       if (i % args[j] === 0) {
//         nums.push(i);
//       }
//     }
//   }

//   console.log(nums);

//   let uniques = [];
//   for (let i = 0; i < nums.length; i += 1) {
//     if (!uniques.includes(nums[i])) {
//       uniques.push(nums[i]);
//     }
//   }

//   let value;
//   if (uniques.length === 0) {
//     value = 0;
//   } else {
//     value = uniques.reduce((acc, num) => acc + num);
//   }
//   console.log(value);
// }

// factorSum(20) //=== 78
// factorSum(11) //=== 33
// factorSum(20, 11) // === 11
// factorSum(1) // === 0


// more practice...

/*
Write a program that takes a string as input and returns a count of how many words in the string can be rearranged to form palindromes. You may assume that input strings are at least 1 character in length and contain only alphabetic characters. You may ignore case for the purpose of assessing possible palindromes.

ex. Processing the string “aaa bca Abab” should return the integer 2 because “aaa” is already a palindrome and “Abab” can be rearranged to “Abba”, which is also a palindrome (case insensitive). Thus, two of the three words in the string can be made into palindromes.


--------------------------PROBLEM----------------------------------------
Questions:
- what is a palindrome? -- reads the same backwards and forwards or just the same letters in the word?

Input:
- a string

Output:
- a number that represents the number of strings that are a palindrome

---------------------------RULES-----------------------------------------
Explicit:
- case insensitive
- input string is 1 character or greater
- only alphabetic characters
- the word itself doesn't need to be a palindrome... success if it can be arranged to become a palindrome

Implicit:
- single character strings are not considered palindromes 'a' is not a palindrome


--------------------------EXAMPLES---------------------------------------

palindromeNumbers('how many palindromes in civic level radar rotor') === 4
palindromeNumbers('how') === 0
palindromeNumbers('') === 0
palindromeNumbers('cviic leevl raadr ortor') === 4


----------------------------ALGO-----------------------------------------
- split the string into an array of lowercase strings
- iterate through the array and filter to see if each word is a palindrome
  - determine if each word is a palindrome
    - rearrange the letters in each word to see if it creates a palindrome?
    - for each word, create an array of all combinations of the word
      - on these permutations...
        - create two substrings... one for the first half of the word and another for the second half
          - for odd index words, find the middle index and create substrings up to but not including the middle index
        - compare the substrings... if they are the same, it is a palindrome
- store the filtered words in an array and return the array length
*/

// function palindromeNumbers(str) {
//   let arr = str.split(' ');

//   let filtered = arr.filter(word => {
//     // console.log(word.split(''))
//     isPalindrome(word.toLowerCase());
//   });

//   // console.log(filtered.length);
// }

// function isPalindrome(word) {
//   let letters = word.split('');
//   let wordsArr = [];

//   console.log(letters.slice(1, 4));


//   // return true;  // console.log(word);
// }


function isPalindrome(str) {
  var reverse = str.split("").reverse().join("");
  return str === reverse;
}

function getCharCounts(chars) {
  // console.log(chars);
  var charCounts = {};
  for (var i = 0, charLen = chars.length; i < charLen; i += 1) {
    if (charCounts[chars[i]]) {
      charCounts[chars[i]] += 1;
    } else {
      charCounts[chars[i]] = 1;
    }
  }
  // console.log(charCounts);
  return charCounts;
}

function possiblePalindrome(str) {
  if (isPalindrome(str)) {
    return true;
  }

  var chars = str.split("");
  var charCounts = getCharCounts(chars);
  console.log(charCounts); // { b: 4, a: 1 }
  var oddsCount = 0;

  var charKeys = Object.keys(charCounts);
  for (var i = 0, len = charKeys.length; i < len; i += 1) {
    console.log(charCounts[charKeys[i]]);
    if (charCounts[charKeys[i]] % 2 === 1) {
      oddsCount += 1;
    }

    console.log('odss count is', oddsCount);
    if (oddsCount > 1) {
      return false;
    }
  }

  return true;
}

function palindromeCounter(str) {
  str = str.toLowerCase();
  var words = str.split(" ");
  var counter = 0;

  for (var i = 0, len = words.length; i < len; i += 1) {
    if (possiblePalindrome(words[i])) {
      counter += 1;
    }
  }

  return counter;
}

// console.log(palindromeCounter("a"));            // 1  ("a")
// console.log(palindromeCounter("ab"));           // 0
// console.log(palindromeCounter("Abc Def G"));    // 1  ("g")
// console.log(palindromeCounter("abbAc C ddEf")); // 2  ("abcba", "c")
// console.log(palindromeCounter("lmn opq rst"));  // 0
console.log(palindromeCounter("AAA bAbbB"));    // 2  ("aaa", "bbabb")

// console.log(palindromeNumbers('how many palindromes in civic level radar rotor')); //=== 4
// palindromeNumbers('howwoh') === 0
// palindromeNumbers('a') === 0
// palindromeNumbers('cviic leevl raadr ortor') === 4
