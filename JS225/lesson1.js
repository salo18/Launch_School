// FACTORIES
// let sedan = {
//   speed: 0,
//   rate: 8,

//   accelerate() {
//     this.speed += this.rate;
//   },

// };

// console.log(sedan.speed);
// sedan.accelerate();
// console.log(sedan.speed);
// sedan.accelerate();
// console.log(sedan.speed);


// function makeCar(rate, slow) {
//   return {
//     speed: 0,
//     rate,
//     slow,
//     accelerate() {
//       this.speed += this.rate;
//     },

//     brake() {
//       this.speed -= this.slow;
//       if (this.speed < 0) {
//         this.speed = 0;
//       }
//     }
//   };
// }

// let sedan = makeCar(8, 6);
// sedan.accelerate();
// console.log(sedan.speed); // 8
// sedan.brake();
// console.log(sedan.speed); // 2
// sedan.brake();
// console.log(sedan.speed); // 8

// let coupe = makeCar(12);
// coupe.accelerate();
// console.log(coupe.speed); // 8

// let hatchback = makeCar(9);
// hatchback.accelerate();

// console.log(hatchback.speed);



// FACTORIES PRACTICE

// let chile = {
//   name: 'The Republic of Chile',
//   continent: 'South America',
//   getDescription() {
//     return this.name + ' is located in ' + this.continent + '.';
//   },
// };

// let canada = {
//   name: 'Canada',
//   continent: 'North America',
//   getDescription() {
//     return this.name + ' is located in ' + this.continent + '.';
//   },
// };

// let southAfrica = {
//   name: 'The Republic of South Africa',
//   continent: 'Africa',
//   getDescription() {
//     return this.name + ' is located in ' + this.continent + '.';
//   },
// };

// function makeCountry(name, continent, visited) {
//   if (visited === undefined) {
//     visited = false;
//   }

//   return {
//     name,
//     continent,
//     visited: false,
//     visitCountry() {
//       this.visited = true;
//     },
//     getDescription() {
//       if (this.visited) {
//         return `${this.name} is located in ${this.continent}. I have visited.`;
//       } else {
//         return `${this.name} is located in ${this.continent}. I haven't visited.`;
//       }
//     },

//   };
// }

// let chile = makeCountry('The Republic of Chile', 'South America');
// let canada = makeCountry('Canada', 'North America');
// let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

// console.log(chile.getDescription());       // "The Republic of Chile is located in South America."
// console.log(chile.visited);

// chile.visitCountry();
// console.log(chile.visited);
// console.log(chile.getDescription());
// // console.log(canada.getDescription());      // "Canada is located in North America."
// // console.log(southAfrica.getDescription()); // "The Republic of South Africa is located in Africa."



// OBJECTS PRACTICE
// let scissorsId = 0;
// let scissorsName = 'Scissors';
// let scissorsStock = 8;
// let scissorsPrice = 10;

// let drillId = 1;
// let drillName = 'Cordless Drill';
// let drillStock = 15;
// let drillPrice = 45;

// function makeProduct(id, prodName, stock, price) {
//   return {
//     id,
//     prodName,
//     stock,
//     price,
//   }
// }

// let scissors = makeProduct(0, 'Scissors', 8, 10);
// console.log(scissors);
// let drill = makeProduct(1, 'Cordless Drill', 15, 45);
// console.log(drill);


// let scissors = {
//   id: 0,
//   name: 'Scissors',
//   stock: 8,
//   price: 10,
// };

// let drill = {
//   id: 1,
//   name: 'Cordless Drill',
//   stock: 15,
//   price: 45,
// };

// function changePrice(product, price) {
//   if (price >= 0) {
//     product.price = price;
//   } else {
//     return 'that is a negative number... try again.'
//   }
// }
// // console.log(changePrice(drill, -10));

// function describeProduct(obj) {
//   console.log(`Name: ${obj.name}`);
//   console.log(`ID: ${obj.id}`);
//   console.log(`Price: $${obj.price}`);
//   console.log(`Stock: ${obj.stock}`);
// }
// describeProduct(scissors);

function makeProduct(id, prodName, stock, price) {
  return {
    id,
    prodName,
    stock,
    price,
    changePrice(price) {
      if (price >= 0) {
        this.price = price;
      } else {
        return 'that is a negative number... try again.'
      }
    },
    describeProduct() {
      console.log(`Name: ${this.prodName}`);
      console.log(`ID: ${this.id}`);
      console.log(`Price: $${this.price}`);
      console.log(`Stock: ${this.stock}`);
    },
  }
}

let scissors = makeProduct(0, 'Scissors', 10, 20);
console.log(scissors.price);
scissors.changePrice(2)
console.log(scissors.price);
scissors.describeProduct();