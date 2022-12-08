// 1
// const p = new Promise((resolve, reject) => {
//   setTimeout(() => {
//     resolve('Launch School');
//   }, 2000);
// });

// p.then(value => {
//   console.log(value);
// });


// 2
// const p1 = new Promise((resolve, reject) => {
//   setTimeout(() => {
//     reject('Error not Launch School');
//   }, 2000)
// });

// p1.catch(value => {
//   console.log(value);
// })

// 3
// const promise = new Promise(function (resolve, reject) {
//   resolve("I am a Promise");
// });
// ​
// promise.then(value => console.log(value));
// console.log("I am NOT a Promise");

// ==> I am NOT a Promise
// ==> I am am a Promise
// syncronous code is run before asyncronous code

// 4
// const promise1 = new Promise((resolve, reject) => {
//   console.log("foo");
//   resolve();
//   console.log("bar");
// });

// promise1.then(() => {
//   console.log("baz");
// });

// console.log("qux");

// // ==> quz
// // ==> foo
// // ==> baz
// // ==> bar


// 5
// const promise = new Promise((resolve, reject) => {
//   console.log("foo");
//   reject();
//   console.log("bar");
// });

// promise
//   .then(() => {
//     console.log("baz");
//   })
//   .catch(() => {
//     console.log("qux");
//   });

// console.log("abc");

// // foo
// // bar
// // abc
// // qux

// // 6
// const promise = new Promise(res => res(1));
// promise
//   .then((num) => {
//     console.log(num);
//     return num + 2;
//   })
//   .then((num) => {
//     console.log(num);
//     return num + 3;
//   })
//   .then((num) => {
//     console.log(num);
//     return num + 4;
//   })
//   .finally((num) => {
//     console.log(num);
//     return num + 5;
//   });

//   // 1
//   // 3
//   // 6
//  // undefined


// 7
// const promise = new Promise((resolve, reject) => {
//   resolve("Got it!");
//   reject("Oops.");
//   resolve("Again!");
// });

// promise
//   .then((res) => {
//     console.log(res);
//   })
//   .catch((err) => {
//     console.log(err);
//   });

// // Got it


// 8
// function after1s(x) {
//   return new Promise((resolve) => {
//     setTimeout(() => {
//       resolve(x);
//     }, 1000);
//   });
// }

// async function test(input) {
//   const a = await after1s(2);
//   const b = await after1s(3);
//   return input * a * b;
// }

// test(3).then((value) => console.log(value));

// 9
// function after1s(x) {
//   return new Promise((resolve) => {
//     setTimeout(() => {
//       resolve(x);
//     }, 1000);
//   });
// }

// async function test(input) {
//   const a = await after1s(2);
//   const b = await after1s(3);
//   return input * (await a) * (await b);
// }

// test(3).then((value) => console.log(value));


// 10
// function after1s(x, ms) {
//   return new Promise((resolve) => {
//     setTimeout(() => {
//       resolve(x);
//     }, ms);
//   });
// }

// async function test1(input) {
//   const a = await after1s(2, 2000);
//   const b = await after1s(3, 2000);
//   return input * a * b;
// }

// async function test2(input) {
//   const a = await after1s(2, 1000);
//   const b = await after1s(3, 1000);
//   return input * a * b;
// }

// test1(2).then((value) => console.log(value));
// test2(3).then((value) => console.log(value));


// 11
// const testPromise = () => Promise.resolve("1");

// function test1() {
//   testPromise().then((result) => console.log(result));
//   console.log("2");
// }

// function test2() {
//   console.log("3");
// }

// test1();
// test2();

// 12
// const test = Promise.resolve("A");

// (async () => {
//   try {
//     console.log(await test);
//   } catch {
//     console.log("E");
//   } finally {
//     console.log("B");
//   }
// })();


// 13
const test = Promise.reject("A");

(async () => {
  try {
    console.log(await test);
  } catch {
    console.log("E");
  } finally {
    console.log("B");
  }
})();
