// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import '../../../../../domain/entities/place_entity.dart';
import 'builder_grid_view_widget.dart';

class PlaceLoadedWiget extends StatelessWidget {
  const PlaceLoadedWiget({
    required this.listData,
    super.key,
  });

  final List<PlaceEntity> listData;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            BuilderGridViewWidget(listData: listData, index: index),
        childCount: listData.length,
      ),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
    );
  }
}
