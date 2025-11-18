
import 'dart:convert';

BannerModel bannerResponseFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerResponseToJson(BannerModel data) =>
    json.encode(data.toJson());

class BannerModel {
  final bool success;
  final int count;
  final List<BannerItem> banners;

  BannerModel({
    required this.success,
    required this.count,
    required this.banners,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    success: json["success"] ?? false,
    count: json["count"] ?? 0,
    banners: json["banners"] != null
        ? List<BannerItem>.from(
        json["banners"].map((x) => BannerItem.fromJson(x)))
        : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
  };
}

class BannerItem {
  final String id;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  BannerItem({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
    id: json["_id"] ?? "",
    image: json["image"] ?? "",
    createdAt: json["createdAt"] != null
        ? DateTime.parse(json["createdAt"])
        : DateTime.now(),
    updatedAt: json["updatedAt"] != null
        ? DateTime.parse(json["updatedAt"])
        : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}