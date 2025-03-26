// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable(includeIfNull: false)
class Member {
  final String? id;
  final String? createdAt;
  final String name;
  final String job;

  
  Member({
    this.id,
    this.createdAt,
    required this.name,
    required this.job,
  });


  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json); 
  Map<String, dynamic> toJson() => _$MemberToJson(this);
  
}
