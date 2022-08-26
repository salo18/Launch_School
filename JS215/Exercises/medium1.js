// 1
/*
input - an array of objects
output - a new rotated array

problem
- rotate the array -- movet the first element to the end of the array
- do not modify the original array

requirements
- if input is not an array, return undefined
- if input is an empty array, return an empty array

algorithm:
- create a variable that points to the original array at index 0
- create a copy of the array starting at index 1
- push the variable into the new array
*/

// function rotateArray(arr) {
//   if (!Array.isArray(arr)) {
//     return undefined;
//   } else if (arr.length === 0) {
//     return [];
//   }

//   // let first = arr[0]
//   // let copy = arr.slice(1);
//   // copy.push(first);
//   // return copy;

//   return arr.slice(1).concat(arr[0]);
// }


// console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
// console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
// console.log(rotateArray(['a']));                    // ["a"]
// console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
// console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
// console.log(rotateArray([]));                       // []

// // return `undefined` if the argument is not an array
// console.log(rotateArray());                         // undefined
// console.log(rotateArray(1));                        // undefined


// // the input array is not mutated
// const array = [1, 2, 3, 4];
// console.log(rotateArray(array));                    // [2, 3, 4, 1]
// console.log(array);                                 // [1, 2, 3, 4]


// 2
/*
Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917

- input - number
- output - rotated number

problem
- need to 'rotate' the last n digits of a number an move them to the end of the number
- 735291, 2 ==> 735219
  - the second to last digit is moved to the end
- 735291, 5 ==> 752913
  - the 5th to last digit is moved to the end

questions:
- what about invalid inputs?
- numbers that start with 0's?
- what if the second argument is not included?
- what if the second argument is larger than the number of digits in the number
- what if a number is not passed in?
- what if no arguments are passed in?

algorithm:
- convert the number into a string, then convert into an array
- calculate the index of the number that needs to be moved
  - total length of the array minus the index
    - 735291, 2
      >> arr length is 6 but need 2nd to last index -- 6 - 2 === 4
  - remove the element at the newly calculated index using splice?
  - push that element to the end of the array
  - join the array and convert back to a number
*/
// function rotateRightmostDigits(num, idx) {
//   let arr = String(num).split('');
//   let index = arr.length - idx;
//   let newArr = [];
//   arr.forEach((el, idx) => {
//     if (idx !== index) {
//       newArr.push(el)
//     }
//   });
//   newArr.push(arr[index]);
//   return Number(newArr.join(''));
//   // console.log(index, arr[index]);
// }

// console.log(rotateRightmostDigits(735291, 1));      // 735291
// console.log(rotateRightmostDigits(735291, 2));      // 735219
// console.log(rotateRightmostDigits(735291, 3));      // 735912
// console.log(rotateRightmostDigits(735291, 4));      // 732915
// console.log(rotateRightmostDigits(735291, 5));      // 752913
// console.log(rotateRightmostDigits(735291, 6));      // 352917


// 3

// function maxRotation(num) {
//   let length = String(num).length;
//   for (let i = length; i > 1; i -= 1) {
//     number = rotateRightmostDigits(num, i);
//   }
//   return number;
// }

// function maxRotation(number) {
//   for (let i = String(number).length; i > 1; i -= 1) {
//     number = rotateRightmostDigits(number, i);
//   }

//   return number;
// }

// function rotateRightmostDigits(num, idx) {
//   let arr = String(num).split('');
//   let index = arr.length - idx;
//   let newArr = [];
//   arr.forEach((el, idx) => {
//     if (idx !== index) {
//       newArr.push(el)
//     }
//   });
//   newArr.push(arr[index]);
//   return Number(newArr.join(''));

// }

// console.log(maxRotation(735291));          // 321579
// console.log(maxRotation(3));               // 3
// console.log(maxRotation(35));              // 53
// console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
// console.log(maxRotation(8703529146));      // 7321609845

// 5
// const NUMBERS = {
//   'zero': 0,
//   'one': 1,
//   'two': 2,
//   'three': 3,
//   'four': 4,
//   'five': 5,
//   'six': 6,
//   'seven': 7,
//   'eigth': 8,
//   'nine': 9,
// }

// function wordToDigit(str) {
//   // let arr = str.split(' ');
//   // console.log(Object.keys(NUMBERS));
//   // return arr.map(word => {
//   //   if (Object.keys(NUMBERS).includes(word.toLowerCase().replace(/\./, ''))) {
//   //     return NUMBERS[word];
//   //   } else {
//   //     return word;
//   //   }
//   // }).join(' ');

//   Object.keys(NUMBERS).forEach(key => {
//     let regex = new RegExp(key, 'g');
//     str = str.replace(regex, NUMBERS[key]);
//   });

//   return str;
// }

// console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// // "Please call me at 5 5 5 1 2 3 4. Thanks."

// 7

// function fibonacci(num) {
//   let numbers = [1, 1];

//   for (let i = 3; i <= num; i += 1) {
//     numbers = [numbers[1], numbers[0] + numbers[1]];
//   }
//   return numbers[1];
// }


// console.log(fibonacci(20));       // 6765
// console.log(fibonacci(50));       // 12586269025
// console.log(fibonacci(75));       // 2111485077978050

// 8
// fibonacci with memoization

const memo = {};

function fibonacci(nth) {
  if (nth <= 2) {
    return 1;
  } else {
    if (memo[nth]) {
      return memo[nth];
    } else {
      memo[nth] = fibonacci(nth - 1) + fibonacci(nth - 2);
      return memo[nth];
    }
  }
}

console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050
