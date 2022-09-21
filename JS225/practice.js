// let invoices = {
//   unpaid: [],

//   add: function(name, owed) {
//     this.unpaid.push({
//       name: name,
//       amount: owed,
//     });
//   },

//   totalDue: function() {
//     let sum = 0;
//     this.unpaid.forEach(obj => {
//       sum += obj.amount;
//     });

//     return sum;
//   },

//   paid: [],

//   payInvoice: function(name) {
//     let unpaid = [];
//     this.unpaid.forEach(obj => {
//       if (obj.name === name) {
//         this.paid.push(obj);
//       } else {
//         unpaid.push(obj);
//       }
//     });
//     this.unpaid = unpaid;
//   },

//   totalPaid: function() {
//     let sum = 0;
//     this.paid.forEach(obj => {
//       sum += obj.amount;
//     });
//     return sum;
//   }
// };



// // console.log(invoices);
// invoices.add('Due North', 250);
// invoices.add('MoonBeam', 187.50);
// invoices.add('Slough', 300);
// // console.log(invoices);
// invoices.payInvoice('Slough');
// invoices.payInvoice('Due North');
// console.log(invoices.totalPaid());
// console.log(invoices.totalDue());





let invoices = {
  unpaid: [],
  paid: [],
  add: function(name, amount) {
    this.unpaid.push({
      name,
      amount,
    });
  },

  totalDue: function() {
    let sum = 0;
    this.unpaid.forEach(obj => {
        sum += obj.amount;
     });
     return sum;
  },

  totalPaid: function() {
    let sum = 0;
    this.paid.forEach(obj => {
        sum += obj.amount;
     });
     return sum;
  },

  payInvoice: function(name) {
    let temp = [];
    this.unpaid.forEach(obj => {
      if (obj.name === name) {
        this.paid.push(obj);
      } else {
        temp.push(obj);
      }
    });
    this.unpaid = temp;
  },


};

invoices.add('Due North', 250);
invoices.add('Moonbeam', 187.5);
invoices.add('Slough', 300);
invoices.payInvoice('Slough');
invoices.payInvoice('Due North');
console.log(invoices.totalDue());
console.log(invoices.totalPaid());