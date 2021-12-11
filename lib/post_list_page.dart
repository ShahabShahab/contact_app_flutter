import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:parsianotp/api_service.dart';
import 'package:parsianotp/detail_post_page.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext mainContext) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<Response>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<ApiService>(mainContext).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)
          final List posts = json.decode(snapshot.data!.bodyString);
          return _buildPosts(mainContext, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext mainContext, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index]['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index]['body']),
            onTap: () => _navigateToPost(mainContext, posts[index]['id']),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPostPage(postId: id),
      ),
    );
  }
}
