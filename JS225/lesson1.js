// FACTORIES
// let sedan = {
//   speed: 0,
//   rate: 8,

//   accelerate() {
//     this.speed += this.rate;
//   },

// };

// console.log(sedan.speed);
// sedan.accelerate();
// console.log(sedan.speed);
// sedan.accelerate();
// console.log(sedan.speed);


// function makeCar(rate, slow) {
//   return {
//     speed: 0,
//     rate,
//     slow,
//     accelerate() {
//       this.speed += this.rate;
//     },

//     brake() {
//       this.speed -= this.slow;
//       if (this.speed < 0) {
//         this.speed = 0;
//       }
//     }
//   };
// }

// let sedan = makeCar(8, 6);
// sedan.accelerate();
// console.log(sedan.speed); // 8
// sedan.brake();
// console.log(sedan.speed); // 2
// sedan.brake();
// console.log(sedan.speed); // 8

// let coupe = makeCar(12);
// coupe.accelerate();
// console.log(coupe.speed); // 8

// let hatchback = makeCar(9);
// hatchback.accelerate();

// console.log(hatchback.speed);

// FACTORIES PRACTICE
