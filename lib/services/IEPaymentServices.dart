import 'package:http/http.dart';

import '../network/IENetworkConstants.dart';

class IEPaymentServices{

  Future getProjectDetails() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var result = await http.get(url);
    return result;
  }

}


