import 'package:acq_test/dto/login.dart';
import 'package:acq_test/dto/member.dart';
import 'package:acq_test/dto/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_services.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class UserServices {
  factory UserServices(Dio dio) = _UserServices;

  @POST('/login')
  Future<HttpResponse> login(
    @Body() Login login
  );

  @GET('/users')
  Future<HttpResponse> getUser(
    @Query('page') int page
  );

  @POST('/user')
  Future<HttpResponse> createMember(
    @Body() Member member
  );
}