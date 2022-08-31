// https://edabit.com/challenge/y8fTF8GBMAXTdkrkH

/*
Create a function that identifies the very first item that has recurred in the string argument passed. It returns the identified item with the index where it first appeared and the very next index where it resurfaced -- entirely as an object; or as an empty object if the passed argument is either null, undefined, empty string, or no recurring item exists.

recurIndex("DXTDXTXDTXD") ➞ {"D": [0, 3]}
// D first appeared at index 0, resurfaced at index 3
// T appeared and resurfaced at indices 3 and 6 but D completed the cycle first
--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- a string of letters

Output:
- an object
  - key is a letter
  - value is an array [first occurence, next occurence]
- empty object if invalid input or

Rules:
- first occurence of a letter occurs at the string index that first sees that letter
- look for the next occurence of that letter (doesn't matter if there is a "shorter" interval later on in the sequence with the same letter)
- if the argument is an empty string, null, undefined return an empty object
- if no recurring string, return an empty object

------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------


------------ Examples/Test Cases/Edge Cases ------------
// HAPPPY PATH
recurIndex("YXZXYTUVXWV") ➞ {"X": [1, 3]}

recurIndex("YZTTZMNERXE") ➞ {"T": [2, 3]}

recurIndex("AREDCBSDERD") ➞ {"D": [3, 7]}

recurIndex("") ➞ {}

recurIndex(null) ➞ {}

recurIndex("YxZXyTUVXWV") ➞ {"X": [1, 3]} // case sensitive?

recurIndex([], {}, 22) ➞ {"X": [1, 3]} // invalid data types

recurIndex("!Y!x_Z_XyTUVXWV!") ➞ {"X": [1, 3]} // do non letter values count or should they be ignored?

recurIndex("YxZXyTUVXWV") ➞ {"X": [1, 3]} // case sensitive?

recurIndex("YxZXyTUVXWV", 'ZBCC') ➞ {"X": [1, 3]} // multiple arguments?
-------------------- Algorithm ---------------------
- declare and initialize a variable to point to an empty object
- create a isValid helper method.. if input is not valid, return an empty object - regex?
- iterate over the string
  - if the object does not contain a key with the letter, add the letter and an array that contains the current index
  {"X": [1]}
  - if the object does contain the letter, push the current index into the array that matches the corresponding letter
  {"X": [1, 3]}
- we should then have an object containing all the letters in the string
  {"X": [1, 3], "Y": [2, 5]}
- convert the object into an array and sort the array based on the value's second index
- the smallest value should be saved to its own array, converted to an object and returned
- if there is no smallest value (nothing at index 1 of the array) return an empty object


---------------------- Notes -----------------------


*/

function recurIndex(str) {
  let obj = {};

  if (!isValid(str)) {
    return obj;
  }

  for (let i = 0; i < str.length; i += 1) {
    if (obj[str[i]]) {
      obj[str[i]].push(i);
    } else {
      obj[str[i]] = [i];
    }
  }

  // console.log(obj);
  let allLetters = Object.entries(obj).filter(x => x[1].length > 1).sort((a, b) => a[1][1] - b[1][1]);

  // console.log(allLetters);
  let winner = allLetters[0];

  if (winner[1].length !== 2) {
    do {
      winner[1].pop();
    } while (winner[1].length > 2)
  }

  winner = [winner];
  return Object.fromEntries(winner);
}

function isValid(str) {
  // if (str === undefined) {
  //   return false;
  // }
  return /[A-Z]+/.test(str) ? true : false;
}

console.log(recurIndex("YXZXYTUVXWV")); // {"X": [1, 3]}

console.log(recurIndex("YZTTZMNERXE")); // {"T": [2, 3]}

console.log(recurIndex("AREDCBSDERD")); // {"D": [3, 7]}

console.log(recurIndex("AKEDCBERSDA")); // {"E": [2, 6]}

console.log(recurIndex("ABCKPEPGBCG")); // { P: [ 4, 6 ] }


console.log(recurIndex("")); // {}

console.log(recurIndex(null)); // {}
console.log(recurIndex(undefined)); // {}


// let [strVectors, objRes] = [[
// 	'DXTDXTXDTXD', 'YXZXYTUVXWV', 'YZTTZMNERXE',
// 	'AREDCBSDERD', '', null, 'KDXTDATTDDX',
// 	'AKEDCBERSDA', 'DXKETRETXDK', 'ABCKPEPGBCG',
// 	'KLMNONMLKOP', 'ABCDEFGHIJK', 'ABCDEFGABCD', undefined ],
//   [{"D":[0,3]}, {"X":[1,3]}, {"T":[2,3]},
// 	 {"D":[3,7]}, {}, {}, {"D":[1,4]},
// 	 {"E":[2,6]}, {"E":[3,6]}, {"P":[4,6]},
// 	 {"N":[3,5]}, {}, {"A":[0,7]}, {}]]
// for (let i in strVectors) {
//   Test.assertSimilar(recurIndex(strVectors[i]), objRes[i])
// }