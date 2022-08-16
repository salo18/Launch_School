// Practice Problems:

// let firstName = 'Suleiman';
// let lastName = 'Mo';
// let fullName = `${firstName} ${lastName}`;
// // console.log(fullName);

// // console.log(firstName.concat(lastName));

// // console.log(fullName.split(' '));

// let language = 'JavaScript';
// let idx = language.indexOf('S');
// // console.log(idx);

// let charCode = language.charCodeAt(idx);
// // console.log(charCode);

// // console.log(String.fromCharCode(charCode));

// // console.log(language.lastIndexOf('a'));

// let a = 'a';
// let b = 'b';
// // console.log(a > b);
// b = 'B';
// // console.log(a > b);

// let aIndex = language.indexOf('a');
// let vIndex = language.indexOf('v');

// // console.log(language.substr(aIndex, 4));
// // console.log(language.substr(vIndex, 4));

// // console.log(language.substring(aIndex, 4));
// // console.log(language.substring(vIndex, 4));

// let fact1 = 'Javascript is fun';
// let fact2 = 'Kids like it too';
// let compoundSentence = fact1 + ' and ' + fact2.toLowerCase();
// // console.log(compoundSentence);

// // console.log(fact1[0]);
// // console.log(fact2[0]);


// let pi = 22 / 7;
// // console.log(pi.toString().lastIndexOf('14'));

// // let boxNumber = (356).toString();
// // console.log(typeof boxNumber);
// // let num = Number.parseInt(boxNumber)
// // console.log(typeof num);
// // console.log(typeof String(num));

// // let name = prompt('What is your name?');

// REVERSE STRING:
// function reverse(string) {
//   // let arr = string.split(' ');
//   // let reversed = arr.map(w => w.split('').reverse());
//   // let result = [];
//   // for (let i = reversed.length -1; i >= 0; i -= 1) {
//   //   result.push(reversed[i].join(''));
//   // }

//   // console.log(result.join(' '));
//   // return result.join(' ');

//   console.log(string.split('').reverse().join(''));
// }

// reverse('hello');                  // returns "olleh"
// reverse('The quick brown fox');    // returns "xof nworb kciuq ehT"


// ACRONYM:
// function acronym(string) {
//   console.log(string.replace(/-/g, ' ').split(' ').map(x => x[0].toUpperCase()).join(''));
// }

// acronym('Portable Network Graphics');                  // "PNG"
// acronym('First In, First Out');                        // "FIFO"
// acronym('PHP: HyperText Preprocessor');                // "PHP"
// acronym('Complementary metal-oxide semiconductor');    // "CMOS"
// acronym('Hyper-text Markup Language');                 // "HTML"

// EMAIL VALIDATION:
// function isValidEmail(email) {
//   // if (!/@/.test(email)) {
//   //   return false;
//   // }

//   // let arr = email.split('@');
//   // let local = arr[0];
//   // let domain = arr[1];

//   // if (/[a-zA-Z0-9]/.test(local) && /./.test(domain)) {
//   //   return true;
//   // }

//   // return false;

//   return /^[a-z0-9]+@([a-z]+\.)+[a-z]+$/i.test(email);
// }

// console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
// console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
// console.log(isValidEmail('foo@baz.com'));             // returns true
// console.log(isValidEmail('foo@baz.ph'));              // returns true
// console.log(isValidEmail('HELLO123@baz'));            // returns false
// console.log(isValidEmail('foo.bar@baz.to'));          // returns false
// console.log(isValidEmail('foo@baz.'));                // returns false
// console.log(isValidEmail('foo_bat@baz'));             // returns false
// console.log(isValidEmail('foo@bar.a12'));             // returns false
// console.log(isValidEmail('foo_bar@baz.com'));         // returns false
// console.log(isValidEmail('foo@bar.....com'));         // returns false


// PARENTHESES
/*
PEDAC
- input - string
- output - boolean
- need to "balance" parentheses, meaning '(str)'
- return true if no parentheses
- if ( is in the string, must be followed at some point by )
- can have nested () meaning that we need to keep track of inner and outer nests

algorithm:
- loop through the characters
- find the first index of ( and store the position in an array
- do this until you go through each character in the string
- get the length of the array and check to see if there are that many ) in the string using regex
*/
// // function isBalanced(str) {
// //   if (!/[()]/.test(str)) {
// //     return true;
// //   }

