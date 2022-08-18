import 'package:cats/constants.dart';
import 'package:cats/model/fact.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET(FACTS_URL)
  Future<List<Fact>> getFact();
}
