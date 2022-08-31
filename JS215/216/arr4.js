// https://edabit.com/challenge/fpHGmHoKX5RyD3wjQ

/*
Create a function that determines how many number pairs are embedded in a space-separated string. The first numeric value in the space-separated string represents the count of the numbers, thus, excluded in the pairings.

Always take into consideration the first number in the string is not part of the pairing, thus, the count. It may not seem so useful as most people see it, but it's mathematically significant if you deal with set operations.

--------------------------PROBLEM-------------------
------------ **Explicit Requirements** -------------
Inputs:
- a string of space separated numbers
- the first number represents how many numbers are in the string and should be ignored

Output:
- a number that represents the number of pairs
- if no numbers are pairs, return 0

Rules:
- pairs occur any time a number is repeated twice
("7 1 2 1 2 1 3 2")
=> [1, 1], [2, 2] - the last 132 are ignored since there is no other like number to pair it with
- ignore the first number
- once a number is used in a pair, it can't be used again and should be ignored


------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------


------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
numberPairs("7 1 2 1 2 1 3 2") ➞ 2
// (1, 1), (2, 2)

numberPairs("9 10 20 20 10 10 30 50 10 20") ➞ 3
// (10, 10), (20, 20), (10, 10)

numberPairs("4 2 3 4 1") ➞ 0
// Although two 4's are present, the first one is discounted.

numberPairs([7, 1, 2, 1, 2, 1, 3, 2]) // what about an array of numbers?

numberPairs("4 2 3 4 1 a z b ") // should we ignore other string characters?

numberPairs("") // what about an empty string?

numberPairs([], {}, undefined) // other types of invalid input

should this method modify the caller?

numberPairs(4, 2, 3, 4, 1,) // what about numbers passed in as arguments?

numberPairs("4 0 0 4 1 a z b ") // should we ignore 0?

numberPairs("4-2 3.1 4 1 a z b ") // numbers separated by dashes? / decimals? -- always whole numbers?

-------------------- Algorithm ---------------------
- split the string into an array of characters
- convert the characaters into numbers
- shift the first element out of the array
[1, 2, 1, 2, 1, 3, 2]
- declare and initialize an object
- iterate through the array and add each number as a key
  - the value should correspond to how many times that number is present in the array
  {
    1: 3,
    2: 3,
    3: 1
  }
// - filter the array for numbers that appear more than once
//   {
//     1: 3,
//     2: 3,
//   }
- iterate over the object and divide each value by 2 and get the floor
- initialize a counter and reassign the counter to the result of the division on each iteration
- return the counter
---------------------- Notes -----------------------
*/
function numberPairs(str) {
  let arr = str.split(' ');
  arr.shift();
  let numArr = arr.map(el => Number(el));

  let numberCounts = {};

  numArr.forEach(x => {
    if (numberCounts[x]) {
      numberCounts[x] += 1;
    } else {
      numberCounts[x] = 1;
    }
  });

  let counter = 0;
  let num;
  for (number in numberCounts) {
    num = Math.floor(numberCounts[number] / 2);
    if (num) {
      counter += num;
    }

  }
  return counter;
}

console.log(numberPairs("7 1 2 1 2 1 3 2")); // 2
// (1, 1), (2, 2)

console.log(numberPairs("9 10 20 20 10 10 30 50 10 20")); // 3
// // (10, 10), (20, 20), (10, 10)

console.log(numberPairs("4 2 3 4 1")); // 0
// // Although two 4's are present, the first one is discounted.

