// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CastMember extends Equatable {
  final int? id;
  final String? name;
  final String? profilePath;
  final String? character;
  const CastMember({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  @override
  List<Object?> get props => [id, name];
}
