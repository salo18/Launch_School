/*
- put event listener on each image
- if the image is clicked, put it inside the figure
- animate and color the border of the clicked image
// https://www.youtube.com/watch?v=9HcxHDS2w1s
*/

document.addEventListener('DOMContentLoaded', () => {
  const images = document.querySelectorAll('li img');

  let figureImg = document.getElementById('main-img');

  let text = figureImg.parentNode.querySelector('figcaption');

  images.forEach(img => {
    img.addEventListener('click', (e) => {
      e.preventDefault();

      let newImgSrc = e.target.getAttribute('src');

      figureImg.setAttribute('src', newImgSrc);

      images.forEach(link => link.classList.remove('active'));

      let currentImg = e.target;
      currentImg.classList.add('active');
      text.textContent = currentImg.getAttribute('alt');
    });
  });

  const buttons = document.querySelectorAll('[data-button]');

  buttons.forEach(button => {
    button.addEventListener('click', () => {

      const offset = button.dataset.button === 'next' ? 1 : -1;

      const slides = Array.prototype.slice.call(button.closest('#slideshow').querySelector('[data-images]').children);

      const ul = button.closest('#slideshow').querySelector('[data-images]');

      const activeImg = ul.querySelector('.active');

      let newIndex;
      if (activeImg !== null) {
        newIndex = slides.indexOf(activeImg.parentNode) + offset;
      } else { // no active image selected yet - first instance of app
        if (button.dataset.button === 'next') {
          newIndex = 1;
        } else if (button.dataset.button === 'previous') {
          newIndex = slides.length - 1;
        }
      }

      if (newIndex < 0) {
        newIndex = slides.length - 1;
      }
      if (newIndex >= slides.length) {
        newIndex = 0;
      }

      let src = slides[newIndex].querySelector('img').getAttribute('src');
      let alt = slides[newIndex].querySelector('img').getAttribute('alt');

      figureImg.setAttribute('src', src);

      slides[newIndex].querySelector('img').classList.add('active');
      activeImg.classList.remove('active');
      text.textContent = alt;


    });
  })
});

// $(function() {
//   let $slideshow = $('slideshow');
//   // let $nav = $slideshow.find('ul');
//   // console.log($nav);
//   let $nav = $('ul');

//   $nav.on('click', 'img', (e) => {
//     e.preventDefault();
//     let $li = $(e.currentTarget).closest('li');
//     console.log($li);
//   });
// });