// //   let left = [];
// //   let right = [];
// //   for (let i = 0; i < str.length; i += 1) {
// //     if (str[i] === '(') {
// //       left.push(i);
// //     } else if (str[i] === ')') {
// //       right.push(i);
// //     }
// //   }

// //   if (left.length !== right.length){
// //     return false;
// //   }

// //   for (let i = 0; i < left.length; i += 1) {
// //     if (left[i] > right[i]) {
// //       return false;
// //     }
// //   }

// //   return true;
// // }

// // LS SOLUTION
// function isBalanced(str) {
//   let counter = 0;
//   for (let i = 0; i < str.length; i += 1) {
//     if (str[i] === '(') {
//       counter += 1;
//     } else if (str[i] === ')') {
//       counter -= 1;
//     }

//     if (counter < 0) {
//       return false;
//     }
//   }

//   return counter === 0;
// }


// console.log(isBalanced('What (is) this?'));        // true
// console.log(isBalanced('What is) this?'));         // false
// console.log(isBalanced('What (is this?'));         // false
// console.log(isBalanced('((What) (is this))?'));    // true
// console.log(isBalanced('((What)) (is this))?'));   // false
// console.log(isBalanced('Hey!'));                   // true
// console.log(isBalanced(')Hey!('));                 // false
// console.log(isBalanced('What ((is))) up('));       // false


// SENTIMENT ANALYSIS

let textExcerpt = 'To be or not to be-that is the question:\n' +
  'Whether \'tis nobler in the mind to suffer\n' +
  'The slings and arrows of outrageous fortune,\n' +
  'Or to take arms against a sea of troubles,\n' +
  'And, by opposing, end them. To die, to sleep-\n' +
  'No more-and by a sleep to say we end\n' +
  'The heartache and the thousand natural shocks\n' +
  'That flesh is heir to-\'tis a consummation\n' +
  'Devoutly to be wished. To die, to sleep-\n' +
  'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
  'For in that sleep of death what dreams may come,\n' +
  'When we have shuffled off this mortal coil,\n' +
  'Must give us pause. There\'s the respect\n' +
  'That makes calamity of so long life.\n' +
  'For who would bear the whips and scorns of time,\n' +
  'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
  'The pangs of despised love, the law’s delay, [F: disprized]\n' +
  'The insolence of office, and the spurns\n' +
  'That patient merit of the unworthy takes,\n' +
  'When he himself might his quietus make\n' +
  'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
  'To grunt and sweat under a weary life,\n' +
  'But that the dread of something after death,\n' +
  'The undiscovered country from whose bourn\n' +
  'No traveler returns, puzzles the will\n' +
  'And makes us rather bear those ills we have\n' +
  'Than fly to others that we know not of?\n' +
  'Thus conscience does make cowards of us all,\n' +
  'And thus the native hue of resolution\n' +
  'Is sicklied o\'er with the pale cast of thought,\n' +
  'And enterprises of great pitch and moment, [F: pith]\n' +
  'With this regard their currents turn awry, [F: away]\n' +
  'And lose the name of action.-Soft you now,\n' +
  'The fair Ophelia.-Nymph, in thy orisons\n' +
  'Be all my sins remembered';

// let positiveWords = ['fortune', 'dream', 'love', 'respect', 'patience', 'devout', 'noble', 'resolution'];
// let negativeWords = ['die', 'heartache', 'death', 'despise', 'scorn', 'weary', 'trouble', 'oppress'];

// function sentiment(text) {
//   let wordList = text.toLowerCase().match(/[a-z']+/g);

//   let positive = wordList.filter(word => positiveWords.indexOf(word) >= 0);
//   let negative = wordList.filter(word => negativeWords.indexOf(word) >= 0);

//   // for (let i = 0; i < positiveWords.length; i += 1) {
//   //   regex = new RegExp(`\\b${positiveWords[i]}\\b`, 'i');
//   //   if (regex.test(text)) {
//   //     positive.push(positiveWords[i]);
//   //   }
//   // }

//   // for (let i = 0; i < negativeWords.length; i += 1) {
//   //   regex = new RegExp(`\\b${negativeWords[i]}\\b`, 'i');
//   //   if (regex.test(text)) {
//   //     negative.push(negativeWords[i]);
//   //   }
//   // }

