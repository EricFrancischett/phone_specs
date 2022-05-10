class Brands {
  bool? status;
  List<BrandModel>? data;

  Brands({this.status, this.data});

  Brands.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <BrandModel>[];
      json['data'].forEach((v) {
        data!.add(BrandModel.fromJson(v));
      });
    }
  }
}

class BrandModel {
  int? brandId;
  String? brandName;
  String? brandSlug;
  int? deviceCount;
  String? detail;

  BrandModel(
      {this.brandId,
      this.brandName,
      this.brandSlug,
      this.deviceCount,
      this.detail});

  BrandModel.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    deviceCount = json['device_count'];
    detail = json['detail'];
  }
}