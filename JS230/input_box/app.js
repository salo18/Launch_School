let cursorInterval;
let focusedText;

document.addEventListener('DOMContentLoaded', () => {
  let text = document.querySelector('.text-field');

  text.addEventListener('click', event => {
    event.stopPropagation();

    focusedText = text;
    text.classList.add('focused');

    if (!cursorInterval) {
      cursorInterval = setInterval(() => text.classList.toggle('cursor'), 500);
    }

    // cursorInterval = cursorInterval || setInterval(() => text.classList.toggle('cursor'), 500);
  });
});

document.addEventListener('keydown', event => {
  if (focusedText) {
    let contentDiv = focusedText.querySelector('.content');
    if (event.key === 'Backspace') {
      contentDiv.textContent = contentDiv.textContent.slice(0, -1);
    } else {
      contentDiv.textContent += event.key;
    }
  }
});

document.addEventListener('click', event => {
  clearInterval(cursorInterval);
  cursorInterval = null;
  if (focusedText) {
    text.classList.remove('focused');
    text.classList.remove('cursor');
    focusedText = null;
  }
  // let text = document.querySelector('.text-field');
});



// SCENARIO 1
// document.addEventListener('DOMContentLoaded', function() {
//   var textField = document.querySelector(".text-field");
//   var content = document.querySelector('.content');

//   textField.addEventListener('click', function(event) {
//     // event.stopPropagation();
//     console.log('textfield event listener fired');
//     this.classList.add('focused');
//   }, true)

//   document.addEventListener('click', function() {
//     console.log('document event listener fired');
//     var textField = document.querySelector(".text-field");
//     textField.classList.remove('focused');
//   })
// });


// SCENARIO 2
// document.addEventListener('DOMContentLoaded', function() {
//   var textField = document.querySelector(".text-field");
//   var content = document.querySelector('.content');

//   textField.addEventListener('click', function(event) {
//     // event.stopPropagation();
//     console.log('textfield event listener fired');
//     this.classList.add('focused');
//   }, true)

//   document.addEventListener('click', function() {
//     console.log('document event listener fired');
//     var textField = document.querySelector(".text-field");
//     textField.classList.remove('focused');
//   }, true)
// })
