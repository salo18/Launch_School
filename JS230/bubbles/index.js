// let divs = document.querySelectorAll('.pick');

// for(let index = 0; index < divs.length; index += 1) {
//   divs[index].addEventListener('click', highlightThis, true);
// }

// function highlightThis(e) {
//   alert(`${this.className} ${e.currentTarget.tagName}`);
// }

let elem1 = document.querySelector('#elem1');

elem1.addEventListener('click', event => alert(event.target.tagName));
elem1.addEventListener('click', event => alert(event.currentTarget.tagName));

