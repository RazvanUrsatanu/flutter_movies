import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies_redux/src/models/index.dart';
import 'package:redux/redux.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Review>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Review>>(
      converter: (Store<AppState> store) => store.state.reviews.toList()
        ..sort((Review a, Review b) {
          return b.createdAt.compareTo(a.createdAt);
        }),
      builder: builder,
    );
  }
}
