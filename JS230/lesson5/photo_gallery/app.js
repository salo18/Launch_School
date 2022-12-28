/*
- put event listener on each image
- if the image is clicked, put it inside the figure
- animate and color the border of the clicked image

*/

document.addEventListener('DOMContentLoaded', () => {
  const images = document.querySelectorAll('li img');

  let figureImg = document.getElementById('main-img');

  images.forEach(img => {
    img.addEventListener('click', (e) => {
      e.preventDefault();
      // let currentImg = document.querySelector('.current');
      // currentImg.classList.remove('current');
      // console.log(currentImg);

      // let x = images.querySelectorAll('current');
      // console.log(images);

      let newImgSrc = e.target.getAttribute('src');

      // console.log(newImgSrc);
      figureImg.setAttribute('src', newImgSrc);

      images.forEach(link => link.classList.remove('active'));

      let currentImg = e.target;
      currentImg.classList.add('active');
      // newImg.classList.toggle('current');
      // figureImg.getAttribute('title')
      // console.log(newImg);
    });
  });

  const buttons = document.querySelectorAll('[data-button]');

  buttons.forEach(button => {
    button.addEventListener('click', () => {
      const offset = button.dataset.button === 'next' ? 1 : -1;
      const slides = button.closest('#slideshow').querySelector('[data-images]');
      // console.log(slides);

      const activeImg = slides.querySelector('.active') || 1;

      console.log(activeImg);
      let newIndex;
      if (activeImg) {
        newIndex = [...slides.children].indexOf(activeImg) + offset;
      } else {
        newIndex = 0;
      }
      // console.log(activeImg);
      // console.log(newIndex);
      console.log([...slides.children].indexOf(activeImg));
    });
  })
  // console.log(buttons);
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

