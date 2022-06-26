// functions

// function average(a, b, c) {
//   return sum(a, b, c) /3;
// }

// function sum(a, b, c) {
//   return a + b + c;
// }

// console.log(average(1, 10, 20));

// function average(arr) {
//   let total = 0;
//   for (i = 0; i < arr.length; i += 1) {
//     total += arr[i]
//   }
//   return total/arr.length
// }

// let array = [1, 2, 3]
// console.log(average(array));

// let temp = [97, 100, 105, 80, 68]
// console.log(average(temp));


// let name = 'Julian';

// function greet(name) {
//   name = 'Logan';
//   console.log(name);
// }

// VARIABLE SCOPE 1

// 1
// let a = 'outer';

// function testScope() {
//   let a = 'inner';
//   console.log(a);
// }

// console.log(a); // outer
// testScope(); // inner
// console.log(a); // outer
// // this will still output outer since the inner scoped `a` variable declared and initialized in the function is only scoped to the function. If we removed the let declaration, this would be variable reassignment.
// // output will be outer both times

// // 2
// let a = 'outer';

// function testScope() {
//   a = 'inner';
//   console.log(a);
// }

// console.log(a); // outer
// testScope(); // inner -- `a` is reassigned to inner
// console.log(a); // inner

// 3
// let basket = 'empty'; // global scope variable

// function goShopping() { // function declaration
//   function shop1() { // function declaration but does not affect the global variable until the function is executed at the end of the function
//     basket = 'tv'; // global scope variable reassigned
//   }

//   console.log(basket); // tv

//   let shop2 = function() { // function expression
//     basket = 'computer'; // global scope variable reassigned
//   };

//   const shop3 = () => { // function expression arrow function
//     let basket = 'play station'; // new block scope variable does not affect outer scope `basket` due to variable shadowing
//     console.log(basket); // play station
//   };

//   shop1();
//   shop2();
//   shop3();

//   console.log(basket); // computer
// }

// goShopping();
// // tv
// // play station
// // computer

// 4
// function hello() {
//   a = 'hi'; // undeclared variable so JS will create a global variable var a = 'hi' that is accessible in the outer scope
// }

// hello();
// console.log(a); // hi

// 5
// function hello() {
//   let a = 'hello'; // local variable declared and initialized in the function has block scope and is not accessible outside the function
// }

// hello();
// console.log(a); // error

// 6
// console.log(a);

// var a = 1;
// // this will output 1. when JS is in the processing phase it will 'hoist' the variable declaration to the top of the program so `a` is accessible even though it is declared below the console.log invocation
// // WRONG... after hoisting, the program will run like this:
// var a; // undefined
// console.log(a); // undefined
// a = 1 // a is initialized

// // 7
// console.log(a);

// let a = 1;
// // After hoisting, JavaScript can tell that there is an a variable, but that variable lives in the Temporal Dead Zone; it is unset and cannot be accessed.


// 8
// console.log(a);

// function hello() {
//   a = 1;
// }
// // 1 is output because we are declaring a global variable inside the function
// // WRONG --- after hoisting, the program looks like this:
// // function hello() {
// //   a = 1;
// // }

// // console.log(a);
// // since hello is never called, we never assign a value to `a` and that causes an error when we try to log `a`.

// VARIABLE SCOPE 2
// 1
// function say() {
//   if (false) {
//     var a = 'hello from inside a block'; // function scope variable is accessible if this block were to run
//   }

//   console.log(a); // undefined
//   // since the if block is never executed, the program knows a is declared but it is never assigned a value
// }

// say();

// // 2
// function say() {
//   if (false) {
//     let a = 'hello from inside a block'; // block scoped variable is not accessible outside the block
//   }

//   console.log(a); // this outputs an error - a not defined
// }

// say();

// 3
// function hello() {
//   a = 'hello'; // function scoped variable is not accessible outside of the function
//   console.log(a);

//   if (false) {
//     var a = 'hello again';
//   }
// }

// hello();
// console.log(a);

// 4
// function hello() {
//   a = 'hello';
//   console.log(a);

//   if (false) {
//     let a = 'hello again';
//   }
// }

// hello();
// console.log(a); // same as #3... `a` is a function scope variable and the let `a` variable initialized inside the if block is block scoped. neither variable is accessible outside of the function

// // 5
// var a = 'hello';

// for (var index = 0; index < 5; index += 1) {
//   var a = index;
// }

// console.log(a); // hello
// the variable declared and initialized inside the for block
// WRONG --- 4 is output because the variable declaration inside the for block is hoisted to the top of the global scope

// // 6
// let a = 'hello';

// for (let index = 0; index < 5; index += 1) {
//   let a = index;
// }

// console.log(a); // hello
// variable shadowing occurs since we already have an `a` variable declared in the outer scope. the outer scoped `a` is thus not affected by the variable declaration and assignment inside the for loop

// 7
// let a = 1; // a is initialized in the outer scope and is accessible inside the function

// function foo() {
//   a = 2; // a is reassigned
//   let bar = function() {
//     a = 3; // a is reassigned
//     return 4;
//   };

//   return bar(); // the function returns 4
// }

// console.log(foo()); // 4
// console.log(a); // 3

// 8
// var a = 'global';

// function checkScope() {
//   var a = 'local';
//   const nested = function() {
//     var a = 'nested';
//     let superNested = () => {
//       a = 'superNested';
//       return a;
//     };

//     return superNested(); // 'supernested'
//   };

//   return nested();
// }

// console.log(checkScope()); // supernested
// console.log(a); // global
// // var declarations are function scoped so the new assignments modifiy the topmost variable in the function

// 9
// let a = 'outer';
// let b = 'outer';

// console.log(a); // outer
// console.log(b); // outer
// setScope(a);
// console.log(a); // outer -- a is not reassigned inside the function -- a is assigned to the function local variable foo but what happens to it does not affect the outer scoped `a`
// console.log(b); // inner -- since b is not declared, it becomes a global variable and thus b is reassigned

// function setScope(foo) {
//   foo = 'inner';
//   b = 'inner';
// }

// // 10
// let total = 50;
// let increment = 15;

// function incrementBy(increment) {
//   total += increment;
// }

// console.log(total); // 50
// incrementBy(10);
// console.log(total); // 60
// console.log(increment); // 15

// 11
let a = 'outer';

console.log(a); // outer
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};
// WRONG... with hoisting this is the same as:
// var setScope;

// let a = 'outer';

// console.log(a);
// setScope();
// console.log(a);

// setScope = function () {
//   a = 'inner';
// };

// the setScope is just a declared global variable with the value of undefined. When it is called, the program attempts to call a function that does not exist since it is only defined later in the program. 