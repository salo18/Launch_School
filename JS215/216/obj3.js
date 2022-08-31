// https://edabit.com/challenge/JyebLWZjCv5jYhrBW

/*
Take two objects with similar key values and combine them into a new object summing any values that belong to the same category.

There's a married couple, Hank and his spouse Sheila. Hank works at a power plant making $70,000 a year, and Sheila is a teacher making $40,000 a year. They both earn rental income from separate rental properties, Hank will get $12,000 and Sheila $10,000. The new object will show their separate income but combine the rental income because it fits the same category.

const user1 = {
  powerPlant: 70000,
  rental: 12000
}

const user2 = {
  teaching: 40000,
  rental: 10000
}

becomes ➞ {
  powerPlant: 70000,
  teaching: 40000,
  rental: 22000   // The rental income is added together.
}

user1Income (Object) ⁠— an income object for user1
user2Income (Object) ⁠— an income object for user2
returns: A new object with like values combined

They won't have the same number of key-value pairs.
The return object must return the values ordered from lowest to highest so your answers can match the test answers.

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Rules:
- each "user" object has their own sources of income
- if the source of income has the same name, add the values
- return object must have values ordered from highest to lowest

Inputs:
- two objects representing the income of two people
- each object has key value pairs that can be unique or the same name

Output:
- a new object with like values combined

------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------


------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH

// user is an empty object?
const user1 = {}

// user has integer values as strings
const user1 = {
  powerPlant: "70000",
  rental: "12000",
}

// user has non integer values
const user1 = {
  powerPlant: 'string',
  rental: [22, 2333],
}

// user points to an array, string or other data type that is not an object
const user1 = []
const user1 = 'Susan'
const user1 = 22

// user1 is undefined?

// more than two users are passed in.... should I code the solution for multiple objects passed in?

-------------------- Algorithm ---------------------
- declare and initialize a new result object
- create an args array that contains each object
[obj1, obj2]
- iterate over the array of arguments
  - for each object, get an array of keys
  [teaching, rental] /// [powerPlant, rental]
  - check if the key exists in the result object
    - if it does, add the new value to the existing key
    - if not, add the new key value pair to the result
- sort the result object from highest to lowest
  - convert the object to an array (entries)
  - sort this array based on the second element (the numbers)
  - convert this sorted array back into an object and return it
*/
const user1 = {
  powerPlant: 70000,
  rental: 12000
}

const user2 = {
  teaching: 40000,
  rental: 10000
}

const user3 = {
  BJJ: 140000,
  rental: 10000,
  coding: 200000,
}

function combineIncomes(...args) {
  let result = {};
  let keys;
  args.forEach(obj => {
    keys = Object.keys(obj);
    keys.forEach(k => {
      if (result[k]) {
        result[k] += obj[k];
      } else {
        result[k] = obj[k];
      }
    });
  });

  let entries = Object.entries(result).sort((a, b) => a[1] - b[1]);
  return Object.fromEntries(entries);
}

console.log(combineIncomes(user1, user2, user3));

//{
//   powerPlant: 70000,
//   teaching: 40000,
//   rental: 22000   // The rental income is added together.
// }