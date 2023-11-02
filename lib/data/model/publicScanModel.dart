import 'package:web_firebase_app/base/network/network-mappers.dart';

class PublicScanModel extends BaseMappable{
  int? status;
  String? description;
  String? flag;
  List<Body>? body;

  PublicScanModel({this.status, this.description, this.flag, this.body});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['description'] = this.description;
    data['flag'] = this.flag;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    status = json['status'];

    description = json['description'];
    flag = json['flag'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
    return PublicScanModel(status: status,description: description,flag: flag,body: body);
  }
}

class Body {
  String? sId;
  QrCode? qrCode;
  List<Products>? products;

  Body(
      {this.sId, this.qrCode, this.products,});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    qrCode =
    json['qrCode'] != null ? new QrCode.fromJson(json['qrCode']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.qrCode != null) {
      data['qrCode'] = this.qrCode!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class QrCode {
  String? id;
  String? value;
  String? referenceNumber;
  String? type;

  QrCode({this.id, this.value, this.referenceNumber, this.type});

  QrCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    referenceNumber = json['referenceNumber'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['referenceNumber'] = this.referenceNumber;
    data['type'] = this.type;
    return data;
  }
}

class Products {
  String? id;
  String? image;
  String? name;
  List<Values>? values;
  String? description;
  String? link;
  int? count;

  Products(
      {this.id,
        this.image,
        this.name,
        this.values,
        this.description,
        this.link,
        this.count});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
    description = json['description'];
    link = json['link'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['link'] = this.link;
    data['count'] = this.count;
    return data;
  }
}

class Values {
  Key? key;
  Key? value;

  Values({this.key, this.value});

  Values.fromJson(Map<String, dynamic> json) {
    key = json['key'] != null ? new Key.fromJson(json['key']) : null;
    value = json['value'] != null ? new Key.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.key != null) {
      data['key'] = this.key!.toJson();
    }
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Key {
  String? sId;
  String? name;

  Key({this.sId, this.name});

  Key.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}