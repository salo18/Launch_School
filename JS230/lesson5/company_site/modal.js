// document.addEventListener('DOMContentLoaded', () => {
//   const team = document.getElementById('team-list');
//   // console.log(team);

//   team.addEventListener('click', (e) => {
//     e.preventDefault();

//     console.log(e.target);
//     const li = e.target.parentNode.parentNode;

//     const modal = li.children[0];
//     const overlay = li.children[1];

//     // modal.classList.remove('hidden');
//     // overlay.classList.remove('hidden');
//   });

//   // const overlay = document.querySelector('overlay');
//   // overlay.addEventListener('click', (e) => {
//   //   e.preventDefault();

//   //   overlay.classList.add('hidden');
//   // })

//   // document.addEventListener('keydown', (e) => {
//   //   if (e.key === 'Escape' && )
//   // })
// });

document.addEventListener('DOMContentLoaded', () => {
  let modal = document.getElementById('modal');
  let modalLayer = document.getElementById('modal-layer');
  let h3 = modal.querySelector('h3');
  let image = modal.querySelector('img');
  let p = modal.querySelector('p');
  let teamLinks = document.querySelectorAll('#team li > a');

  // console.log(teamLinks);
  const showModal = () => {
    event.preventDefault();
    let link = event.target.closest('a');
    h3.textContent = link.dataset.name;
    image.src = link.dataset.imageSource;
    image.alt = link.dataset.name;
    p.textContent = link.dataset.text;
    modalLayer.classList.replace('hide', 'show');
    modal.classList.replace('hide', 'show');
  }

  const hideModal = () => {
    event.preventDefault();
    h3.textContent = '';
    image.src = '';
    image.alt = '';
    p.textContent = '';
    modalLayer.classList.replace('show', 'hide');
    modal.classList.replace('show', 'hide');
  }

  teamLinks.forEach(link => link.addEventListener('click', showModal));
  document.querySelector('#modal-layer').addEventListener('click', hideModal);
  document.querySelector('#modal a.close').addEventListener('click', hideModal);
  document.addEventListener('keyup', (e) => {
    if (e.keyCode === 27) {
      hideModal();
    }
  })

});