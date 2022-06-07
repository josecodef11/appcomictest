
import 'dart:developer';
import 'package:appcomictest/Models/issues_model.dart';
import 'package:appcomictest/Models/issue_model.dart';
import 'package:appcomictest/constans.dart';
import 'package:dio/dio.dart';


class ApiService {
  final Dio _dio = Dio(kDioOptions);
  final Dio _dio2 = Dio();

  Future<IssuesModel?> getIssues() async {
    try {
     final response = await _dio.get('');
      if (response.statusCode == 200) {
        final _model = IssuesModel.fromMap(response.data);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
    Future<IssueModel?> comicDetail(String path) async {
    try {
     url=path+api;
     final response = await _dio2.get(url);
     if (response.statusCode == 200) {
     final _modelc = IssueModel.fromMap(response.data);
     return _modelc;  
      }
    } catch (e) {
      log(e.toString());
    }
  }
  
}
