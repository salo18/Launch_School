// // 4
// let obj = {
//   b: 2,
//   a: 1,
//   c: 3,
// };

// let arr = Object.keys(obj).map((key) => key.toUpperCase());
// console.log(arr);

// 6
// "foo"
// // primitive
// 3.1415
// // primitive
// [ 'a', 'b', 'c' ]
// // obj
// false
// // primitive
// foo
// // // primitive
// function bar() { return "bar"; }
// // obj
// undefined
// // primitive
// { a: 1, b: 2 }
// // obj

// 8
// let objToCopy = {
//   foo: 1,
//   bar: 2,
//   qux: 3,
// };

// function copyObj(source, keys) {
//   let newObj = {};

//   if (keys) {
//     keys.forEach(function(key) {
//       newObj[key] = source[key]
//     });

//     return newObj;
//   } else {
//     return Object.assign(newObj, source);
//   }
// }

// let newObj = copyObj(objToCopy);
// console.log(newObj);        // => { foo: 1, bar: 2, qux: 3 }

// let newObj2 = copyObj(objToCopy, [ 'foo', 'qux' ]);
// console.log(newObj2);       // => { foo: 1, qux: 3 }

// let newObj3 = copyObj(objToCopy, [ 'bar' ]);
// console.log(newObj3);       // => { bar: 2 }

// 9
// let foo = {
//   a: 'hello',
//   b: 'world',
// };

// let qux = 'hello';

// function bar(argument1, argument2) {
//   argument1.a = 'hi';
//   argument2 = 'hi';=
// }

// bar(foo, qux);

// console.log(foo.a);
// console.log(qux);


// 11
