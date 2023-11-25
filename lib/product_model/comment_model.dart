import 'package:hive_flutter/hive_flutter.dart';
part 'comment_model.g.dart';

@HiveType(typeId: 1)
class CommentModel extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  CommentModel({required this.title, required this.description});
  
}