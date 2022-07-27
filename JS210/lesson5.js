// Working with Objects

// 1
// let pets = {
//   cat: 'Simon',
//   dog: 'Dwarf',
//   mice: null,
// };

// function objectHasProperty(obj, str) {
//   for (let pet in pets) {
//     if (pet === str) {
//       console.log(true);
//       return true;
//     }
//   }
//   return false
// }

// objectHasProperty(pets, 'dog');       // true
// objectHasProperty(pets, 'lizard');    // false
// objectHasProperty(pets, 'mice');      // true

// 2
// let wins = {
//   steve: 3,
//   susie: 4,
// };

// const incrementProperty = (obj, key) => {
//   if (Object.keys(obj).includes(key)) {
//     obj[key] += 1;
//   } else {
//     obj[key] = 1;
//   }
//   console.log(obj[key]);
// }

// incrementProperty(wins, 'susie');   // 5
// console.log(wins);                               // { steve: 3, susie: 5 }
// incrementProperty(wins, 'lucy');    // 1
// console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }

// 3
// let hal = {
//   model: 9000,
//   enabled: true,
// };

// let sal = {};

// const copyProperties = (obj1, obj2) => {
//   for (let obj in obj1) {
//     obj2[obj] = obj1[obj];
//   }
//   console.log(Object.keys(obj1).length);
// }

// copyProperties(hal, sal);  // 2
// sal;                       // { model: 9000, enabled: true }

// 4
// const wordCount = str => {
//   let arr = str.split(" ");
//   let obj = {};
//   for (let i = 0; i < arr.length; i += 1) {
//     if (obj[arr[i]]) {
//       obj[arr[i]] += 1;
//     } else {
//       obj[arr[i]] = 1;
//     }
//   }

//   console.log(obj);
// }
// wordCount('box car cat bag box');  // { box: 2, car: 1, cat: 1, bag: 1 }

// WELCOME STRANGER
// function greetings(arr, obj) {
//   let name = arr.join(" ");
//   let job = `${obj["title"] + obj["occupation"]}`;
//   console.log(`Hello ${name}! Nice to have a ${job} around.`)
// }
// greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// REPEATED CHARS
const repeatedCharacters = str => {
  let obj = {};
  let newstr = str.toLowerCase();

  for (let i = 0; i < newstr.length; i += 1) {
    if (obj[newstr[i]]) {
      obj[newstr[i]] += 1;
    } else {
      obj[newstr[i]] = 1;
    }
  }

  let newobj = {};

  for (let i in obj) {
    if (obj[i] > 1) {
      newobj[i] = obj[i];
    }
  }

  console.log(newobj);
}

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }

