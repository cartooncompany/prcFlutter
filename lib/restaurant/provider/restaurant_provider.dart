import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/common/model/cursor_pagination_model.dart';
import 'package:untitled/restaurant/model/restaurant_model.dart';
import 'package:untitled/restaurant/repository/restaurant_repository.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, List<RestaurantModel>>(
  (ref) {
    final repository = ref.watch(restaurantRepositoryProvider);

    final notifier = RestaurantStateNotifier(repository: repository);
    return notifier;
   },
);

class RestaurantStateNotifier extends StateNotifier<CursorPagination> {
  final RestaurantRepository repository;

  RestaurantStateNotifier({
    required this.repository,
  }) : super(CursorPagination(meta: meta, data: data,)) {
    paginate();
  }

  paginate() async {
    final resp = await repository.paginate();
    state = resp.data;
  }
}
