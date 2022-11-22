import 'package:equatable/equatable.dart';
import 'package:movies_app/data/models/cast_member_model.dart';

class CastResultModel {
  final List<CastMemberModel> castMembers;
  const CastResultModel({required this.castMembers});

  factory CastResultModel.fromJson(Map<String, dynamic> json) {
    final List<CastMemberModel> castMembers = List<CastMemberModel>.from(
        json['cast'].map((json) => CastMemberModel.fromJson(json)));
    return CastResultModel(castMembers: castMembers);
  }
}