//   let sentiment;
//   if (positive.length > negative.length) {
//     sentiment = 'Positive';
//   } else if (negative.length > positive.length) {
//     sentiment = 'Negative';
//   } else if (positive.length === negative.length) {
//     sentiment = 'Neutral';
//   }


//   console.log(`There are ${positive.length} positive words in the text.`);
//   console.log(`Positive sentiments: ${positive.join(', ')}`);
//   console.log(`There are ${negative.length} negative words in the text.`);
//   console.log(`Negative sentiments: ${negative.join(', ')}`);
//   console.log(`The sentiment of the text is ${sentiment}`);
// }

// sentiment(textExcerpt);

// // console output
// // There are 5 positive words in the text.
// // Positive sentiments: fortune, dream, respect, love, resolution

// // There are 6 negative words in the text.
// // Negative sentiments: die, heartache, die, death, weary, death

// // The sentiment of the text is Negative.

// SENTIMENT ANALYSIS 2
// let positiveRegex = /\bfortunes?\b|\bdream(s|t|ed)?\b|love(s|d)?\b|respect(s|ed)?\b|\bpatien(ce|t)?\b|\bdevout(ly)?\b|\bnobler?\b|\bresolut(e|ion)?\b/gi;
// let negativeRegex = /\bdie(s|d)?\b|\bheartached?\b|death|despise(s|d)?\b|\bscorn(s|ed)?\b|\bweary\b|\btroubles?\b|\boppress(es|ed|or('s)?)?\b/gi;

// function sentiment(text) {
//   let wordList = text.toLowerCase().match(/[a-z']+/g);

//   let positive = wordList.filter(word => positiveRegex.test(word));
//   let negative = wordList.filter(word => negativeRegex.test(word));

//   let sentiment;
//   if (positive.length > negative.length) {
//     sentiment = 'Positive';
//   } else if (negative.length > positive.length) {
//     sentiment = 'Negative';
//   } else if (positive.length === negative.length) {
//     sentiment = 'Neutral';
//   }

//   console.log(`There are ${positive.length} positive words in the text.`);
//   console.log(`Positive sentiments: ${positive.join(', ')}`);
//   console.log(`There are ${negative.length} negative words in the text.`);
//   console.log(`Negative sentiments: ${negative.join(', ')}`);
//   console.log(`The sentiment of the text is ${sentiment}`);
// }

// sentiment(textExcerpt);

// // console output

// // There are 9 positive type words in the text.
// // Positive sentiments: nobler, fortune, devoutly, dream, dreams, respect, love, patient, resolution

// // There are 10 negative type words in the text.
// // Negative sentiments: troubles, die, heartache, die, death, scorns, oppressor's, despised, weary, death

// // The sentiment of the text is Negative.

