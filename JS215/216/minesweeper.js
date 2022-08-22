/*
https://edabit.com/challenge/cEGny3Pc8tjTfJryr

Given a 2D array of mines, replace the question mark with the number of mines that immediately surround it. This includes the diagonals, meaning it is possible for it to be surrounded by 8 mines maximum.

The key is as follows:

An empty space: "-"
A mine: "#"
Number showing number of mines surrounding it: "?"

You will only be given 3x3 grids.
The question mark is not limited to the centre (there may be multiple question marks).

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Rules:
- the array consists of empty spaces '-', mines '#' and '?'
- need to count how many mines are next to a question mark
  - NEXT TO...
    - above or below -- array above it or below it at the same index
    - next to means left or right -- same subarray + or - index 1
    - diagonal -- array above or below AND next to (so + or - index 1)
- there many be multiple  question marks
  - question mark needs to be replaced by a number

Inputs:
- a nested array that represents a grid
  - nested array containing 3 arrays

Output:
- the same array with the question marks mutated to represent the number of mines next to the position

------------ **Implicit Requirements** -------------

-------------------- Algorithm ---------------------
- iterate through each array
  - identify any array elements that contain a ?
  for each ?, add the coordinates to coordinate array
  - return the array index and the array element index [[1, 1], []] // array 1 index 1
  -- >>> array containing coordinates of ?

- for each coordiante, build a nested array of all possible coordinates
  - build an array containing all 8 relevant positions
    - iterate through that array and check for mines
      - regex test for /#/
    - [1, 1]
    - ? at position [x, y]
    - UP and DOWN [x-1, y], [x+1, y]
    - LEFT AND RIGHT [x, y-1], [x, y+1]
    - diagonals [x-1, y-1], [x-1, y+1], [x+1, y-1], [x+1, y+1]

      - UP and DOWN - [0, 1], [2, 1]
      - LEFT and RIGHT - [1, 0], [1, 2]
      - DIAGONALS -
        - [0, 0], [0, 2], [2, 0], [2, 2]
  - iterate through possible coordinates array and check for a mine
      - counter += 1 if a mine?
  - replace the original ? with the value of counter
*/

function minesweeper(array) {
  let coordinates = findQuestions(array); // coordinates of question mark

  let possibleMines = buildPossibleMines(coordinates); // nested array containing all possiblities

  let mines = countMines(possibleMines, array, coordinates); // nested array -- last element of each array is the number of ?

  console.log(replaceWithNumber(array, mines)); // return
}

function findQuestions(array) {
  let coordinates = [];
  for (let i = 0; i < array.length; i += 1) {
    array[i].forEach((x, idx) => {
      if (/\?/.test(x)) {
        coordinates.push([i, idx])
      }
    })
  }
  return coordinates;
}

function buildPossibleMines(array) {
  let possibleMines = [];
  for (let i = 0; i < array.length; i += 1) {
    possibleMines.push([]);
  }

  array.forEach((x, idx) => {
    possibleMines[idx].push([x[0]+1, x[1]]);
    possibleMines[idx].push([x[0]-1, x[1]]);
    possibleMines[idx].push([x[0], x[1]+1]);
    possibleMines[idx].push([x[0], x[1]-1]);
    possibleMines[idx].push([x[0]+1, x[1]+1]);
    possibleMines[idx].push([x[0]+1, x[1]-1]);
    possibleMines[idx].push([x[0]-1, x[1]+1]);
    possibleMines[idx].push([x[0]-1, x[1]-1]);
  });

  return possibleMines;
}

function countMines(possibleCoordinates, inputArray, questionCoordinates) {
  questionCoordinates.forEach(x => {
    x.push(0);
  });

  let row;
  let column;

  possibleCoordinates.forEach((x, idx) => {
    x.forEach(y => {
      row = y[0];
      column = y[1];
      if (inputArray[row]) {
        if (/#/.test(inputArray[row][column])) {
          questionCoordinates[idx][2] += 1;
        }
      }
    });
  });

  return questionCoordinates;
}

function replaceWithNumber(inputArray, minesArray) {
  let row;
  let column;
  let number;
  minesArray.forEach(x => {
    row = x[0];
    column = x[1];
    number = x[2];
    inputArray[row][column] = number;
  })

  return inputArray;
}

// minesweeper([
//   ["-", "#", "-"],
//   ["-", "?", "-"],
//   ["-", "-", "-"]
// ]) // [
//   ["-", "#", "-"],
//   ["-", "1", "-"],
//   ["-", "-", "-"]
// ]

// minesweeper([
//   ["-", "#", "-"],
//   ["#", "-", "?"],
//   ["#", "#", "-"]
// ]) //➞ [
//   ["-", "#", "-"],
//   ["#", "-", "2"],
//   ["#", "#", "-"]
// ]

// minesweeper([
//   ["-", "#", "#"],
//   ["?", "#", ""],
//   ["#", "?", "-"]
// ]) //➞ [
//   ["-", "#", "#"],
//   ["3", "#", ""],
//   ["#", "2", "-"]
// ]

// minesweeper([
//   ["-", "-", "#"],
//   ["?", "-", "-"],
//   ["-", "-", "-"]
// ]) // ➞ [
//   ["-", "-", "#"],
//   ["0", "-", "-"],
//   ["-", "-", "-"]
// ]

// Edge cases
// minesweeper([
//   ["-", [], "#"],
//   ["?", "-", "-"],
//   ["1", 2, "-"]
// ]) // what should happen here?

// minesweeper([
//   2,
//   'str',
//   ["1", 2, "-"]
// ]) // what should happen here?

// minesweeper([
//   [],
//   [],
//   []
// ]) // what should happen here?

// minesweeper([
//   ["-", "-", "#"],
//   [],
//   ["-", "-", "-"]
// ]) // what should happen here?