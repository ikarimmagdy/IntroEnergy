class IEPaymentServices{

  Future getProjectDetails() async {
    var result = await http.get('https://getProjectList');
    return result;
  }

}