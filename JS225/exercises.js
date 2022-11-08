// OBJECTS
// 1

// function createGreeter(name) {
//   return {
//     name,
//     morning: 'Good Morning',
//     afternoon: 'Good Afternoon',
//     evening: 'Good Evening',
//     greet(timeOfDay) {
//       let msg = '';
//       switch (timeOfDay) {
//         case 'morning':
//           msg += `${this.morning} ${this.name}`;
//           break;
//         case 'afternoon':
//           msg += `${this.afternoon} ${this.name}`;
//           break;
//         case 'evening':
//           msg += `${this.evening} ${this.name}`;
//           break;
//       }

//       console.log(msg);
//     },
//   };
// }

// const helloVictor = createGreeter('Victor');
// helloVictor.greet('morning');
// // = Good Morning Victor

// 2
// const item = {
//   name: 'Foo',
//   description: 'Fusce consequat dui est, semper.',
//   price: 50,
//   quantity: 100,
//   discount(percent) {
//     const discount = this.price * percent / 100;
//     return this.price - discount;
//   },
// };

// console.log(item.discount(20));   // should return 40
// // = 40
// console.log(item.discount(50));   // should return 25
// // = 20
// console.log(item.discount(25));   // should return 37.5
// // = 15

//3

// function objectsEqual(a, b) {
//   if (a === b) {
//     return true;
//   }

//   return (keysMatch(a, b) && valuesMatch(a, b));
// }

// function keysMatch(a, b) {
//   const aKeys = Object.getOwnPropertyNames(a).sort();
//   const bKeys = Object.getOwnPropertyNames(b).sort();

//   if (aKeys.length !== bKeys.length) {
//     return false;
//   }

//   return aKeys.every((key, index) => key === bKeys[index]);
// }

// function valuesMatch(a, b) {
//   const aKeys = Object.getOwnPropertyNames(a).sort();

//   return aKeys.every(key => a[key] === b[key]);
// }

// function objectsEqual(obj1, obj2) {
//   let prop1 = Object.getOwnPropertyNames(obj1);
//   let prop2 = Object.getOwnPropertyNames(obj2);

//   if (prop1.length !== prop2.length) {
//     console.log(false);
//     return false;
//   }

//   prop1.forEach((x, idx) => {
//     if (x !== prop2[idx]) {
//       console.log(false);
//       return false;
//     }
//   });

//   console.log(true);
//   return true;
// }

// objectsEqual({a: 'foo'}, {a: 'foo'});                      // true
// objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'});            // false
// objectsEqual({}, {});                                      // true
// objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1});  // false


// 4
function createStudent(name, year) {
  return {
    name,
    year,

    info() {
      console.log(`${this.name} is a ${this.year} year student.`);
    },
    courses: [],

    listCourses() {
      console.log(this.courses);
    },

    addCourse(obj) {
      this.courses.push(obj);
    },

    addNote(code, note) {
      let course;
    //  const course = this.courses.filter(code => code === code)

      this.courses.forEach(x => {
        if (code === x.code) {
          course = x;
        }
      });

      if (course.note) {
        course.note += `; ${note}`;
      } else {
        course.note = note;
      }
    },

    viewNotes() {
      this.courses.forEach(x => {
        console.log(`${x.name}: ${x.note}`)
      });
    },

    updateNote(code, note) {
      let course;

      this.courses.forEach(x => {
        if (code === x.code) {
          course = x;
        }
      });

      course.note = note;
    }

  }
}

// let foo = createStudent('Foo', '1st');
// foo.info();
// // // "Foo is a 1st year student"
// foo.listCourses();
// // // // [];
// foo.addCourse({ name: 'Math', code: 101 });
// foo.addCourse({ name: 'Advanced Math', code: 102 });
// // foo.listCourses();
// // // [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
// foo.addNote(101, 'Fun course');
// foo.addNote(101, 'Remember to study for algebra');
// foo.listCourses();
// // // "Math: Fun course; Remember to study for algebra"
// foo.addNote(102, 'Difficult subject');
// foo.viewNotes();
// // // "Math: Fun course; Remember to study for algebra"
// // // "Advance Math: Difficult subject"
// foo.updateNote(101, 'Fun course');
// foo.viewNotes();
// // // "Math: Fun course"
// // // "Advanced Math: Difficult subject"

