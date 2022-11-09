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

// let school = {
//   students: [],
//   addStudent(obj) {
//     let years = ['1st', '2nd', '3rd', '4th', '5th'];

//     if (years.includes(obj.year)) {
//       this.students.push(obj);
//     } else {
//       console.log('Invali Yea');
//     }
//   },

//   viewStudents() {
//     console.log(this.students);
//   },

//   // enrollStudent() {

//   // }

//   getReportCard(student) {
//     student.courses.forEach(course => {
//       if (course.grade) {
//         console.log(`${course.name}: ${course.grade}`);
//       } else {
//         console.log(`${course.name}: In progress`);
//       }

//     });
//   },

//   courseReport(courseName) {
//     console.log(`--${courseName}--`);
//     let scores = [];
//     this.students.forEach(student => {
//       let subject = student.courses.filter(({name}) => name === courseName)[0];//.filter(x => student.courses.name === x);

//       if (subject !== undefined) {
//         scores.push(subject.grade);
//         console.log(student.name, subject.grade);
//       }
//     });
//     if (!scores.includes(undefined)) {
//       let avg = scores.reduce((acc, current) => acc += current) / scores.length;
//       console.log(`Course Average: ${avg}`)
//     }
//   },
// }

// // Examples of created student objects with grades; methods on the objects are not shown here for brevity.
// // The following are only showing the properties that aren't methods for the three objects
// let foo = {
//   name: 'foo',
//   year: '3rd',
//   courses: [
//     { name: 'Math', code: 101, grade: 95, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//     { name: 'Physics', code: 202, }
//   ],
// };

// let bar = {
//   name: 'bar',
//   year: '1st',
//   courses: [
//     { name: 'Math', code: 101, grade: 91, },
//   ],
// };

// let qux = {
//   name: 'qux',
//   year: '2nd',
//   courses: [
//     { name: 'Math', code: 101, grade: 93, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//    ],
// };

// school.addStudent(foo);
// school.addStudent(bar);
// school.addStudent(qux);

// // school.viewStudents();

// // school.getReportCard(foo);
// // = Math: 95
// // = Advanced Math: 90
// // = Physics: In progress


// school.courseReport('Math');
// // = =Math Grades=
// // = foo: 95
// // = bar: 91
// // = qux: 93
// // = ---
// // = Course Average: 93

// school.courseReport('Advanced Math');
// // = =Advanced Math Grades=
// // = foo: 90
// // = qux: 90
// // = ---
// // = Course Average: 90

// school.courseReport('Physics');
// // = undefined


// FUNCTION CONTEXT AND CLOSURES

// 1
// const person = {
//   firstName: 'Rick ',
//   lastName: 'Sanchez',
//   fullName: this.firstName + this.lastName,
// };

// console.log(person.fullName); // NaN

// 2
// const franchise = {
//   name: 'How to Train Your Dragon',
//   allMovies() {
//     // return [1, 2, 3].map(function(number) {
//     //   return `${this.name} ${number}`;
//     // });

//     // FIX 1 - arrow function
//     // return [1, 2, 3].map(number => {
//     //   return `${this.name} ${number}`;
//     // });

//     // FIX 2 - declare variable
//     // let self = this;
//     // return [1, 2, 3].map(function(number) {
//     //   return `${self.name} ${number}`;
//     // });

//     // FIX 3 - add optional context object argument
//     // return [1, 2, 3].map(function(number) {
//     //   return `${this.name} ${number}`;
//     // }, this);

//     // FIX 4 - bind this
//       // return [1, 2, 3].map(function(number) {
//       //   return `${this.name} ${number}`;
//       // }.bind(this));
//   },
// };

// console.log(franchise.allMovies());

// 4

// function myBind(func, context) {
//   // return func.apply(context);
//   return function(...args) {
//     return func.apply(context, args);
//   };
// }

// 5
// function myBind(func, ctx, ...partialArgs) {
//   return function(...args) {
//     const fullArgs = partialArgs.concat(args);

