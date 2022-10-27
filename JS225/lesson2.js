
// // 4
// var message = 'Hello from the global scope!';

// function deliverMessage() {
//   console.log(this.message);
// }

// deliverMessage(); // hello from the global scope

// let bar = {
//   message: 'Hello from the function scope!',
// };

// bar.deliverMessage = deliverMessage;
// // console.log(bar);
// bar.deliverMessage(); // hello from the function scope

// // 5
// let a = 10;
// let b = 10;
// let c = {
//   a: -10,
//   b: -10,
// };

// function add() {
//   return this.a + b;
// }

// c.add = add;

// console.log(add()); // 20
// console.log(c.add()); // 0


// 7
// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = {
//    a: 'abc',
//    b: 'def',
//    add() {
//      return this.a + this.b;
//    },
// };

// console.log(bar.add.call(foo));

// 8
// let fruitsObj = {
//   list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
//   title: 'A Collection of Fruit',
// };

// function outputList() {
//   console.log(this.title + ':');

//   let args = [].slice.call(arguments);

//   args.forEach(function(elem) {
//     console.log(elem);
//   });
// }

// // invoke outputList here
// outputList.apply(fruitsObj, fruitsObj.list);


// let object = {
//   a: 'hello',
//   b: 'world',
//   foo() {
//     return this.a + ' ' + this.b;
//   },
// }

// a = 'sup';
// b = 'suppy';

// let bar = object.foo;
// console.log(bar()); // sup suppy

// let baz = object.foo.bind(object);
// console.log(baz());

// let object2 = {
//   a: 'hi',
//   b: 'there',
// };

// console.log(baz.call(object2));



// let car = {
//   fuel: 7.8,
//   running: false,
//   start() {
//     this.running = true;
//   },
// };
// // console.log(car);

// car.stop = function() {
//   this.running = false;
// };

// car.drive = function(distance) {
//   this.fuel -= distance / 52;
// };

// car.start();
// car.stop();
// car.drive(139);
// console.log(car);

// let me = {
//   firstName: 'Jane',
//   lastName: 'Doe',
// };

// function fullName(person) {
//   // console.log(person.firstName + ' ' + person.lastName);
//   console.log(`${person.firstName} ${person.lastName}`)
// }

// let friend = {
//   firstName: 'John',
//   lastName: 'Smith',
// };

// let friend1 = {
//   firstName: 'Josh',
//   lastName: 'W',
// };

// let friend2 = {
//   firstName: 'Sid',
//   lastName: 'B',
// }

// let people = {
//   collection: [me, friend, friend1, friend2],
//   fullName(person) {
//     // console.log(person.firstName + ' ' + person.lastName);
//     console.log(`${person.firstName} ${person.lastName}`)
//   },

//   rollCall: function() {
//     this.collection.forEach(this.fullName);
//   },

//   add: function(person) {
//     this.collection.push(person);
//   },

//   getIndex: function(person) {
//     let index = -1;
//     this.collection.forEach((compare, i) => {
//       if (compare.firstName === person.firstName && compare.lastName === person.lastName) {
//         index = i;
//       }
//     });

//     return index;
//     // return this.collection.indexOf(person);
//   },

//   remove: function(person) {
//     let index;

//     if (this.isInvalidPerson(person)) {
//       return;
//     }

//     index = this.getIndex(person);
//     if (index === -1) {
//       return;
//     }

//     this.collection.splice(index, 1);
//   },

//   isInvalidPerson: function(person) {
//     return typeof person.firstName !== 'string' || typeof person.lastName !== 'string'
//   },

//   add: function(person) {
//     if (this.isInvalidPerson(person)) {
//       return;
//     }

//     this.collection.push(person);
//   },

//   get: function(person) {
//     if (this.isInvalidPerson(person)) {
//       return;
//     }

//     return this.collection[this.getIndex(person)];
//   },

//   update: function(person) {
//     if (this.isInvalidPerson(person)) {
//       return;
//     }

//     let existingPersonId = this.getIndex(person);
//     if (existingPersonId === -1) {
//       this.add(person);
//     } else {
//       this.collection[existingPersonId] = person;
//     }
//   },

// };

// console.log(people.collection);
// console.log(people.getIndex(friend));
// people.remove(friend);
// console.log(people.getIndex(friend));
// console.log(people.collection);


// Practice problems: Objects
// let invoices = {
//   unpaid: [],
//   add: function(name, amount) {
//     let obj = {
//       name,
//       amount,
//     };

//     this.unpaid.push(obj);
//   },

//   totalDue: function() {
//     let sum = 0;

//     this.unpaid.forEach(obj => {
//       sum += obj.amount;
//     });

//     return sum;
//   },

//   paid: [],

//   payInvoice: function(name) {
//     let arr = [];
//     this.unpaid.forEach(obj => {
//       if (obj.name === name) {
//         this.paid.push(obj);
//       } else {
//         arr.push(obj);
//       }
//     });
//     this.unpaid = arr;
//   },

//   totalPaid: function(name) {
//     let sum = 0;

//     this.paid.forEach(obj => {
//       sum += obj.amount;
//     });

//     return sum;
//   },
// };

// // console.log(invoices.unpaid);
// invoices.add('something', 1000);
// // console.log(invoices.unpaid);
// invoices.add('somethingnew', 50);
// // console.log(invoices.unpaid);
// // console.log(invoices.totalDue());
// console.log(invoices.paid);
// invoices.payInvoice('something');
// invoices.payInvoice('somethingnew');
// console.log(invoices.paid);
// console.log(invoices.unpaid);

// let sedan = {
//   speed: 0,
//   rate: 8,

//   accelerate() {
//     this.speed += this.rate;
//   },
// };

// function makeCar(rate, brakeRate) {
//   return {
//     speed: 0,
//     rate,
//     brakeRate,
//     accelerate() {
//       this.speed += this.rate;
//     },
//     brake() {
//       if (this.speed - brakeRate <= 0) {
//         this.speed = 0;
//       } else {
//         this.speed -= brakeRate;
//       }
//     },
//   };
// }

// let hatchback = makeCar(9, 6);
// hatchback.accelerate();
// console.log(hatchback.speed);
// hatchback.brake();
// console.log(hatchback.speed);
// hatchback.brake();
// console.log(hatchback.speed);


// function makeCountry(name, continent, visited) {
//   if (visited === undefined) {
//     visited = false;
//   }
//   return {
//     name,
//     continent,
//     visited,
//     getDescription() {
//       if (this.visited) {
//         return `${this.name} is located in ${this.continent}. I have visited.`;
//       } else {
//         return `${this.name} is located in ${this.continent}. I have never visited.`;
//       }
//     },
//     visitCountry() {
//       this.visited = true;
//     }
//   }
// }

// let nz = makeCountry('New Zealand', 'Oceania');
// // console.log(nz);
// console.log(nz.getDescription());
// nz.visitCountry();
// console.log(nz.visited);
// console.log(nz.getDescription());


// let people = [];
// people.push(friend);
// people.push(me);

// console.log(people);

// function rollCall(collection) {
//   // collection.forEach(x => {
//   //   fullName(x);
//   // });

//   collection.forEach(fullName);
// }

// rollCall(people);
// // fullName(friend);
// // fullName(me);



let obj = {
  message: 'js',
};

function foo() {
  console.log(this.message);
}

let me = foo.bind(obj);
me();