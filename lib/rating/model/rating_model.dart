import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/common/model/model_with_id.dart';
import 'package:untitled/uesr/model/user_model.dart';

import '../../common/utils/data_utils.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel implements IModelWithId{
  final String id;
  final UserModel user;
  final int rating;
  final String content;
  @JsonKey(
    fromJson: DataUtils.listPathsToUrls,
  )
  final List<String> imgUrls;

  RatingModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.content,
    required this.imgUrls,
  });
  
  factory RatingModel.fromJson(Map<String, dynamic> json)
  => _$RatingModelFromJson(json);
}
