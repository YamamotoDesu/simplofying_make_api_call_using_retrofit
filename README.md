# [simplofying_make_api_call_using_retrofit](https://www.youtube.com/watch?v=zjNhlmue5Os)

## 📦️ Packages
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  retrofit: ^4.0.1
  dio: ^5.3.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0

  retrofit_generator: ^7.0.8
  build_runner: ^2.4.6
  json_serializable: ^6.7.1
```

## 🎨 Project Tree
```
- lib
  - main.dart
  - model
    - post_model.dart
    - post_model.g.dart
  - pages
    - home.dart
  - service
    - api_service.dart
    - api_service.g.dart
```

## ✨ Make API Call Using Retrofit

lib/model/post_model.dart
```dart
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  // factory PostModel.fromJson(Map<String, dynamic> json) {
  //   return PostModel(
  //     userId: json['userId'],
  //     id: json['id'],
  //     title: json['title'],
  //     body: json['body'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       'userId': userId,
  //       'id': id,
  //       'title': title,
  //       'body': body,
  //     };
}
```

lib/pages/home.dart
```dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../service/api_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1D1E22),
        title: const Text('Retrofit Example'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    final apiSercice =
        ApiService(Dio(BaseOptions(contentType: "applicaton/json")));
    return FutureBuilder(
      future: apiSercice.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final posts = snapshot.data;
          return _posts(posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _posts(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
    );
  }
}
```
