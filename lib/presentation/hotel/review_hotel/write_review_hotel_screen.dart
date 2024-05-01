import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import 'widgets/appbar_review_hotel_widget.dart';
import 'widgets/content_write_review.dart';
import 'widgets/done_comment_btn.dart';

class WriteReviewHotelScreen extends StatefulWidget {
  const WriteReviewHotelScreen({super.key});

  @override
  State<WriteReviewHotelScreen> createState() => _WriteReviewHotelScreenState();
}

class _WriteReviewHotelScreenState extends State<WriteReviewHotelScreen> {
  final TextEditingController commentText = TextEditingController();

  @override
  void dispose() {
    commentText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarReviewHotelWidget(),
          SliverList(
              delegate: SliverChildListDelegate([
            ContentWriteReview(comment: commentText),
            DoneCommentBtn(comment: commentText),
          ])),
        ],
      ),
    );
  }
}

