// Factory Functions Practice

// 3
// let invoice = {
//   phone: 3000,
//   internet: 6500,
// };
// let payment = {
//   phone: 1300,
//   internet: 5500,
// };
// let invoiceTotal = invoice.phone + invoice.internet;
// let paymentTotal = payment.phone + payment.internet;
// let remainingDue = invoiceTotal - paymentTotal;

// console.log(paymentTotal);         // => 6800
// console.log(remainingDue);         // => 2700

// function createInvoice(services = {}) {
//   return {
//     phone: services.phone || 3000,
//     internet: services.internet || 5500,
//     payments: [],
//     total() {
//       return this.phone + this.internet;
//     },
//     addPayment(payment) {
//       this.payments.push(payment);
//     },
//     addPayments(payments) {
//       let i;
//       for (i = 0; i < payments.length; i += 1) {
//         this.addPaymeent(payments[i]);
//       }
//     },
//     paymentTotal() {
//       let totalPaid = 0;
//       let i;
//       for (i = 0; i < this.payments.length; i += 1) {
//         totalPaid += this.payments[i].total();
//       };

//       return totalPaid;
//     },
//     amountDue() {
//       return this.total() - this.paymentTotal();
//     },
//   };
// }

// function invoiceTotal(invoices) {
//   let total = 0;
//   let i;

//   for (i = 0; i < invoices.length; i += 1) {
//     total += invoices[i].total();
//   }

//   return total;
// }

// let invoices = [];
// invoices.push(createInvoice());
// invoices.push(createInvoice({
//   internet: 6500,
// }));

// invoices.push(createInvoice({
//   phone: 2000,
// }));

// invoices.push(createInvoice({
//   phone: 1000,
//   internet: 4500,
// }));

// console.log(invoiceTotal(invoices));             // => 31000

// 4

// function createPayment(services) {
//   services = services || {};
//   return {
//     phone: services.phone || 0,
//     internet: services.internet || 0,
//     amount: services.amount,
//     total() {
//       return this.amount || (this.phone + this.internet);
//     },
//   };
// }

// function paymentTotal(payments) {
//   let total = 0;
//   let i;

//   for (i = 0; i < payments.length; i += 1) {
//     total += payments[i].total();
//   }

//   return total;
// }

// let payments = [];
// payments.push(createPayment());
// payments.push(createPayment({
//   internet: 6500,
// }));

// payments.push(createPayment({
//   phone: 2000,
// }));

// payments.push(createPayment({
//   phone: 1000,
//   internet: 4500,
// }));

// payments.push(createPayment({
//   amount: 10000,
// }));

// console.log(paymentTotal(payments));      // => 24000


// let invoice = createInvoice({
//   phone: 1200,
//   internet: 4000,
// });

// let payment1 = createPayment({
//   amount: 2000,
// });

// let payment2 = createPayment({
//   phone: 1000,
//   internet: 1200,
// });

// let payment3 = createPayment({
//   phone: 1000,
// });

// invoice.addPayment(payment1);
// invoice.addPayments([payment2, payment3]);
// invoice.amountDue();



// function Lizard() {
//   this.scamper = function() {
//     console.log("I'm scampering!");
//   };

// }

// let lizzy = Lizard();
// // console.log(lizzy.scamper()); // ?

// global.scamper(); // ?



// Prototypes

// let prot = {};

// let foo = Object.create(prot);

// console.log(Object.getPrototypeOf(foo) === prot);

// console.log(prot.isPrototypeOf(foo));

// let prot = {};

// let foo = Object.create(prot);

// prot.isPrototypeOf(foo);
// Object.prototype.isPrototypeOf(foo);


// Prototypal Inheritance Practice

// 1
// function getDefiningObject(object, propKey) {
//   let x;
//   x = Object.getPrototypeOf(object);
//   if (x) {
//     getDefiningObject(x);
//   } else {
//     return x;
//   }
// }

// function getDefiningObject(object, propKey) {
//   while (object && !object.hasOwnProperty(propKey)) {
//     object = Object.getPrototypeOf(object);
//   }

//   return object;
// }

// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// let baz = Object.create(bar);
// let qux = Object.create(baz);

// bar.c = 3;

// console.log(getDefiningObject(qux, 'c') === bar);     // => true
// console.log(getDefiningObject(qux, 'e'));             // => null

// 2
// function shallowCopy(object) {
//   let result = Object.create(Object.getPrototypeOf(object));
//   let prop;

