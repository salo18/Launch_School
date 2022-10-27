// 3
//let numbers = [1, 2, 3, 4];
// function makeCheckEven() {
//   return function(number) {
//     return number % 2 === 0;
//   }
// }

// let checkEven = makeCheckEven();

// console.log(numbers.filter(checkEven)); // [2, 4]


// 4
// function execute(func, operand) {
//   console.log(func(operand));
//   return func(operand);
// }

// execute(function(number) {
//   return number * 2;
// }, 10); // 20

// execute(function(string) {
//   return string.toUpperCase();
// }, 'hey there buddy'); // "HEY THERE BUDDY"

// 5
// function makeListTransformer(func) {
//   return function(collection) {
//     return collection.map(func);
//   };
// }

// let timesTwo = makeListTransformer(function(number) {
//   return number * 2;
// });

// console.log(timesTwo([1, 2, 3, 4])); // [2, 4, 6, 8]

// CLOSURES


// 1
// function makeCounterLogger(start) {
//   return function(finish) {
//     let i;

//     if (start > finish) {
//       for (let i = start; i >= finish; i -= 1) {
//         console.log(i);
//       }
//     } else if (finish > start) {
//       for (let i = start; i <= finish; i += 1) {
//         console.log(i);
//       }
//     }
//   }
// }

// let countlog = makeCounterLogger(5);
// // countlog(8);
// countlog(2);

// 2
// function makeList() {
//   let list = [];
//   let i;
//   return function(item) {
//    if (list.includes(item)) {
//       i = list.indexOf(item);
//       list.splice(i, 1);
//       return `${item} removed!`
//     } else if (list.length === 0 && item === undefined) {
//       return 'The list is empty.'
//     } else if (!list.includes(item) && item !== undefined) {
//       list.push(item);
//       return `${item} added!`
//     } else {
//       list.forEach(x => console.log(x));
//     }
//   }
// }

// function makeList() {
//   let list = [];
//   let i;
//   return function(item) {
//    if (item) {
//      i = list.indexOf(item);
//      if (i === -1) {
//        list.push(item);
//        console.log(`${item} added!`);
//      } else {
//        list.splice(i, 1);
//        console.log(`${item} removed!`);
//      }
//    } else {
//      if (list.length === 0) {
//        console.log(`the list is empty.`);
//      } else {
//        list.forEach(x => console.log(x));
//      }
//    }
//   }
// }

// let list = makeList();
// list();
// list('make breakfast');
// list('read book');
// list();
// list('make breakfast');
// list();


// practice problems - closures
// function makeMultipleLister(num) {
//   return function() {
//     let count = num;
//     let arr = [num];
//     do {
//       count += 1;
//       if (count % num === 0) {arr.push(count)}
//     } while (count < 100)
//     arr.forEach(x => console.log(x));
//   }
// }

// ls
// function makeMultipleLister(number) {
//   return function() {
//     let i;
//     for (i = number; i < 100; i += number) {
//       console.log(i);
//     }
//   }
// }
// let lister = makeMultipleLister(13);
// lister();


// 2
// let total = 0;
// function add(num) {
//   total += num;
//   console.log(total);
// }

// function subtract(num) {
//   total -= num;
//   console.log(total);
// }

// add(1);
// add(42);
// subtract(39);
// add(6);

// 3
// function startup() {
//   let status = 'ready';
//   return function() {
//     console.log('The system is ready.');
//   };
// }

// let ready = startup();
// let systemStatus =


//
// function makeList() {
//   let items = [];
//     return {
//       add(item) {
//         let index = items.indexOf(item);
//         if (index === -1) {
//           items.push(item);
//           console.log(`${item} added!`);
//         }
//       },

//       list() {
//         if (items.length === 0) {
//           console.log('The list is empty.');
//         } else {
//           items.forEach(x => console.log(x));
//         }
//       },

//       remove(item) {
//         let i = items.indexOf(item);
//         if (i !== -1) {
//           items.splice(i, 1);
//           console.log(`${item} removed!`);
//         }
//       },
//   }
// }

// let list = makeList();
// list.add('peas');
// list.list();
// list.add('corn');
// list.list();
// list.remove('peas');
// list.list();
// // console.log(list.items);




// //
// function makeBank() {
//   let accounts = [];
//   return {
//     openAccount() {
//       let number = accounts.length + 101;
//       let account = makeAccount(number);
//       accounts.push(account);
//       return account;
//     },
//     transfer(source, destination, amount) {
//       source.withdraw(amount);
//       destination.deposit(amount);
//       return amount;
//     },
//   };
// }

// function makeAccount(number) {
//   let balance = 0;
//   let transactions = [];

//   return {
//     deposit(amount) {
//       // this.transactions.push({
//         transactions.push({
//         type: 'deposit',
//         amount: amount,
//       });
//       balance += amount;
//       return amount;
//     },

//     withdraw(amount) {
//       if (amount > balance) {
//         amount = balance;
//       }
//         transactions.push({
//         type: 'withdrawal',
//         amount: amount,
//       });
//       balance -= amount;
//       return amount;
//     },

//    balance() {
//      return balance;
//    },

//    number() {
//      return number;
//    },

//    transactions() {
//      return transactions;
//    },

//   };
// }

// let bank = makeBank();
// console.log(bank.accounts);
// // undefined



// let bank = makeBank();
// let account = bank.openAccount();
// console.log(account.number);
// // 101
// console.log(bank.accounts);
// // [{...}]
// console.log(bank.accounts[0]);
// // {number: 101, balance: 0, transactions: Array[0]}
// let secondAccount = bank.openAccount();
// console.log(secondAccount.number);
// // 102
// console.log(bank.accounts[1]);



// let bank = makeBank();
// let source = bank.openAccount();
// console.log(source.deposit(10));
// // 10
// let destination = bank.openAccount();
// console.log(bank.transfer(source, destination, 7));
// // 7
// console.log(source.balance);
// // 3
// console.log(destination.balance);
// // 7



// let bank = makeBank();
// let account = bank.openAccount();
// console.log(account.balance());
// // 0
// console.log(account.deposit(17));
// // 17
// let secondAccount = bank.openAccount();
// console.log(secondAccount.number());
// // 102
// console.log(account.transactions());
// // [{...}]


// console.log(account.balance);
// // 0
// console.log(account.deposit(12));
// // 12
// console.log(account.balance);
// // 12
// console.log(account.deposit(10));
// // 10
// console.log(account.balance);

// account.balance = 100;
// console.log(account.balance);
// // 100
// console.log(account.withdraw(19));
// // 19
// console.log(account.transactions);

// console.log(account.transactions[0]);


// // console.log(account.balance);
// // 81

// console.log(account.balance);
// // 81
// console.log(account.withdraw(91));
// // 81
// console.log(account.balance);
// // 0

// let account = makeAccount();
// console.log(account.deposit(15));
// // 15
// console.log(account.balance);
// // 15
// let otherAccount = makeAccount();
// console.log(otherAccount.balance);
// // 0


function greet(greeting, name) {
  console.log(`${greeting}, ${name}`);
}

function generator(arg1, arg2) {
  return function(arg2) {
    return greet(arg1, arg2);
  }
}

let sayHello = generator('Hello');
sayHello('Brandon');

let sayHi = generator('Hi');
sayHi('Sofie');
// greet('howdy', 'Joe');