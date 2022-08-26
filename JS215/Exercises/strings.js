// 1
// function isUppercase(str) {
//   // console.log(str === str.toUpperCase());
//   console.log(!/[a-z]/g.test(str));
// }

// isUppercase('t');               // false
// isUppercase('T');               // true
// isUppercase('Four Score');      // false
// isUppercase('FOUR SCORE');      // true
// isUppercase('4SCORE!');         // true
// isUppercase('');                // true

// 2
// function removeVowels(arr) {
//   console.log(arr.map(word => word.replace(/[aeiou]/ig, '')));
// }
// removeVowels(['abcdefghijklmnopqrstuvwxyz']);         // ["bcdfghjklmnpqrstvwxyz"]
// removeVowels(['green', 'YELLOW', 'black', 'white']);  // ["grn", "YLLW", "blck", "wht"]
// removeVowels(['ABC', 'AEIOU', 'XYZ']);                // ["BC", "", "XYZ"]

// 3
// function letterCaseCount(str) {
//   let obj = {lowercase: 0, uppercase: 0, neither: 0};

//   for (let i = 0; i < str.length; i += 1) {
//     if (/[a-z]/.test(str[i])) {
//       obj.lowercase += 1;
//     } else if (/[A-Z]/.test(str[i])) {
//       obj.uppercase += 1;
//     } else {
//       obj.neither += 1;
//     }
//   }

//   console.log(obj);
// }
// letterCaseCount('abCdef 123');  // { lowercase: 5, uppercase: 1, neither: 4 }
// letterCaseCount('AbCd +Ef');    // { lowercase: 3, uppercase: 3, neither: 2 }
// letterCaseCount('123');         // { lowercase: 0, uppercase: 0, neither: 3 }
// letterCaseCount('');            // { lowercase: 0, uppercase: 0, neither: 0 }

// 4
// function wordCap(str) {
//   console.log(str.split(' ').map(word => word[0].toUpperCase() + word.substring(1).toLowerCase()).join(' '));
// }

// wordCap('four score and seven');       // "Four Score And Seven"
// wordCap('the javaScript language');    // "The Javascript Language"
// wordCap('this is a "quoted" word');    // 'This Is A "quoted" Word'

// 5
// function swapCase(str) {
//   let arr = str.split('').map(letter => {
//     if (letter === letter.toUpperCase()) {
//       return letter.toLowerCase();
//     } else if (letter === letter.toLowerCase()) {
//       return letter.toUpperCase();
//     } else {
//       return letter;
//     }
//   });
//   console.log(arr.join(''));
// }
// swapCase('CamelCase');              // "cAMELcASE"
// swapCase('Tonight on XYZ-TV');      // "tONIGHT ON xyz-tv"


// 6
// function staggeredCase(str) {
//     return str.split('').map((letter, idx) => {
//     if (idx % 2 === 0) {
//       return letter.toUpperCase();
//     } else {
//       return letter.toLowerCase();
//     }
//   }).join('');
// }

// console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
// console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
// console.log(staggeredCase('ignore 77 the 4444 numbers'));   // "IgNoRe 77 ThE 4444 nUmBeRs"

// 7
// function staggeredCase(str) {
//   let switcher = true;
//   let newChar;
//   return str.split('').map((char) => {
//     if (char.match(/[a-z]/i)) {
//       if (switcher) {
//         newChar = char.toUpperCase();
//       } else {
//         newChar = char.toLowerCase();
//       }
//       switcher = !switcher;
//       return newChar;
//     } else {
//       return char;
//     }
//   }).join('');
// }

// console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
// console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
// console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"

// 8
// function wordLengths(str) {
//   if (str === undefined || str.length === 0) {
//     return [];
//   }
//   return str.split(' ').map(word => {
//     return `${word} ${word.length}`
//   })
// }


// console.log(wordLengths('cow sheep chicken'));
// // ["cow 3", "sheep 5", "chicken 7"]

// console.log(wordLengths('baseball hot dogs and apple pie'));
// // ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

// console.log(wordLengths("It ain't easy, is it?"));
// // ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

// console.log(wordLengths('Supercalifragilisticexpialidocious'));
// // ["Supercalifragilisticexpialidocious 34"]

// console.log(wordLengths(''));      // []
// console.log(wordLengths());        // []

// // 9
// function searchWord(word, text) {
//   if (!word || !text) return undefined;

//   // let counter = 0;
//   // text.split(' ').forEach(w => {
//   //   if (word.toLowerCase() === w.toLowerCase()) {
//   //     counter += 1;
//   //   }
//   // })
//   // const regex = new RegExp(`\\b${word}\\b`, 'gi');
//   // const matches = text.match(regex);
//   // console.log(matches);


//   // return matches ? matches.length : 0;
//   // console.log(counter);
// }

function searchWord(word, text) {
  if (!word || !text) return undefined;

  const parseWord = new RegExp(`\\b${word}\\b`, 'gi');
  return text.match(parseWord)?.length || 0
}
const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(searchWord('qui', text));      // 3

// 10
// function searchWord(word, text) {
//     if (!word || !text) return undefined;

//     // return text.split(' ').map(w => {
//     //   if (word.toLowerCase() === w.toLowerCase()) {
//     //     return `**${w.toUpperCase()}**`;
//     //   } else {
//     //     return w;
//     //   }
//     // }).join(' ')

//     // let reg = new RegExp(`\\b${word}\\b`, 'gi');
//     let reg = new RegExp(word, 'gi');
//     return text.replace(reg, `**${word.toUpperCase()}**`)

//   }

// const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

// console.log(searchWord('sed', text));
// // returns
// "**SED** ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, **SED** quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, **SED** quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"