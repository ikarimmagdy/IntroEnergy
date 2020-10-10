import 'package:http/http.dart';
import 'package:intro_energy/network/IENetworkManager.dart';

import '../network/IENetworkConstants.dart';
import 'dart:convert';

class IEPaymentServices {

   static getPaymentList() async {
    var result =
        await IENetworkManager.fetchPaymentList(IENetworkConstants.payment);
    return result;
  }

   static getConsumptionList() async {
     var result =
     await IENetworkManager.fetchConsumptionList(IENetworkConstants.consumtion);
     return result;
   }
}
