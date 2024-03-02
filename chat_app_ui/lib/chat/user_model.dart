class UserModel {
  final String image;
  final String name;
  final String lastMsg;
  final String date;

  UserModel(
      {required this.image,
      required this.name,
      required this.lastMsg,
      required this.date});
}

List<UserModel> user = [
  UserModel(
      image:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/12DB/production/_104172840_gettyimages-923757862.jpg',
      name: 'Mo Salah',
      lastMsg: 'Hello, Mo',
      date: '12:00PM'),
  UserModel(
      image:
          'https://upload.wikimedia.org/wikipedia/commons/4/43/Ahmed_Mostafa_Zizo.jpg',
      name: 'Ahmed Sayed Zizo',
      lastMsg: 'Hello, Zizo',
      date: '11:00PM'),
  UserModel(
      image:
          'https://cdn1-m.alittihad.ae/store/archive/image/2024/2/29/9f9f29a4-051e-4094-8bb7-4138e7851db2.jpg',
      name: 'Shika',
      lastMsg: 'Hello',
      date: '02:00PM'),
  UserModel(
      image:
          'https://cdn1-m.alittihad.ae/store/archive/image/2024/2/29/9f9f29a4-051e-4094-8bb7-4138e7851db2.jpg',
      name: 'Omar Gaber',
      lastMsg: 'How are u?',
      date: '15:00PM'),
  UserModel(
      image:
          'https://cdn1-m.alittihad.ae/store/archive/image/2024/2/29/9f9f29a4-051e-4094-8bb7-4138e7851db2.jpg',
      name: 'Ahmed Fatouh',
      lastMsg: 'Thanks',
      date: '02:00PM'),
  UserModel(
      image:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/12DB/production/_104172840_gettyimages-923757862.jpg',
      name: 'Elshenawy',
      lastMsg: 'Thanks',
      date: '02:00PM'),
];
