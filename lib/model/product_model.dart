import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? title;
  double? price;
  int? quantity;
  String? description;
  // String? category;
  String? foodImage;
  // Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.description,
    // this.category,
    this.foodImage,
    // this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        quantity: json["quantity"]!,
        foodImage: json["foodImage"],
        // rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "quantity": quantity,
        "foodImage": foodImage,
        // "rating": rating?.toJson(),
      };
}

// class Rating {
//   double? rate;
//   int? count;

//   Rating({
//     this.rate,
//     this.count,
//   });

//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"]?.toDouble(),
//         count: json["count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//       };
// }
