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

// 1
// function startCounting() {
//   let num = 1;

//   setInterval(() => {
//     count += 1;
//     console.log(count);
//   }, 1000);

// }

// // startCounting();

// // 2
// function stopCounting() {
//   clearInterval()
// }



// document.addEventListener('DOMContentLoaded', event => {
//   let addButton = document.getElementById('add');
//   let output = document.getElementById('output');
//   let count = 0;

//   addButton.addEventListener('click', event => {
//     count += 1;
//     output.textContent = String(count);
//   });
// });


// Alert
// function displayAlert(event) {
//   let message = document.getElementById('message').value;
//   alert(message);
// }

// // document.addEventListener('DomContentLoaded', () => {
// //   let button = document.getElementById('alert');
// //   button.addEventListener('click', displayAlert);
// // });

// // function displayAlert(event) {
// //   let message = document.getElementById('message').value;
// //   alert(message);
// // }

// document.addEventListener('DOMContentLoaded', () => {
//   let button = document.getElementById('alert');
//   button.addEventListener('click', displayAlert);
// });

// document.getElem


// Promises practice
// https://www.youtube.com/watch?v=DHvZLI7Db8E
// USING CALLBACKS
// const userLeft = false;
// const userDistracted = false;

// function watchTutorialCallback(callback, errorCallback) {
//   if (userLeft) {
//     errorCallback({
//       name: 'User Left',
//       message: ':(',
//     });
//   } else if (userDistracted) {
//     errorCallback({
//       name: 'User distracted on Youtube',
//       message: 'not coding...',
//     })
//   } else {
//     callback('yeah keep coding')
//   }
// }

// watchTutorialCallback((message) => {
//   console.log('Success' + message);
// }, (error) => {
//   console.log(`${error.name} is ${error.message}`);
// })

// USING PROMISES

// function watchTutorialPromise() {
//   return new Promise((resolve, reject) => {
//     if (userLeft) {
//       reject({
//         name: 'User Left',
//         message: ':(',
//       });
//     } else if (userDistracted) {
//       reject({
//         name: 'User distracted on Youtube',
//         message: 'not coding...',
//       })
//     } else {
//       resolve('yeah keep coding')
//     }
//   })
// }

// watchTutorialPromise().then((message) => {
//   console.log('Success ' + message);
// }).catch((error) => {
//   console.log(`${error.name} is ${error.message}`);
// })


// // ANOTHER EXAMPLE
// const recordVid1 = new Promise((resolve, reject) => {
//   resolve('Video 1 is recorded');
// })

// const recordVid2 = new Promise((resolve, reject) => {
//   resolve('Video 2 is recorded');
// })

// const recordVid3 = new Promise((resolve, reject) => {
//   resolve('Video 3 is recorded');
// })

// // the promises all run at the same time --- if one is really slow, the other two continue running. this takes advantage of the asynchronous nature of JS
// // Promise.all([
// //   recordVid1,
// //   recordVid2,
// //   recordVid3
// // ]).then((messages) => {
// //   console.log(messages);
// // })

// // returns as soon as the first one is complete instead of waiting for all three
// Promise.race([
//   recordVid1,
//   recordVid2,
//   recordVid3
// ]).then((message) => {
//   console.log(message);
// })


// async await
function makeRequest(location) {
  return new Promise((resolve, reject) => {
    console.log(`Making requests to ${location}`);
    if (location === 'Google') {
      resolve('Google says hi');
    } else {
      reject('We can only talk to Google');
    }
  });
}

function processRequest(response) {
  return new Promise((resolve, reject) => {
    console.log('Processing response');
    resolve(`Extra Information + ${response}`);
  });
}

// makeRequest('FB').then(response => {
//   console.log(`Response Received`);
//   return processRequest(response);
// }).then(processedResponse => {
//   console.log(processedResponse);
// }).catch(err => {
//   console.log(err);
// })


async function doWork() {
  try { // put all code that could potentially fail in here
    const response = await makeRequest('Google'); // code should wait until the invocation is finished and then after execute the next thing
    console.log(`Response Received`);

    const processedResponse = await processRequest(response);
    console.log(processedResponse);
  } catch (err) {
    console.log(err);
  }

}

doWork();
