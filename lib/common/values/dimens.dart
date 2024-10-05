import 'package:rada360/common/values/my_devices.dart';

class Dimens {
  Dimens._();

  static const double horizontal = 16.0;
  static const double vertical = 16.0;

  static const double toolbarHeight = 56.0;
  static const double toolbarIcon = 24.0;

  static const double radius4 = 4.0;
  static const double radius6 = 6.0;
  static const double radius8 = 8.0;
  static const double radius10 = 10.0;
  static const double radius13 = 13.0;
  static const double radius16 = 16.0;

  static const double iconSizeBottomNavigation = 28.0;
  static const double horizontalItemsListHeightLarge = 356;

  static const double heightAppNavView = 210;

  static double hSpace() {
    final hSpace = (MyDevices.screenWidth * 0.2) / 2;
    return MyDevices.get().isTablet ? hSpace : horizontal;
  }
}
