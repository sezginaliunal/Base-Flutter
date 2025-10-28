import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  // =================== Padding Values ===================
  static const double _lowPaddingValue = 8;
  static const double _normalPaddingValue = 16;
  static const double _highPaddingValue = 24;

  // =================== All Padding ===================
  Widget paddingLow() =>
      Padding(padding: const EdgeInsets.all(_lowPaddingValue), child: this);
  Widget paddingNormal() =>
      Padding(padding: const EdgeInsets.all(_normalPaddingValue), child: this);
  Widget paddingHigh() =>
      Padding(padding: const EdgeInsets.all(_highPaddingValue), child: this);

  // =================== Symmetric Padding ===================
  Widget horizontalPaddingLow() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: _lowPaddingValue),
    child: this,
  );
  Widget horizontalPaddingNormal() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: _normalPaddingValue),
    child: this,
  );
  Widget horizontalPaddingHigh() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: _highPaddingValue),
    child: this,
  );

  Widget verticalPaddingLow() => Padding(
    padding: const EdgeInsets.symmetric(vertical: _lowPaddingValue),
    child: this,
  );
  Widget verticalPaddingNormal() => Padding(
    padding: const EdgeInsets.symmetric(vertical: _normalPaddingValue),
    child: this,
  );
  Widget verticalPaddingHigh() => Padding(
    padding: const EdgeInsets.symmetric(vertical: _highPaddingValue),
    child: this,
  );

  // =================== Only Padding ===================
  Widget paddingOnlyTopLow() => Padding(
    padding: const EdgeInsets.only(top: _lowPaddingValue),
    child: this,
  );
  Widget paddingOnlyBottomLow() => Padding(
    padding: const EdgeInsets.only(bottom: _lowPaddingValue),
    child: this,
  );
  Widget paddingOnlyLeftLow() => Padding(
    padding: const EdgeInsets.only(left: _lowPaddingValue),
    child: this,
  );
  Widget paddingOnlyRightLow() => Padding(
    padding: const EdgeInsets.only(right: _lowPaddingValue),
    child: this,
  );

  Widget paddingOnlyTopNormal() => Padding(
    padding: const EdgeInsets.only(top: _normalPaddingValue),
    child: this,
  );
  Widget paddingOnlyBottomNormal() => Padding(
    padding: const EdgeInsets.only(bottom: _normalPaddingValue),
    child: this,
  );
  Widget paddingOnlyLeftNormal() => Padding(
    padding: const EdgeInsets.only(left: _normalPaddingValue),
    child: this,
  );
  Widget paddingOnlyRightNormal() => Padding(
    padding: const EdgeInsets.only(right: _normalPaddingValue),
    child: this,
  );

  Widget paddingOnlyTopHigh() => Padding(
    padding: const EdgeInsets.only(top: _highPaddingValue),
    child: this,
  );
  Widget paddingOnlyBottomHigh() => Padding(
    padding: const EdgeInsets.only(bottom: _highPaddingValue),
    child: this,
  );
  Widget paddingOnlyLeftHigh() => Padding(
    padding: const EdgeInsets.only(left: _highPaddingValue),
    child: this,
  );
  Widget paddingOnlyRightHigh() => Padding(
    padding: const EdgeInsets.only(right: _highPaddingValue),
    child: this,
  );

  // =================== Dynamic Padding ===================
  Widget dynamicPadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    BuildContext? context,
  }) {
    double width = 0;
    double height = 0;

    if (context != null) {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: top != null
            ? height * top
            : (vertical != null
                  ? height * vertical
                  : (all != null ? height * all : 0)),
        bottom: bottom != null
            ? height * bottom
            : (vertical != null
                  ? height * vertical
                  : (all != null ? height * all : 0)),
        left: left != null
            ? width * left
            : (horizontal != null
                  ? width * horizontal
                  : (all != null ? width * all : 0)),
        right: right != null
            ? width * right
            : (horizontal != null
                  ? width * horizontal
                  : (all != null ? width * all : 0)),
      ),
      child: this,
    );
  }

  // =================== Margin ===================
  // =================== Margin Values ===================
  static const double _lowMarginValue = 8;
  static const double _normalMarginValue = 16;
  static const double _highMarginValue = 24;

  // =================== All Margin ===================
  Widget marginLow() =>
      Container(margin: const EdgeInsets.all(_lowMarginValue), child: this);
  Widget marginNormal() =>
      Container(margin: const EdgeInsets.all(_normalMarginValue), child: this);
  Widget marginHigh() =>
      Container(margin: const EdgeInsets.all(_highMarginValue), child: this);

  // =================== Symmetric Margin ===================
  Widget horizontalMarginLow() => Container(
    margin: const EdgeInsets.symmetric(horizontal: _lowMarginValue),
    child: this,
  );
  Widget horizontalMarginNormal() => Container(
    margin: const EdgeInsets.symmetric(horizontal: _normalMarginValue),
    child: this,
  );
  Widget horizontalMarginHigh() => Container(
    margin: const EdgeInsets.symmetric(horizontal: _highMarginValue),
    child: this,
  );

  Widget verticalMarginLow() => Container(
    margin: const EdgeInsets.symmetric(vertical: _lowMarginValue),
    child: this,
  );
  Widget verticalMarginNormal() => Container(
    margin: const EdgeInsets.symmetric(vertical: _normalMarginValue),
    child: this,
  );
  Widget verticalMarginHigh() => Container(
    margin: const EdgeInsets.symmetric(vertical: _highMarginValue),
    child: this,
  );

  // =================== Only Margin ===================
  Widget marginOnlyTopLow() => Container(
    margin: const EdgeInsets.only(top: _lowMarginValue),
    child: this,
  );
  Widget marginOnlyBottomLow() => Container(
    margin: const EdgeInsets.only(bottom: _lowMarginValue),
    child: this,
  );
  Widget marginOnlyLeftLow() => Container(
    margin: const EdgeInsets.only(left: _lowMarginValue),
    child: this,
  );
  Widget marginOnlyRightLow() => Container(
    margin: const EdgeInsets.only(right: _lowMarginValue),
    child: this,
  );

  Widget marginOnlyTopNormal() => Container(
    margin: const EdgeInsets.only(top: _normalMarginValue),
    child: this,
  );
  Widget marginOnlyBottomNormal() => Container(
    margin: const EdgeInsets.only(bottom: _normalMarginValue),
    child: this,
  );
  Widget marginOnlyLeftNormal() => Container(
    margin: const EdgeInsets.only(left: _normalMarginValue),
    child: this,
  );
  Widget marginOnlyRightNormal() => Container(
    margin: const EdgeInsets.only(right: _normalMarginValue),
    child: this,
  );

  Widget marginOnlyTopHigh() => Container(
    margin: const EdgeInsets.only(top: _highMarginValue),
    child: this,
  );
  Widget marginOnlyBottomHigh() => Container(
    margin: const EdgeInsets.only(bottom: _highMarginValue),
    child: this,
  );
  Widget marginOnlyLeftHigh() => Container(
    margin: const EdgeInsets.only(left: _highMarginValue),
    child: this,
  );
  Widget marginOnlyRightHigh() => Container(
    margin: const EdgeInsets.only(right: _highMarginValue),
    child: this,
  );

  Widget circleAvatar({
    double radius = 24,
    Color backgroundColor = Colors.grey,
    EdgeInsets? padding,
    ImageProvider? backgroundImage,
  }) => CircleAvatar(
    radius: radius,
    backgroundColor: backgroundColor,
    backgroundImage: backgroundImage,
    child: Padding(padding: padding ?? EdgeInsets.zero, child: this),
  );
  // =================== Decoration ===================
  Widget cornerRadius(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  Widget clipOval() => ClipOval(child: this);
  Widget clipCircle() => ClipOval(child: this);

  Widget backgroundColor(Color color) => ColoredBox(color: color, child: this);

  Widget withBorder({Color color = Colors.black, double width = 1}) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
        ),
        child: this,
      );

  Widget shadow({
    Color color = Colors.black26,
    double blurRadius = 10,
    double spreadRadius = 1,
    Offset offset = const Offset(0, 4),
    BorderRadius? borderRadius,
    Color? backgroundColor,
  }) => Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    ),
    child: this,
  );

  // =================== Visibility & Disabled ===================
  Widget visible({bool isVisible = false}) =>
      isVisible ? this : const SizedBox.shrink();

  Widget disabled({bool value = true, double opacity = 0.5}) => AbsorbPointer(
    absorbing: value,
    child: Opacity(opacity: value ? opacity : 1.0, child: this),
  );

  Widget opacity(double value) => Opacity(opacity: value, child: this);

  // =================== Alignment ===================
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget get center => Center(child: this);

  Widget get expanded => Expanded(child: this);
  Widget get flexible => Flexible(child: this);

  Widget sized(double width, double height) =>
      SizedBox(width: width, height: height, child: this);

  // =================== Interaction ===================
  Widget onTap(VoidCallback onTap, {BorderRadius? radius}) =>
      InkWell(borderRadius: radius, onTap: onTap, child: this);

  Widget onLongPress(VoidCallback onLongPress, {BorderRadius? radius}) =>
      InkWell(borderRadius: radius, onLongPress: onLongPress, child: this);

  Widget onDoubleTap(VoidCallback onDoubleTap, {BorderRadius? radius}) =>
      InkWell(borderRadius: radius, onDoubleTap: onDoubleTap, child: this);

  Widget clickable({VoidCallback? onTap, BorderRadius? radius}) =>
      InkWell(borderRadius: radius, onTap: onTap, child: this);

  Widget onHoverWidget(void Function(bool hovering) onHover) => MouseRegion(
    onHover: (_) => onHover(true),
    onExit: (_) => onHover(false),
    child: this,
  );

  Widget tooltip(String message) => Tooltip(message: message, child: this);

  // =================== Animations ===================
  Widget animated({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) => AnimatedSwitcher(
    duration: duration,
    switchInCurve: curve,
    switchOutCurve: curve,
    child: this,
  );

  Widget fade({
    double opacity = 1,
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.easeInOut,
  }) => AnimatedOpacity(
    opacity: opacity,
    duration: duration,
    curve: curve,
    child: this,
  );

  Widget slide({
    Offset offset = const Offset(0, 0.1),
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.easeInOut,
  }) => AnimatedSlide(
    offset: offset,
    duration: duration,
    curve: curve,
    child: this,
  );

  Widget rotate({
    double turns = 0.0,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) => AnimatedRotation(
    turns: turns,
    duration: duration,
    curve: curve,
    child: this,
  );

  Widget scale({
    double scale = 1.0,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) => TweenAnimationBuilder(
    tween: Tween<double>(begin: 0.5, end: scale),
    duration: duration,
    curve: curve,
    builder: (context, double value, child) =>
        Transform.scale(scale: value, child: child),
    child: this,
  );

  Widget animatedSize({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) => AnimatedSize(
    duration: duration,

    curve: curve,
    child: this,
    alignment: Alignment.center,
  );

  Widget tapAnimateScale({
    double scale = 1.1,
    Duration duration = const Duration(milliseconds: 500),
  }) => GestureDetector(
    onTapDown: (_) {},
    onTapUp: (_) {},
    child: this.scale(scale: scale, duration: duration),
  );

  Widget hoverAnimateOpacity({
    double opacity = 0.7,
    Duration duration = const Duration(milliseconds: 200),
  }) => MouseRegion(
    onEnter: (_) {},
    onExit: (_) {},
    child: this.fade(opacity: opacity, duration: duration),
  );

  Widget pressAnimateRotation({
    double turns = 0.1,
    Duration duration = const Duration(milliseconds: 500),
  }) => GestureDetector(
    onTapDown: (_) {},
    onTapUp: (_) {},
    child: this.rotate(turns: turns, duration: duration),
  );

  // =================== Layout Helpers ===================
  Widget wrapInCard({Color? color, double elevation = 2, EdgeInsets? margin}) =>
      Card(color: color, elevation: elevation, margin: margin, child: this);

  Widget wrapWithScroll({Axis axis = Axis.vertical, bool reverse = false}) =>
      SingleChildScrollView(
        scrollDirection: axis,
        reverse: reverse,
        child: this,
      );

  Widget overlayWidget(Widget overlay) => Stack(children: [this, overlay]);

  Widget withBadge({
    Widget? badge,
    Alignment alignment = Alignment.topRight,
    double? width = 8,
    double? height = 8,
  }) => Stack(
    clipBehavior: Clip.none,
    children: [
      this,
      Positioned(
        top: 0,
        right: 0,
        child:
            badge ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
      ),
    ],
  );

  // =================== Debug Helpers ===================
  Widget debugBorder({Color color = Colors.red, double width = 1}) => Container(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: width),
    ),
    child: this,
  );
}
