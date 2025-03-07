import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/restaurant/component/restaurant_card.dart';
import 'package:untitled/restaurant/provider/restaurant_provider.dart';
import 'package:untitled/restaurant/view/restaurant_detail_screen.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if(data.length == 0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (_, index) {
          final pItem = data[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RestaurantDetailScreen(
                      id: pItem.id,
                    ),
                  ),
                );
              },
              child: RestaurantCard.fromModel(model: pItem));
        },
        separatorBuilder: (_, int index) {
          return const SizedBox(
            height: 16.0,
          );
        },
      ),
    );
  }
}
