import 'package:flutter/material.dart';
import 'package:parsianotp/data_source/remote/rest_client.dart';
import 'package:parsianotp/models/posts_response.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  FutureBuilder<List<PostsResponse>> _buildBody(BuildContext mainContext) {
    // FutureBuilder is perfect for easily building UI when awaiting a Future
    // Response is the type currently returned by all the methods of PostApiService
    return FutureBuilder<List<PostsResponse>>(
      // In real apps, use some sort of state management (BLoC is cool)
      // to prevent duplicate requests when the UI rebuilds
      future: Provider.of<RestClient>(mainContext).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Snapshot's data is the Response
          // You can see there's no type safety here (only List<dynamic>)
          final List<PostsResponse> posts = snapshot.data;
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

  ListView _buildPosts(BuildContext mainContext, List<PostsResponse> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body),
            onTap: () => _navigateToPost(mainContext, posts[index].id),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    print('PostListPage._navigateToPost $id');
  }
}
