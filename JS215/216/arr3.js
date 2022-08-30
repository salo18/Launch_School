// https://edabit.com/challenge/p7gLw52gxdKENTkcP

/*
Given an array of seats, return the maximum number of new people which can be seated, as long as there is at least a gap of 2 seats between people.

Empty seats are given as 0.
Occupied seats are given as 1.
Don't move any seats which are already occupied, even if they are less than 2 seats apart. Consider only the gaps between new seats and existing seats.

maximumSeating([0, 0, 0, 1, 0, 0, 1, 0, 0, 0]) ➞ 2
// [1, 0, 0, 1, 0, 0, 1, 0, 0, 1]

maximumSeating([0, 0, 0, 0]) ➞ 2
// [1, 0, 0, 1]

maximumSeating([1, 0, 0, 0, 0, 1]) ➞ 0
// There is no way to have a gap of at least 2 chairs when adding someone else.

Notice how there may be several possibilities for assigning seats to people, but these cases won't affect the results.
All seats will be valid.

--------------------------PROBLEM-------------------


------------ **Explicit Requirements** -------------
Rules:
- 0's represent empty seats
- 1's represent occupied seats
- [1, 0, 0, 1]
  >> a 1 must be separated by at least two array elements
  >> [1, 0, 0, 0, 0  0, 1]
- don't move any "seats" -- don't alter the position of the array

Inputs:
- an array of 0's and 1's
Output:
- return the number of NEW seats that we can add

------------ **Implicit Requirements** -------------
- odd numbered array length might be easier to insert seats?


------------- **Clarifying Questions** -------------
- don't need to mutate the caller?

-------------------- Algorithm ---------------------
- make a copy of the array - slice it to work on a new array
- identify the indexes of the 1's
  - if the array element is a 1
    - push the index into a new array
    - see if the array elements are 2 indexes apart or more ?
    - maximumSeating([1, 0, 0, 0, 0, 0, 1])
        [0, 5] 5 - 0 > 2
        add a 1 at arr[0 + 2]
        [1, 0, 0, 1, 0, 0, 1]
- repeat this process, build a new array and insert a 1 into a potential empty seat
- keep count of how many 1's have been added
- return the count



[1, 0, 0, 1, 0, 0, 0, 0, 0, 1]
- iterate through this array
- if element is 1, check if there are 0's in the elements to the right
  - helper function that returns true or false
  - then check the next 1 and see if there are two 0's to the left
If this is true, add a 1 two elements away from the first one

---------------------- Notes -----------------------
*/

function maximumSeating(array) {
  let newArr = array.slice();

  let counter = 0;

  for (let i = 0; i < newArr.length; i += 1) {
    if (isValid(newArr, i)) {
      // console.log(`index`, i);
      newArr[i] = 1;
      counter += 1;
    }
  }
  // console.log(newArr);


  return counter;
}

function isValid(arr, i) {
  if (arr[i] === 1) return false;
  if (i - 1 >= 0 && arr[i-1] === 1) return false;
  if (i - 2 >= 0 && arr[i-2] === 1) return false;
  if (i + 1 <= arr.length && arr[i + 1] === 1) return false;
  if (i + 2 <= arr.length && arr[i + 2] === 1) return false;

  return true;
}

 // // if ((arr[i - 1] === 0 || arr[i - 1] === undefined) && (arr[i - 2] === 0 || arr[i -2] === undefined) && (arr[i+1] === 0 || arr[i+1] === undefined) && (arr[i + 2] === 0 || arr[i+2] === undefined) && (arr[i+3] === 0 || arr[i+3] === undefined)) {
  // //   return true;
  // }

// function maximumSeating(arr) {
// 	let seated = 0;

// 	for (let i = 0; i < arr.length; i += 1) {
// 		if (arr[i - 1] === 1 || arr[i - 2] === 1) continue;
// 		if (arr[i + 1] === 1 || arr[i + 2] === 1) continue;

//     if (arr[i] === 0) seated += 1;
// 		arr[i] = 1;
// 	}

// 	return seated;
// }


 // let ones = []; // [ 0, 3, 9 ]

  // newArr.forEach((el, idx) => {
  //   if (el === 1) {
  //     ones.push(idx);
  //   }
  // });

  // for (let i = 0; i < ones.length; i += 1){
  //   if (Math.abs(ones[i] - ones[i + 1]) > 2 && Math.abs(ones ) {
  //     // console.log(Math.abs(ones[i] - ones[i + 1]));
  //   }
  // }

  // ones[0] + 2 = 2

console.log(maximumSeating([1, 0, 0, 1, 0, 0, 0, 0, 0, 1])); // 1

console.log(maximumSeating([0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0])); //➞ 3

console.log(maximumSeating([0, 0, 0, 1, 0, 0, 1, 0, 0, 0])); //➞ 2
// // [1, 0, 0, 1, 0, 0, 1, 0, 0, 1]

console.log(maximumSeating([0, 0, 0, 0])); //➞ 2
// // [1, 0, 0, 1]

console.log(maximumSeating([1, 0, 0, 0, 0, 1])); //➞ 0
// // There is no way to have a gap of at least 2 chairs when adding someone else.

console.log(maximumSeating([1, 1, 0, 0, 0])); // 1

// maximumSeating([]) // empty array
// maximumSeating([2, 3, 10]) // array of non 0's and 1's
// maximumSeating(['str', {}, undefined]) // other data types
// maximumSeating() // no argument is passed in?

// maximumSeating([1, , , 1]) // does that count?

/*

[0,0=,0]    1,0,0,0,0,0,1,   [0,0,0]
[1,0,0]                      [0,0,1]
          [1,0,0,1,0,0,1]

*/