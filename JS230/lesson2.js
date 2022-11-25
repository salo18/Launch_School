// 1
// function delayLog() {
//   let arr = [...Array(11).keys()].slice(1);
//   let delay = 1000;
//   arr.forEach((num, idx) => {
//     setTimeout(() => {
//       console.log(num);
//     }, 1000 * idx);
//   });
// }

// delayLog();
// // 1  // 1 second later
// // 2  // 2 seconds later
// // 3  // 3 seconds later
// // 4  // etc...
// // 5
// // 6
// // 7
// // 8
// // 9
// // 10

//  2
// setTimeout(() => {        // 1
//   console.log('Once');    // 5
// }, 1000);

// setTimeout(() => {        // 2
//   console.log('upon');    // 7
// }, 3000);

// setTimeout(() => {         // 3
//   console.log('a');         // 6
// }, 2000);

// setTimeout(() => {          // 4
//   console.log('time');      // 8
// }, 4000);


//  3
// setTimeout(() => {
//   setTimeout(() => {
//     q();
//   }, 15);

//   d();

//   setTimeout(() => {
//     n();
//   }, 5);

//   z();
// }, 10);

// setTimeout(() => {
//   s();
// }, 20);

// setTimeout(() => {
//   f();
// });

// g();

// // g, f, d, z, n, s, q


//  4

// function afterNSeconds(callback, seconds) {
//   setTimeout(callback, seconds * 1000)
// }




// setInterval()

