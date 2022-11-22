import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchMoviesParameters extends Equatable {
  final String? queryText;
  const SearchMoviesParameters({
    this.queryText,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'query': queryText,
    };
  }

  String toJson() => json.encode(toMap());

  factory SearchMoviesParameters.fromMap(Map<String, dynamic> map) {
    return SearchMoviesParameters(
      queryText: map['query'] != null ? map['query'] as String : null,
    );
  }

  factory SearchMoviesParameters.fromJson(String source) =>
      SearchMoviesParameters.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [queryText];
}
