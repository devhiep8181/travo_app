// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../widgets/custom_dialog.dart';
import '../../bloc/place/place_bloc.dart';
import 'place_grid_view_widget/place_loaded_widget.dart';

class PlaceGridViewWidget extends StatelessWidget {
  const PlaceGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceBloc, PlaceState>(
      builder: (context, state) {
        if (state is PlaceLoading) {
          return const SliverAppBar(
            title: Center(child: CircularProgressIndicator()),
          );
        } else if (state is PlaceLoaded) {
          final listData = state.listPlaceEntity;
          return PlaceLoadedWiget(listData: listData);
        } 
        else {
          return const SliverAppBar(
            title: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
