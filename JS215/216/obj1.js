// https://edabit.com/challenge/NcRsSwrJbMm4dRbCk

/*
You volunteered to help out teaching a preschool in your area! You were given an array of all students and some important data about them, grouped by their teacher. Create a function that will ungroup every student so you can look at their details individually.

ungroupStudents([{
  teacher: "Ms. Car",
  data: [{
     name: "James",
     emergenceNumber: "617-771-1082",
  }, {
     name: "Alice",
     alergies: ["nuts", "carrots"],
  }],
}, {
  teacher: "Mr. Lamb",
  data: [{
    name: "Aaron",
    age: 3
  }]
}]) ➞ [{
  teacher: "Ms. Car",
  name: "James",
  emergencyNumber: "617-771-1082",
}, {
  teacher: "Ms. Car",
  name: "Alice",
  alergies: ["nuts", "carrots"],
}, {
  teacher: "Mr. Lamb",
  name: "Aaron",
  age: 3,
}]
--------------------------PROBLEM-------------------
- need to "ungroup" the students so that there is an object for each student instead of for each teacher
------------ **Explicit Requirements** -------------
Rules:

Inputs:
- an array of objects
  - each object represents a teacher
  - inside each object is a data key with a value of an array of objects that represent each student

Output:
- an array of objects, each object representing an individual student

------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------
- does this need to mutate the caller or should I return a new object?

------------ Examples/Test Cases/Edge Cases ------------
ungroupStudents([{
  teacher: "Ms. Car",
  data: [{
     name: "James",
     emergenceNumber: "617-771-1082",
  }, {
     name: "Alice",
     alergies: ["nuts", "carrots"],
  }],
}, {
  teacher: "Mr. Lamb",
  data: [{
    name: "Aaron",
    age: 3
  }]
}])

what about a teacher without students?
ungroupStudents([{
  teacher: "Ms. Car",
  data: [],
}, {
  teacher: "Mr. Lamb",
  data: [{
    name: "Aaron",
    age: 3
  }]
}])

what about empty input?
ungroupStudents([])

------------------ Data Structure ------------------


-------------------- Algorithm ---------------------
- create a new result array
- iterate over each teacher object
  - for each student, push the information in the data array into its own object in the result array
  - add the teacher name to that object
---------------------- Notes -----------------------
*/
function ungroupStudents(arr) {
  let result = [];

  let teacherName;
  let keys;

  let student;
  for (let i = 0; i < arr.length; i += 1) {
    teacherName = arr[i].teacher;
    for (let j = 0; j < arr[i].data.length; j += 1) {
      keys = Object.keys(arr[i].data[j]);

      student = [
        ['teacher', teacherName],
      ];

      keys = Object.keys(arr[i].data[j]);
      keys.forEach(k => {
        student.push([k, arr[i].data[j][k]])
      });

      result.push(Object.fromEntries(student));
    }
  }
  return result;
}

console.log(ungroupStudents([{
  teacher: "Ms. Car",
  data: [{
     name: "James",
     emergenceNumber: "617-771-1082",
  }, {
     name: "Alice",
     alergies: ["nuts", "carrots"],
  }],
}, {
  teacher: "Mr. Lamb",
  data: [{
    name: "Aaron",
    age: 3
  }]
}]));
// [{
//   teacher: "Ms. Car",
//   name: "James",
//   emergencyNumber: "617-771-1082",
// }, {
//   teacher: "Ms. Car",
//   name: "Alice",
//   alergies: ["nuts", "carrots"],
// }, {
//   teacher: "Mr. Lamb",
//   name: "Aaron",
//   age: 3,
// }]