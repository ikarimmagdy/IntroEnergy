import 'package:http/http.dart';

import 'IENetworkConstants.dart';

class IENetworkManager {

  _makeGetRequest() async {
    // make GET request
    Response response = await get(IENetworkConstants.payment);
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
  }
}