//     return func.apply(ctx, fullArgs);
//   };
// }

// function addNumbers(a, b) {
//   return a + b;
// }

// const addFive = myBind(addNumbers, null, 5);

// addFive(10); // 15


// 6
// function myFilter(array, func) {
//   const result = [];

//   array.forEach(value => {
//     if (func(value)) {
//       result.push(value);
//     }
//   });

//   return result;
// }

// const filter = {
//   allowedValues: [5, 6, 9],
// };

// function myFilter(array, func, thisArg) {
//   const result = [];

//   array.forEach(value => {
//     if (func.call(thisArg, value)) {
//       result.push(value);
//     }
//   });

//   return result;
// }

// myFilter([2, 1, 3, 4, 5, 6, 12], function(val) {
//   return this.allowedValues.includes(val);
// }, filter); // returns [5, 6]

// 7
// function makeArrays() {
//   let array = [];

//   return () => {
//     array.push('');
//     return array;
//   };
// }

// const pushIt = makeArrays();
// pushIt();
// // more code


// // 8
// function newStack() {
//   let arr = [];
//   return {
//     push(val) {
//       arr.push(val);
//     },

//     pop() {
//       let value = arr.pop();
//       return value;
//     },

//     printStack() {
//       arr.forEach(x => {
//         console.log(x);
//       })
//     }
//   }
// }

// let stack = newStack();
// stack.push(1);
// // stack.printStack();
// stack.push(2);
// stack.push(3);
// stack.printStack();
// stack.pop();

// 9
// const name = 'Naveed';
// const greeting = 'Hello';

// const x = {
//   name: 'Naveed',
//   greeting: 'Hello',
// }

// const greeter = {
//   // message: `${x.greeting} ${x.name}!`,
//   // message: this.greeting + this.name,
//   message: (() => {
//     const name = 'Naveed';
//     const greeting = 'Hello';
//     return `${greeting} ${name}!`;
//   })(),
//   sayGreetings() {
//     console.log(this.message);
//   }
// };

// greeter.sayGreetings();


// 10

function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],
    info() {
      console.log(`${this.name} is a ${this.year} student`);
    },

    listCourses() {
      return this.courses;
    },

    addCourse(course) {
      this.courses.push(course);
    },

    addNote(courseCode, note) {
      const course = this.courses.filter(({code}) => code === courseCode)[0];

      if (course) {
        if (course.note) {
          course.note += `; ${note}`;
        } else {
          course.note = note;
        }
      }

    },

    viewNotes() {
      this.courses.forEach(course => {
        if (course.note) {
          console.log(`${course.name}: ${course.note}`);
        }
      });
    },

    updateNote(courseCode, note) {
      const course = this.courses.filter(({code}) => code === courseCode)[0];

      if (course) {
        course.note = note;
      }
    },
  };
}


// const school = {
//   students: [],
//   addStudent(name, year) {
//     if (['1st', '2nd', '3rd', '4th', '5th'].includes(year)) {
//       const student = createStudent(name, year);
//       this.students.push(student);
//       return student;
//     } else {
//       console.log('Invalid Year');
//     }
//   },

//   enrollStudent(student, courseName, courseCode) {
//     student.addCourse({name: courseName, code: courseCode})
//   },

//   addGrade(student, courseName, grade) {
//     const course = student.listCourses().filter(({name}) => name === courseName)[0];

//     if (course) {
//       course.grade = grade;
//     }
//   },

//   getReportCard(student) {
//     student.listCourses().forEach(({grade, name}) => {
//       if (grade) {
//         console.log(`${name}: ${String(grade)}`);
//       } else {
//         console.log(`${name}: In progress`);
//       }
//     });
//   },

//   courseReport(courseName) {
//     function getCourse(student, courseName) {
//       return student.listCourses().filter(({name}) => name === courseName)[0];
//     }

//     const courseStudents = this.students.map(student => {
//       const course = getCourse(student, courseName) || { grade: undefined };
//       return { name: student.name, grade: course.grade };
//     }).filter(({grade}) => grade);

