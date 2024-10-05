/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/ms_star_loading.json
  String get msStarLoading => 'assets/animations/ms_star_loading.json';

  /// List of all assets
  List<String> get values => [msStarLoading];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SVN-Gilroy Bold.otf
  String get sVNGilroyBold => 'assets/fonts/SVN-Gilroy Bold.otf';

  /// File path: assets/fonts/SVN-Gilroy Light.otf
  String get sVNGilroyLight => 'assets/fonts/SVN-Gilroy Light.otf';

  /// File path: assets/fonts/SVN-Gilroy Medium.otf
  String get sVNGilroyMedium => 'assets/fonts/SVN-Gilroy Medium.otf';

  /// File path: assets/fonts/SVN-Gilroy Regular.otf
  String get sVNGilroyRegular => 'assets/fonts/SVN-Gilroy Regular.otf';

  /// File path: assets/fonts/SVN-Gilroy SemiBold.otf
  String get sVNGilroySemiBold => 'assets/fonts/SVN-Gilroy SemiBold.otf';

  /// List of all assets
  List<String> get values => [
        sVNGilroyBold,
        sVNGilroyLight,
        sVNGilroyMedium,
        sVNGilroyRegular,
        sVNGilroySemiBold
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_mobile.png
  AssetGenImage get icMobile =>
      const AssetGenImage('assets/icons/ic_mobile.png');

  /// List of all assets
  List<AssetGenImage> get values => [icMobile];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
