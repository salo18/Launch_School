// 1
// const paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
//                 ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
//                 dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
//                 ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
//                 diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \
//                 hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
// console.log(paragraph);


// 2
// const myBoolean = true;
// const myString = 'hello';
// const myArray = [];
// const myOtherString = '';

// if (myBoolean) {
//   console.log('Hello');
//   // truthy
// }

// if (!myString) {
//   console.log('World');
//   // falsy
// }

// if (!!myArray) {
//   console.log('World');
//   // truthy
// }

// if (myOtherString || myArray) {
//   console.log('!');
//   // truthy
// }

// 5
// const sync = require("readline-sync");

// console.log(`Enter the first number`);
// let num1 = sync.prompt();

// console.log(`Enter the second number`);
// let num2 = sync.prompt();

// console.log(`${num1} + ${num2} = ${num1+num2}`);
// console.log(`${num1} - ${num2} = ${num1-num2}`);
// console.log(`${num1} * ${num2} = ${num1*num2}`);
// console.log(`${num1} / ${num2} = ${num1/num2}`);
// console.log(`${num1} ** ${num2} = ${num1**num2}`);

// 6
const sync = require("readline-sync");

console.log(`Enter a phrase`);
let ogPhrase = sync.prompt()
let phrase = ogPhrase.match(/[A-Z]/gi).length;

console.log(`There are ${phrase} characters in ${ogPhrase}`);