import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/model/cursor_pagination_model.dart';

class RestaurantRatingStateNotifier extends StateNotifier<CursorPaginationBase> {
  RestaurantRatingStateNotifier() : super(
    CursorPaginationLoading(),
  );
}