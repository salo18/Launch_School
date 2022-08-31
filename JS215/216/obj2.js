https://edabit.com/challenge/E5kxeJA782rNX2bch

/*
Create a function that returns which chapter is nearest to the page you're on. If two chapters are equidistant, return the chapter with the higher page number.

All page numbers in the dictionary will be valid integers.
Return the higher page number if ever two pages are equidistant (see last test case).
--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Rules:
- each chapter has a starting page number
- need to find the difference in lengths between the chapters
- if the chapters are equidistant, return the higher page number chapter

Inputs:
- an object containing key value pairs representing chapters and their starting page number
- an integer
Output:
- a chapter name


-------------------- Algorithm ---------------------
- create an array of page numbers
[1, 15, 37]
- find the absolute value of the input number - each page number
  - 1 - 10 === 9
  - 15 - 10 === 5
  - 37 - 10 === 27
  - get the max value of this computation and return the page number associated with this chapter
    - 5 -- index 1
- find the chapter name associated with this page number
  - chapter 2

---------------------- Notes -----------------------
*/

function nearestChapter(obj, num) {
  let values = Object.values(obj);

  let arr = values.slice();

  let difference = arr.map(x => Math.abs(x-num)).sort((a, b) => a - b)[0];

  let chapterPage = arr.filter(x => Math.abs(x - difference) === num || Math.abs(x + difference) === num);

  if (chapterPage.length > 1) {
    chapterPage = chapterPage[1];
  } else if (chapterPage.length === 1) {
    chapterPage = chapterPage[0];
  }

  let chapters = Object.entries(obj);

  let chapterName = chapters.filter(x => x[1] === chapterPage);

  return chapterName[0][0];
}

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 15,
  "Chapter 3" : 37
}, 10) // "Chapter 2"


nearestChapter({
  "New Beginnings" : 1,
  "Strange Developments" : 62,
  "The End?" : 194,
  "The True Ending" : 460
}, 200) // "The End?"


nearestChapter({
  "Chapter 1a" : 1,
  "Chapter 1b" : 5,
}, 3) // "Chapter 1b" /// equidistant


// ------------ Examples/Test Cases/Edge Cases ------------
// nearestChapter({}, 10) // empty object

// nearestChapter([], 10) // different data type

// nearestChapter({
//   1 : 1,
//   2 : 15,
//   3 : 37
// }, 10) // different data type for the keys

// nearestChapter({
//   "Chapter 1" : 1,
//   "Chapter 2" : 15,
//   "Chapter 3" : 37
// }, 0) // 0 as second argument?

// nearestChapter({
//   "Chapter 1" : 1,
//   "Chapter 2" : 15,
//   "Chapter 3" : 37
// }, 'sdrds') // different data type as second argument?

// nearestChapter({
//   "Chapter 1" : 1,
//   "Chapter 2" : 1,
//   "Chapter 3" : 1
// }, 'sdrds') // chapters with the same page number

// nearestChapter({
//   "Chapter 1" : 1,
//   "Chapter 2" : 15,
//   "Chapter 3" : 37
// }, 'sdrds') // different data type as second argument?

