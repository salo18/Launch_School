// forEach, map, filter, find

// FOREACH
// // forEach returns the value undefined >> can't chain it
// const array1 = ['a', 'b', 'c'];

// array1.forEach(element => console.log(element));

// // expected output: "a"
// // expected output: "b"
// // expected output: "c"

// // MAP
// // map returns a new array
// const array1 = [1, 4, 9, 16];

// // pass a function to map
// const map1 = array1.map(x => x * 2);

// console.log(map1);
// // expected output: Array [2, 8, 18, 32]

// // FILTER
// // filter returns shallow copy,
// const words = ['spray', 'limit', 'elite', 'exuberant', 'destruction', 'present'];

// const result = words.filter(word => word.length > 6);
// // filter is a method
// // `word => word.length > 6` is callback function


// console.log(result);

// // FIND
// // find returns first element that returns a truthy value
// const array1 = [5, 12, 8, 130, 44];

// const found = array1.find(element => element > 10);

// console.log(found);


// // ASK ABOUT THIS VERBAGE
// const words = ['aa', 'spray', 'limit', 'elite';]

// const result = words.filter(word => word.length < 4);
// // filter is a method
// // `word => word.length > 6` is callback function

// // the filter method invokes the anonymous function and passes each array element as an argument. the return value of the callback function is then evaluated. the return values that evaluate to true (truthy) are added to a new array.  that is a shallow copy of a portion of the caller.


// first class functions
// const myObj = {};
// myObj[myFunc()] = 'hello, ';

// function myFunc() {
//   return 'funcProp';
// }

// console.log(myObj);
// myObj[myFunc()] = 'world';
// console.log(myObj);



// console.log(x);

// var x = 10;
// console.log(x);
// let x; // value of undefined --- UNSET ONLY WHEN HOISTING
// console.log(x);

// x = 10;





// EXPLAIN THIS CODE
// nonsense(); // nonsense executed

// var nonsense = function() {
//   console.log('anonymous function executed');
// };

// nonsense(); // anonymous function executed

// function nonsense() {
//   console.log('nonsense executed');
// }

// //

// function test() {
//   if (false) {
//     var a = 1;
//   }

//   console.log(a);
// }

// test();



