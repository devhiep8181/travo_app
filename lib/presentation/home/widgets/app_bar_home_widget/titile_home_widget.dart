// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../../../core/app_export.dart';
import '../../../../l10n/l10n.dart';
import '../../../booking/book_and_review/blocs/contact/contact_bloc.dart';

class TitileHomeWidget extends StatefulWidget {
  const TitileHomeWidget({
    super.key,
  });

  @override
  State<TitileHomeWidget> createState() => _TitileHomeWidgetState();
}

class _TitileHomeWidgetState extends State<TitileHomeWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ContactBloc>().add(CallContactEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            if (state.contactStatus.isLoaded) {
              return Text('${l10n.hiText}${state.userEnity.displayName}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 24.sp));
            }
            return Text(l10n.hiText,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 24.sp));
          },
        ),
        Text(
          l10n.subTitileHome,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ColorConstant.whiteColor,
                fontSize: 12.sp,
              ),
        )
      ],
    );
  }
}
