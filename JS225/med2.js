function Employee(name, age) {
  this.name = name;
  this.age = age;
}

// move methods off the constructor function and into the constructor function's prototype to save memory... otherwise each instance would get its own copy of the method.
Employee.prototype.sayHi = function() {
  console.log(`${this.name} says hi`);
}

Employee.prototype.ethnicity = 'Arayn';

let bob = new Employee('Bob', 80);

console.log(bob);
// console.log(Employee.prototype === bob.__proto__)
// bob.sayHi();

// console.log(bob.ethnicity);


// Employee is a constructor function
// a prototype object is automatically created with the new keyword.
// console.log(Employee.prototype);
// the prototype object assigned to the prototype property of the constructor function has a consturctor property that points back to the constructor function
console.log(Employee.prototype.constructor === Employee)
// instances inherit methods and properties from the Employee.prototype
// instances have their own prototype property [[Prototype]] that references the constructor function's prototype object
// There's only 2 ways to access the prototype property of a constructor function's instance:
  // * instance.__proto__  === Employee.prototype
  // * Object.getPrototypeOf(instance) === Employee.prototype
// console.log(Object.getOwnPropertyNames(Object.prototype))

bob.__proto__.hello = function() {
  console.log('hi');
}

console.log(bob.__proto__);
bob.hello();


// -----------------
// how to establish prototypal link using constuctor pattern --- NOT RECOMMENDED
function Human() {}

// Object.setPrototypeOf(Employee.prototype, Human.prototype);

// How to establish prototypal relationship with the constructor pattern
Employee.prototype = Object.create(Human.prototype);
// need to pass in Human.prototype because the prototypal chain is established on the prototype objects and not the constructor functions
Employee.prototype = {} // this is its prototype => Human.prototype // is an empty object and need to thus manually assign the constructor to the prototype object's constructor function
Employee.prototype.constructor = Employee;
// need to set the constructor property to the constructor function on which the prototype object is defined so that all instances of the constructor function can reference its type (steve is an Employee, not a Human).

const steve = new Employee('Steve', 25);

console.log(steve.constructor === Employee);
console.log(steve.constructor === Human);
console.log(steve instanceof Employee); // true

///////////////////////////// OOP //////////////////////////////
// a bunch of object creation patterns || the prototypal pattern
// const prototyplessObject = Object.create(null);

// 5 patterns

// 1)

// Constructor pattern
// 1. creates new object
// 2. sets `this` to object created (when you set properties, you set them on the object referenced by this and not the global object -- only if the constructor is called with the `new` keyword)
// 3. sets the new object's prototype to `ConstructorName.prototype`
  // instance.__proto__ === ConstructorName.prototype
// 4. returns the object referenced by `this`, unless you explicitly return another object using `return`. If anything other than an object is explicitly returned, it is ignored and the object referenced by `this` is returned instead.

// function Alien(obj, age, name) {
//   this.name = name;
//   this.age = age;

//   return 'Salo'; // string would be ignored
// }

// const ET = new Alien({name: 'ET', age: 20}, 'Bob', 50);

// console.log(ET);
////////////////////////////////
function Alien(obj, age, name) {
  if (!(this instanceof Alien)) {
    return new Alien(obj, age, name)
  } /// if `this` is not an instance of Alien, return a new instance of Alien

  this.name = name;
  this.age = age;

  return 'Salo'; // string would be ignored and object returned
}

const alienator = Alien({name: 'bob', age: 50}, 20, 'alientator');
// if called with `new`, `this` is Alien
// if not called with `new`, this is the global object
console.log(alienator);

// 2)
// FACTORY FUNCTION
function boats(name, style) {
  return {
    name,
    style,
  }
}

let boaty = boats('boaty', 'skipper');
console.log(boaty);
// 2 disadvantages
//  - can't determine the type
//  - each instance has its own copy of the exact same method -- not memory efficient

// 3)
class Food {
// addding a # to static or instance method or property and it becomes private
  appleVinegar = 'vineagr'; // instance property can also be defined outside the constructor property

  static static_property = 'Indian'; // static property

  constructor(liquid, powder) {
    this.liquid = liquid;
    this.powder = powder;
  }

  // instance method -- any properties defined inside are instance properties
  ingredients() {
    console.log(`${this.liquid} mixed with ${this.powder}`);
    this.oliveOil = 'oil';
  }

  static tools() {
    console.log('I am a static method')
  }
}
// a class is just a function
console.log(typeof Food) // 'function'
// every instance method you define within the class is defined on `className.prototype`

function p(arg) {
  console.log(arg);
}

p(Food.static_property); // Indian
p(Food.prototype.ingredients);
Food.tools()
///

// function Food() {
//   this.prop1 = 'value1'
//   this.prop2 = 'value2';
// }

// the prototype of instances created from classes is `className.prototype`

let bread = new Food('water', 'cocaine');

console.log(bread.__proto__ === Food.prototype) // true

//////////////////
class Mexican extends Food {
  liquid = 'tequila';
  powder = 'fentanyl';
}
// The prototypal link when you use `extends` is similar to:
Object.setPrototypeOf(Mexican.prototype, Food.prototype)

// let bread = new Food('water', 'cocaine');
let mex = new Mexican;
mex.ingredients();

// 4) OLOO

// 5) Pseudo Classical

function array() {
  let arr = [];
  return function(arg) {
    arr.push(arg);
    return arr;
  }
}


let a = array();
console.log(a(1));

// CLOSURE IS FORMED BY THE ANONYMOUS INNER FUNCTION RETURNED BY array()

// console.log(arr); // error

// with class pattern, we establish two prototypal chains:
 // -- chain for classes (Food is prototype of Mexican):
    // Mexican => Food => Function.prototype => Object.prototype
 // -- chain for instances:
    //(mex => Mexican.prototype => Food.prototype => Object.prototype)
p(Food.__proto__ === Function.prototype)
p(Mexican.__proto__ === Food)
p(Mexican.__proto__.__proto__ === Function.prototype)
p(Mexican.__proto__.__proto__.__proto__ === Object.prototype)

// With constructor pattern, we only create prototypal chain on the instances, not the functions themselves (constructors)
// Employee.prototype => Human.prototype => Object.prototype
p(Human.__proto__ === Function.prototype);
p(Employee.__proto__ === Function.prototype);

// constructor pattern, chain for constructor functions:
// constructorName (Human) => Function.prototype => Object.prototype