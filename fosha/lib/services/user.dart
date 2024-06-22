import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fosha/core/network/http.dart';
import 'package:fosha/core/widgets/show_error_alert.dart';

class User {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  User(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
  }

  static Future login(context, username, password) async {
    try {
      Response response =
          await HttpHelper.post(url: "https://dummyjson.com/auth/login", body: {
        "username": username,
        "password": password,
      });
      String theResponse = response.body;

      if (response.statusCode != 200) {
        throw Exception(
            'This is a states exception code : ${response.statusCode}');
      }
      return theResponse;
    } catch (e) {
      return showDialog(
          context: context,
          builder: (_) {
            return ErrorAlert(
              errorMassege: "Login Error $e",
            );
          });
    }
  }
}
