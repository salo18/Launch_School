
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