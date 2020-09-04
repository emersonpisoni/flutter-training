class Breed {
  final String image;
  final String status;

  Breed({this.image, this.status});

  Breed.fromJson(Map jsonMap)
      : image = jsonMap['message'],
        status = jsonMap['status'];
}
