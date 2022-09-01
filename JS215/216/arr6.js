// https://edabit.com/challenge/RaxaX4wmKKCsrzKwJ

/*
Write a function that divides an array into chunks such that the sum of each chunk is <= n. Start from the left side of the array and move to the right.

The max of the array will always be smaller than or equal to n.
Use the greedy approach when solving the problem (e.g. fit as many elements you can into a chunk as long as you satisfy the sum constraint).

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- an array of integers
- a number that represents the sum

Output:
- a nested array of all the elements that add up to less than or equal the input number

Rules:
- start from left to right moving element by element
- if element n up to element m add up to less than 5, group those elements together into their own nested array
  - stop only if element m + 1 would set the sum to over the target sum
  [1, 2, 3], 5
  >>> [1, 2], [3] - stop at 3 because that would set the sum to over 5
- add as many elements as possible to each nested array -- "greedy"
- stop the nested array at index - 1 of the index that would set the number over the target sum

------------ **Implicit Requirements** -------------
- each number can only be counted once
- if the number is used in a nested array, continue the operation at index + 1 of that element

------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
divide([1, 2, 3, 4, 1, 0, 2, 2], 5) // [[1, 2], [3], [4, 1, 0], [2, 2]]

divide([1, 0, 1, 1, -1, 0, 0], 1) // [[1, 0], [1], [1, -1, 0, 0]]

divide([2, 1, 0, -1, 0, 0, 2, 1, 3], 3) // [[2, 1, 0, -1, 0, 0], [2, 1], [3]]

//
divide([], 5) // empty array
divide([1, 2, 3, 4, 1, 0, 2, 2], 0) // target sum is 0 ?
divide([0, 0, 0], 5) // array consists of all 0's
divide([11, 12, 33, 4, 11, 0, 2, 2], 5) // array elements are larger than the target sum?
divide(['asd', [], {}, 4, 1, 0, 2, '2'], '5') // do i need to deal with strings or other non number data types?
divide([1, 2, 3, , , 0, 2, 2], 5) // deal with sparse arrays?
divide([1, 2, 3, 4, 1, 0, 2, 2]) // what if no target sum is provided?
divide(5) // what if no array is provided?
divide([1, 2, 3, 4, 1, 0, 2, 2], [1, 2, 3], 5) // what if multiple arguments are provided?
divide([1, 2, 3, 4, 1, 0, 2, 2], 5) // do I need to mutate the caller? I am guessing I should return a new array?
divide([1,'-1': 1], 5) // should I ignore object properties?

-------------------- Algorithm ---------------------
[1, 2, 3, 4, 1, 0, 2, 2], 5
1 <= 5 Y [1]
1 + 2 <= 5 Y [1, 2]
1 + 2 + 3 <= 5 N [3]
3 + 4 <= 5 N [4]
4 + 1 <= 5 Y [4, 1]
4 + 1 + 0 <= 5 Y [4, 1, 0]
4 + 1 + 0 + 2 <= 5 N [2]
2 + 2 <= 5 Y [2, 2]


- iterate over the array
- add each element into a new nested array if the sum of the nested array elements is <= 5
  - use slice to create subarray
- if not, add current element into its own array
---------------------- Notes -----------------------

*/
function divide(array, num) {
  let result = [];

  let start = 0;
  let nested = [];
  let sum;
  for (let i = 1; i <= array.length; i += 1) {
    sum = array.slice(start, i).reduce((total, value) => total + value);
    // console.log('idx', i);
    // console.log('start is', start);
    // console.log('slice is', array.slice(start, i))
    // console.log('sum is', sum);
    if (sum <= num) {
      nested.push(array[i-1]);
      if (i == array.length) {
        result.push(nested);
      }
    } else {
      result.push(nested);
      nested = [];
      nested.push(array[i-1]);
      start = i-1;
      if (i == array.length) {
        result.push(nested);
      }
    }
    // console.log('nested is', nested);
    // console.log('result is', result);
    // console.log('--------');
  }
  console.log(result);
  return result;
}

console.log(divide([1, 2, 3, 4, 1, 0, 2, 2], 5) === [[1, 2], [3], [4, 1, 0], [2, 2]]);

console.log(divide([1, 0, 1, 1, -1, 0, 0], 1) === [[1, 0], [1], [1, -1, 0, 0]]);

console.log(divide([2, 1, 0, -1, 0, 0, 2, 1, 3], 3) === [[2, 1, 0, -1, 0, 0], [2, 1], [3]]);
