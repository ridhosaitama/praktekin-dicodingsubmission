class DataUser{
  String name;
  String image;
  String email;


  DataUser({
    required this.name,
    required this.image,
    required this.email,
  });
}

var data = DataUser(
    name: 'Muhammad Ridho',
    image: 'images/profile-pic-50px.png',
    email: 'contoh@mail.com',
);