// 5

let school = {
  students: [],
  addStudent(obj) {
    let years = ['1st', '2nd', '3rd', '4th', '5th'];

    if (years.includes(obj.year)) {
      this.students.push(obj);
    } else {
      console.log('Invali Yea');
    }
  },

  viewStudents() {
    console.log(this.students);
  },

  // enrollStudent() {

  // }

  getReportCard(student) {
    student.courses.forEach(course => {
      if (course.grade) {
        console.log(`${course.name}: ${course.grade}`);
      } else {
        console.log(`${course.name}: In progress`);
      }

    });
  },

  courseReport(courseName) {
    console.log(`--${courseName}--`);
    let scores = [];
    this.students.forEach(student => {
      let subject = student.courses.filter(({name}) => name === courseName)[0];//.filter(x => student.courses.name === x);

      if (subject !== undefined) {
        scores.push(subject.grade);
        console.log(student.name, subject.grade);
      }
    });
    if (!scores.includes(undefined)) {
      let avg = scores.reduce((acc, current) => acc += current) / scores.length;
      console.log(`Course Average: ${avg}`)
    }
  },
}

// Examples of created student objects with grades; methods on the objects are not shown here for brevity.
// The following are only showing the properties that aren't methods for the three objects
let foo = {
  name: 'foo',
  year: '3rd',
  courses: [
    { name: 'Math', code: 101, grade: 95, },
    { name: 'Advanced Math', code: 102, grade: 90, },
    { name: 'Physics', code: 202, }
  ],
};

let bar = {
  name: 'bar',
  year: '1st',
  courses: [
    { name: 'Math', code: 101, grade: 91, },
  ],
};

let qux = {
  name: 'qux',
  year: '2nd',
  courses: [
    { name: 'Math', code: 101, grade: 93, },
    { name: 'Advanced Math', code: 102, grade: 90, },
   ],
};

school.addStudent(foo);
school.addStudent(bar);
school.addStudent(qux);

// school.viewStudents();

// school.getReportCard(foo);
// = Math: 95
// = Advanced Math: 90
// = Physics: In progress


school.courseReport('Math');
// = =Math Grades=
// = foo: 95
// = bar: 91
// = qux: 93
// = ---
// = Course Average: 93

school.courseReport('Advanced Math');
// = =Advanced Math Grades=
// = foo: 90
// = qux: 90
// = ---
// = Course Average: 90

school.courseReport('Physics');
// = undefined


// ASK IN THE FORUM

// let year = '2022'  // GC-end of program
// let actor = 'Tom Hanks' // GC when reassigned to Ryan
// let person = 'Elon Musk aka Chief Twit'; // GC when reassigned to GW

// function changer() {
//   actor = 'Ryan Gosling'; // GC // EOP
//   person = 'George Washington';
//   return person;
// }

// const candidate = changer(); // George Washington
// // changer is GC after it is invoked

// // Only thing still in memory is `candidiate` const and the variale it points to GW


// function logName() {
//   let name = {name: 'Sarah'};
//   console.log(name);
//   return name; /// it seems inconsistent... name in the below example has two references since a string is pass by value. what about an object? is the object GC after the function is invoked? or is that not the case because it is passed by reference
// }

// let loggedName = logName();

// /*
// In this code example, there are two 'Sarah' values that could be eligible for garbage collection. One is initialised to the local variable name. This is eligible for garbage collection after the logName function is executed, as Strings are passed by value, meaning the 'Sarah' value that is assigned to the local variable name is different to the 'Sarah' value that is returned by calling the logName function. By contrast, the 'Sarah' value that is returned from calling the logName function is not eligible for garbage collection, as it is assigned to the local variable loggedName, and accessible within the program.
// */
// //