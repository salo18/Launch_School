// VARIABLES 1
// 1
// let a = 'outer';

// function testScope() {
//   let a = 'inner';
//   console.log(a);
// }

// console.log(a);
// testScope();
// console.log(a);
/*
on line 2 we declare local variable `a` and initialize it to point to the value `outer`
on line 4, we declare the `testScope` function declaration
on line 5, we declare a new local variable `a` and initialize it to point to the string `inner`.
this variable is block scoped and since it is declared inside the testScope function, it is scoped to the function and not accessible outside it.
the code on line 6 will log 'inner'. the code looks for a variable `a` and finds a variable declaration inside the function.
line 9 logs the string 'outer'. We are passing in variable `a`. JS looks through the code and finds a variable with that name in its local context (which just happens to be the global execution context)
line 10 invokes the testScope function and logs 'inner'
line 11 again logs 'outer' which shows that the variable declaration and initialization on line 5 had no effect on the outer scoped `a` variable. This demonstrates that let variables are block scoped and not accessible outside the block in which they are declared. A function declaration is not technically a block but is treated as such when it comes to variable declarations.
*/

// 2
// let a = 'outer';

// function testScope() {
//   a = 'inner'; // a is reassigned since JS finds another variable with the same name in the outer scope
//   console.log(a); // inner
// }

// console.log(a); // outer
// testScope(); // inner
// console.log(a); // inner
// this code demonstrates how a variable declared in the outer scope is accessible in an inner scope that is defined by a function declaration. `a` is thus reassigned to point to a new value on line 28 and that reassignment is reflected in the global scope after testScope is invoked

// 3
// let basket = 'empty'; // local variable that happens to coincide with the global execution context

// function goShopping() {
//   function shop1() {
//     basket = 'tv';
//   }

//   console.log(basket); // empty -- shop1 hasn't been invoked yet so the variable is not reassigned

//   let shop2 = function() {
//     basket = 'computer';
//   };

//   const shop3 = () => { // arrow functino
//     let basket = 'play station';
//     console.log(basket); // play station -- new local variable basket that is limited in scope to the shop3 function
//   };

//   shop1();
//   shop2();
//   shop3();

//   console.log(basket); // computer -- this is reassigned when the shop2 function is invoked
// }

// goShopping();

// // 4
// function hello() {
//   a = 'hi'; // since there is no var, const or let declaration, this becomes an object of the global property and is thus accessible in the global execution context
// }

// hello();
// console.log(a); // hi

// 5
// function hello() {
//   let a = 'hello'; // a is declared and initialized to point the value 'hello'
// }

// hello();
// console.log(a); // ReferenceError - a is block scoped and thus not accessible outside of the "block" created by the function

// 6
// console.log(a); // undefined

// var a = 1;

// // after hoisting this becomes
// // var a;
// // console.log(a);
// // a = 1;

// 7
// console.log(a); // ReferenceError - variable can't be accessed before it is intialized

// let a = 1;
// // after hoisting, this becomes
// // let a; // a is said to be unset and thus in the Temporal Dead Zone
// // console.log(a);
// // a = 1;

// 8
// console.log(a); // hello is never invoked to the global variable `a` is never intialized -- this will return a reference error

// function hello() {
//   a = 1;
// }

// after hoisting
// function hello() {
//   a = 1;
// }
// console.log(a);


// VARIABLES 2
// 1
// function say() {
//   if (false) {
//     var a = 'hello from inside a block';
//   }

//   console.log(a);
// }

// say(); // undefined
// // we invoke the say method. the if conditional is never run since the condition is a falsy value
// // however, a variable declared with var has function scope and due to hoisting the code is aware of the variable declaration even though the assignment never occurs so the console.log will log undefined

// 2
// function say() {
//   if (false) {
//     let a = 'hello from inside a block';
//   }

//   console.log(a); // a is block scoped and thus not accessible -- this logs an error
// }

// say();

// 3
// function hello() {
//   a = 'hello';
//   console.log(a); // hello

//   if (false) {
//     var a = 'hello again'; // this is function scoped
//   }
// }

// hello();
// console.log(a); // a is function scoped and not accessible outside the function -- logs a ReferenceError
// after hoisting
// function hello() {
//   var a;
//   a = 'hello';
//   console.log(a); // hello

//   if (false) {
//     a = 'hello again'; // this is function scoped
//   }
// }

// // 4
// function hello() {
//   a = 'hello'; // this is declared without var, let or const so this is a global variable
//   console.log(a); // hello

//   if (false) {
//     let a = 'hello again'; // a is a new variable that is block scoped
//   }
// }

// hello();
// console.log(a); // hello

// 5
// var a = 'hello';

// for (var index = 0; index < 5; index += 1) {
//   var a = index;
// }

// console.log(a); // 4
// // the for loop creates a block but var declarations are function scoped. In this case, the variable declared inside the for loop is accessible in the global execution context
// // this is an example of variable shadowing where the variable in the for loop is reassigned. Since both variables are declared in the global execution context

// 6
// let a = 'hello';

// for (let index = 0; index < 5; index += 1) {
//   let a = index;
// }

// console.log(a); // hello
// the variable declared in the for loop is block scoped and thus not accessible outside the loop

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
// // a is declared in the global execution context and thus has access to variables declared inside both scopes created by the nested functions

// // 8
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

// after hoisting
// function setScope(foo) {
//   foo = 'inner';
//   b = 'inner';
// }

// let a;
// let b;
// a = 'outer';
// b = 'outer';

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
setScope();
console.log(a); // inner -- a is reassigned when the function is invoked

var setScope = function () {
  a = 'inner';
};

// after hoisting
var setScope;
let a;
a = outer;
console.log(a);
setScope();
console.log(a);

setScope = function () {
  a = 'inner';
};