// https://edabit.com/challenge/jThp2fAGWuwffsokZ

/*
Create a function that can nest a flat array to represent an incremental depth level sequence.

The elements do not matter to the function, you should increment by index.
Expect the array length to be from 2-20.

--------------------------PROBLEM-------------------

------------ **Explicit Requirements** -------------
Inputs:
- an array

Output:
- a new array

Rules:
- each index is the start to anoether nested array
[1, 2, 3, 4, 5]
[1, [2, [3, [4, [5]]]]]
- index 1 starts another nested array
- each nested array only has two elements... the current index + a nested array containing the remaining elements
- last element is off by itself in its own nested array
- strings and numbers are valid array elements

------------- **Clarifying Questions** -------------
- do I need to mutate the caller?

------------ Examples/Test Cases/Edge Cases ------------
// HAPPY PATH
incrementalDepth([1, 2]) // [1, [2]]

incrementalDepth([1, 2, 3, 4, 5]) // [1, [2, [3, [4, [5]]]]]

incrementalDepth([1, 3, 2, 6]) // [1, [3, [2, [6]]]]

incrementalDepth(["dog", "cat", "cow"]) // ["dog", ["cat", ["cow"]]]

//
incrementalDepth([]) // how to deal with empty array?
incrementalDepth([1, 2, <3 empty lines>]) // how to deal with sparse array?
incrementalDepth([1, undefined , null]) // should undefined values be counted?
incrementalDepth([1, [], {}]) // how about other data types?
incrementalDepth([1, 2], [1, 2]) // what about extra inputs?
incrementalDepth() // no inputs?
incrementalDepth([1, 2, [3], {a: 1}]) // what about nested array elements or objects?
-------------------- Algorithm ---------------------
[1, 2, 3, 4] ===> [1, [2, [3,[4]]]]

- transform input array -- each element in its own array
[[1], [2], [3], [4]]
- remove first element and insert original first element
[1, [2], [3], [4], [5]]
- declare and initialize a result array
- iterate over mapped array from end to start
  - push last element into second to last
    [4, [5]]
  - push updated second to last into third to last
    [3, [4, [5]]]
  - do this until you reach the element at index 1
---------------------- Notes -----------------------
    // [[4, [5]]]
    // [3, [4, [5]]]
    // el is [4, [5]]


    // el.push(result[result.length - 1]);

    // console.log('holder is', holder);
    // console.log('el is', el);

     // if (i === mapped.length - 1) {
    //   holder.push(mapped[i-1][0]);
    //   holder.push(mapped[i]);
    // }
*/
// function incrementalDepth(arr) {
//   let mapped = arr.map(x => [x]);
//   let first = mapped[0][0];

//   mapped.shift();
//   mapped.unshift(first);

//   let holder = [mapped[mapped.length-1][0]];
//   for (let i = mapped.length - 1; i > 1; i -=1) {
//     holder = [holder];
//     holder.unshift(mapped[i-1][0]);
//   }

//   let result = [first];
//   result.push(holder);
//   return result;
// }


// console.log(incrementalDepth([1, 2])); // [1, [2]]

console.log(incrementalDepth([1, 2, 3, 4, 5])); // [1, [2, [3, [4, [5]]]]]

// console.log(incrementalDepth([1, 3, 2, 6])); // [1, [3, [2, [6]]]]

// console.log(incrementalDepth(["dog", "cat", "cow"])); // ["dog", ["cat", ["cow"]]]