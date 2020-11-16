import 'package:flutter/material.dart';

enum DeviceSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

class DeviceSizeBuilder<T> {
  const DeviceSizeBuilder({
    this.base,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  final T base;
  final T xs;
  final T sm;
  final T md;
  final T lg;
  final T xl;
}

extension BuildContextX on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double heightInPercent(double percent) => height * percent;
  double widthInPercent(double percent) => width * percent;

  DeviceSize get deviceSize {
    // min width
    const xs = 300;
    const sm = 640;
    const md = 720;
    const lg = 1024;
    const xl = 1280;

    if (width >= xs && width < sm) {
      return DeviceSize.xs;
    }

    if (width >= sm && width < md) {
      return DeviceSize.sm;
    }

    if (width >= md && width < lg) {
      return DeviceSize.md;
    }

    if (width >= lg && width < xl) {
      return DeviceSize.lg;
    }

    return DeviceSize.xl;
  }

  T builderByDeviceSize<T>(DeviceSizeBuilder<T> deviceSizeBuilder) {
    final size = deviceSize;

    switch (size) {
      case DeviceSize.xs:
        return deviceSizeBuilder.xs ?? deviceSizeBuilder.base;

      case DeviceSize.sm:
        return deviceSizeBuilder.sm ?? deviceSizeBuilder.base;

      case DeviceSize.md:
        return deviceSizeBuilder.md ?? deviceSizeBuilder.base;

      case DeviceSize.lg:
        return deviceSizeBuilder.lg ?? deviceSizeBuilder.base;

      default:
        return deviceSizeBuilder.xl ?? deviceSizeBuilder.base;
    }
  }

  Widget layoutBuilder({
    Widget base,
    Widget xs,
    Widget sm,
    Widget md,
    Widget lg,
    Widget xl,
  }) =>
      builderByDeviceSize<Widget>(
        DeviceSizeBuilder(
          base: base,
          xs: xs,
          sm: sm,
          md: md,
          lg: lg,
          xl: xl,
        ),
      );

  double sizeBuilder({
    double base,
    double xs,
    double sm,
    double md,
    double lg,
    double xl,
  }) =>
      builderByDeviceSize<double>(
        DeviceSizeBuilder(
          base: base,
          xs: xs,
          sm: sm,
          md: md,
          lg: lg,
          xl: xl,
        ),
      );
}