// var emailData = "From: foo@bar.com#/#\nSubject: Nunc in justo eros. Aliquam.#/#\nDate: 07-27-2016#/#\nTo: foo@bar.com#/#\nEtiam convallis commodo tortor, dapibus auctor dolor semper consequat. Sed lobortis eros nec ante porta, eu placerat sapien interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi consectetur et odio vitae volutpat. Curabitur imperdiet orci metus, et dignissim nisl lacinia non. Aenean volutpat diam in lorem iaculis, sit amet volutpat nibh dictum. Quisque vel vulputate nisi. Nam a vestibulum turpis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi interdum leo id velit aliquet, at vestibulum ipsum molestie. Cras eu lobortis libero. In rutrum non leo id ultricies. Aliquam in ex ut nibh placerat sollicitudin vitae id magna.##||##\n\nFrom: baz@foo.com#/#\nSubject: Aenean cursus velit non arcu.#/#\nDate: 08-11-2016#/#\nTo: baz@foo.com#/#\nCras ex leo, faucibus id mollis a, dignissim sit amet metus. Sed dui massa, mollis in tristique ut, auctor quis tortor. Donec egestas velit purus, eget laoreet urna venenatis id. Etiam eget ultrices tortor. Duis venenatis leo mi, non porta est molestie at. Nulla lacus nisl, dapibus convallis massa ut, dignissim euismod lacus. Ut vel magna lectus. Morbi sit amet vulputate arcu. Cras non ante arcu. Nam tempor iaculis ipsum eget tincidunt. Praesent imperdiet varius dui, vel egestas ipsum porta in. Sed suscipit massa in neque lobortis congue.##||##\n\nFrom: qux@bar.com#/#\nSubject: Sed hendrerit felis in ex.#/#\nDate: 06-25-2016#/#\nTo: qux@bar.com#/#\nNulla quis est vitae orci tincidunt convallis sit amet ut libero. Sed eu facilisis justo. Maecenas sed ultrices urna. Sed malesuada justo sed magna sodales, eget congue dolor convallis. Vestibulum vel consectetur nunc. Morbi at tincidunt turpis, eget imperdiet orci. Curabitur laoreet ipsum a quam facilisis, eu aliquet lectus viverra. Maecenas ullamcorper rutrum dui, ac aliquet mi pulvinar sit amet.##||##\n\nFrom: quux@foo.com#/#\nSubject: Curabitur tincidunt elit nec risus.#/#\nDate: 07-24-2016#/#\nTo: quux@foo.com#/#\nCurabitur interdum dictum consectetur. Nulla facilisi. Quisque sed tellus consectetur, vestibulum quam sed, lacinia mauris. Nunc risus dolor, feugiat nec erat at, elementum tempor urna. Vivamus facilisis elementum congue. Cras dui libero, vehicula eget porttitor sed, sagittis quis dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam lacinia nulla nisi, vel finibus ligula sodales quis. Maecenas vulputate, leo auctor venenatis pretium, lectus elit eleifend odio, nec molestie ligula ex eget tellus. Nullam a nibh ut enim efficitur elementum. Nunc non elit vitae tortor iaculis ornare in id risus. Integer finibus lobortis lorem, id rutrum elit congue id. In hac habitasse platea dictumst.##||##\n\nFrom: garply@foo.com#/#\nSubject: Integer nec nunc facilisis, ultricies.#/#\nDate: 07-03-2016#/#\nTo: garply@foo.com#/#\nFusce rhoncus purus nisi, vel blandit felis fermentum sed. Vestibulum ultricies rutrum dui nec vehicula. Proin quis semper nulla. Maecenas congue, leo nec feugiat dapibus, dui metus facilisis elit, non finibus leo nisl at est. Donec varius, turpis non pulvinar sodales, nulla nulla posuere ligula, nec eleifend quam metus ut tortor. Sed semper vestibulum mattis. Nullam et ornare eros. Aliquam sed pellentesque dui, ut consequat neque. Integer luctus turpis ultrices, congue erat mattis, vehicula tellus. Pellentesque tincidunt posuere nibh pretium tincidunt. In hac habitasse platea dictumst.";


// // MAIL COUNT

// function mailCount(emailData) {
//   let arr = emailData.split('##||##');

//   let dates = [];
//   arr.forEach(email => {
//     dates.push(email.split('#/#')[2])
//   });

//   let strDates = dates.map(word => word.substring(7));

//   let numDates = strDates.map(str => Date.parse(str));

//   let sorted = numDates.sort().map(ms => new Date(ms));
//   let first = sorted[0];
//   let last = sorted[sorted.length - 1];

//   console.log(`Count of Email: ${arr.length}`);
//   console.log(`Date Range: ${first.toDateString()} - ${last.toDateString()}`);
// }

// // LS SOLUTION

// // function mailCount(emailData) {
// //   let emails = emailData.split('##||##');
// //   let count = emails.length;
// //   let emailDates = emails.map(email => email.split('#/#')[2]);

// //   console.log('Count of Email: ' + count);
// //   console.log('Date Range: ' + displayableDateRange(emailDates));
// // }

// // function displayableDateRange(dates) {
// //   let dateObjects = getDateObjects(dates);
// //   // console.log(dateObjects);
// //   dateObjects.sort((a, b) => a.valueOf() - b.valueOf());
// //   return dateObjects[0].toDateString() + ' - ' + dateObjects[dateObjects.length - 1].toDateString();
// // }

// // function getDateObjects(dates) {
// //   return dates.map(date => {
// //     let dateElements = date.split(' ')[1].split('-');
// //     // console.log(dateElements);
// //     let month = parseInt(dateElements[0], 10) - 1;
// //     let day = parseInt(dateElements[1], 10);
// //     let year = parseInt(dateElements[2], 10);
// //     return new Date(year, month, day);
// //   });
// // }

// mailCount(emailData);

// // console output

// // Count of Email: 5
// // Date Range: Sat Jun 25 2016 - Thu Aug 11 2016

