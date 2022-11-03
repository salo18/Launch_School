
/*//////////////////////// OOP ///////////////////////////////////
     Object creation patterns   |        Prototypal pattern

Factory function pattern
Constructor pattern
OLOO
class based pattern
pseudo-classical pattern




NOTE - closures vs variable scope


// Prototypal pattern: any object created in Javacript has a father/prototype

// Object creation patterns:
1. {}   => prototype link is implicit     Object.prototype
let obj = {}

obj.__proto__  === Object.prototype // true
Object.getPrototypeOf(obj) === Object.prototype // true


2. function employeeFactory(name, age, title) {
  // const obj = Object.create(employeeFactory.prototype);
  return {
    name,
    age,
    title,
    speak: function() {},
    sayHi: function() {},
  }
}

let bob = employeeFactory('bob', 45, 'Janitor');

p(bob.__proto__ === Object.prototype) // true

Disadvantage of Factory Functions:
- each object will get its own copy of the methods, each copy will take up its own memmory allocation in the heap which is memory inefficient
- don't know the type of object created by the Factory function... don't have a type, just a regular object literal

3. function Employee(name, title, age) {
  this.name = name;
  this.title = title;
  this.age = age;
  function sayHi() {
  }

}

let juan = new Employee('Juan', 'tacos', 28);
-- invoking constructor function with "new"
  1. creates a simple regular object {}
  2. it sets it to the `this` keyword
  3. it sets the prototype of this to Employee.prototype
  4. implicitly return `this`


4.

5.


*/

// function p(arg) {
//   console.log(arg);
// }

// let obj = {};
// p(obj.__proto__  === Object.prototype); // true
// p(Object.getPrototypeOf(obj) === Object.prototype); // true
// p('bob'.__proto__ === String.prototype);













let bar = {};
let baz = Object.create(bar);
let foo = Object.create(baz);

console.log(baz.isPrototypeOf(foo));             // true
console.log(Object.getPrototypeOf(bar)); // false



// function Animal(species) {
//   this.species = species;

// }

// let lion = new Animal('Panthera leo');
// console.log(Object.prototype.constructor === lion.constructor);

// function Sa(name) {
//   this.name = name;
//   this.speak = function() {
//     console.log(`${this.name} says hi`);
//   };
// }

// let foo = new Sa('foo');

// console.log(Object.getOwnPropertyNames());



{
  "entry": "super",
  "request": "super",
  "response": "super",
  "assoc_word": [
    "excellent",
    "highly",
    "perfect"
  ],
  "assoc_word_ex": [
    "excellent",
    "highly",
    "perfect",
    "very",
    "awesome"
  ],
  "version": "7.0.7",
  "author": "twinword inc.",
  "email": "help@twinword.com",
  "result_code": "200",
  "result_msg": "Success"
}