import '../../../../core/app_export.dart';
import '../../../../gen/assets.gen.dart';

Map<String, dynamic> selectRoomData = {
  '24_HOURS_FRONT_DESK': {
    TextConstant.keyTitle: '24-hours',
    TextConstant.keySubtitle: ' Front Desk',
    TextConstant.keyColor: ColorConstant.tealColor.withOpacity(0.5),
    TextConstant.keyImage: Assets.images.reception
  },
  'CURRENCY_EXCHANGE': {
    TextConstant.keyTitle: 'Currency',
    TextConstant.keySubtitle: 'Exchange',
    TextConstant.keyColor: ColorConstant.salmonPinkColor,
    TextConstant.keyImage: Assets.images.exchange
  },
  'FREE_BREAKFAST': {
    TextConstant.keyTitle: 'Free',
    TextConstant.keySubtitle: 'Breakfast',
    TextConstant.keyColor: ColorConstant.salmonPinkColor,
    TextConstant.keyImage: Assets.images.forkPink
  },
  'FREE_WIFI': {
    TextConstant.keyTitle: 'Free',
    TextConstant.keySubtitle: 'Wifi',
    TextConstant.keyColor: ColorConstant.lightBuleColor,
    TextConstant.keyImage: Assets.images.wifiViolet
  },
  'WIFI': {
    TextConstant.keyTitle: 'Wifi',
    TextConstant.keySubtitle: '',
    TextConstant.keyColor: ColorConstant.deepCarrotOrangeColor.withOpacity(0.5),
    TextConstant.keyImage: Assets.images.wifi
  },
  'NON_REFUNDABLE': {
    TextConstant.keyTitle: 'Non-',
    TextConstant.keySubtitle: 'Refundable',
    TextConstant.keyColor: ColorConstant.palePeachColor,
    TextConstant.keyImage: Assets.images.dollar
  },
  'NON_SMOKING': {
    TextConstant.keyTitle: 'Non-',
    TextConstant.keySubtitle: 'smoking',
    TextConstant.keyColor: ColorConstant.tealColor.withOpacity(0.5),
    TextConstant.keyImage: Assets.images.noSmoking
  },
  'ROOM_SERVICE': {
    TextConstant.keyTitle: 'Room',
    TextConstant.keySubtitle: 'Service',
    TextConstant.keyColor: ColorConstant.tealColor.withOpacity(0.5),
    TextConstant.keyImage: Assets.images.reception
  },
  'RESTAURANT': {
    TextConstant.keyTitle: 'Restaurant',
    TextConstant.keySubtitle: '',
    TextConstant.keyColor: ColorConstant.lightBuleColor,
    TextConstant.keyImage: Assets.images.fork
  },
  'MORE': {
    TextConstant.keyTitle: 'More',
    TextConstant.keySubtitle: '',
    TextConstant.keyColor: ColorConstant.midnightBlue.withOpacity(0.5),
    TextConstant.keyImage: Assets.images.group14,
  }
};

final List<String> keyServices = [
  'RESTAURANT',
  'WIFI',
  'CURRENCY_EXCHANGE',
  '24_HOURS_FRONT_DESK',
  'MORE'
];
