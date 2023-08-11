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
