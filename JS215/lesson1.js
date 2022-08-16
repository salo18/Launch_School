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
// Pedac
// area = height * width
// need to find the total area of each square -- map to a new array
// add up the values of all the arrays -- reduce / forEach

// let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

// function totalSquareArea(arr) {
//   let squares = arr.filter(a => a[0] === a[1]);
//   return totalArea(squares);
//   // return areas.reduce((result, value) => result + value);
// }

// function totalArea(arr) {
//   let areas = arr.map(([el1, el2]) => el1 * el2);

//   return areas.reduce((result, value) => result + value);
// }
// // console.log(totalArea(rectangles));    // 141

// console.log(totalSquareArea(rectangles));    // 121


// PROCESSING RELEASES:
// PEDAC:
// input -- object /// output -- array of objects
// only include id and title keys
// id (if exists) is > 0 and title (if exists) is non empty string
// keep objects that have both id and title

// let newReleases = [
//   {
//     'id': 0,
//     'title': 'Die Hard',
//     'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
//     'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
//     'rating': [4.0],
//     'bookmark': [],
//   },
//   {
//     'id': 654356453,
//     'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
//     'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
//     'rating': [5.0],
//     'bookmark': [{ id:432534, time:65876586 }],
//   },
//   {
//     'title': 'The Chamber',
//     'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
//     'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
//     'rating': [4.0],
//     'bookmark': [],
//   },
//   {
//     'id': 675465,
//     'title': 'Fracture',
//     'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
//     'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
//     'rating': [5.0],
//     'bookmark': [{ id:432534, time:65876586 }],
//   },
// ];

// function processReleaseData(data) {
//   return data.filter(obj => obj['id'] !== undefined && obj['title'])
//               .map(obj => {
//                 return {
//                   id: obj.id,
//                   title: obj.title,
//                 };
//               });
// }

// console.log(processReleaseData(newReleases)); // array of objects

// // should return:
// // [{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];



// OCTAL:
// Pedac
// octal to decimal conversion
// if string representation of octal number, convert to decimal

// break string up into individual elements
// iterate over the string
  // count backwards to get the powers integer going to zero
// add up all the arrays

// function octalToDecimal(numberString) {
//   let numArr = numberString.split('');
//   let arr = [];
//   let reverse = numArr.length - 1;
//   for (let i = 0; i < numArr.length; i += 1) {
//     arr.push(Number(numArr[i]) * Math.pow(8, reverse));
//     reverse -= 1;
//   }

//   let num = arr.reduce((total, value) => total + value);
//   console.log(num);
// }

// octalToDecimal('1');           // 1
// octalToDecimal('10');          // 8
// octalToDecimal('130');         // 88
// octalToDecimal('17');          // 15
// octalToDecimal('2047');        // 1063
// octalToDecimal('011');         // 9

// ANAGRAMS:
// PEDAC:
// return new array of words that are anagrams of the word argument
// anagram is a word that shares all same letters as other word

// function anagram(word, list) {
//   return list.filter(w => areAnagrams(w, word));

// }

// function areAnagrams(str1, str2) {
//   return String([...str1].sort()) === String([...str2].sort());
// }

// console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
// // anagram('listen', ['enlist', 'google', 'inlets', 'banana']);   // [ "enlist", "inlets" ]


// FORMATTING BANDS:
// PEDAC
// need to reformat the array of objects
// change country to canada
// capitalize band names
// remove all dots from band names
// return new array of objects
// map the array

// let bands = [
//   { name: 'sunset rubdown', country: 'UK', active: false },
//   { name: 'women', country: 'Germany', active: false },
//   { name: 'a silver mt. zion', country: 'Spain', active: true },
// ];

// function processBands(data) {
//   // let newObj = []
//   // data.forEach(el => {
//   //   el.name = el.name.split(' ').map(x => x[0].toUpperCase() + x.slice(1)).join(' ').replace('.', '');
//   //   el.country = "Canada";
//   //   newObj.push(el);
//   // });
//   // return newObj;

//   return data.map(el => {
//     return {
//       name: el.name.split(' ').map(x => x[0].toUpperCase() + x.slice(1)).join(' ').replace('.', ''),
//       country: el.country = 'Canada',
//       active: el.active,
//     };
//   })
// }

// console.log(processBands(bands));

// // should return:
// // [
// //   { name: 'Sunset Rubdown', country: 'Canada', active: false },
// //   { name: 'Women', country: 'Canada', active: false },
// //   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// // ]

