

// // function Employee(name, age) {
// //   this.name = name;
// //   this.age = age;
// // }

// // Employee.prototype.intro = function() {
// //   console.log(`${this.name} is ${this.age} years old`);
// // };

// // let bob = new Employee('Bob', 20);
// // bob.intro();

// // let jeff = new bob.constructor('Jeff', 35);
// // console.log(jeff);

// // let jeff2 = new Employee.prototype.constructor('Jeff', 35);
// // console.log(jeff2);

// // Employee.prototype // prototype object that is a property of the constructor function

// //Employee.prototype.constructor // constructor property defined automatically in the constructor function's prototype

// // [[Prototype]] // hidden / internal prototype property of the instance that is a pointer to the constructor function's prototype object


// // Employee.prototype = Object.create(Person.prototype);
// // creates empty object whose hidden prototype property that inherits from


// //  console.log(Employee.prototype.constructor)// [Function: Person]
// //reassigning prototype to new object -- destroying native prototype object of employee -- replacing with object that points to Person.prototype
// // employee.prototype inherits from Person.prototype
// // this ensures that the methods get inherited






// // HUNTER


// // FACTORY FUNCTION
// // function createEmployee(name, age) {
// //   return {
// //     name,
// //     age,
// //     intro() {
// //       console.log(this.name, this.age);
// //     }
// //   }
// // }

// // let pearl = createEmployee('pearl', 80);
// // console.log(pearl);

// // CONSTRUCTOR PATTERN
// function Employee(name, age) {
//   this.name = name;
//   this.age = age;
//   // this.intro = function() {
//   //   console.log(this.name, this.age);
//   // }
//   // return this; // global object
// };

// let pearl = Employee('young pearl', 24); // properties are defined on the global object
// console.log(pearl); // undefined

// // let Employee = function(name, age) {
// //   this.name = name;
// //   this.age = age;

// // }

// // Employee.prototype.intro = function() {
// //     console.log(this.name, this.age);
// // }

// // let x = new Employee('Elon', 51);
// // console.log(x.constructor);
// // console.log(Employee.constructor);
// // console.log(Object.getPrototypeOf(x));
// // console.log(Employee.prototype.hasOwnProperty('intro'));
// // // console.log(Object.getPrototype(x).intro);
// // console.log( x instanceof Employee);

// // Employee --- constructor function
// // contains a Prototype property that is itself an object
// // prototype property contains a constructor property
// // constructor property and prototype property are automatically created when an instance is created

// // a new instance of Employee contains an inner/hidden prototype property (NOT OBJECT) that references Employee.prototype [[Prototype]]
// // constructor property on the instance points to constructor function (who is my mama)

// // OLOO

// // let Dog = {
// //   init(name, age, style) {
// //     this.name = name;
// //     this.age = age;
// //     this.style = style;
// //     return this;
// //   },

// //   bark() {
// //     console.log('rufff');
// //   }
// // }

// // let ollie = Object.create(Dog).init('oliver', 8, 'spicy');
// // // getting a blank object that inherits from Dog
// // console.log(ollie);

// // class
// // class Dog {
// //   constructor(name, age, style) {
// //     this.name = name;
// //     this.age = age;
// //     this.style = style;
// //   }

// //   bark() {
// //     console.log('Ruff');
// //   }
// // }

// // let y = new Dog('lucy', 17, 'white');
// // console.log(y);

// // class Poodle extends Dog {
// //   constructor(name, age, style, hair) {
// //     super(name, age, style);
// //     this.hair = hair;
// //   }

// //   bark() {
// //     console.log('poodle ruff');
// //   }
// // }

// // let poodle = new Poodle('lucypoodle', 17, 'black', 'curly');
// // console.log(poodle);
// // poodle.bark();



// // CLOSURES / Private Data

// function arrays() {
//   let arr = []; // arr is only accessible in the block defined by the function
//   return function hashies() {
//     arr.push(1);
//     return arr;
//   }
// }
// // console.log(arr); // error -- arr is not defined
// let y = arrays();
// console.log(y())
// // this demonstrates the concept of closures. arr is not accessible outside the arrays function but y has access to the variable. this is because a closure is defined at the time of method definition (not invocation), meaning that y has access to arr and can return arr even though arr is not in scope
// // arr.push('malicious code');

// function Person(name, age) {
//   this.name = name;
//   this.age = age;

//   function sayHi() {
//     console.log('hi');
//   };
// }

// let peep = new Person('peep', 100);
// // console.log(Person.prototype.constructor)
// // console.log(peep.__proto__ === Person.prototype)
// // console.log(Object.getPrototypeOf(peep) === Person.prototype)

// console.log(peep.constructor)






// function Person(name, age) {
//   this.name = name;
//   this.age = age;
// }

// Person.prototype.sayHi = function() {
//   console.log(`${this.name} says hi`);
// }

// function Teenager(name, age, hobby) {
//   Person.call(this, name, age);
//   this.hobby = hobby;
// }

// let tina = new Teenager('Tina', 18, 'writing');
// // console.log(Teenager.prototype);
// // Teenager.prototype = Person.prototype;
// Teenager.prototype = Object.create(Person.prototype); // establishing the prototypal chain
// Teenager.prototype.constructor = Teenager;
// // because we reassigned Teenager's prototype, need to give the prototype a constructor that points back to the constructor Function.

// // Teenager.prototype.doHobby = function() {
// //   console.log(`${this.name} is ${this.hobby}`);
// // }

// console.log(Object.getOwnPropertyNames(Person.prototype));
// console.log(Object.getOwnPropertyNames(Teenager.prototype));
// // console.log(Teenager instanceof Person);


// function Animal(name) {
//   // some statements
// }

// Animal.prototype = {
//   speak() {
//     // some statements
//   },
// };

// function Dog() {}
// Dog.prototype = Object.create(Animal.prototype);

// let doggy = new Dog();

// // console.log(Dog.prototype === Animal.prototype);
// console.log(Object.getPrototypeOf(doggy) === Dog.prototype);
// // console.log(doggy instanceof Animal)

