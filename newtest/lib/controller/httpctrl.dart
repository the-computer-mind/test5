// TODO Implement this library.
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as gg;
import 'package:newtest/datamodels/newsdatamodel.dart';
import 'package:newtest/globalVar.dart' as global;

class ControllerHttp extends gg.GetxController {
  var result = {}.obs;
  var changebutton = false.obs;

  Future loadData() async {
    changebutton.value = true;
    try {
      Dio dio;
      BaseOptions options = new BaseOptions(
          headers: {
            // 'Content-type': 'application/json; charset=UTF-8',
            "Authorization": "9d596d0da1c948b09b18cdfed8dd72fe",
          },
          baseUrl:
              "https://newsapi.org/v2/top-headlines?country=us&apiKey=9d596d0da1c948b09b18cdfed8dd72fe",
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10) // 10 seconds
          );

      dio = new Dio(options);
      Response response;

      try {
        response = await dio.get(
          "",
        );
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectionTimeout) {
          //showFirstDialog(context, "Connnection Problem Please Retry");
          changebutton = false.obs;
          throw Exception("Connection  Timeout Exception");
        }
        //showFirstDialog(context, "Something Went Wrong ${ex.message}");
        // button_press = false;
        throw Exception(ex.message);
      }
      // print(response);
      print("response");
      //print(response.data);
      // Map<String, dynamic> jsonMap = jsonDecode(jsonEncode(response.data));
      print(response.data["articles"][0]);
      print("hello ");
      global.newsResponse.value = await NewsResponse.fromJson(response.data);
      //result.value = response.data;
      print(global.newsResponse.value.totalResults);
      // print(global.newsResponse.value.articles![0]);
      // print(global.newsResponse.value.status); // "ok"
      // print(global.newsResponse.value.totalResults); // 38
      // print(global.newsResponse.value.articles![0].source!.name!); // "Reuters"
      // print(global.newsResponse.value.articles![0].title);
    } catch (err) {
      print(err);
      var erro = "Server is Busy Try Again Later";

      // _timer = Timer(const Duration(milliseconds: 70), () async {
      //   // Navigator.of(context, rootNavigator: false).pop();
      //   //showFirstDialog(context, erro);
      //   // await Future.delayed(Duration(seconds: 2));
      //   // Navigator.of(, rootNavigator: false).pop();
      // });
      return 4;
    }
  }
}
