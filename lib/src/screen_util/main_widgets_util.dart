import 'dart:math' show min, max;
import 'dart:ui' as ui show FlutterView;

import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
import 'package:flutter/material.dart';

typedef FontSizeResolver = double Function(
    num fontSize, MainWidgetsUtil instance);

class MainWidgetsUtil {
  static BuildContext? _context;
  static const Size defaultSize = Size(360, 690);
  static final MainWidgetsUtil _instance = MainWidgetsUtil._();

  static bool Function() _enableScaleWH = () => true;
  static bool Function() _enableScaleText = () => true;

  /// UI设计中手机尺寸 , dp
  /// Size of the phone in UI Design , dp
  late Size _uiSize;

  ///屏幕方向
  late Orientation _orientation;

  late bool _minTextAdapt;
  late MediaQueryData _data;
  late bool _splitScreenMode;
  FontSizeResolver? fontSizeResolver;

  MainWidgetsUtil._();

  factory MainWidgetsUtil() => _instance;

  /// Enable scale
  ///
  /// if the enableWH return false, the width and the height scale ratio will be 1
  /// if the enableText return false, the text scale ratio will be 1
  ///
  static void enableScale(
      {bool Function()? enableWH, bool Function()? enableText}) {
    _enableScaleWH = enableWH ?? () => true;
    _enableScaleText = enableText ?? () => true;
  }

  /// Manually wait for window size to be initialized
  ///
  /// `Recommended` to use before you need access window size
  /// or in custom splash/bootstrap screen [FutureBuilder]
  ///
  /// example:
  /// ```dart
  /// ...
  /// ScreenUtil.init(context, ...);
  /// ...
  ///   FutureBuilder(
  ///     future: Future.wait([..., ensureScreenSize(), ...]),
  ///     builder: (context, snapshot) {
  ///       if (snapshot.hasData) return const HomeScreen();
  ///       return Material(
  ///         child: LayoutBuilder(
  ///           ...
  ///         ),
  ///       );
  ///     },
  ///   )
  /// ```
  ///
  static Future<void> ensureScreenSize([
    ui.FlutterView? window,
    Duration duration = const Duration(milliseconds: 10),
  ]) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();

    await Future.doWhile(() {
      window ??= binding.platformDispatcher.implicitView;

      if (window == null || window!.physicalSize.isEmpty) {
        return Future.delayed(duration, () => true);
      }

      return false;
    });

