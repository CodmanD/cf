import 'package:cats/model/fact.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';


//@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")

@RestApi(baseUrl: "http://localhost/facts/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
//  @GET('facts')
  @GET('f.json')
  Future<List<Fact>> getFact();
}


//
// @RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
// class ApiService {
//
//  // Dio? dio;
//   factory ApiService(Dio dio, {String? baseUrl}) {
//
//     String baseUrl= 'https://cat-fact.herokuapp.com';
//     dio.options = BaseOptions(
//       baseUrl: baseUrl!,
//       connectTimeout: 5000,
//       receiveTimeout: 3000,
//     );
//
//     return ApiService(dio, baseUrl:baseUrl);
//   }
//
//
//   @GET('facts')
//   static  Future<void> fetchFacts() async {
//       try {
//
//         String baseUrl= 'https://cat-fact.herokuapp.com';
//         BaseOptions options = BaseOptions(
//           baseUrl: baseUrl!,
//           connectTimeout: 5000,
//           receiveTimeout: 3000,
//         );
//
//         Dio dio = new Dio(options);
//
//
//
//
//         Response response = await dio.get("/facts");
//         print("---Response "+response.toString());
//         List result = response.data as List;
//         print("---Response List : "+result.toString());
//
//         // List<Fact> facts = result.isNotEmpty
//         //     ? result.map((item) {}
//         // )
//         //     : [];
//
//      // var res=  result.map((e) {print("----map :"+e.toString());}).toList();
//
//       //  print("---Result List : "+res.toString());
//         List<Fact> facts = result.isNotEmpty
//             ? result.map((item) => Fact.fromJson(item) ).toList()
//             : [];
//        // print("---Response Fact : "+facts.toString());
//        // return HttpResponse(isSuccess: true, data: facts);
//       } catch (error) {
//        // return HttpResponse(message: error);
//         print("---Error"+error.toString());
//       }
//
//   }
//
//
// }
