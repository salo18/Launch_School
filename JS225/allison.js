/*
  constructor
  OLOO
  Pseudoclassical
  Class syntax
  factory functions
*/

// CONSTRUCTOR PATTERN
function Person(name, age) {
  this.name = name;
  this.age = age;
}

Person.prototype.sayHi = function() {
  console.log(`${this.name} says hi`);
}

let bob = new Person('Bob', 20); // a new instance of the Person constructor function
// bob is an object (that can be classified as an instance) whose [[Prototype]] is assigned to the object stored at `Person.prototype`.

function Teenager(name, age, hobby) {
  Person.call(this, name, age);
  this.hobby = hobby; // creating a hobby property on the object bound at this and assigning its value to the hobby parameter/local variable
}

let tina = new Teenager('Tina', 18, 'writing');
// console.log(Teenager.prototype);
// Teenager.prototype = Person.prototype;
Teenager.prototype = Object.create(Person.prototype); // establishing the prototypal chain
Teenager.prototype.constructor = Teenager;
// because we reassigned Teenager's prototype, need to give the prototype a constructor that points back to the constructor Function.

Teenager.prototype.doHobby = function() {
  console.log(`${this.name} is ${this.hobby}`);
}

console.log(Object.getOwnPropertyNames(Person.prototype));
console.log(Object.getOwnPropertyNames(Teenager.prototype));
// console.log(Teenager instanceof Person);


// console.log(bob);
// console.log(bob.__proto__ === Person.prototype); // [[Prototype]]
// console.log(Person.prototype.constructor === Person);

// let sam = {
//   hello() {
//     console.log('hi');
//   }
// }
//

// OLOO
// Object literal masquerading as a constructor/class
// allObjectLiterals --> Object.prototype --> null
// const personPrototype = {
//   init(name, age) {
//     this.name = name;
//     this.age = age;
//     // return this; // need to give an explicit return value
//   },

//   sayHello() { console.log(`Hello ${this.name}`) },
// };

// let jake = Object.create(personPrototype)//.init("Jake", 30);
// jake.init("Jake", 30);
// console.log(jake); //
// console.log(jake.prototype); // undefined --- jake is only an object and not a function so does not have prototype property
// console.log(jake.__proto__); //
// console.log(personPrototype); // contains all the properties that Jake has access to
// console.log(personPrototype.prototype) // undefined
// console.log(personPrototype.__proto__) // undefined

// let sally = Object.create(sam);
// console.log(sally)




/*
  - All JS objects have an internal [[Prototype]] property that is not accessible to the programmer - but is used by the engine to determine object property inheritance.
  - All functions are objects, so all functions also have a [[Prototype]].
  - Additionally, ECMAScript defines a `prototype` property that is accessible to the programmer for all function objects. This `prototype` property is only used by the engine when the function is invoked with `new`.
    - The `prototype` property is an object that is given a single property on default by the engine, which is the `constructor` property. The `constructor` property is assigned to the function object that it was created from.

  -
*/

/*
  - JS object properties have additional configurations that can be attached to them. They are called property attributes. Enumerability is like a visibility setting for some methods and iterations.
*/

// console.log(Object.getOwnPropertyNames(Person));
// console.log(Object.getOwnPropertyNames(Person.prototype));
// console.log(Object.keys(Person));
// console.log(Object.keys(Person.prototype));




// CLASS
class Engineer {
  constructor() {

  }
}
