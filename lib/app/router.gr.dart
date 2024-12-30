// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:gridfind/gridfind.dart' as _i7;
import 'package:path_finding/node.dart' as _i9;
import 'package:path_finding/screens/animation_screen/animation_screen.dart'
    as _i1;
import 'package:path_finding/screens/config_screen/config_screen.dart' as _i2;
import 'package:path_finding/screens/doc_screen/doc_screen.dart' as _i3;
import 'package:path_finding/screens/position_config_screen/position_config_screen.dart'
    as _i4;
import 'package:path_finding/screens/stats_screen/stats_screen.dart' as _i5;

/// generated route for
/// [_i1.AnimationScreen]
class AnimationRoute extends _i6.PageRouteInfo<AnimationRouteArgs> {
  AnimationRoute({
    required _i7.PathFindingState state,
    required _i7.PathFindingStrategy<_i7.PathFindingState> alg,
    required String name,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AnimationRoute.name,
          args: AnimationRouteArgs(
            state: state,
            alg: alg,
            name: name,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnimationRouteArgs>();
      return _i1.AnimationScreen(
        args.state,
        args.alg,
        args.name,
        key: args.key,
      );
    },
  );
}

class AnimationRouteArgs {
  const AnimationRouteArgs({
    required this.state,
    required this.alg,
    required this.name,
    this.key,
  });

  final _i7.PathFindingState state;

  final _i7.PathFindingStrategy<_i7.PathFindingState> alg;

  final String name;

  final _i8.Key? key;

  @override
  String toString() {
    return 'AnimationRouteArgs{state: $state, alg: $alg, name: $name, key: $key}';
  }
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
    _i8.Key? key,
    required int width,
    required int height,
    required bool allowDiagonals,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PositionConfigRoute.name,
          args: PositionConfigRouteArgs(
            key: key,
            width: width,
            height: height,
            allowDiagonals: allowDiagonals,
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
        allowDiagonals: args.allowDiagonals,
      );
    },
  );
}

class PositionConfigRouteArgs {
  const PositionConfigRouteArgs({
    this.key,
    required this.width,
    required this.height,
    required this.allowDiagonals,
  });

  final _i8.Key? key;

  final int width;

  final int height;

  final bool allowDiagonals;

  @override
  String toString() {
    return 'PositionConfigRouteArgs{key: $key, width: $width, height: $height, allowDiagonals: $allowDiagonals}';
  }
}

/// generated route for
/// [_i5.StatsScreen]
class StatsRoute extends _i6.PageRouteInfo<StatsRouteArgs> {
  StatsRoute({
    _i8.Key? key,
    required _i7.Point start,
    required _i7.Point target,
    required List<List<_i9.Node>> grid,
    required bool allowDiagonals,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          StatsRoute.name,
          args: StatsRouteArgs(
            key: key,
            start: start,
            target: target,
            grid: grid,
            allowDiagonals: allowDiagonals,
          ),
          initialChildren: children,
        );

  static const String name = 'StatsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StatsRouteArgs>();
      return _i5.StatsScreen(
        key: args.key,
        start: args.start,
        target: args.target,
        grid: args.grid,
        allowDiagonals: args.allowDiagonals,
      );
    },
  );
}

class StatsRouteArgs {
  const StatsRouteArgs({
    this.key,
    required this.start,
    required this.target,
    required this.grid,
    required this.allowDiagonals,
  });

  final _i8.Key? key;

  final _i7.Point start;

  final _i7.Point target;

  final List<List<_i9.Node>> grid;

  final bool allowDiagonals;

  @override
  String toString() {
    return 'StatsRouteArgs{key: $key, start: $start, target: $target, grid: $grid, allowDiagonals: $allowDiagonals}';
  }
}
