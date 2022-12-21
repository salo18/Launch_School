









// let request = new XMLHttpRequest();

// request.addEventListener('load', event => {
//   let xhr = event.target;
// })


// let request = new XMLHttpRequest();
// request.open('POST', 'https://lsjs230-book-catalog.herokuapp.com/books');

// request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

// let data = 'title=Effective%20JavaScript&author=David%20Herman';

// request.addEventListener('load', () => {
//   if (request.status === 201) {
//     console.log(`This book was added to the catalog: ${request.responseText}`);
//   }
// });

// request.send(data);

// let request = new XMLHttpRequest();
// request.open('GET', 'https://api.github.com/repos/rails/rails');

// request.addEventListener('load', event => {
//   let data = JSON.parse(request.response);

//   // do something with data
// });

// request.send();





function createProduct(data) {
  let json = JSON.stringify(data);
  let request = new XMLHttpRequest();

  request.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/products');
  request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
  request.setRequestHeader('Authorization', 'token AUTH_TOKEN');

  request.addEventListener('load', () => {
    console.log(`This product was added: ${request.responseText}`);
  })
  request.send(json);

}



createProduct({
  name: 'sup',
  sku: 'abcd',
  price: '2',
});
