import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TicketFlightCheckoutWidget extends StatelessWidget {
  const TicketFlightCheckoutWidget({
    required this.tittle,
    required this.subtitle,
    super.key,
  });
  final List<String> tittle;
  final List<String> subtitle;
  @override
  Widget build(BuildContext context) {
    //final l10n = context.l10n;
    final theme = Theme.of(context).textTheme;

    return Padding(
        padding: EdgeInsets.zero,
        child: Row(
          children: List.generate(
              3,
              (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tittle[index]),
                          Text(
                            subtitle[index],
                            style: theme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  )),
        ));
  }
}
