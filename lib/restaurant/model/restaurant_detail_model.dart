import 'package:untitled/restaurant/model/restaurant_model.dart';

import '../../common/const/data.dart';

class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProduct> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantDetailModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      tags: List<String>.from(json['tags']),
      priceRange: RestaurantPriceRange.values.firstWhere(
        (e) => e.name == json['priceRange'],
      ),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      detail: json['detail'],
      products: json['products'].map<RestaurantProduct>(
        (e) => RestaurantProduct(
          id: e['id'],
          name: e['name'],
          imgUrl: e['imgUrl'],
          detail: e['detail'],
          price: e['price'],
        ),
      ).toList(),
    );
  }
}

class RestaurantProduct {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProduct({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });
}
