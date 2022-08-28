// 1
/*
input - a string
output - an object containing the percentages of the composition of the string by type
*/

// function letterPercentages(str) {
//   let obj = {
//     lowercase: 0,
//     uppercase: 0,
//     neither: 0,
//   }

//   let strLength = str.length;
//   let uppers = str.match(/[A-Z]/g) || 0;
//   let lowers = str.match(/[a-z]/g) || 0;
//   let neither = str.match(/\W|[0-9]/g) || 0;

//   for (key in obj) {
//     if (key === 'lowercase' && lowers) {
//       obj[key] = lowers.length / strLength;
//     } else if (key === 'uppercase'  && uppers) {
//       obj[key] = uppers.length / strLength;
//     } else if (key === 'neither'  && neither) {
//       obj[key] = neither.length / strLength;
//     }
//   }

//   // console.log(obj['lowercase'] > 0, obj['lowercase'])

//   obj['lowercase'] = convertToStr(obj['lowercase']);
//   obj['uppercase'] = convertToStr(obj['uppercase']);
//   obj['neither'] = convertToStr(obj['neither']);


//   console.log(obj);
// }

// function convertToStr(number) {
//   let arr;
//   if (number < 1 && number > 0) {
//     arr = String(number).split('').slice(2);
//     for (let i = arr.length; i < 4 ; i += 1) {
//       arr.push('0');
//     }
//     arr.splice(2, 0, '.');
//     return arr.join('');
//   } else if (number === 0) {
//     return `0.00`;
//   } else if (number === 1) {
//     return `100.00`;
//   }
// }

// letterPercentages('abCdef 123');
// // { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

// letterPercentages('AbCd +Ef');
// // { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

// letterPercentages('123');
// // { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }

// 2
// function triangle(num1, num2, num3) {
//   // let [min, middle, max] = [num1, num2, num3].sort();
//   let arr = [num1, num2, num3];
//   arr.sort();
//   if (arr.includes(0) || (arr[0] + arr[1] < arr[2])) {
//     return 'invalid';
//   } else if (arr[0] === arr[1] && arr[1] === arr[2] && arr[2] === arr[0]) {
//     return 'equilateral';
//   } else if (arr[0] !== arr[1] && arr[1] !== arr[2] && arr[2] !== arr[0]) {
//     return 'scalene';
//   } else {
//     return 'isosceles';
//   }
// }

// console.log(triangle(3, 3, 3));        // "equilateral"
// console.log(triangle(3, 3, 1.5));      // "isosceles"
// console.log(triangle(3, 4, 5));        // "scalene"
// console.log(triangle(0, 3, 3));        // "invalid"
// console.log(triangle(3, 1, 1));        // "invalid"

// 3
// function triangle(an1, an2, an3) {
//   let arr = [an1, an2, an3];
//   if (arr.reduce((acc, val) => acc + val) !== 180 || arr.includes(0)) {
//     return 'invalid';
//   }

//   if (arr.every(x => x < 90)) {
//     return 'acute';
//   } else if (arr.filter(x => x > 90).length === 1) {
//     return 'obtuse';
//   } else if (arr.filter(x => x === 90).length === 1) {
//     return 'right';
//   }
// }


// console.log(triangle(60, 70, 50));       // "acute"
// console.log(triangle(30, 90, 60));       // "right"
// console.log(triangle(120, 50, 10));      // "obtuse"
// console.log(triangle(0, 90, 90));        // "invalid"
// console.log(triangle(50, 50, 50));       // "invalid"

// // 4
// function fridayThe13ths(year) {
//   const thirtheenths = [];
//   for (let i = 0; i < 12; i += 1) {
//     thirtheenths.push(new Date(year, i, 13));
//   }
//   // console.log(thirtheenths);
//   return thirtheenths.reduce((count, day) => day.getDay() === 5 ? (count + 1) : count, 0);
// }

// console.log(fridayThe13ths(1986));      // 1
// console.log(fridayThe13ths(2015));      // 3
// console.log(fridayThe13ths(2017));      // 2

// // 5
// function featured(num) {
//   let featured = num;
//   do {
//     featured += 1;
//   } while ((featured % 2 === 1) && (featured % 7 !== 0) && unique(featured));
//   return featured;
// }

// function unique(num) {
//   let arr = String(num).split('');
//   return arr.filter((x, i, a) => a.indexOf(x) === i).length === arr.length;
// }

// console.log(featured(12));           // 21
// console.log(featured(20));           // 21
// console.log(featured(21));           // 35
// console.log(featured(997));          // 1029
// console.log(featured(1029));         // 1043
// console.log(featured(999999));       // 1023547
// console.log(featured(999999987));    // 1023456987
// console.log(featured(9876543186));   // 9876543201
// console.log(featured(9876543200));   // 9876543201
// featured(9876543201);   // "There is no possible number that fulfills those requirements."


// 6
// function sumSquareDifference(num) {
//   let arr = [];
//   for (let i = 1; i <= num; i += 1) {
//     arr.push(i);
//   }
//   let sum = arr.reduce((acc, val) => acc + val)**2;
//   let squares = arr.map(x => x**2).reduce((acc, val) => acc + val);
//   console.log(sum - squares);
// }

// sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
// sumSquareDifference(10);     // 2640
// sumSquareDifference(1);      // 0
// sumSquareDifference(100);    // 25164150