//   for (prop in object) {
//     if (Object.prototype.hasOwnProperty.call(object, prop)) {
//       result[prop] = object[prop];
//     }
//   }

//   return result;
// }

// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// bar.c = 3;
// bar.say = function() {
//   console.log('c is ' + this.c);
// };

// let baz = shallowCopy(bar);
// // console.log(baz.a);       // => 1
// baz.say();                // => c is 3
// baz.hasOwnProperty('a');  // false
// baz.hasOwnProperty('b');  // false


// 3

// function extend(destination, ...args) {
//   for (let i = 0; i < args.length; i++) {
//     let source = args[i];
//     for (let prop in source) {
//       if (Object.prototype.hasOwnProperty.call(source, prop)) {
//         destination[prop] = source[prop];
//       }
//     }
//   }

//   return destination;
// }

// let foo = {
//   a: 0,
//   b: {
//     x: 1,
//     y: 2,
//   },
// };

// let joe = {
//   name: 'Joe'
// };

// let funcs = {
//   sayHello() {
//     console.log('Hello, ' + this.name);
//   },

//   sayGoodBye() {
//     console.log('Goodbye, ' + this.name);
//   },
// };

// let object = extend({}, foo, joe, funcs);

// console.log(object.b.x);          // => 1
// object.sayHello();                // => Hello, Joe


//

// function Dog(name, breed, weight) {
//   // deleted Object.setPrototypeOf(this, Dog.myPrototype);
//   this.name = name;
//   this.breed = breed;
//   this.weight = weight;
// }

// Dog.prototype.bark = function() {
//   console.log(this.weight > 20 ? 'Woof!' : 'Yip!');
// };

// let maxi = new Dog('Maxi', 'German Shepherd', 32);
// // maxi.bark(); // 'Woof!'
// console.log(maxi.constructor)

// let biggie = new Dog('Biggie', 'Whippet', 9);
// // biggie.bark(); // 'Yip!'


// Practice - constructor functions and prototypes

// 1
// let a = 1;
// let foo;
// let obj;

// function Foo() {
//   this.a = 2;
//   this.bar = function() {
//     console.log(this.a);
//   };
//   this.bar();
// }

// Foo.ghost = 'Boo';

// console.log(Foo.ghost);
// foo = new Foo(); // 2
// // console.log(foo);
// foo.bar(); // 2
// Foo(); // 2
// console.log(this.a);
// obj = {};
// console.log(obj);
// Foo.call(obj); // 1
// console.log(obj);
// obj.bar(); // error - no bar property for obj

// console.log(this.a); // 1



// let bar = {
//   a: 1,
//   sayHi() {
//     console.log(this.a);
//   }
// }

// bar.sayHi();
// let baz = {
//   a: 100,
// }

// console.log(baz);
// bar.sayHi.call(baz);
// console.log(baz);



// 2
// let RECTANGLE = {
//   area() {
//     return this.width * this.height;
//   },
//   perimeter() {
//     return 2 * (this.width + this.height);
//   },
// };

// function Rectangle(width, height) {
//   this.width = width;
//   this.height = height;
//   this.area = RECTANGLE.area.call(this);
//   this.perimeter = RECTANGLE.perimeter.call(this);
// }

// let rect1 = new Rectangle(2, 3);
// console.log(rect1.area);
// console.log(rect1.perimeter);


//  3

// function Circle(radius) {
//   this.area = function() {
//     return Math.PI * (radius ** 2);
//   };
// }

// let a = new Circle(3);
// let b = new Circle(4);

// console.log(a.area().toFixed(2)); // => 28.27
// console.log(b.area().toFixed(2)); // => 50.27


// 4
// let ninja;
// function Ninja() {
//   this.swung = true;
// }

// ninja = new Ninja();

// Ninja.prototype.swingSword = function() {
//   return this.swung;
// };

// console.log(ninja.swingSword());

// 5
// let ninja;
// function Ninja() {
//   this.swung = true;
// }

// ninja = new Ninja();

// Ninja.prototype = {
//   swingSword: function() {
//     return this.swung;
//   },
// };

// console.log(ninja.);


// 6
// let ninjaA;
// let ninjaB;
// function Ninja() {
//   this.swung = false;
// }

// ninjaA = new Ninja();
// ninjaB = new Ninja();

// Ninja.prototype.swing = function() {
//   this.swung = true;
//   return this;
// }

// // Add a swing method to the Ninja prototype which
// // returns the calling object and modifies swung

// console.log(ninjaA.swing().swung);      // must log true
// console.log(ninjaB.swing().swung);      // must log true


