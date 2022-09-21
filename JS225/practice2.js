// 1
// let message = 'Hello from the global scope!';

// function func(message) {
//   message = 'Hello from the function scope!';
//   console.log(message);
// }

// func(message);
// console.log(message); // global scope

// 2
// let myObj = { message: 'Greetings from the global scope!' };

// function func(obj) {
//   obj.message = 'Greetings from the function scope!';
//   console.log(obj.message);
// }

// func(myObj);

// console.log(myObj.message); // the property is reassigned == greetings from function scope

// 3
// let message = 'Hello from the global scope!';

// function func() {
//   message = 'Hello from the function scope!';
//   console.log(message);
// }

// func();
// console.log(message); // hello from function scope
// // message is declared in the global scope and is accessible within the func function declaration

// 4
// let a = 10;
// let obj = {
//   a
// }

// let newObj = obj;
// newObj.a += 10;

// console.log(obj.a === a); // false
// console.log(newObj.a === obj.a); // true

// 5
let animal = {
  name: 'Pumbaa',
  species: 'Phacochoerus africanus',
};

let menagerie = {
  warthog: animal,
};

console.log(menagerie);
animal = {
  name: 'Timon',
  species: 'Suricata suricatta',
};

menagerie.meerkat = animal;
console.log(menagerie);
menagerie.warthog === animal; // false
menagerie.meerkat === animal; // true