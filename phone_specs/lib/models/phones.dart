class Phones {
  bool? status;
  Data? data;

  Phones({this.status, this.data});

  Phones.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? title;
  int? currentPage;
  int? lastPage;
  List<PhoneModel>? phones;

  Data({this.title, this.currentPage, this.lastPage, this.phones});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    if (json['phones'] != null) {
      phones = <PhoneModel>[];
      json['phones'].forEach((v) {
        phones!.add(PhoneModel.fromJson(v));
      });
    }
  }
}

class PhoneModel {
  String? brand;
  String? phoneName;
  String? slug;
  String? image;
  String? detail;

  PhoneModel({this.brand, this.phoneName, this.slug, this.image, this.detail});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    phoneName = json['phone_name'];
    slug = json['slug'];
    image = json['image'];
    detail = json['detail'];
  }

}
