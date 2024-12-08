// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:path_finding/algorithm.dart' as _i8;
import 'package:path_finding/screens/animation_screen/animation_screen.dart'
    as _i1;
import 'package:path_finding/screens/config_screen/config_screen.dart' as _i2;
import 'package:path_finding/screens/doc_screen/doc_screen.dart' as _i3;
import 'package:path_finding/screens/position_config_screen/position_config_screen.dart'
    as _i4;
import 'package:path_finding/screens/stats_screen/stats_screen.dart' as _i5;

/// generated route for
/// [_i1.AnimationScreen]
class AnimationRoute extends _i6.PageRouteInfo<void> {
  const AnimationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AnimationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnimationScreen();
    },
  );
}

/// generated route for
/// [_i2.ConfigScreen]
class ConfigRoute extends _i6.PageRouteInfo<void> {
  const ConfigRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfigRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ConfigScreen();
    },
  );
}

/// generated route for
/// [_i3.DocScreen]
class DocRoute extends _i6.PageRouteInfo<void> {
  const DocRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DocRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.DocScreen();
    },
  );
}

/// generated route for
/// [_i4.PositionConfigScreen]
class PositionConfigRoute extends _i6.PageRouteInfo<PositionConfigRouteArgs> {
  PositionConfigRoute({
    _i7.Key? key,
    required int width,
    required int height,
    required _i8.Algorithm alg,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PositionConfigRoute.name,
          args: PositionConfigRouteArgs(
            key: key,
            width: width,
            height: height,
            alg: alg,
          ),
          initialChildren: children,
        );

  static const String name = 'PositionConfigRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PositionConfigRouteArgs>();
      return _i4.PositionConfigScreen(
        key: args.key,
        width: args.width,
        height: args.height,
        alg: args.alg,
      );
    },
  );
}

class PositionConfigRouteArgs {
  const PositionConfigRouteArgs({
    this.key,
    required this.width,
    required this.height,
    required this.alg,
  });

  final _i7.Key? key;

  final int width;

  final int height;

  final _i8.Algorithm alg;

  @override
  String toString() {
    return 'PositionConfigRouteArgs{key: $key, width: $width, height: $height, alg: $alg}';
  }
}

/// generated route for
/// [_i5.StatsScreen]
class StatsRoute extends _i6.PageRouteInfo<void> {
  const StatsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          StatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.StatsScreen();
    },
  );
}
