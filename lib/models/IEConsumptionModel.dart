class IEConsumptionModel {
  List<Consumption> _consumption;

  IEConsumptionModel({List<Consumption> consumption}) {
    this._consumption = consumption;
  }

  List<Consumption> get consumption => _consumption;
  set consumption(List<Consumption> consumption) => _consumption = consumption;

  IEConsumptionModel.fromJson(Map<String, dynamic> json) {
    if (json['Consumption'] != null) {
      _consumption = new List<Consumption>();
      json['Consumption'].forEach((v) {
        _consumption.add(new Consumption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._consumption != null) {
      data['Consumption'] = this._consumption.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consumption {
  String _id;
  String _createdOn;
  String _amout;
  String _currency;
  String _consumption;
  String _unit;

  Consumption(
      {String id,
        String createdOn,
        String amout,
        String currency,
        String consumption,
        String unit}) {
    this._id = id;
    this._createdOn = createdOn;
    this._amout = amout;
    this._currency = currency;
    this._consumption = consumption;
    this._unit = unit;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get createdOn => _createdOn;
  set createdOn(String createdOn) => _createdOn = createdOn;
  String get amout => _amout;
  set amout(String amout) => _amout = amout;
  String get currency => _currency;
  set currency(String currency) => _currency = currency;
  String get consumption => _consumption;
  set consumption(String consumption) => _consumption = consumption;
  String get unit => _unit;
  set unit(String unit) => _unit = unit;

  Consumption.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _createdOn = json['createdOn'];
    _amout = json['amout'];
    _currency = json['currency'];
    _consumption = json['consumption'];
    _unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['createdOn'] = this._createdOn;
    data['amout'] = this._amout;
    data['currency'] = this._currency;
    data['consumption'] = this._consumption;
    data['unit'] = this._unit;
    return data;
  }
}