// 7
// let ninjaA = (function() {
//   function Ninja(){};
//   return new Ninja();
// })();

// // create a ninjaB object
// // console.log(ninjaA);
// // let ninjaB = new ninjaA.constructor;
// let ninjaB = Object.create(Object.getPrototypeOf(ninjaA));

// console.log(ninjaB.constructor === ninjaA.constructor);    // should log true



// Prototypes practice 2
// 1
// let shape = {
//   getType() {
//     return this.type;
//   },
// };

// function Triangle(a, b, c) {
//   this.type = 'triangle';
//   this.a = a;
//   this.b = b;
//   this.c = c;
// }

// Triangle.prototype = shape;
// Triangle.prototype.getPerimeter = function() {
//   return this.a + this.b + this.c;
// };

// Triangle.prototype.constructor = Triangle;

// let t = new Triangle(3, 4, 5);
// t.constructor;                 // Triangle(a, b, c)
// shape.isPrototypeOf(t);        // true
// t.getPerimeter();              // 12
// t.getType();                   // "triangle"

// 2
// function User(first, last) {
//   if (!(this instanceof User)) {
//     return new User(first, last);
//   }
//   this.name = `${first} ${last}`;
// }

// let name = 'Jane Doe';
// let user1 = new User('John', 'Doe');
// let user2 = User('John', 'Doe');

// console.log(name);         // => Jane Doe
// console.log(user1.name);   // => John Doe
// // console.log(user2.name);   // => John Doe


// 3
// function createObject(obj) {
//   function NewObject() {
//   }

//   NewObject.prototype = obj;

//   return new NewObject;
// }

// let foo = {
//   a: 1
// };

// let bar = createObject(foo);
// console.log(foo.isPrototypeOf(bar));         // true

// 4
// let foo = {
//   a: 1,
//   begetObject() {
//     function F() {};
//     F.prototype = this;
//     return new F();
//   },
// };

// let bar = foo.begetObject();
// console.log(foo.isPrototypeOf(bar));         // true


// 5
// function neww(constructor, args) {
//   let obj = Object.create(constructor.prototype);
//   let result = constructor.apply(obj, args);

//   return typeof result === 'object' ? result : obj;
// }

// function Person(firstName, lastName) {
//   this.firstName = firstName;
//   this.lastName = lastName;
// }

// Person.prototype.greeting = function() {
//   console.log('Hello, ' + this.firstName + ' ' + this.lastName);
// };

// let john = neww(Person, ['John', 'Doe']);
// john.greeting();          // => Hello, John Doe
// john.constructor;         // Person(firstName, lastName) {...}



// let Point = {             // capitalized name for the prototype as a convention
//   onXAxis() {             // shared methods defined on the prototype
//     return this.y === 0;
//   },

//   onYAxis() {
//     return this.x === 0;
//   },

//   distanceToOrigin() {
//     return Math.sqrt((this.x * this.x) + (this.y * this.y));
//   },

//   init(x, y) {            // optional init method to set states
//     this.x = x;
//     this.y = y;
//     return this;
//   },
// };

// let pointA = Object.create(Point).init(30, 40);

// console.log(Point.isPrototypeOf(pointA));


// function Point(x = 0, y = 0) {            // capitalized constructor name as a convention
//   this.x = x;                                   // initialize states with arguments
//   this.y = y;                                   // 0 as default value
// };

// Point.prototype.onXAxis = function() {  // shared behaviors added to constructor's prototype property
//   return this.y === 0;
// };

// Point.prototype.onYAxis = function() {  // these methods are added one by one
//   return this.x === 0;
// };

// Point.prototype.distanceToOrigin = function() {
//   return Math.sqrt((this.x * this.x) + (this.y * this.y));
// };

// let pointA = new Point(30, 40);         // use new to create objects
// let pointB = new Point(20);

// console.log(pointA instanceof Point);                // use instanceof to check type
// pointB instanceof Point;

// pointA.distanceToOrigin();              // 50
// pointB.onXAxis();                       // true




//
let obj = {
  name: 'Obj',
};

Object.defineProperties(obj, {
  age: {
    value: 30,
    writable: false,
  },
});

console.log(obj.age); // => 30
obj.age = 32;         // throws an error in strict mode
console.log(obj.age); // => 30



function newPerson(name) {
  return Object.defineProperties({name: name}, {
    log: {
      value() {
        console.log(this.name);
      },
      writable: false
    },
  });
}

let me = newPerson('Shane Riley');
me.log();     // => Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log();     // => Shane Riley


