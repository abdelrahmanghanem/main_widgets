// import 'package:flutter/material.dart';
// import 'package:main_widgets/src/screen_util/main_widgets_size_extension.dart';
//
// import '../widgets/responsive_widget.dart';
//
// class FontWeightManager {
//   FontWeightManager._();
//   static const FontWeight light = FontWeight.w300;
//   static const FontWeight regular = FontWeight.w400;
//   static const FontWeight medium = FontWeight.w500;
//   static const FontWeight semiBold = FontWeight.w600;
//   static const FontWeight bold = FontWeight.w700;
// }
//
// class FontSize {
//   FontSize._();
//
//   static double get s1 => 1.spp;
//   static double get s2 => 2.spp;
//   static double get s3 => 3.spp;
//   static double get s4 => 4.spp;
//   static double get s5 => 5.spp;
//   static double get s6 => 6.spp;
//   static double get s7 => 7.spp;
//   static double get s8 => 8.0.spp;
//   static double get s9 => 9.0.spp;
//   static double get s10 => 10.0.spp;
//   static double get s11 => 11.0.spp;
//   static double get s12 => 12.0.spp;
//   static double get s13 => 13.0.spp;
//   static double get s14 => 14.0.spp;
//   static double get s15 => 15.0.spp;
//   static double get s16 => 16.0.spp;
//   static double get s17 => 17.0.spp;
//   static double get s18 => 18.0.spp;
//   static double get s19 => 19.0.spp;
//   static double get s20 => 20.0.spp;
//   static double get s21 => 21.0.spp;
//   static double get s22 => 22.0.spp;
//   static double get s23 => 23.0.spp;
//   static double get s24 => 24.0.spp;
//   static double get s25 => 25.0.spp;
//   static double get s26 => 26.0.spp;
//   static double get s28 => 28.0.spp;
//   static double get s32 => 32.0.spp;
//   static double get s36 => 36.0.spp;
//   static double get s40 => 40.0.spp;
//   static double get s44 => 44.0.spp;
//   static double get s48 => 48.0.spp;
//   static double get s52 => 52.0.spp;
//   static double get s56 => 56.0.spp;
// }
//
// class ResponsiveFontSize {
//   static double get s9 => getResponsiveSize(
//         mobile: FontSize.s9,
//         tabletPortrait: FontSize.s3,
//         tabletLandscape: FontSize.s3,
//       );
//   static double get s10 => getResponsiveSize(
//         mobile: FontSize.s10,
//         tabletPortrait: FontSize.s4,
//         tabletLandscape: FontSize.s4,
//       );
//   static double get s11 => getResponsiveSize(
//         mobile: FontSize.s11,
//         tabletPortrait: FontSize.s5,
//         tabletLandscape: FontSize.s5,
//       );
//   static double get s12 => getResponsiveSize(
//         mobile: FontSize.s12,
//         tabletPortrait: FontSize.s6,
//         tabletLandscape: FontSize.s6,
//       );
//   static double get s13 => getResponsiveSize(
//         mobile: FontSize.s13,
//         tabletPortrait: FontSize.s7,
//         tabletLandscape: FontSize.s7,
//       );
//   static double get s14 => getResponsiveSize(
//         mobile: FontSize.s14,
//         tabletPortrait: FontSize.s8,
//         tabletLandscape: FontSize.s8,
//       );
//   static double get s15 => getResponsiveSize(
//         mobile: FontSize.s15,
//         tabletPortrait: FontSize.s9,
//         tabletLandscape: FontSize.s9,
//       );
//   static double get s16 => getResponsiveSize(
//         mobile: FontSize.s16,
//         tabletPortrait: FontSize.s10,
//         tabletLandscape: FontSize.s10,
//       );
//   static double get s17 => getResponsiveSize(
//         mobile: FontSize.s17,
//         tabletPortrait: FontSize.s11,
//         tabletLandscape: FontSize.s11,
//       );
//   static double get s18 => getResponsiveSize(
//         mobile: FontSize.s18,
//         tabletPortrait: FontSize.s12,
//         tabletLandscape: FontSize.s12,
//       );
//   static double get s19 => getResponsiveSize(
//         mobile: FontSize.s19,
//         tabletPortrait: FontSize.s13,
//         tabletLandscape: FontSize.s13,
//       );
//   static double get s20 => getResponsiveSize(
//         mobile: FontSize.s20,
//         tabletPortrait: FontSize.s14,
//         tabletLandscape: FontSize.s14,
//       );
//   static double get s21 => getResponsiveSize(
//         mobile: FontSize.s21,
//         tabletPortrait: FontSize.s15,
//         tabletLandscape: FontSize.s15,
//       );
//   static double get s22 => getResponsiveSize(
//         mobile: FontSize.s22,
//         tabletPortrait: FontSize.s16,
//         tabletLandscape: FontSize.s16,
//       );
//   static double get s23 => getResponsiveSize(
//         mobile: FontSize.s23,
//         tabletPortrait: FontSize.s17,
//         tabletLandscape: FontSize.s17,
//       );
//   static double get s24 => getResponsiveSize(
//         mobile: FontSize.s24,
//         tabletPortrait: FontSize.s18,
//         tabletLandscape: FontSize.s18,
//       );
//   static double get s25 => getResponsiveSize(
//         mobile: FontSize.s25,
//         tabletPortrait: FontSize.s19,
//         tabletLandscape: FontSize.s19,
//       );
//   static double get s26 => getResponsiveSize(
//         mobile: FontSize.s26,
//         tabletPortrait: FontSize.s20,
//         tabletLandscape: FontSize.s20,
//       );
//   static double get s28 => getResponsiveSize(
//         mobile: FontSize.s28,
//         tabletPortrait: FontSize.s20,
//         tabletLandscape: FontSize.s20,
//       );
//   static double get s32 => getResponsiveSize(
//         mobile: FontSize.s32,
//         tabletPortrait: FontSize.s23,
//         tabletLandscape: FontSize.s23,
//       );
//   static double get s36 => getResponsiveSize(
//         mobile: FontSize.s36,
//         tabletPortrait: FontSize.s26,
//         tabletLandscape: FontSize.s26,
//       );
//
//   static double get s40 => getResponsiveSize(
//         mobile: FontSize.s40,
//         tabletPortrait: FontSize.s28,
//         tabletLandscape: FontSize.s28,
//       );
//   static double get s44 => getResponsiveSize(
//         mobile: FontSize.s44,
//         tabletPortrait: FontSize.s28,
//         tabletLandscape: FontSize.s28,
//       );
//   static double get s48 => getResponsiveSize(
//         mobile: FontSize.s48,
//         tabletPortrait: FontSize.s32,
//         tabletLandscape: FontSize.s32,
//       );
//   static double get s52 => getResponsiveSize(
//         mobile: FontSize.s52,
//         tabletPortrait: FontSize.s36,
//         tabletLandscape: FontSize.s36,
//       );
//   static double get s56 => getResponsiveSize(
//         mobile: FontSize.s56,
//         tabletPortrait: FontSize.s36,
//         tabletLandscape: FontSize.s36,
//       );
//   static double get mobile => getResponsiveSize(
//         mobile: FontSize.s24,
//         tabletPortrait: FontSize.s13,
//         tabletLandscape: FontSize.s10,
//       );
// }
