/*
# Question 1
Examine the code below. What structure does `{...}` define? Explain with reference to this structure why line 9, `console.log(a)`, outputs `5` but line 10, `console.log(b)`, throws a `ReferenceError` exception. What underlying principle about the structure does this demonstrate?

```js
let a = 10

{
  a = 5;
  let b = 15;
}

console.log(a);  // 5
console.log(b);  // Uncaught ReferenceError: b is not defined
```

# Question 2
Explain why the following code outputs `Xyzzy` with precise language. What is the underlying concept?

```js
let a = 'Xyzzy';

function myValue(b) {
  b[2] = '-';
}

myValue(a);
console.log(a);
```

# Question 3
Explain why the line `console.log(sentence)` outputs `hello world` rather than `HELLO WORLD`. What does this demonstrate about what happens on line 2?

```js
function shout(string) {
  return string.toUpperCase();
}

let sentence = 'hello world';
shout(sentence);
console.log(sentence);         // hello world
```

# Question 4
What happens when you run the following code? Why?

```js
const NAME = 'Shali';
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);

NAME = 'Moro';
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);
```

# Question 5
Take a look at this code snippet:

```js
let foo = 'bar';
{
  let foo = 'qux';
}

console.log(foo);
```

What does this program log to the console? Why?

# Question 6
Will this program produce an error when run? Why or why not?

```js
const FOO = 'bar';
{
  const FOO = 'qux';
}

console.log(FOO);
```

# Question 7
What does this code log to the console? Does executing the `foo` function affect the output? Why or why not?

```js
let bar = 1;
function foo() {
  let bar = 2;
}

foo();
console.log(bar);
```

# Question 8
What does this code log to the console? Does executing the `foo` function affect the output? Why or why not?

```js
let bar = 1;
function foo() {
  bar = 2;
}

foo();
console.log(bar);
```

# Question 9
What does this code log to the console and why?

```js
if (true) {
  var grade = 3;
  console.log(grade);
}

function test() {
  var grade = 4;
  console.log(grade);
}

test();

function review() {
  console.log(grade);
}

review();
```

# Question 10
What is the output and why?

```js
function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

if (true) {
  console.log(bike);
}

ride();
```

# Question 11
What is the output and why?

```js
function ride() {
  bike = 'Schwinn';
  console.log(bike);
}

ride();

if (true) {
  console.log(bike);
}
```

# Question 12
[Launch School Reference](https://launchschool.com/exercises/a5a1b87c)

What sequence of numbers will be logged to the console and why? Explain with precise language.

```js
for (let i = 0; i <= 10; i += 2) {
  console.log(i);
}
```

# Question 13
[Launch School Reference](https://launchschool.com/exercises/5bd541dc)

The following code results in an infinite loop. Explain why and then explain what can be done to solve this.

```js
for (let i = 0; ; i += 1) {
  console.log("and on");
}
```

# Question 14
[Launch School Reference](https://launchschool.com/exercises/76b7ea3d)

What is the difference between the following two code snippets? Explain each code snippet in detail.

```js
let counter = 0;

while (counter > 0) {
  console.log('Woooot!');
  counter -= 1;
}
```

```js
let counter = 0;

do {
  console.log('Woooot!');
  counter -= 1;
} while (counter > 0);
```

# Question 15
[Launch School Reference](https://launchschool.com/exercises/2f3dd3ae)

Take a look at the code below. Without running it, determine what it will log to the console.

```js
let animal = 'horse';

switch (animal) {
  case 'duck':
    console.log('quack');
  case 'squirrel':
    console.log('nook nook');
  case 'horse':
    console.log('neigh');
  case 'bird':
    console.log('tweet tweet');
  default:
    console.log('*cricket*');
}
```

# Question 16
[Launch School Reference](https://launchschool.com/exercises/f83e8ac3)

What does this code output and why?

```js
if (false || true) {
  console.log('Yes!');
} else {
  console.log('No...');
}
```

# Question 17
[Launch School Reference](https://launchschool.com/exercises/f1dfe3f6)

What does this code output and why?

```js
let sale = true;
let admissionPrice = !sale ? 5.25 : 3.99;

console.log('$' + admissionPrice);
```

# Question 18
[Launch School Reference](https://launchschool.com/exercises/58aab02e)

What is the output and why?

```js
function multiplesOfThree() {
  let divisor = 1;

  for (let dividend = 3; dividend <= 30; dividend += 3) {
    console.log(dividend + ' / ' + divisor + ' = 3');
    divisor += 1;
  }
}

multiplesOfThree;
```

# Question 19
[Launch School Reference](https://launchschool.com/exercises/e710c517)

What is the output and why?

```js
console.log(greeting);

var greeting = 'Hello world!';
```

# Question 20
[Launch School Reference](https://launchschool.com/exercises/aba8a530)

What is the output and why?

```js
console.log(greeting);

let greeting = 'Hello world!';
```

# Question 21
[Launch School Reference](https://launchschool.com/exercises/85bba3f0)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
if (true) {
  let myValue = 20;
}

console.log(myValue);
```

# Question 22
[Launch School Reference](https://launchschool.com/exercises/4c097ca6)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
  }
}

myFunction();
```

# Question 23
[Launch School Reference](https://launchschool.com/exercises/8bd04112)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
function myFunction() {
  let a = 1;

  if (true) {
    console.log(a);
    let a = 2;
    console.log(a);
  }
}

myFunction();
```

# Question 24
[Launch School Reference](https://launchschool.com/exercises/2c7c0c0f)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
let a = 5;
let b = false;

if (a > 4) {
  let b = true;
}

console.log(b);
```

# Question 25
[Launch School Reference](https://launchschool.com/exercises/dbcd15de)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
let a = 1;

function myFunction() {
  console.log(a);
}

myFunction();
```

# Question 26
[Launch School Reference](https://launchschool.com/exercises/36d6b9d0)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
let a = 1;

function myFunction(a) {
  console.log(a);
}

let b = 2;

myFunction(b);
```

# Question 27
[Launch School Reference](https://launchschool.com/exercises/73c36214)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
const a = 1;

function myFunction() {
  a = 2;
}

myFunction(a);
```

# Question 28
[Launch School Reference](https://launchschool.com/exercises/84f23c76)

What will the following code log to the console and why? Don't run it until you have tried to answer.

```js
const a = {
  firstName: 'John',
  lastName: 'Doe'
};

function myFunction() {
  a.firstName = 'Jane';
}

myFunction();

console.log(a);
```

# Question 29
[Launch School Reference](https://launchschool.com/exercises/0b4ede66)

What is the output of both code snippets and why? Explain any differences.

```js
let ocean = {};
let prefix = 'Indian';

ocean.prefix = 'Pacific';

console.log(ocean); // ?
```

```js
let ocean = {};
let prefix = 'Indian';

ocean[prefix] = 'Pacific';

console.log(ocean); // ?
```

# Question 30
[Launch School Reference](https://launchschool.com/exercises/516713a8)

We are experimenting with some code to get more comfortable working with objects. Run the snippet below and explain why "It's true!" is never output.

```js
let obj = {
  num: 42,
  'property name': 'string value',
  true: false,
  fun: function() {
    console.log('Harr Harr!');
  },
};

for (let prop in obj) {
  if (prop === true) {
    console.log("It's true!");
  }
}
```

# Question 31
When run, the code below outputs the Strings `a`, `b`, `c`, `d`, `e` and `f` in sequence. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the two calls to `#forEach`.

```js
let myArr = [["a", "b"], ["c", "d"], ["e", "f"]];

myArr.forEach(function (arr) {
  arr.forEach(function (letter) {
    console.log(letter);
  });
});
```

# Question 32
When run, the code below outputs this array `["FORD", "CHRYSLER", "TOYOTA"]`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `map`.

```js
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.map(function (car) {
  return car.toUpperCase();
});

console.log(myCars);  // [ "FORD", "CHRYSLER", "TOYOTA" ]
```

# Question 33
When run, the code below outputs this array `["Ford", "Toyota"]`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `filter`.

```
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.filter(function (car) {
  return car.includes('o');
});

console.log(myCars);  // [ "Ford", "Toyota" ]
```

# Question 34
When run, the code below outputs `Ford`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `find`.

```js
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.find(function (car) {
  return car.includes('o');
});

console.log(myCars);  // Ford
```

# Question 35
When run, the code below outputs `FordChryslerToyota`. Provide a precise breakdown of the code to explain why this happens, paying particular attention to the call to `reduce`.

```js
let cars = [ 'Ford', 'Chrysler', 'Toyota' ];

let myCars = cars.reduce(function (prev, cur) {
  return prev + cur;
});

console.log(myCars);  // FordChyrlserTotyota
```

# Question 36
[Launch School Book Reference](https://launchschool.com/books/javascript/read/arrays#iterationmethods)

What is the output and why?

```js
let array = ['a', 'b', 'c', 'd', 'e', 'f'];
array.splice(3, 2);
console.log(array);
```
*/