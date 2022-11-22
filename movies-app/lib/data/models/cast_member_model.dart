import 'package:movies_app/domain/entities/cast_member.dart';

class CastMemberModel extends CastMember {
  const CastMemberModel({
    required super.id,
    required super.name,
    required super.profilePath,
    required super.character,
  });

  factory CastMemberModel.fromJson(Map<String, dynamic> json) {
    return CastMemberModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'] ?? '/kuqFzlYMc2IrsOyPznMd1FroeGq.jpg',
      character: json['character'],
    );
  }
}