    binding.allowFirstFrame();
  }

  Set<Element>? _elementsToRebuild;

  /// ### Experimental
  /// Register current page and all its descendants to rebuild.
  /// Helpful when building for web and desktop
  static void registerToBuild(
    BuildContext context, [
    bool withDescendants = false,
  ]) {
    (_instance._elementsToRebuild ??= {}).add(context as Element);

    if (withDescendants) {
      context.visitChildren((element) {
        registerToBuild(element, true);
      });
    }
  }

  static void configure({
    MediaQueryData? data,
    Size? designSize,
    bool? splitScreenMode,
    bool? minTextAdapt,
    FontSizeResolver? fontSizeResolver,
  }) {
    try {
      if (data != null) {
        _instance._data = data;
      } else {
        data = _instance._data;
      }

      if (designSize != null) {
        _instance._uiSize = designSize;
      } else {
        designSize = _instance._uiSize;
      }
    } catch (_) {
      throw Exception(
          'You must either use ScreenUtil.init or ScreenUtilInit first');
    }

    final MediaQueryData? deviceData = data.nonEmptySizeOrNull();
    final Size deviceSize = deviceData?.size ?? designSize;

    final orientation = deviceData?.orientation ??
        (deviceSize.width > deviceSize.height
            ? Orientation.landscape
            : Orientation.portrait);

    _instance
      ..fontSizeResolver = fontSizeResolver ?? _instance.fontSizeResolver
      .._minTextAdapt = minTextAdapt ?? _instance._minTextAdapt
      .._splitScreenMode = splitScreenMode ?? _instance._splitScreenMode
      .._orientation = orientation;

    _instance._elementsToRebuild?.forEach((el) => el.markNeedsBuild());
  }

  /// Initializing the library.
  static void init(
    BuildContext context, {
    Size designSize = defaultSize,
    bool splitScreenMode = false,
    bool minTextAdapt = false,
    FontSizeResolver? fontSizeResolver,
  }) {
    final view = View.maybeOf(context);
    _context = context;
    configure(
      data: view != null ? MediaQueryData.fromView(view) : null,
      designSize: designSize,
      splitScreenMode: splitScreenMode,
      minTextAdapt: minTextAdapt,
      fontSizeResolver: fontSizeResolver,
    );
  }

  static bool get isTablet =>
      MainWidgetsUtil().deviceType(_context!) == DeviceType.tablet;

  ///获取屏幕方向
  ///Get screen orientation
  Orientation get orientation => _orientation;

  /// 每个逻辑像素的字体像素数，字体的缩放比例
  /// The number of font pixels for each logical pixel.
  double get textScaleFactor => _data.textScaleFactor;

  /// 设备的像素密度
  /// The size of the media in logical pixels (e.g, the size of the screen).
  double? get pixelRatio => _data.devicePixelRatio;

  /// 当前设备宽度 dp
  /// The horizontal extent of this size.
  double get screenWidth => _data.size.width;

  ///当前设备高度 dp
  ///The vertical extent of this size. dp
  double get screenHeight => _data.size.height;

  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top, in dp
  double get statusBarHeight => _data.padding.top;

  /// 底部安全区距离 dp
  /// The offset from the bottom, in dp
  double get bottomBarHeight => _data.padding.bottom;

  /// 实际尺寸与UI设计的比例
  /// The ratio of actual width to UI design
  double get scaleWidth => !_enableScaleWH() ? 1 : screenWidth / _uiSize.width;

  /// The ratio of actual height to UI design
  double get scaleHeight => !_enableScaleWH()
      ? 1
      : (_splitScreenMode ? max(screenHeight, 700) : screenHeight) /
          _uiSize.height;

  double get scaleText => !_enableScaleText()
      ? 1
      : (_minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth);

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///Adapt according to the smaller of width or height
  double radius(num r) => r * min(scaleWidth, scaleHeight);

  /// Adapt according to the both width and height
  double diagonal(num d) => d * scaleHeight * scaleWidth;

  /// Adapt according to the maximum value of scale width and scale height
  double diameter(num d) => d * max(scaleWidth, scaleHeight);

  ///Font size adaptation method
  ///- [fontSize] The size of the font on the UI design, in dp.
  double setSp(num fontSize) =>
      fontSizeResolver?.call(fontSize, _instance) ?? fontSize * scaleText;

  DeviceType deviceType(BuildContext context) {
    var deviceType = DeviceType.web;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      bool isMobile = defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android;
      bool isTablet =
          (orientation == Orientation.portrait && screenWidth >= 600) ||
              (orientation == Orientation.landscape && screenHeight >= 600);

      if (isMobile) {
        deviceType = isTablet ? DeviceType.tablet : DeviceType.mobile;
      } else {
        switch (defaultTargetPlatform) {
          case TargetPlatform.linux:
            deviceType = DeviceType.linux;
            break;
          case TargetPlatform.macOS:
            deviceType = DeviceType.mac;
            break;
          case TargetPlatform.windows:
            deviceType = DeviceType.windows;
            break;
          case TargetPlatform.fuchsia:
            deviceType = DeviceType.fuchsia;
            break;
          default:
            break;
        }
      }
    }

    return deviceType;
  }
}

extension on MediaQueryData? {
  MediaQueryData? nonEmptySizeOrNull() {
    if (this?.size.isEmpty ?? true) {
      return null;
    } else {
      return this;
    }
  }
}

enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
