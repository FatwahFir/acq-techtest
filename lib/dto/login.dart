import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(createFactory: false)
class Login {
  final String email;
  final String password;
  Login({
    required this.email,
    required this.password,
  });


  Map<String, dynamic> toJson() => _$LoginToJson(this); 
  
}
