// // https://edabit.com/challenge/JyebLWZjCv5jYhrBW
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

Arguments
user1Income (Object) ⁠— an income object for user1
user2Income (Object) ⁠— an income object for user2
returns: A new object with like values combined
Challenges
They won't have the same number of key-value pairs.
The return object must return the values ordered from lowest to highest so your answers can match the test answers.

P
 Input
 output

 - Understanding the problem:
  - Explicit requirements:
  - Implcit requirements:
  - Questions

Examples and test cases

Data Structures

Algorithm



PEDAC:
- input - two user objects
- output - a result object that adds like categories of income
- problem
  - two users have separate income streams >>> want to find income for the whole family
  - combine income if same category

algorith:
- create a new result object
- pass in each user to a function
- function iterates through each user
  - if the key exists, add the value to the existing key
  - if the key does not exist, add the key and value
- return the result object

*/

// const user1 = {
//   powerPlant: 70000,
//   rental: 12000
// }

// const user2 = {
//   teaching: 40000,
//   rental: 10000
// }

function addIncomes(...args) {
  let result = {};

  args.forEach(user => {
    Object.entries(user).forEach(u => {
      if (Object.keys(result).includes(u[0])) {
        result[`${u[0]}`] += u[1];
      } else {
        result[`${u[0]}`] = u[1];
      }
    });
  });

  return sortResult(result);
}

function sortResult(result) {
  let arr = Object.entries(result);
  arr.sort((arr1, arr2) => arr2[1] - arr1[1]);
  return Object.fromEntries(arr);
}

// console.log(addIncomes(user1, user2));


const test1User1Income = {
  softwareDeveloping: 70000,
  rental: 10000,
};

const test1User2Income = {
  teaching: 40000,
  rental: 12000,
};
// => return value
// const test1Answer = {
//   rental: 22000,
//   teaching: 40000,
//   softwareDeveloping: 70000,
// };

// console.log(addIncomes(test1User1Income, test1User2Income));

const test2User1Income = {
  softwareDeveloping: 70000,
  pizzaDeliverying: 6000,
  rental: 10000,
};

const test2User2Income = {
  teaching: 40000,
  rental: 12000,
};
// Return value
// const test2Answer = {
//   pizzaDeliverying: 6000,
//   rental: 22000,
//   teaching: 40000,
//   softwareDeveloping: 70000,
// };

// console.log(addIncomes(test2User1Income, test2User2Income));


const test3User1Income = {
  softwareDeveloping: 70000,
  pizzaDeliverying: 6000,
  sellingGarlic: 6000,
  rental: 10000,
};

const test3User2Income = {
  rental: 12000,
  sellingGarlic: 32000,
};

// Return Value
// const test3Answer = {
//   pizzaDeliverying: 6000,
//   rental: 22000,
//   sellingGarlic: 38000,
//   softwareDeveloping: 70000,
// };

// console.log(addIncomes(test3User1Income, test3User2Income));


// What if there's no 1st or 2nd object argument?
console.log(addIncomes(user1))

// what if there's one or 2 empty objects?
console.log(addIncomes({}, {}))

// What if one or more properties in either object arguments are not numbers?
console.log(addIncomes({a: 'Bob'}))
