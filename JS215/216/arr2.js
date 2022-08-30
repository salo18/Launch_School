// https://edabit.com/challenge/TfL5ffvWoEgsoRhuP
// started at 09:55 AM

/*
Write a function that determines if an array is circular. An array is circular if its subarrays can be reordered such that each subarray's last element is equal to the next subarray's first element.

For example, the array [[1, 1, 1], [9, 2, 3, 4], [4, 1], [1, 2, 5, 7, 9]] is circular because we can re-arrange the elements to create the following array:

[[9, 2, 3, 4], [4, 1], [1, 1, 1], [1, 2, 5, 7, 9]]

In a circular re-ordering, the last subarray's last element must be identical to the first subarray's first element.

Subarrays will contain at least one element.

--------------------------PROBLEM-------------------
- determine if an array is circular
  - circular array has subarrays where the last element is equal the next subarray's first element
- test to see if reordered the subarrays can be defined as circular
------------ **Explicit Requirements** -------------
Rules:
  - last subarray's element must equal the next subarray's first element
    - the last element in EACH subarray must match the first element in at least one other subarray
  - subarrays are not modified -- arrays are 'frozen' in place
  - need to reorder the subarrays
    - check if last element equals first element of next subarray
    - the last subarray element in the list must also have a matching first element in another sub array

Inputs:
- an two dimensional array
Output:
- boolean

------------ Examples/Test Cases/Edge Cases ------------
isCircular([[9, 8], [6, 9, 1], [8, 4, 2], [1, 9], [2, 1, 6]]) ➞ true
// Can be reordered: [[9, 8], [8, 4, 2], [2, 1, 6], [6, 9, 1], [1, 9]]

isCircular([[1, 1], [1, 2]]) ➞ false

isCircular([[2, 1], [1, 2]]) ➞ true

isCircular([[2, 1], [1, 2], [2, 1], [1, 3, 1], [1, 4, 4]]) ➞ false

isCircular([[2, 1]) // false
isCircular([[2], [2, 3]) // false
isCircular([[2], [2]) // true
isCircular([['str2', 2], [2, 'str2']) // true
isCircular([[[2, 3], 2], [2, 'str2']) // false
isCircular([[], [2, 2]]) // false
isCircular([[2, 2], 22]) // false
isCircular([[2, 2], 'str']) // false
isCircular([]) // false

-------------------- Algorithm ---------------------
- creating a new array with just the first and last elements of each subarray
  - [[9, 8], [6, 1], [8, 2], [1, 9], [2, 6]]
- loop through the subarrays
  - extract the last element of the subarray
  - in the nested loop
    - check each subarray to see if there is at least one that contains the variable
    - return false if not
  - if we exit the loop, return true

edge Cases
- return false is nested array length < 2
- return false if NEW subarrays contains subarrray with just one value
  - line 55
- return false if any subarray elements are arrays
- return false if a subarray is empty
- return false if
- return false if element is not an array


---------------------- Notes -----------------------
- create all permutations of first and last combinations
- filter for a combination that where both elements in the subarray are equal
  - [[8, 6], [1, 8], [2, 1], [9, 2], [6, 9]]


- sort based on last element
  [[6, 1], [8, 2], [2, 6], [9, 8], [1, 9]]
  - sort based on first element
  [[1,9], [2, 6], [6, 1], [8, 2], [9, 8]]
  - sort by last and first element

- filter through the array in such a way that each subarray satisfies the condition
  - arr[0][arr.length -1] === arr[1][0]
  - array.every(subarray => {


*/

// Solution 1:
function isCircular(array) {
  let arr = [];
  array.forEach(sub => {
    arr.push([sub[0], sub.at(-1)]);
  });

  let last;
  let matched;

  // let x = arr.map(sub => sub[0]);
  // console.log(x);

  for (let i = 0; i < arr.length; i += 1) {
    last = arr[i].at(-1);
    matched = false;
    // if (!x.includes(last)) {
    //   return false;
    // }

    for (let j = 0; j < arr.length; j += 1) {
      if (arr[j][0] === last) {
        matched = true;
        break;
      }
    }

    if (matched === false) {
      return false;
    }
  }

  return true;
}


// Solution 2:

function isCircular(array) {
  let last;
  return array.every(subArray => {
    last = subArray.at(-1);
    return array.some(sub => sub[0] === last);
  })
}


console.log(isCircular([[9, 8], [6, 9, 1], [8, 4, 2], [1, 9], [2, 1, 6]])); //➞ true
// Can be reordered: [[9, 8], [8, 4, 2], [2, 1, 6], [6, 9, 1], [1, 9]]

console.log(isCircular([[1, 1], [1, 2]])); //➞ false

console.log(isCircular([[2, 1], [1, 2]])); //➞ true

console.log(isCircular([[2, 1], [1, 2], [2, 1], [1, 3, 1], [1, 4, 4]])); //➞ false
