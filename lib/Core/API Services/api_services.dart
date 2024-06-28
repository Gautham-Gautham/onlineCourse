// import 'dart:io';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinecourse/Models/my_course_model.dart';

final apiProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  String BaseURL = "https://trogon.info/tutorpro/edspark/api/";
  static const String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM";
  var headers = {
    'auth_token':
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM",
  };
  Future<Mycourse> getMyCourse() async {
    Mycourse responseJson;
    try {
      final response = await http.get(
        Uri.parse(
          "https://trogon.info/tutorpro/edspark/api/my_course?auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM",
        ),
        headers: <String, String>{
          'auth_token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM",
        },
      );
      print("${BaseURL}${token}");
      print(response.statusCode);
      // print("-----------------------------------------");
      print(response.body);
      responseJson = Mycourse.fromMap(jsonDecode(response.body));
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<Mycourse> getLevel() async {
    Mycourse responseJson;
    // levels_by_course
    // Parameters:
    // course_id=1
    // section_id
    // auth_token

    try {
      final response = await http.get(
        Uri.parse(
          "https://trogon.info/tutorpro/edspark/api/levels_by_course?auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM",
        ),
        headers: <String, String>{
          'course_id':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM",
        },
      );
      print("${BaseURL}${token}");
      print(response.statusCode);
      // print("-----------------------------------------");
      print(response.body);
      responseJson = Mycourse.fromMap(jsonDecode(response.body));
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}
