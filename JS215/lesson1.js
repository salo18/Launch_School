// iteration
// function myForEach(array, func) {
//   for (let i = 0; i < array.length; i += 1) {
//     func(array[i], i, array);
//   }
// }

// let min = Infinity;
// let getMin = value => (min = value <= min ? value : min);
// myForEach([4, 5, 12, 23, 3], getMin);
// console.log(min);

// transformation
// function myMap(array, func) {
//   let result = [];

//   array.forEach(element => result.push(func(element)));

//   return result;
// }

// let plusOne = n => n + 1;
// let ar = myMap([1, 2, 3, 4], plusOne);       // [ 2, 3, 4, 5 ]





// // function getBooksTitle(books) {
// //   return myMap(books, getTitle);
// // }

// function getBooksTitle(books) {
//   return myMap(books, function(books) {
//     return books['title'];
//   });
// }
// let books = [
//   {
//     title: 'JavaScript and JQuery: Interactive Front-End Web Development',
//     author: 'Jon Ducket',
//     edition: '1st',
//   },
//   {
//     title: 'Eloquent JavaScript: A Modern Introduction to Programming',
//     author: 'Haverbeke',
//     edition: '2nd',
//   },
//   {
//     title: "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics",
//     author: 'Jennifer Niederst Robbins',
//     edition: '4th',
//   },
// ];

// function getTitle(book) {
//   return book['title'];
// }

// console.log(getBooksTitle(books));
// // console output
// // [
// //   "JavaScript and JQuery: Interactive Front-End Web Development",
// //   "Eloquent JavaScript: A Modern Introduction to Programming",
// //   "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics"
// // ]

// reduce
// function myReduce(array, func, initial) {
//   let value;
//   let index;

//   if (initial === undefined) {
//     value = array[0];
//     index = 1;
//   } else  {
//     value = initial;
//     index = 0;
//   }

//   array.slice(index).forEach(element => value = func(value, element));
//   return value;
// }

// let smallest = (result, value) => (result <= value ? result : value);
// let sum = (result, value) => result + value;

// myReduce([5, 12, 15, 1, 6], smallest);           // 1
// myReduce([5, 12, 15, 1, 6], sum, 10);            // 49


// function longestWord(words) {
//   return myReduce(words, longest);
// }

// function longest(result, currentWord) {
//   return currentWord.length >= result.length ? currentWord : result;
// }

// longestWord(['abc', 'launch', 'targets', '']);      // "targets"

// EVERY
// function myOwnEvery(array, func) {
//   for (let i = 0; i < array.length; i += 1) {
//     if (!func(array[i])) {
//       return false;
//     }
//   }
//   return true;
// }

// let isAString = value => typeof value === 'string';
// myOwnEvery(['a', 'a234', '1abc'], isAString);       // true

// function areAllNumbers(array) {
//   return myOwnEvery(array, isANumber);
// }

// function isANumber(value) {
//   return typeof value === 'number' && !Number.isNaN(value);
// }

// areAllNumbers([1, 5, 6, 7, '1']);             // false
// areAllNumbers([1, 5, 6, 7, 1]);               // true
// areAllNumbers([1, 5, 6, 7, NaN]);             // false

//
// let names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];

// let arr = names.map(el => el[0]);

// let obj = {};

// arr.forEach(function(el) {
//   if (obj[el]) {
//     obj[el] += 1;
//   } else {
//     obj[el] = 1;
//   }
// });

// let letter = Object.keys(obj).reduce((lastLetter, currentLetter) => {
//   if (obj[lastLetter] > obj[currentLetter]) {
//     return lastLetter;
//   } else {
//     return currentLetter;
//   }
// });

// console.log(arr);
// console.log(obj);
// console.log(letter);


// Objects

// iteration
// let myObject = { a: 1, b: 2, c: 3 };
// Object.keys(myObject).forEach(key => {
//   console.log(`key: ${key}, value: ${myObject[key]}`);
// })

// keys or values
// let myObject = { a: 1, b: 2, c: 3 };
// let keys = Object.keys(myObject);
// let values = Object.values(myObject);

// other methods

// map to a new object with values doubled from myObject
// function doubleValues(obj) {
//   let objEntries = Object.entries(obj); // convert obj into array
//   console.log(objEntries);
//   let objMapped = objEntries.map(([key, value]) => [key, value * 2]); // transform array
//   console.log(objMapped);
//   return Object.fromEntries(objMapped); // convert new array into an object
// }
// console.log(doubleValues({ a: 1, b: 2, c: 3 })); // { a: 2, b: 4, c: 6 }


// // filter an object to select only values with even numbers
// function keepEvens(obj) {
//   let objEntries = Object.entries(obj);
//   console.log(objEntries);
//   let objFiltered = objEntries.filter(([key, value]) => value % 2 === 0);
//   console.log(objFiltered);
//   return Object.fromEntries(objFiltered);
// }
// console.log(keepEvens({ a: 1, b: 2, c: 3 })); // { b: 2 }

// reduce an invoice object
// function getTotal(invoice) {
//   let total = Object.values(invoice).reduce((total, value) => total + value);
//   return {total: total};
// }
// console.log(getTotal({ phone: 10000, internet: 8000, tax: 3000 })); // { total: 21000 }


// TOTAL SQUARE AREA:
