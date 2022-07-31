// // 2
// const person = { name: 'Victor' };
// const otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);    // false -- expected: true
// // this code is comparing if the two objects are the same. they are different objects that reference the same values but they are not the same objects and thus the code logs false

// // for this code to work, we would need to compare the values referenced by the object properties like so...
// console.log(person.name === otherPerson.name);    // false -- expected: true

// 4
// let startingBalance = 1;
// const chicken = 5;
// const chickenQuantity = 7;

// function totalPayable(item, quantity) {
//   return startingBalance + (item * quantity);
// }

// startingBalance = 5;
// console.log(totalPayable(chicken, chickenQuantity)); // 40

// startingBalance = 10;
// console.log(totalPayable(chicken, chickenQuantity)); // 45

// // this is due to closures and how a function 'carries' its surrounding context even if a variable is reassigned after the method is defined.

// 5
// function doubler(number, caller) {
//   console.log(`This function was called by ${caller}.`);
//   return number + number;
// }

// doubler(5, 'Victor');                   // returns 10
// logs:
// This function was called by Victor.

// function makeDoubler(caller) {
//   return number => {
//     console.log(`This function was called by ${caller}.`);
//     return number + number;
//   };
// }

// const doubler = makeDoubler('Victor');
// doubler(5);                             // returns 10
// // logs:
// // This function was called by Victor.

// // 6
// const array = ['Apples', 'Peaches', 'Grapes'];

// array[3.4] = 'Oranges';
// console.log(array.length); // 3
// console.log(Object.keys(array).length); // 4

// array[-2] = 'Watermelon';
// console.log(array.length); // 3
// console.log(Object.keys(array).length); // 5
// // we are assigning properties to the array
// // properties are not counted in the Array.prototype.length method but are counter in the array returned by Object.prototype.keys method.

// 7
// const languages = ['JavaScript', 'Ruby', 'Python'];
// console.log(languages); // ['JavaScript', 'Ruby', 'Python']
// console.log(languages.length); // 3

// languages.length = 4;
// console.log(languages); // ['JavaScript', 'Ruby', 'Python', <empty>]
// console.log(languages.length); // 4

// languages.length = 1;
// console.log(languages); // ['JavaScript']
// console.log(languages.length); // 1

// languages.length = 3;
// console.log(languages); // ['JavaScript', <Empty>, <empty>]
// console.log(languages.length); // 3

// languages.length = 1;
// languages[2] = 'Python';
// console.log(languages); //  ['JavaScript', <empty>, 'Python']
// console.log(languages[1]); // undefined
// console.log(languages.length); // 3

// 8
function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111);
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101);
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33);
