class Specifications {
  bool? status;
  InfoData? data;

  Specifications({this.status, this.data});

  Specifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? InfoData.fromJson(json['data']) : null;
  }
}

class InfoData {
  String? brand;
  String? phoneName;
  String? thumbnail;
  List<String>? phoneImages;
  String? releaseDate;
  String? dimension;
  String? os;
  String? storage;
  List<SpecificationsModel>? specifications;

  InfoData(
      {this.brand,
      this.phoneName,
      this.thumbnail,
      this.phoneImages,
      this.releaseDate,
      this.dimension,
      this.os,
      this.storage,
      this.specifications});

  InfoData.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    phoneName = json['phone_name'];
    thumbnail = json['thumbnail'];
    phoneImages = json['phone_images'].cast<String>();
    releaseDate = json['release_date'];
    dimension = json['dimension'];
    os = json['os'];
    storage = json['storage'];
    if (json['specifications'] != null) {
      specifications = <SpecificationsModel>[];
      json['specifications'].forEach((v) {
        specifications!.add(SpecificationsModel.fromJson(v));
      });
    }
  }
}

class SpecificationsModel {
  String? title;
  List<Specs>? specs;

  SpecificationsModel({this.title, this.specs});

  SpecificationsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['specs'] != null) {
      specs = <Specs>[];
      json['specs'].forEach((v) {
        specs!.add(Specs.fromJson(v));
      });
    }
  }
}

class Specs {
  String? key;
  List<String>? val;

  Specs({this.key, this.val});

  Specs.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    val = json['val'].cast<String>();
  }
}