// import 'dart:convert';
//
// import 'package:chopper/chopper.dart';
// import 'package:flutter/material.dart';
// import 'package:parsianotp/api_service.dart';
// import 'package:provider/provider.dart';
//
// class DetailPostPage extends StatelessWidget {
//   final int postId;
//
//   const DetailPostPage({Key? key, required this.postId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chopper Blog'),
//       ),
//       body: FutureBuilder<Response>(
//         future: Provider.of<ApiService>(context).getPost(postId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             final Map post = json.decode(snapshot.data!.bodyString);
//             return _buildPost(post);
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Padding _buildPost(Map post) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: <Widget>[
//           Text(
//             post['title'],
//             style: const TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(post['body']),
//         ],
//       ),
//     );
//   }
// }
