import 'package:dio/dio.dart';
import 'package:dog/models/breed.model.dart';

class Api {
  static Future retrieveDogBreed(String dogBreed) async {
    try {
      Response response =
          await Dio().get('https://dog.ceo/api/breed/$dogBreed/images/random');

      Breed breed = Breed.fromJson(response.data);

      return breed;
    } on DioError catch (e) {
      Breed breed = Breed.fromJson(e.response.data);

      return breed;
    }
  }

  static Future retrieveRandomDogBreed() async {
    try {
      Response response =
          await Dio().get('https://dog.ceo/api/breeds/image/random');

      Breed breed = Breed.fromJson(response.data);

      return breed;
    } on DioError catch (e) {
      Breed breed = Breed.fromJson(e.response.data);

      return breed;
    }
  }
}
