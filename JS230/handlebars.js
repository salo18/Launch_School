let post = {
  title: 'Lorem ipsum dolor sit amet',
  published: 'April 1, 2015',
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
};

// using jQuery
// let postTemplate = Handlbars.compile($('#post').html());

// using JS

let posts = [
  {
    title: 'test',
    published: 'June 10, 2000',
    body: 'somebody',
  }
];

posts.push(post);

let postTemplate1 = Handlebars.compile(document.getElementById('post').innerHtml);

$('body').append(postTemplate({posts: posts}));

post.body = '<p>' + post.body + '</p>';

post.tags = ['Food', 'BJJ', 'Surfing'];

Handlebars.registerPartial('tag', $('#tag').html());


