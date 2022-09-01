// https://edabit.com/challenge/wtPATmEY9xQCpzWNT

/*
Write a function that replaces every row and column that contains at least one 1 into a row/column that is filled entirely with 1s.

You must mutate the original array.
Input matrices will have at least row and one column.
Bonus: Solve this without using any higher-order functions.

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- a nested array of three arrays containing 1's and 0's

Output:
- a nested array
- must mutate the original array

Rules:
- need to replace the zeros
  - if there is a 1 in a row, the entire row (that entire array) must become 1's
  - if there is a 1 in a column, the entire column (all array elements at that index) must become 1's
- a "row" is represented by a nested array
- a "column" is represented by the index of all the nested arrays

------------ **Implicit Requirements** -------------

------------- **Clarifying Questions** -------------
- will there always be three arrays? or should I deal with the possiblity of more arrays?
- arrays can be any size?
- will arrays always be the same size? arr1 is 5 elements long, arr2 is 2 elements long? etc

------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
onesInfection([
  [0, 0, 1],
  [0, 0, 0],
  [0, 0, 0]
]) // [
//   [1, 1, 1],
//   [0, 0, 1],
//   [0, 0, 1]
// ]

onesInfection([
  [1, 0, 1, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
]) // [
//   [1, 1, 1, 1],
//   [1, 1, 1, 1],
//   [1, 1, 1, 0]
// ]

onesInfection([
  [0, 1, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
]) // [
//   [1, 1, 1, 1],
//   [0, 1, 0, 1],
//   [1, 1, 1, 1]
// ]

// invalid inputs
onesInfection([
  [0],
  [0, 0],
  [0, 1, 0]
]) // arrays of differnt sizes?

onesInfection([
  [0, 1, 0, 1],
]) // one array?

onesInfection([
  [2, 1, 4, 1],
  [undefined, 0, 's', 0],
  [0, 1, [], {}]
]) // array containing other numbers, strings, arrays or objects?

onesInfection([
  [],
  [],
  [0, 1, 0, 0]
]) // how to deal with empty arrays?

onesInfection([]) // what if input array is empty?

onesInfection([
  [<2 empty lines>, 1, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
]) // do I need to worry about sparse arrays?

onesInfection([
  's',
  [0, 0, 0, 0],
  {}
]) // how to deal with different data types?

onesInfection([
  [0, 1, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
], []) // what about multiple arguments?

onesInfection([
  [[0, 1], 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
]) // what about nested array objects?

onesInfection([
  [0, 1, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0], '-1': 1,
]) // what about array properties?

onesInfection([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
]) // if all 0's should I do something special?  same for all 1's?
-------------------- Algorithm ---------------------
onesInfection([
  [1, 0, 1, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])

- iterate through each array
  - find the indexes where the number 1 occurs -- store these values in an array
[0, 1, 2]
- iterate through the array again
  - if the array contains the number 1, replace all elements with the number 1
  OR
  - if the current element's index is included in the index array, replace that index with 1

---------------------- Notes -----------------------
*/

function onesInfection(nested) {
  let indexes = [];

  nested.forEach(arr => {
    arr.forEach((el, idx) => {
      if (el === 1) {
        indexes.push(idx)
      }
    });
  });

  nested.forEach(arr => {
    if (arr.includes(1)) {
      arr.forEach((el, idx) => arr[idx] = 1);
    }

    arr.forEach((el, idx) => {
      if (indexes.includes(idx)) {
        arr[idx] = 1;
      }
    });
  });

  return nested;
}

console.log(onesInfection([
  [0, 0, 1],
  [0, 0, 0],
  [0, 0, 0]
])); // [
//   [1, 1, 1],
//   [0, 0, 1],
//   [0, 0, 1]
// ]

// console.log(onesInfection([
//   [1, 0, 1, 0],
//   [0, 1, 0, 0],
//   [0, 0, 0, 0]
// ])); // [
//   [1, 1, 1, 1],
//   [1, 1, 1, 1],
//   [1, 1, 1, 0]
// ]

console.log(onesInfection([
  [0, 1, 0, 1],
  [0, 0, 0, 0],
  [0, 1, 0, 0]
])); // [
//   [1, 1, 1, 1],
//   [0, 1, 0, 1],
//   [1, 1, 1, 1]
// ]