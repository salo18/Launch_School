// https://edabit.com/challenge/AxiMSPKYwJhdkSrqt

/*
Given two strings, that may or may not be of the same length, determine the minimum number of character deletions required to make an anagram. Any characters can be deleted from either of the strings.
--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- two strings

Output:
- an integer that represent the number of deletions from each strings

Rules:
- what is an anagram?
  - two strings that have the same values
    -- owman // woman -- when both are sorted, equal each other
- a one letter string counts as a valid anagram
- can delete characters from either string
- need to count how many characters are deleted
------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------


------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
makeAnagram("cde", "abc") // 4
// Remove d and e from cde to get c.
// Remove a and b from abc to get c.
// It takes 4 deletions to make both strings anagrams.

makeAnagram("fcrxzwscanmligyxyvym", "jxwtrhvujlmrpdoqbisbwhmgpmeoke") // 30

makeAnagram("showman", "woman") // 2

// edge cases
makeAnagram("", "abc") // 0
makeAnagram("", "") // one or both arguments are empty strings?
makeAnagram("abc", "def") // no anagram
makeAnagram("abc", "def", "ade") // ignore extra argument
makeAnagram([], {}) //  ignore
-------------------- Algorithm ---------------------
- split the string in to an array

---------------------- Notes -----------------------
['c', 'd', 'e']
['a', 'b', 'c']

{
  a: 1,
  b: 2,
}

arr1.filter(x => arr2.includes(x))

 && ['x', 'x'].length === ['x', 'x', 'x'].length
*/
// function makeAnagram(str1, str2) {
//   let arr1 = str1.split('').map(x => x.toLowerCase());
//   let arr2 = str2.split('').map(x => x.toLowerCase());

//   let filtered1 = arr1.filter(x => arr2.includes(x));
//   let filtered2 = arr2.filter(x => arr1.includes(x));

//   let count = 0;

//   let filtered = filtered1.length > filtered2.length ? filtered2 : filtered1;

//   console.log(filtered1);
//   console.log(filtered2);
//   console.log(arr1);
//   console.log(arr2);
//   // console.log(filtered2);

//   count += (arr1.length - filtered.length);
//   count += (arr2.length - filtered.length);

//   console.log(count);
//   // console.log(arr2);
// }

function makeAnagram(str1, str2) {
  if (!str1 || !str2) {
    return 'invalid'
  }

  str1 = str1.toLowerCase();
  str2 = str2.toLowerCase();

  let obj1 = {};
  let obj2 = {};

  let count = 0;

  for (let i = 0; i < str1.length; i += 1) {
    if (obj1[str1[i]]) {
      obj1[str1[i]] += 1;
    } else {
      obj1[str1[i]] = 1;
    }
  }

  for (let i = 0; i < str2.length; i += 1) {
    if (obj2[str2[i]]) {
      obj2[str2[i]] += 1;
    } else {
      obj2[str2[i]] = 1;
    }
  }

  for (let char in obj1) {
    if (obj2[char]) {
      count += Math.abs(obj1[char] - obj2[char]);
    } else {
      count += obj1[char]
    }
  }

  for (let char in obj2) {
    if (!obj1[char]) {
      count += obj2[char]
    }
  }

return count;
  // console.log(obj1);
  // console.log(obj2);
}


console.log(makeAnagram("cde", "abc")); // 4

// Remove d and e from cde to get c.
// Remove a and b from abc to get c.
// It takes 4 deletions to make both strings anagrams.

console.log(makeAnagram("fcrxzwscanmligyxyvym", "jxwtrhvujlmrpdoqbisbwhmgpmeoke")); // 30

console.log(makeAnagram("showman", "woman")); // 2
console.log(makeAnagram("", "abc")); // 0
console.log(makeAnagram("", ""));       // 0
console.log(makeAnagram("abc", "def")); // 6
console.log(makeAnagram("str", undefined)); // 'invalid'
console.log(makeAnagram("str")); // 'invalid'
console.log(makeAnagram("abc", "ABCd")); // 1 -- case insensitive
console.log(makeAnagram("abc111", "ABC1d!#")); // 5 - but other characters are also valid 