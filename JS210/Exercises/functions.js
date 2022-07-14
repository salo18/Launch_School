// // 1
// var myVar = 'This is global';

// function someFunction() {
//   var myVar = 'This is local';
// }

// someFunction();
// console.log(myVar); // This is global
// // the variable declaration in someFunction is scoped to the function. The outer scoped variable is thus not reassigned when the function is invoked.

// 2
// var myVar = 'This is global';

// function someFunction() {
//   var myVar = 'This is local';
//   console.log(myVar);
// }

// someFunction(); // this is local
// // the someFunction function logs the value of the myVar variable, which is a locally scoped variable

// 3
// var myVar = 'This is global';

// function someFunction() {
//   myVar = 'This is local';
// }

// someFunction();
// console.log(myVar); // this is local
// // myVar is declared in the global scope but is reassigned inside the function to point to a new string

// 4
// var myVar = 'This is global';

// function someFunction() {
//   console.log(myVar);
// }

// someFunction(); // this is global
// // since variables declared with var are accessible inside function declarations, the calling someFunction logs the value assigned to myVar even though myVar is declared in the global scope

// 5
// function someFunction() {
//   myVar = 'This is global';
// }

// someFunction();
// console.log(myVar);
// // the code will try to look for a variable myVar that is declared inside the function. Since it doesn't find one, myVar will be declared as a var global scoped variable in the outer scope and the code will run

// // 6
// let a = 7;

// function myValue(b) {
//   b += 10;
// }

// myValue(a); // undefined since there nothing is specified with the return keyword
// console.log(a); // 7
// // the variable assignment inside myValue happens on the local variable created by the argument. An outer scoped variable that is passed in to the function would not be reassigned

// 7
// let a = 7;

// function myValue(a) {
//   a += 10; // outer scoped a is accessible inside the function... is it being reassigned or is the assignment happening on the argument being passed in
// }

// myValue(a); // no output since nothing is specified
// console.log(a); // 7
// // the outer scoped variable is accessible but the argument has the same variable name so the outer scope variable is shadowed by the function argument. thus nothing happens to the outer scoped variable

// 8
// let a = [1, 2, 3];

// function myValue(b) {
//   b[2] += 7;
// }

// myValue(a);
// console.log(a);

// 9
// console.log(a); // undefined... after hoisting, the variable a will be declared but a value will only be assigned after the logging

// var a = 1;

// 10
// logValue();

// function logValue() {
//   console.log('Hello, world!');
// }
// // hello world
// // after the code is run, the creation phase will hoist up the function to the top of its scope (in this case the global scope). The function invocation is thus aware that there is a function with that name lower down in the code so the code will not produce an error

// 11
// var logValue = 'foo';

// function logValue() {
//   console.log('Hello, world!');
// }

// console.log(typeof logValue);

// // after hoisting, this code becomes
// function logValue() {
//   console.log('Hello, world!');
// }

// logValue = 'foo';

// console.log(typeof logValue); // string


console.log(foo());

function foo() {
  console.log('Waiting for bar!');
}

function foo() {
  console.log(foo);
  function bar() {
    console.log('bar again');
  }

  bar();

  function bar() {
    console.log('bar again and again');
  }
}