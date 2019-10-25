import 'package:http/http.dart' as http;  // api
import 'dart:async';
import 'dart:convert';


class Handler {
  final int id;

  Handler(this.id);
}

class Post {
  final int id;
  final String userId;
  final String searchContent;

  Post({this.id, this.userId, this.searchContent});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;
    map["searchContent"] = searchContent;
    return map;
  }
}

Future<ImageLinks> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return ImageLinks.fromJson(json.decode(response.body));
  });
}

class ImageLinks {
  final int id;
  final String userId;
  final List<String> paths;

  ImageLinks({this.id, this.userId, this.paths});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks (
      id: json["id"],
      userId: json["userId"],
      paths: json["paths"],
    );
  }
}