// // 1
// let myArray = [1, 2, 3, 4];
// const myOtherArray = myArray;

// myArray.pop(); // destructive
// console.log(myArray); // [1, 2, 3]
// console.log(myOtherArray); // [1, 2, 3] -- same array

// myArray = [1, 2];
// console.log(myArray); // [1, 2]
// console.log(myOtherArray); // [1, 2, 3] -- the array is reassigned

// 2
// let myArray = [1, 2, 3, 4];
// const myOtherArray = [...myArray];
// const myOtherArray = Array.from(myArray);

// 3
// function concat(array1, secondArgument) {
//   let copy = [array1, secondArgument].flat();


//   return copy;
// }

// // console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
// // console.log(concat([1, 2], 3));                     // [1, 2, 3]
// // console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
// // console.log(concat([2, 3], 'four'));                // [2, 3, "four"]


// const obj = { a: 2, b: 3 };
// const newArray = concat([2, 3], obj);
// console.log(newArray);                              // [2, 3, { a: 2, b: 3 }]
// obj.a = 'two';
// console.log(newArray);                              // [2, 3, { a: "two", b: 3 }]

// const arr1 = [1, 2, 3];
// const arr2 = [4, 5, obj];
// const arr3 = concat(arr1, arr2);
// console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
// obj.b = 'three';
// console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

// arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
// console.log(obj);                                   // { a: "two", b: 3 }

// // 4
// function concat(...args) {
//     // let copy = [args].flat();

//   console.log(args.flat());
// }

// concat([1, 2, 3], [4, 5, 6], [7, 8, 9]);    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
// concat([1, 2], 'a', ['one', 'two']);        // [1, 2, "a", "one", "two"]
// concat([1, 2], ['three'], 4);               // [1, 2, "three", 4]

// 5
// function pop(arr) {
//   const popped = arr[arr.length - 1];
//   arr.splice(arr.length - 1);

//   console.log(arr);
//   console.log(popped);
// }

// function push(arr, ...args) {
//   const length = args.length;

//   for (let i = 0; i < length; i += 1) {
//     array[array.length] = args[i];
//   }

//   return array.length;
// }

// // pop
// // const array1 = [1, 2, 3];
// // pop(array1);                        // 3
// // console.log(array1);                // [1, 2]
// // pop([]);                           // undefined
// // pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

// // push
// const array2 = [1, 2, 3];
// push(array2, 4, 5, 6);              // 6
// console.log(array2);                // [1, 2, 3, 4, 5, 6]
// push([1, 2], ['a', 'b']);          // 3
// push([], 1);                       // 1
// push([]);                          // 0

// 6
// function reverse(input) {
//   let output;
//   if (Array.isArray(input)) {
//     output = [];
//     for (let i = input.length - 1; i >= 0; i -= 1) {
//       output.push(input[i]);
//     }
//   } else {
//     output = '';
//     for (let i = input.length - 1; i >= 0; i -= 1) {
//       output += input[i];
//     }
//   }
//   console.log(output);
// }

// reverse('Hello');           // "olleH"
// reverse('a');               // "a"
// reverse([1, 2, 3, 4]);      // [4, 3, 2, 1]
// reverse([]);                // []

// const array = [1, 2, 3];
// reverse(array);             // [3, 2, 1]
// array;                      // [1, 2, 3]

// // 7
// function shift(arr) {
//   let first = arr[0];
//   arr.splice(0, 1);
//   return first;
// }

// function unshift(arr, ...args) {
//   for (let i = 0; i < args.length; i += 1) {
//     arr.push(args[i]);
//   }
// }

// // console.log(shift([1, 2, 3]));                // 1
// // console.log(shift([]));                       // undefined
// // console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

// unshift([1, 2, 3], 5, 6);        // 5
// unshift([1, 2, 3]);              // 3
// unshift([4, 5], [1, 2, 3]);      // 3

// // const testArray = [1, 2, 3];
// // shift(testArray);                // 1
// // testArray;                       // [2, 3]
// // unshift(testArray, 5);           // 3
// // testArray;                       // [5, 2, 3]

// 8
// function slice(array, begin, end) {
//   let newarr = [];

//   for (let i = begin; i < end; i += 1) {
//     newarr.push(array[i]);
//     if (i === array.length - 1) {
//       break;
//     }
//   }
//   console.log(newarr);
// }

// slice([1, 2, 3], 1, 2);               // [2]
// slice([1, 2, 3], 2, 0);               // []
// slice([1, 2, 3], 5, 1);               // []
// slice([1, 2, 3], 0, 5);               // [1, 2, 3]

// const arr1 = [1, 2, 3];
// slice(arr1, 1, 3);                     // [2, 3]
// arr1;                                  // [1, 2, 3]

// function splice(array, start, deleteCount, element1, elementN) {

// }

// splice([1, 2, 3], 1, 2);              // [2, 3]
// splice([1, 2, 3], 1, 3);              // [2, 3]
// splice([1, 2, 3], 1, 0);              // []
// splice([1, 2, 3], 0, 1);              // [1]
// splice([1, 2, 3], 1, 0, 'a');         // []

// const arr2 = [1, 2, 3];
// splice(arr2, 1, 1, 'two');             // [2]
// arr2;                                  // [1, "two", 3]

// const arr3 = [1, 2, 3];
// splice(arr3, 1, 2, 'two', 'three');    // [2, 3]
// arr3;                                  // [1, "two", "three"]

// const arr4 = [1, 2, 3];
// splice(arr4, 1, 0);                    // []
// splice(arr4, 1, 0, 'a');               // []
// arr4;                                  // [1, "a", 2, 3]

// const arr5 = [1, 2, 3];
// splice(arr5, 0, 0, 'a');               // []
// arr5;                                  // ["a", 1, 2, 3]

// 9
// function oddities(array) {
//   const oddElements = [];

//   for (let i = 0; i < array.length; i += 2) {
//     oddElements.push(array[i]);
//   }

//   return oddElements;
// }

// oddities([2, 3, 4, 5, 6]) === [2, 4, 6];      // false
// oddities(['abc', 'def']) === ['abc'];         // false

// 10
function areArraysEqual(array1, array2) {
  let copy1 = array1.slice();
  let copy2 = array2.slice();

  copy1.sort();
  copy2.sort();

  for (let i = 0; i < copy1.length; i += 1) {
    if (copy1[i] !== copy2[i]) {
      return false;
    }
  }
  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true