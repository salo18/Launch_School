// // 1
// const myObject = {
//   a: 'name',
//   'b': 'test',
//   123: 'c',
//   1: 'd',
// };

// console.log(myObject[1]);
// // console.log(myObject[a]);
// console.log(myObject.a);

// // 2
// const person = {
//   firstName() {
//     return 'Victor';
//   },
//   lastName() {
//     return 'Reyes';
//   },
// };

// console.log(`${person.firstName()} ${person.lastName()}`);

// 3
// const array1 = [ 'Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
// const array2 = [];

// for (let i = 0; i < array1.length; i += 1) {
//   array2.push(array1[i]);
// }

// array1.push("sup");
// for (let i = 0; i < array1.length; i += 1) {
//   if (Array.isArray(array1[i])) {
//     // array1[i].pop();
//     // array1[i] = array1[i].pop();
//     array1[i].reverse();
//   }
// }

// for (let i = 0; i < array1.length; i += 1) {
//   if (array1[i].startsWith('C')) {
//     array1[i] = array1[i].toUpperCase();
//   }
// }


// const array1 = [[1, 2, 3], "Hi", "Sup"];
// const array2 = [];

// for (let i = 0; i < array1.length; i += 1) {
//   array2.push(array1[i]);
// }

// array1.push("hello");

// array1[0].reverse();
// console.log(array1);
// console.log(array2);

// 4
// const myObject = {
//   prop1: '123',
//   prop2: '234',
//   'prop 3': '345',
// };

// const prop2 = '456';
// // myObject['prop2'] = '456';
// // myObject[prop2] = '678';

// console.log(myObject[prop2]); // 456
// console.log(myObject.prop2); // 678

//
// const myObj = {};
// myObj[myFunc()] = 'hello, ';

// function myFunc() {
//   return 'funcProp';
// }

// console.log(myObj); // {'funcProp': 'hello'}
// myObj[myFunc()] = 'world!';
// console.log(myObj); // {'funcProp': 'world'}

//
// const person = {
//   firstName() {
//     return 'Victor';
//   },
//   lastName() {
//     return 'Reyes';
//   },
// };
// const hi = person.firstName;
// console.log(hi);
// console.log(hi());
// // console.log(person.firstName());

// // 5
// const myArray = ['a', 'b', 'c'];

// console.log(myArray[0]); // a
// console.log(myArray[-1]); // undefined

// myArray[-1] = 'd';
// myArray['e'] = 5;
// myArray[3] = 'f';

// console.log(myArray[-1]); // d
// console.log(myArray['e']); // 5
// console.log(myArray); // ['a', 'b', 'c', 'f', -1: 'd', 'e': 5]

// 6
// const myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5;

// function average(array) {
//   let sum = 0;

//   for (let i = -2; i < array.length; i += 1) {
//     sum += array[i];
//   }

//   console.log(sum / array.length); // length is 2 so the function will return 10 (20 / 2)
// }

// average(myArray); // [5, 5, '-1': 5, '-2': 5]

// // 7
// function calculateBonus(...args) {
//   console.log(args);
//   // return _________[1] ? _________[0] / 2 : 0;
// }

// calculateBonus(2800, true);               // 1400
// calculateBonus(1000, false);              // 0
// calculateBonus(50000, true);              // 25000

// // 8
// function penultimate(string) {
//   let arr = string.split(' ')
//   console.log(arr[arr.length - 2]);
// }

// penultimate('last word');                    // expected: "last"
// penultimate('Launch School is great!');      // expected: "is"
// // can't access a negative index

// // 9
// const MINUTES_PER_HOUR = 60;
// const HOURS_PER_DAY = 24;
// const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

// function timeOfDay(deltaMinutes) {
//   deltaMinutes = deltaMinutes % MINUTES_PER_DAY;
//   if (deltaMinutes < 0) {
//     deltaMinutes = MINUTES_PER_DAY + deltaMinutes;
//   }

//   let hours = Math.floor(deltaMinutes / MINUTES_PER_HOUR);
//   let minutes = deltaMinutes % MINUTES_PER_HOUR;

//   return `${padWithZeroes(hours, 2)}:${padWithZeroes(minutes, 2)}`;
// }

// function padWithZeroes(number, length) {
//   let numberString = String(number);

//   while (numberString.length < length) {
//     numberString = `0${numberString}`;
//   }

//   return numberString;
// }