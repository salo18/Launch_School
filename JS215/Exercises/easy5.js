// 1
// function repeater(str) {
//   let newStr = '';
//   for (let i = 0; i < str.length; i += 1) {
//     newStr += str[i] + str[i];
//   }
//   console.log(newStr);
// }

// repeater('Hello');        // "HHeelllloo"
// repeater('Good job!');    // "GGoooodd  jjoobb!!"
// repeater('');             // ""

// 2

// function doubleConsonants(str) {
//   let newStr = '';
//   for (let i = 0; i < str.length; i += 1) {
//     if (/[^aeiou\W\d]/.test(str[i])) {
//       newStr += str[i] + str[i];

//     } else {
//       newStr += str[i]
//     }
//   }
//   console.log(newStr);
// }

// doubleConsonants('String');          // "SSttrrinngg"
// doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
// doubleConsonants('July 4th');        // "JJullyy 4tthh"
// doubleConsonants('');                // ""

// 3
// function reverseNumber(num) {
//   let str = String(num).split('').reverse().join('');

//   console.log(str.replace(/^0+/, ''));
// }

// reverseNumber(12345);    // 54321
// reverseNumber(12213);    // 31221
// reverseNumber(456);      // 654
// reverseNumber(12000);    // 21 -- Note that zeros get dropped!
// reverseNumber(1);        // 1

// 4
// function centerOf(str) {
//   let len = Math.floor(str.length / 2);
//   console.log(`str length is ${str.length} half is ${len}`);
//   // console.log(``)
//   if (str.length % 2 === 0) {
//     console.log(str.substring(len -1, len+1));
//   } else {
//     console.log(str[len]);
//   }
// }

// centerOf('I Love JavaScript'); // "a"
// centerOf('Launch School');     // " "
// centerOf('Launch');            // "un"
// centerOf('Launchschool');      // "hs"
// centerOf('x');                 // "x"


// 5
// function negative(num) {
//   if (num === 0) { return -0 }
//   return num > 0 ? -num : num;
//   // if (num > 0) {
//   //   return -num;
//   // } else {
//   //   return num;
//   // }
// }

// console.log(negative(5));     // -5
// console.log(negative(-3));    // -3
// console.log(negative(0));     // -0

// // 6
// function sequence(num) {
//   let arr = [];
//   for (let i = 1; i <= num; i += 1) {
//     arr.push(i);
//   }
//   console.log(arr);
// }
// sequence(5);    // [1, 2, 3, 4, 5]
// sequence(3);    // [1, 2, 3]
// sequence(1);    // [1]

// 7
// function swapName(str) {
//   let arr = str.split(' ')
//   let fnames = arr.slice(0, arr.length - 1).join(' ');
//   console.log(`${arr[arr.length-1]}, ${fnames}`);
// }
// swapName('Joe Martin Bobby Roberts');    // "Roberts, Joe ..."

// 8

// function sequence(count, start) {
//   let arr = [];
//   for (let i = 1; i <= count ; i += 1) {
//     arr.push(start * i)
//   }
//   console.log(arr);
// }

// sequence(5, 1);          // [1, 2, 3, 4, 5]
// sequence(4, -7);         // [-7, -14, -21, -28]
// sequence(3, 0);          // [0, 0, 0]
// sequence(0, 1000000);    // []

// 9
// function reverseSentence(str) {
//   console.log(str.split(' ').reverse().join(' '))
// }

// reverseSentence('');                       // ""
// reverseSentence('Hello World');            // "World Hello"
// reverseSentence('Reverse these words');    // "words these Reverse"

// 10
function reverseWords(str) {
  let arr = str.split(' ');
  let newArr = arr.map(x => {
    if (x.length > 4) {
      return x.split('').reverse().join('');
    } else {
      return x;
    }
  });
  console.log(newArr.join(' '));
}

reverseWords('Professional');             // "lanoisseforP"
reverseWords('Walk around the block');    // "Walk dnuora the kcolb"
reverseWords('Launch School');            // "hcnuaL loohcS"