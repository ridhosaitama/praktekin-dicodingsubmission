class Content {
  String title;
  String description;
  String author;
  String image;
  String category;
  int likeCount;
  int viewCount;

  
  Content({
    required this.title,
    required this.description,
    required this.author,
    required this.image,
    required this.category,
    required this.likeCount,
    required this.viewCount,
  });
}

List <Content> contentListView =
[
  Content(title: 'lorem ipsum sit dolor amet conseptatum adipicing elit.' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Teknologi', likeCount: 55, viewCount: 690),
  Content(title: 'lorem ipsum Informasi' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Informasi', likeCount: 55, viewCount: 690),
  Content(title: 'lorem ipsum Komunikasi' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Komunikasi', likeCount: 55, viewCount: 690),
  Content(title: 'lorem ipsum Rekayasa' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Rekayasa', likeCount: 55, viewCount: 690),
  Content(title: 'lorem ipsum Bisnis' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Bisnis', likeCount: 55, viewCount: 690),
  Content(title: 'lorem ipsum Manajemen' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Manajemen', likeCount: 55, viewCount: 690),
  Content(title: 'lorem ipsum Kesehatan' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Kesehatan', likeCount: 55, viewCount: 690),
  Content(title: 'tech 2' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Teknologi', likeCount: 55, viewCount: 690),
  Content(title: 'tech 3' , description: 'description', author: 'author lipsum', image: 'images/150x150.jpg', category: 'Teknologi', likeCount: 55, viewCount: 690),

];