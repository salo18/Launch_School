let me = {
  firstName: 'Joe',
  lastName: 'Shmoe',
}

me.sport = 'surf';

function fullName(person) {
  console.log(`${person.firstName} ${person.lastName}`);
}

fullName(me);

let friend = {
  firstName: 'John',
  lastName: 'Smith',
};

let mother = {
  firstName: 'Amber',
  lastName: 'Doe',
};

let father = {
  firstName: 'Shane',
  lastName: 'Doe',
};

let people = [];
people.push(me);
people.push(friend);
people.push(mother);
people.push(father);

// function rollCall(collection) {
//   let length;
//   let i;
//   for (i = 0; length = collection.length; i < length; i += 1) {
//     fullName(collection[i]);
//   }
// }
// rollCall(people);

// function rollCall(collection) {
//   collection.forEach(function(item) {
//     fullName(item);
//   });
// }
// rollCall(people);

// function rollCall(collection) {
//   collection.forEach(fullName);
// }
// rollCall(people);

let people = {
  collection: [me, friend, mother, father],
  fullName: function(person) {
    console.log(`${person.firstName} ${person.lastName}`);
  },
  rollCall: function() {
    this.collection.forEach(this.fullName);
  },
  add: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }
    this.collection.push(person);
  },
  // getIndex: function(person) {
  //   return this.collection.indexOf(person);
  // },
  getIndex: function(person) {
    let index = -1;
    this.collection.forEach(function (compare, i) {
      if (compare.firstName === person.firstName && compare.lastName === person.lastName) {
        index = i;
      }
    });
  },
  remove: function(person) {
    let index;

    if (this.isInvalidPerson(person)) {
      return;
    }

    index = this.getIndex(person);
    if (index === -1) {
      return;
    }
    this.collection.splice(index, 1);
  },
  isInvalidPerson: function(person) {
    // return typeof person.firstName === 'string' && typeof person.lastName === 'string';
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  },
  get: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    return this.collection[this.getIndex(person)];
  },
  update: function(person) {
    if (this.isInvalidPerson(person)) {
      return;
    }

    let existingPersonID = this.getIndex(person);
    if (existingPersonID === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonID] = person;
    }
  },
};
people.rollCall();