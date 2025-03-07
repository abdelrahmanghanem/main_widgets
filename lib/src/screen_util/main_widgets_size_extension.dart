// import 'package:flutter/material.dart';
//
// import 'main_widgets_util.dart';
//
// extension MainWidgetsSizeExtension on num {
//   ///[MainWidgetsUtil.setWidth]
//   double get ww => MainWidgetsUtil().setWidth(this);
//
//   ///[MainWidgetsUtil.setHeight]
//   double get hh => MainWidgetsUtil().setHeight(this);
//
//   ///[MainWidgetsUtil.radius]
//   double get rr => MainWidgetsUtil().radius(this);
//
//   ///Multiple of screen width
//   double get sww => MainWidgetsUtil().screenWidth * this;
//
//   ///Multiple of screen height
//   double get shh => MainWidgetsUtil().screenHeight * this;
//
//   double get spp => MainWidgetsUtil().setSp(this);
// }
//
// extension MainWidgetsEdgeInsetsExtension on EdgeInsets {
//   /// Creates adapt insets using r [MainWidgetsSizeExtension].
//   EdgeInsets get rr => copyWith(
//         top: top.rr,
//         bottom: bottom.rr,
//         right: right.rr,
//         left: left.rr,
//       );
//
//   EdgeInsets get ww => copyWith(
//         top: top.ww,
//         bottom: bottom.ww,
//         right: right.ww,
//         left: left.ww,
//       );
//
//   EdgeInsets get hh => copyWith(
//         top: top.hh,
//         bottom: bottom.hh,
//         right: right.hh,
//         left: left.hh,
//       );
// }
//
// extension MainWidgetsBorderRadiusExtension on BorderRadius {
//   /// Creates adapt BorderRadius using r [MainWidgetsSizeExtension].
//   BorderRadius get rr => copyWith(
//         bottomLeft: bottomLeft.rr,
//         bottomRight: bottomRight.rr,
//         topLeft: topLeft.rr,
//         topRight: topRight.rr,
//       );
//
//   BorderRadius get ww => copyWith(
//         bottomLeft: bottomLeft.ww,
//         bottomRight: bottomRight.ww,
//         topLeft: topLeft.ww,
//         topRight: topRight.ww,
//       );
//
//   BorderRadius get hh => copyWith(
//         bottomLeft: bottomLeft.hh,
//         bottomRight: bottomRight.hh,
//         topLeft: topLeft.hh,
//         topRight: topRight.hh,
//       );
// }
//
// extension MainWidgetsRadiusExtension on Radius {
//   /// Creates adapt Radius using r [MainWidgetsSizeExtension].
//   Radius get rr => Radius.elliptical(x.rr, y.rr);
//
//   Radius get ww => Radius.elliptical(x.ww, y.ww);
//
//   Radius get hh => Radius.elliptical(x.hh, y.hh);
// }
//
// extension MainWidgetsBoxConstraintsExtension on BoxConstraints {
//   BoxConstraints get rr => copyWith(
//         maxHeight: maxHeight.rr,
//         maxWidth: maxWidth.rr,
//         minHeight: minHeight.rr,
//         minWidth: minWidth.rr,
//       );
//
//   BoxConstraints get ww => copyWith(
//         maxHeight: maxHeight.ww,
//         maxWidth: maxWidth.ww,
//         minHeight: minHeight.ww,
//         minWidth: minWidth.ww,
//       );
//
//   BoxConstraints get hh => copyWith(
//         maxHeight: maxHeight.hh,
//         maxWidth: maxWidth.hh,
//         minHeight: minHeight.hh,
//         minWidth: minWidth.hh,
//       );
// }
