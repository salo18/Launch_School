// https://edabit.com/challenge/WyEL2YcemhrS4waEE

/*
Create a function that takes an array of students and returns an object representing their notes distribution. Keep in mind that all invalid notes should not be counted in the distribution. Valid notes are: 1, 2, 3, 4, 5

getNotesDistribution([
  {
    "name": "Steve",
    "notes": [5, 5, 3, -1, 6]
  },
  {
    "name": "John",
    "notes": [3, 2, 5, 0, -3]
  }
] ➞ {
  5: 3,
  3: 2,
  2: 1
})

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- an array of objects that represent students

Output:
- an object that contains the number of times each note is present in the student objects

Rules:
- valid notes are 1, 2, 3, 4, 5 => all other numbers are invalid and should not be included in the result object
- the notes are included inside each object as a value of the notes key
- notes are held in an array of integers
- notes that exist should be tallied for one total per note

------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------


------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
getNotesDistribution([
  {
    "name": "Steve",
    "notes": [5, 5, 3, -1, 6]
  },
  {
    "name": "John",
    "notes": [3, 2, 5, 0, -3]
  }
]);

// empty input
getNotesDistribution();

// empty students array
getNotesDistribution([]);

// invalid input types like string or number or object
getNotesDistribution('string', 22, {});

// multiple student arrays passed in?
getNotesDistribution(class1, class2, class3)

// notes key contains invalid values in the array?
- ['5', '5', '3', '-1', '6'] -- numbers represented as strings
- [] - value is empty?
- ['str1', 'str2', [1, 2,], {num: 1}] - value contains strings, arrays, objects?
- notes key not given?
- [5, 5, '-1': '2'] - array properties in the array?
- [5, 5, <1 empty line>] - how should empty lines be treated?

// notes key not included in a student object
getNotesDistribution([
  {
    "name": "Steve",
    "notes": [5, 5, 3, -1, 6]
  },
  {
    "name": "John",
    "notes": [3, 2, 5, 0, -3]
  },
  {
    "name": "Susan",
  }
]);

// none of the student objects have a notes key?
getNotesDistribution([
  {
    "name": "Steve",
  },
  {
    "name": "John",
  },
  {
    "name": "Susan",
  }
]);

-------------------- Algorithm ---------------------
- declare a constant [1, 2, 3, 4, 5]
- declare and initialize a results object
- iterate over the input array
  - access each object's notes value
  - iterate over this array
    - if array element is included in the VALID constant, add to results object
      - if the number is already included in the results object, increment by 1
      - if not, set the note to 1
- return the result object
---------------------- Notes -----------------------
*/
let students = [
  {
    "name": "Steve",
    "notes": [5, 5, 3, -1, 6]
  },
  {
    "name": "John",
    "notes": [3, 2, 5, 0, -3]
  },
  {
    "name": "Susie",
  }
];

function getNotesDistribution(array) {
  const VALID = [1, 2, 3, 4, 5];

  let result = {};

  array.forEach(obj => {
    if (obj.notes) {
      obj.notes.forEach(num => {
        if (VALID.includes(num)) {
          if (result[num]) {
            result[num] += 1;
          } else {
            result[num] = 1;
          }
        }
      });
    }
  });
  return result;
}

getNotesDistribution(students);
// {
//   5: 3,
//   3: 2,
//   2: 1
// }
