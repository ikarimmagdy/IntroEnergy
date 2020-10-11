import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intro_energy/models/IEConsumptionModel.dart';
import 'package:intro_energy/models/IEPaymentModel.dart';

import 'IENetworkConstants.dart';
import 'dart:async'; //for asynchronous features
import 'dart:convert';
class IENetworkManager {
  static _makeGetRequest(String url) async {
    // make GET request
    Response response = await http.get(url,headers: {"Content-Type": "application/json"});
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    final Map parsed = jsonDecode(json);

    return parsed;
  }

  static fetchPaymentList(String url) async {
    var map = await _makeGetRequest(url);
     return Test.fromJson(map).data;
  }

  static fetchConsumptionList(String url) async {
    var map = await _makeGetRequest(url);
    return IEConsumptionModel.fromJson(map).consumption;
  }
}
