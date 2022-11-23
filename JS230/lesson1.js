// function findAllParagraphs() {
//   let matches = [];
//   let nodes = document.body.childnodes;
//   for (let i = 0; i < nodes.length; i += 1) {
//     if (nodes[i] instanceof HTMLParagraphElement) {
//       matches.push(nodes[i]);
//     }
//   }
//   return matches;
// }

// console.log(findAllParagraphs());


function addClassToParagraphs(node) {
  if (node instanceof HTMLParagraphElement) {
    node.classList.add("article-text");
  }

  let nodes = node.childNodes;
  for (let index = 0; index < nodes.length; index += 1) {
    addClassToParagraphs(nodes[index]);
  }
}

addClassToParagraphs(document.body);