import 'package:json_annotation/json_annotation.dart';

/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
part 'posts_response.g.dart';

@JsonSerializable(includeIfNull: false)
class PostsResponse {
  int userId;

  int id;

  String title;

  String body;

  PostsResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostsResponse.fromJson(dynamic json) => _$PostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsResponseToJson(this);
}
