import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video extends Equatable {
  final String? id;
  final String? name;
  final String? key;
  final String? site;
  final String? publishedAt;
  const Video({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.publishedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      key,
      site,
      publishedAt,
    ];
  }
}
