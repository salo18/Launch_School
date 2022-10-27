
// let temperatures = [53, 86, 12, 43, 0];

// // function average(values) {
// //   let total = 0;
// //   let i;
// //   for (i = values.length - 1; i >= 0; i -=1) {
// //     total += values[i];
// //   }

// //   return total / values.length;
// // }

// function average() {
//   let total = 0;
//   let i;
//   for (i = this.length - 1; i >= 0; i -= 1) {
//     total += this[i];
//   }

//   return total / this.length;
// }

// // console.log(average.call(temperatures));

// // let averageTemperature = average.bind(temperatures);

// // console.log(averageTemperature());

// temperatures.average = average;
// console.log(temperatures);


// let turk = {
//   firstName: 'Christopher',
//   lastName: 'Turk',
//   occupation: 'Surgeon',
//   getDescription() {
//     return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
//   }
// };

// let getTurkDescription = turk.getDescription.bind(turk);
// console.log(getTurkDescription());

// // function logReturnVal(func, context) {
// //   let returnVal = func.call(context);
// //   console.log(returnVal);
// // }

// // logReturnVal(turk.getDescription, turk);



// let TESgames = {
//   titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   // listGames() {
//   //   this.titles.forEach(function(title) {
//   //     console.log(this.seriesTitle + ' ' + title);
//   //   });
//   // }
//   // listGames() {
//   //   this.titles.forEach(title => {
//   //     console.log(this.seriesTitle + ' ' + title);
//   //   });
//   // }

//   // listGames() {
//   //   let self = this;
//   //   this.titles.forEach(function(title) {
//   //     console.log(self.seriesTitle + ' ' + title);
//   //   });
//   // }

//   listGames() {
//     this.titles.forEach(function(title) {
//       console.log(this.seriesTitle + ' ' + title);
//     }, this);
//   }

// };

// TESgames.listGames();




// let foo = {
//   a: 0,

  // incrementA() {
  //   function increment() {
  //     this.a += 1;
  //   }

  //   increment();
  // }

  // incrementA() {
  //   let self = this;
  //   function increment() {
  //     self.a += 1;
  //   }

  //   increment();
  // }

//   incrementA() {
//     function increment() {
//       this.a += 1;
//     }

//     increment.apply(this);
//   }

// };

// foo.incrementA();
// foo.incrementA();
// foo.incrementA();

// let foo = {
//   a: 0,
//   incrementA() {
//     let increment = function() {
//       this.a += 1;
//     }.bind(this);

//     increment();
//     increment();
//     increment();
//   }
// };

// function bar() {
//   this.num = 20;
// }

// let foo = {
//   a: 0,
//   incrementA() {
//     let increment = function() {
//       this.a += 1;
//     }.bind(this);

//     increment();
//     increment();
//     increment();
//   }
// }
// bar();
// console.log(global.num);
// console.log(foo.a);

let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount.call(computer);
  }
};

console.log(computer.total());
