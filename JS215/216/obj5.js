// https://edabit.com/challenge/g2QxB5HCE9hN3PS75

/*
Standard competition ranking (also known as "1224" ranking) assigns the same rank to matching values. Rank numbers are increased each time, so ranks are sometimes skipped. If we have 5 scores (the highest score having a rank of 1):

No matching values:
Scores = [99, 98, 97, 96, 95]
Rank = 1,  2,  3,  4,  5

With matching values:
Scores = [99, 98, 98, 96, 95]
Rank = 1,  2,  2,  4,  5

// Second and third scores are equal, so rank "3" is skipped.

The highest score has a rank value of 1.

Given an object containing the names and scores of 5 competitors, and a competitor name, return the rank of that competitor after applying competition ranking.

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- an object containing key value pairs that represent a competitor and their score
- a string that represents a competitor's name

Output:
- an integer that represents the rank of that competitor relative to other competitors

Rules:
- scores are compared to each other
- highest score has a rank of 1, lower scores are lower ranked
- if multiple competitors have the same score, they share the same rank
  Scores = [99, 98, 98, 96, 95] /// Rank = 1,  2,  2,  4,  5
  OR
  Scores = [99, 98, 98, 98, 95] /// Rank = 1,  2,  2,  2,  5
  -- rank stays the same if values are the same
  -- rank doesn't go down by 1 though... it goes down by the number of people who share the same score
    - this is incorrect = [99, 98, 98, 98, 95] /// Rank = 1,  2,  2,  2,  3
    - this is correct = [99, 98, 98, 98, 95] /// Rank = 1,  2,  2,  2,  5


------------ **Implicit Requirements** -------------


------------- **Clarifying Questions** -------------
- are there always going to be five competitors?
- is the score from 0 - 100?
- will the object keys/values always be orderd from highest to lowest?

------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
competition_rank({
  George: 96,
  Emily: 95,
  Susan: 93,
  Jane: 89,
  Brett: 82
  }, "Jane") ➞ 4

competition_rank({
  Kate: 92,
  Carol: 92,
  Jess: 87,
  Bruce: 87,
  Scott: 84
  }, "Bruce") ➞ 3

// invalid inputs
competition_rank({}, "Bruce") // empty object

competition_rank({}, []) // second argument is not a string

competition_rank({
  Kate: 92,
  Carol: 92,
  Jess: 87,
  Bruce: 87,
  Scott: 84
  }, "Pete") // second argument is a name that is not included in the object

  competition_rank({
  Kate: '92',
  Carol: 'str',
  Jess: [],
  Bruce: {},
  Scott: 84
  }, "Bruce") // object contains strings, arrays or objects

competition_rank({
  Kate: 92,
  Carol: 92,
  Jess: 87,
  Bruce: 87,
  Scott: 84,
  Leah: 100,
  Ben: 200,
  }, "Pete") // object contains more or less than five competitors?

competition_rank({
  Kate: 92,
  Carol: 92,
  Jess: 87,
  Bruce: 87,
  Scott: 84,
  Leah: 100,
  Ben: 200,
  }, "Pete", 'Jim', 'Sally') // what if we pass in more than one person? or more than one object? or an object without a person string?

competition_rank({
  Kate: 92,
  Carol: 92,
  Kate: 87,
  Bruce: 87,
  Scott: 84
  }, "Bruce") // competitors with the same name

-------------------- Algorithm ---------------------
- convert object into nested array - entries
- sort this array based on the value of the second index of each array and convert back to an object
[['kate', 92], ['carol', 92], ['jess', 87], ['bruce', 87], ['scott', 84]]
- declare and initialize a ranks array
[]

- iterate through the object array
  - add ranks (1, 2, 3, etc) to the rank array
    - first array element is always rank 1
    [ 92, 92, 87, 87, 84 ]
    - build subarray of index 0 to current index
    [ 92, 92]
      - if current index is included in the subarray, re-add the last element of the ranks index
      - if not increment the rank by the element's position in the score array
    [ 92, 92, 87]
      - current element is included... re-add the last element of the ranks index

- find the array index for the input competitor
  - if NO SIMILAR NAMES
    - find the array index that has the same name as the input string
    - find the rank at the same index in the ranks array
    - return the rank

---------------------- Notes -----------------------
- declare and initialize a rank tracker variable
// rank = 1

      // - iterate through the object
//   - if the value


    - for all proceeding elements
      - if the score is the same, add the same rank to the array (or add the rank of the last element in the array)

        - increment the rank tracker
      - if the score is not the same, add the index of the current object + 1
*/
// MY SOLUTION
// function competitionRank(obj, name) {
//   let arr = Object.entries(obj).sort((a, b) => b[1] - a[1]);

//   let ranks = [];
//   let scores = arr.map(x => x[1]);
//   console.log(scores);

//   let subarray = [];
//   scores.forEach((el, idx) => {
//     for (let i = 0; i <= idx; i += 1) {
//       subarray.push(scores[i-1]);
//     }
//     // console.log('el is', el);
//     // console.log('idx is', idx);

//     // console.log('current subarray', subarray);
//     // console.log(ranks, 'ranks length is', ranks.length);
//     // console.log('-------');

//     if (ranks.length === 0) {
//       ranks.push(1);
//     } else if (subarray.includes(el)) {
//       ranks.push(ranks[idx-1]);
//     } else if (!subarray.includes(el)) {
//       ranks.push(idx+1);
//     }

//     subarray = [];
//   });
//   // console.log(ranks);

//   let names = arr.map(x => x[0]);
//   let idx;
//   for (let i = 0; i < names.length; i += 1) {
//     if (names[i] === name) {
//       idx = i;
//     }
//   }

// return ranks[idx];
// }

// function competitionRank(results, person) {
// 	let rank = 1;
// 	for (let key in results){

//     console.log(results);
//     console.log('current person', key, results[key]);
//     console.log(person, results[person]);
// 		if(results[key] > results[person]){
// 			rank += 1;
// 		}
// 	}
// 	return rank;
// }

function competitionRank(results, person) {
  var ranks = Object.values(results);
  // [];
	// for(rank in results){
	// 	ranks.push(results[rank]);
  // }

  console.log(ranks);
  ranks.sort(function(a, b){return b-a});
  console.log(ranks);
	return ranks.indexOf(results[person]) +1;
}

// console.log(competitionRank({
//   George: 96,
//   Emily: 95,
//   Susan: 93,
//   Jane: 89,
//   Brett: 82
//   }, "Jane")); // 4

console.log(competitionRank({
  Scott: 84,
  Kate: 92,
  Carol: 92,
  Jess: 87,
  Bruce: 87,
  }, "Bruce")); // 3