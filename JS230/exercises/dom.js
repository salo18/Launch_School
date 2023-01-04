// 3
// function domTreeTracer(id) {
//   let currentElement = document.getElementById(id);
//   let parentElement;
//   const domTree = [];

//   do {
//     parentElement = currentElement.parentNode;
//     let children = getTagNames(parentElement.children);
//     domTree.push(children);

//     currentElement = parentElement;
//   } while (parentElement.tagName !== 'BODY');

//   console.log(domTree);
// }

// function getTagNames(htmlCollection) {
//   const elementsArray = Array.from(htmlCollection);
  return elementsArray.map(({tagName}) =tagName);
// }

// domTreeTracer(1);
// domTreeTracer(2);
// domTreeTracer(22);

// // > domTreeTracer(1);
// // = [["ARTICLE"]]
// // > domTreeTracer(2);
// // = [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
// // > domTreeTracer(22);
// // = [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]


// 4
function sliceTree(start, end) {
  
}


sliceTree(1, 4);
// = ["ARTICLE", "HEADER", "SPAN", "A"]
sliceTree(1, 76);
// = undefined
sliceTree(2, 5);
// = undefined
sliceTree(5, 4);
// = undefined
sliceTree(1, 23);
// = ["ARTICLE", "FOOTER"]
sliceTree(1, 22);
// = ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
sliceTree(11, 19);
// = ["SECTION", "P", "SPAN", "STRONG", "A"]