//     if (courseStudents.length > 0) {
//       console.log(`=${courseName} Grades=`);

//       const average = courseStudents.reduce((total, {name, grade}) => {
//         console.log(`${name}: ${String(grade)}`);
//         return total + grade;
//       }, 0) / courseStudents.length;

//       console.log('---');
//       console.log(`Course Average: ${String(average)}`);
//     }
//   },
// };


// const school = (function() {
//   let students = [];
//   let allowedYears = ['1st', '2nd', '3rd', '4th', '5th'];

//   function getCourse(student, courseName) {
//     return student.listCourses().filter(({name}) => name === courseName)[0];
//   }

//   return {
//     addStudent(name, year) {
//       if (allowedYears.includes(year)) {
//         const student = createStudent(name, year);
//         students.push(student);
//         return student;
//       } else {
//         console.log('Invalid Year');
//       }
//     },

//     enrollStudent(student, courseName, courseCode) {
//       student.addCourse({name: courseName, code: courseCode})
//     },

//     addGrade(student, courseName, grade) {
//       const course = getCourse(student, courseName);

//       if (course) {
//         course.grade = grade;
//       }
//     },

//     getReportCard(student) {
//       student.listCourses().forEach(({grade, name}) => {
//         if (grade) {
//           console.log(`${name}: ${String(grade)}`);
//         } else {
//           console.log(`${name}: In progress`);
//         }
//       });
//     },

//     courseReport(courseName) {
//       const courseStudents = students.map(student => {
//         const course = getCourse(student, courseName) || { grade: undefined };
//         return { name: student.name, grade: course.grade };
//       }).filter(({grade}) => grade);

//       if (courseStudents.length > 0) {
//         console.log(`=${courseName} Grades=`);

//         const average = courseStudents.reduce((total, {name, grade}) => {
//           console.log(`${name}: ${String(grade)}`);
//           return total + grade;
//         }, 0) / courseStudents.length;

//         console.log('---');
//         console.log(`Course Average: ${String(average)}`);
//       }
//     }
//   }
// }());



// OBJECT CREATION PATTERNS:

// 1
// name property added to make objects easier to identify
// const foo = {name: 'foo'};
// const bar = Object.create(foo);
// bar.name = 'bar';
// const baz = Object.create(bar);
// baz.name = 'baz';
// const qux = Object.create(baz);
// qux.name = 'qux';

// Object.prototype.ancestors = function() {
//   let arr = [];

//   let proto = Object.getPrototypeOf(this).name;

//   if (proto !== undefined) {
//     arr.push(getProto(this));
//   } else {
//     arr.push(Object.getPrototypeOf(this));
//   }

//   function getProto(obj) {
//     return Object.getPrototypeOf(this).name
//   }


//   console.log(arr);
// }


// Object.prototype.ancestors = function ancestors() {
//   const ancestor = Object.getPrototypeOf(this);

//   // console.log(ancestor, Object.prototype.hasOwnProperty.call(ancestor, 'name'));

//   // console.log(ancestor.hasOwnProperty('name'));

//   if (Object.prototype.hasOwnProperty.call(ancestor, 'name')) {
//     return [ancestor.name].concat(ancestor.ancestors());
//   }

//   return ['Object.prototype'];
// };


// console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
// console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
// console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
// console.log(foo.ancestors());  // returns ['Object.prototype']

// // 2
// const foo = {
//   name: 'test',
//   bar(greeting) {
//     console.log(`${greeting} ${this.name}`);
//   },
// };

// function delegate(obj, name, ...args) {
//   // return () => obj[name].apply(obj, args);
//   return function() {
//     obj[name](...args);
//   }
// }

// const baz = {
//   qux: delegate(foo, 'bar', 'hello'),
// };

// baz.qux();   // logs 'hello test';

// foo.bar = () => { console.log('changed'); };

// baz.qux();          // logs 'changed'


// 3

