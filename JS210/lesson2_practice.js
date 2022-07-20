// Variable Scope 1

// 1
// let a = 'outer';

// function testScope() {
//   let a = 'inner';
//   console.log(a);
// }

// console.log(a); // outer -- global scope variable
// testScope(); // inner
// console.log(a); // outer -- assignment in the function is limited to the block and thus does not affect the value of `a`

// 2
// let a = 'outer';

// function testScope() {
//   a = 'inner'; // this variable is declared in the outer scope thus changing the value of the outer scoped variable
//   console.log(a);
// }

// console.log(a); // outer
// testScope(); // inner
// console.log(a); // inner

// 3
// let basket = 'empty';

// function goShopping() {
//   function shop1() {
//     basket = 'tv';
//   }

//   console.log(basket); // empty

//   let shop2 = function() {
//     basket = 'computer';
//   };

//   const shop3 = () => {
//     let basket = 'play station';
//     console.log(basket); // play station
//   };

//   shop1();
//   shop2();
//   shop3();

//   console.log(basket); // computer
// }

// goShopping();

// 4
// function hello() {
//   a = 'hi';
// }

// hello();
// console.log(a); // hi -- a is undeclared and thus becomes a global variable that is accessible in the outer scope

// 5
// function hello() {
//   let a = 'hello';
// }

// hello();
// console.log(a); // undefined variable a -- a is a block scoped variable and thus not accessible in the outer scope

// 6
// console.log(a);

// var a = 1;

// after hoisting this becomes
// var a;
// console.log(a);
// a = 1
// output will be - undefined

// 7
// console.log(a);

// let a = 1;
// // after hoisting this becomes
// let a;
// console.log(a);
// a = 1;
// // output will be - temporal dead zone.. unset variable ... cannot accesss `a` before initialization

// 8
// console.log(a); // error -- can't reference variable before initialization -- function is declared before the console.log due to hoisting but the function is not called and thus the variable is not initialized

// function hello() {
//   a = 1;
// }

// VARIABLE SCOPE 2
// 1
// function say() {
//   if (false) {
//     var a = 'hello from inside a block';
//   }

//   console.log(a);
// }

// say(); // undefined

// // after hoisting, the code becomes
// function say() {
//   var a;
//   if (false) {
//     a = 'hello from inside a block';
//   }

//   console.log(a);
// }

// say();

// 2
// function say() {
//   if (false) {
//     let a = 'hello from inside a block';
//   }

//   console.log(a);
// }

// say(); // error - can't access uninitialized variable -- since let variables are block scoped, the variable is only accessible within the if conditional

// 3
// function hello() {
//   a = 'hello';
//   console.log(a);

//   if (false) {
//     var a = 'hello again';
//   }
// }

// hello(); // hello
// console.log(a); // error

// 4
// function hello() {
//   a = 'hello';
//   console.log(a);

//   if (false) {
//     let a = 'hello again';
//   }
// }

// hello(); // hello
// console.log(a); // error - no global variable named a in the global scope

// 5
// var a = 'hello';

// for (var index = 0; index < 5; index += 1) {
//   var a = index;
// }

// console.log(a); // hello

// 7
// let a = 1;

// function foo() {
//   a = 2;
//   let bar = function() {
//     a = 3;
//     return 4;
//   };

//   return bar();
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

//     return superNested();
//   };

//   return nested();
// }

// console.log(checkScope()); // supernested
// console.log(a); // global

// 9
// let a = 'outer';
// let b = 'outer';

// console.log(a); // outer
// console.log(b); // outer
// setScope(a);
// console.log(a); // outer
// console.log(b); // inner

// function setScope(foo) {
//   foo = 'inner';
//   b = 'inner';
// }


// 10
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
setScope(); // error - not a function
console.log(a); // this code never runs,ess

var setScope = function () {
  a = 'inner';
};

// after hoisting
var setScope;
let a = 'outer';

console.log(a);
setScope();
console.log(a);

setScope = function () {
  a = 'inner';
};