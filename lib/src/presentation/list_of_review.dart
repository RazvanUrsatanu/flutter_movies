import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_redux/src/container/reviews_container.dart';
import 'package:movies_redux/src/container/users_container.dart';
import 'package:movies_redux/src/models/index.dart';

class ListOfReview extends StatelessWidget {
  const ListOfReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: UsersContainer(
              builder: (BuildContext context, Map<String, AppUser> users) {
                return ReviewsContainer(
                  builder: (BuildContext context, List<Review> reviews) {
                    final DateFormat format = DateFormat.yMMMMEEEEd().add_Hms();

                    return ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Review review = reviews[index];
                        final AppUser? user = users[review.uid];
                        return ListTile(
                          title: Text('${review.comment}${user == null ? '' : ' (${user.username})'}'),
                          subtitle: Text(format.format(review.createdAt.toLocal())),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
