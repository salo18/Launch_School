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


// function addClassToParagraphs(node) {
//   if (node instanceof HTMLParagraphElement) {
//     node.classList.add("article-text");
//   }

//   let nodes = node.childNodes;
//   for (let index = 0; index < nodes.length; index += 1) {
//     addClassToParagraphs(nodes[index]);
//   }
// }

// // addClassToParagraphs(document.body);

// function walk(node, callback) {
//   callback(node);

//   for (let index = 0; index < node.childNodes.length; index += 1) {
//     walk(node.childNodes[index], callback);
//   }
// }

// walk(document, node => {
//   if (node instanceof HTMLParagraphElement) {
//     node.classList.add('new-class');
//   }
// });


// function getElementsByTagName(tagName) {
//   let matches = [];

//   walk(document.body, (node) => {
//     if (node.nodeName.toLowerCase() === tagName) {
//       matches.push(node);
//     }
//   });

//   return matches;
// }

// getElementsByTagName("p").forEach((paragraph) =>
//   paragraph.classList.add("article-text")
// );


// function addClassToDivP() {
//   let child = document.getElementsByTagName('p');
//   child = Array.prototype.slice.call(child);

//   let ps = [];
//   child.forEach(node => {
//     if (node.parentNode.classList.contains('intro')) {
//     ps.push(node);
//     }
//   });

//   ps.forEach(node => node.classList.add('new-new'));
// }






let paragraph = document.createElement('p');
paragraph.textContent = 'this is a test';
document.body.appendChild(paragraph);


let text = document.createTextNode('This is a test');

paragraph.appendChild(text);
document.body.appendChild(paragraph);

let paragraph2 = paragraph.cloneNode(true);
document.body.appendChild(paragraph2);

paragraph.remove();
paragraph2.remove();



function walk(node) {
  console.log(node);
  for (let index = 0; index < node.childNodes.length; index += 1) {
    walk(node.childNodes[index]);
  }
}