// function Person(firstName, lastName, age, gender) {
//   this.firstName = firstName;
//   this.lastName = lastName;
//   this.age = age;
//   this.gender = gender;
// }

// Person.prototype.eat = function() {
//   console.log('Eating');
// }

// Person.prototype.communicate = function() {
//   console.log('Communicating');
// }

// Person.prototype.sleep = function() {
//   console.log('Sleeping');
// }

// Person.prototype.fullName = function() {
//   // console.log(`${this.firstName} ${this.lastName}`);
//   return `${this.firstName} ${this.lastName}`;
// }

// function Doctor(firstName, lastName, age, gender, specialization) {
//   Person.call(this, firstName, lastName, age, gender);
//   this.specialization = specialization;
// }

// // Doctor.prototype = Object.create(Person.prototype);
// Doctor.prototype = Person.prototype;
// Doctor.prototype.diagnose = function() {
//   console.log('Diagnosing');
// }
// Doctor.prototype.constructor = Doctor;

// function Student(firstName, lastName, age, gender, degree) {
//   Person.call(this, firstName, lastName, age, gender);
//   this.degree = degree;
// }

// Student.prototype = Person.prototype;
// Student.prototype.study = function() {
//   console.log('Studying');
// }
// Student.prototype.constructor = Student;

// function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
//   Student.call(this, firstName, lastName, age, gender, degree);
//   this.graduateDegree = graduateDegree;
// }

// GraduateStudent.prototype = Student.prototype;
// GraduateStudent.prototype.research = function() {
//   console.log('researching');
// }
// GraduateStudent.prototype.constructor = GraduateStudent;

class Person {
  constructor(firstName, lastName, age, gender) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.gender = gender;
  }

  eat() {
    console.log('Eating');
  };

  communicate() {
    console.log('Communicating');
  }

  sleep() {
    console.log('Sleeping');
  }

  fullName() {
    return `${this.firstName} ${this.lastName}`;
  }
}

class Doctor extends Person {
  constructor(firstName, lastName, age, gender, specialization) {
    super(firstName, lastName, age, gender);
    this.specialization = specialization;
  }

  diagnose() {
    console.log('Diagnosing');
  }
}

class Student extends Person {
  constructor(firstName, lastName, age, gender, degree) {
    super(firstName, lastName, age, gender);
    this.degree = degree;
  }

  study() {
    console.log('Studying');
  }
}

class GraduateStudent extends Student {
  constructor(firstName, lastName, age, gender, degree, graduateDegree) {
    super(firstName, lastName, age, gender, degree);
    this.graduateDegree = graduateDegree;
  }

  research() {
    console.log('Researching');
  }
}

// const person = new Person('foo', 'bar', 21, 'gender');
// console.log(person instanceof Person);     // logs true
// person.eat();                              // logs 'Eating'
// person.communicate();                      // logs 'Communicating'
// person.sleep();                            // logs 'Sleeping'
// console.log(person.fullName());            // logs 'foo bar'

// const doctor = new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics');
// console.log(doctor instanceof Person);     // logs true
// console.log(doctor instanceof Doctor);     // logs true
// doctor.eat();                              // logs 'Eating'
// doctor.communicate();                      // logs 'Communicating'
// doctor.sleep();                            // logs 'Sleeping'
// console.log(doctor.fullName());            // logs 'foo bar'
// doctor.diagnose();                         // logs 'Diagnosing'

const graduateStudent = new GraduateStudent('foo', 'bar', 21, 'gender', 'BS Industrial Engineering', 'MS Industrial Engineering');
// logs true for next three statements
console.log(graduateStudent instanceof Person);
console.log(graduateStudent instanceof Student);
console.log(graduateStudent instanceof GraduateStudent);
graduateStudent.eat();                     // logs 'Eating'
graduateStudent.communicate();             // logs 'Communicating'
graduateStudent.sleep();                   // logs 'Sleeping'
console.log(graduateStudent.fullName());   // logs 'foo bar'
graduateStudent.study();                   // logs 'Studying'
graduateStudent.research();                // logs 'Researching'




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