// CLASS RECORDS:

// let studentScores = {
//   student1: {
//     id: 123456789,
//     scores: {
//       exams: [90, 95, 100, 80],
//       exercises: [20, 15, 10, 19, 15],
//     },
//   },
//   student2: {
//     id: 123456799,
//     scores: {
//       exams: [50, 70, 90, 100],
//       exercises: [0, 15, 20, 15, 15],
//     },
//   },
//   student3: {
//     id: 123457789,
//     scores: {
//       exams: [88, 87, 88, 89],
//       exercises: [10, 20, 10, 19, 18],
//     },
//   },
//   student4: {
//     id: 112233445,
//     scores: {
//       exams: [100, 100, 100, 100],
//       exercises: [10, 15, 10, 10, 15],
//     },
//   },
//   student5: {
//     id: 112233446,
//     scores: {
//       exams: [50, 80, 60, 90],
//       exercises: [10, 0, 10, 10, 0],
//     },
//   },
// };

// function generateClassRecordSummary(scores) {
//   let data = Object.entries(scores);

//   let averageExamScores = findExamAverage(data);

//   let letterGrades = convertScoresGrades(averageExamScores);

//   let classExams = buildClassExams(data);

//   let averageMinMax = buildAverageMinMax(classExams);

//   return {
//     studentGrades: letterGrades,
//     exams: averageMinMax,
//   }
// }

// function findExamAverage(data) {
//   return data.map(student => {
//     let examAvg = student[1].scores.exams.reduce((total, value) => total + value) / student[1].scores.exams.length * .65;

//     let exerciseAvg = student[1].scores.exercises.reduce((total, value) => total + value) *.35;

//     return examAvg + exerciseAvg;
//   });
// }

// function convertScoresGrades(averages) {
//   return averages.map(score => {
//     let rounded = Math.ceil(score);

//     if (rounded >= 93) {
//       return `${rounded} (A)`;
//     } else if (rounded >= 85 && rounded <= 92) {
//       return `${rounded} (B)`;
//     } else if (rounded >= 77 && rounded <= 84) {
//       return `${rounded} (C)`;
//     } else if (rounded >= 69 && rounded <= 76) {
//       return `${rounded} (D)`;
//     } else if (rounded >= 60 && rounded <= 68) {
//       return `${rounded} (E)`;
//     } else if (rounded >= 0 && rounded <= 59) {
//       return `${rounded} (F)`;
//     }
//   });
// }

// function buildClassExams(data) {
//   let exams = [[], [], [], []];

//   for (let i = 0; i <= 3; i += 1) {
//     for (let j = 0; j < data.length; j += 1) {
//       exams[i].push(data[j][1].scores.exams[i])
//     }
//   }

//   return exams;
// }

// function buildAverageMinMax(data) { // return array of objects
//   return data.map(exam => {
//     return {
//       average: exam.reduce((total, value) => total+value)/data[0].length,
//       minimum: Math.min(...exam),
//       maximum: Math.max(...exam),
//     }
//   });
// }

// console.log(generateClassRecordSummary(studentScores));

// // returns:
// // {
// //   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
// //   exams: [
// //     { average: 75.6, minimum: 50, maximum: 100 },
// //     { average: 86.4, minimum: 70, maximum: 100 },
// //     { average: 87.6, minimum: 60, maximum: 100 },
// //     { average: 91.8, minimum: 80, maximum: 100 },
// //   ],
// // }



// ALL UNIQUE LETTERS
// function isAllUnique(string) {
//   let arr = string.toLowerCase().split('');

//   let result = [];

//   for (let i = 0; i < arr.length; i += 1) {
//     if (!result.includes(arr[i])) {
//       result.push(arr[i]);
//     } else {
//       return false;
//     }
//   }
//   return true;
// }

// console.log(isAllUnique('The quick brown fox jumped over a lazy dog'));  // false
// console.log(isAllUnique('123,456,789'));                                 // false
// console.log(isAllUnique('The big apple'));                               // false
// console.log(isAllUnique('The big apPlE'));                               // false
// console.log(isAllUnique('!@#$%^&*()'));                                  // true
// console.log(isAllUnique('abcdefghijklmnopqrstuvwxyz'));                  // true

// function iterate(array, callback) {
//   for (let i = 0; i < array.length; i += 1) {
//     callback(array[i]);
//   }
// }

// let methods = {
//    foo: function () {
//      console.log('hello');
//    },
// };

// iterate([1, 2, 3], methods.foo);