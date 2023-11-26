import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:pie_menu/src/pie_button.dart';
import 'package:pie_menu/src/pie_provider.dart';

/// Action display anchor point for the specified custom angle in [PieTheme].
enum PieAnchor { start, center, end }

/// Defines the behavior and the appearance
/// of [PieCanvas] and [PieMenu] widgets.
class PieTheme {
  /// Creates a [PieTheme] to configure [PieMenu]s.
  const PieTheme({
    this.brightness = Brightness.light,
    this.overlayColor,
    this.pointerColor,
    this.pointerDecoration,
    this.buttonTheme = const PieButtonTheme(
      backgroundColor: Colors.blue,
      iconColor: Colors.white,
    ),
    this.buttonThemeHovered = const PieButtonTheme(
      backgroundColor: Colors.green,
      iconColor: Colors.white,
    ),
    this.iconSize,
    this.radius = 96,
    this.spacing = 6,
    this.customAngleDiff,
    this.angleOffset = 0,
    this.customAngle,
    this.customAngleAnchor = PieAnchor.center,
    this.buttonSize = 56,
    this.pointerSize = 40,
    this.tooltipPadding = const EdgeInsets.all(32),
    this.tooltipTextStyle,
    this.tooltipTextAlign,
    this.tooltipCanvasAlignment,
    this.tooltipUseFittedBox = false,
    this.bounceDuration = const Duration(seconds: 1),
    this.fadeDuration = const Duration(milliseconds: 250),
    this.hoverDuration = const Duration(milliseconds: 250),
    this.delayDuration = const Duration(milliseconds: 350),
    this.leftClickShowsMenu = true,
    this.rightClickShowsMenu = false,
  });

  /// How the background and tooltip widgets should be displayed
  /// if they are not specified explicitly.
  final Brightness brightness;

  /// Preferably a translucent color for [PieCanvas] to display
  /// under the menu child, and on top of the other widgets.
  final Color? overlayColor;

  /// Custom color for the widget displayed in the center of [PieMenu].
  final Color? pointerColor;

  /// Decoration for the widget displayed in the center of [PieMenu].
  ///
  /// If specified, [pointerColor] will be ignored.
  final Decoration? pointerDecoration;

  /// Theme of [PieButton].
  final PieButtonTheme buttonTheme;

  /// Theme of [PieButton] when it is hovered.
  final PieButtonTheme buttonThemeHovered;

  /// Size of the icon to be displayed on the [PieButton].
  final double? iconSize;

  /// Distance between the [PieButton] and the center of [PieMenu].
  final double radius;

  /// Spacing between the [PieButton]s.
  final double spacing;

  /// Angle difference between the [PieButton]s in degrees.
  ///
  /// If specified, [spacing] will be ignored.
  final double? customAngleDiff;

  /// Angle offset in degrees for the actions.
  final double angleOffset;

  /// Display the menu actions in a specific angle in degrees.
  final double? customAngle;

  /// Action display alignment for the specified [customAngle].
  final PieAnchor customAngleAnchor;

  /// Size of [PieButton] circle.
  final double buttonSize;

  /// Size of the widget displayed in the center of [PieMenu].
  final double pointerSize;

  /// Padding value of the tooltip at the edges of [PieCanvas].
  final EdgeInsets tooltipPadding;

  /// Default text style for the tooltip widget.
  final TextStyle? tooltipTextStyle;

  /// Text alignment of the tooltip widget.
  final TextAlign? tooltipTextAlign;

  /// Alignment of the tooltip in the [PieCanvas].
  ///
  /// Setting this property will disable dynamic tooltip positioning.
  final Alignment? tooltipCanvasAlignment;

  /// Whether to wrap the tooltip with [FittedBox] widget.
  ///
  /// Can be used to display long tooltip texts in a single line.
  final bool tooltipUseFittedBox;

  /// Duration of [PieButton] bounce animation.
  final Duration bounceDuration;

  /// Duration of [PieMenu] fade animation.
  final Duration fadeDuration;

  /// Duration of [PieButton] hover animation.
  final Duration hoverDuration;

  /// Long press duration for [PieMenu] to display.
  ///
  /// Can be set to [Duration.zero] to display the menu immediately on tap.
  final Duration delayDuration;

  /// Whether to display the menu on left mouse click.
  final bool leftClickShowsMenu;

  /// Whether to display the menu on right mouse click.
  final bool rightClickShowsMenu;

  /// Displacement distance of [PieButton]s when hovered.
  double get hoverDisplacement => buttonSize / 8;

  Color get effectiveOverlayColor {
    return overlayColor ??
        (brightness == Brightness.light
            ? Colors.white.withOpacity(0.8)
            : Colors.black.withOpacity(0.8));
  }

  /// Returns the [PieTheme] defined in the closest [PieCanvas].
  static PieTheme of(BuildContext context) {
    return PieState.of(context).canvasTheme;
  }

  /// Creates a copy of this theme but with the
  /// given fields replaced with the new values.
  PieTheme copyWith({
    Brightness? brightness,
    Color? overlayColor,
    Color? pointerColor,
    Decoration? pointerDecoration,
    PieButtonTheme? buttonTheme,
    PieButtonTheme? buttonThemeHovered,
    double? iconSize,
    double? radius,
    double? spacing,
    double? customAngleDiff,
    double? angleOffset,
    double? customAngle,
    PieAnchor? customAngleAnchor,
    double? buttonSize,
    double? pointerSize,
    EdgeInsets? tooltipPadding,
    TextStyle? tooltipTextStyle,
    TextAlign? tooltipTextAlign,
    Alignment? tooltipCanvasAlignment,
    bool? tooltipUseFittedBox,
    Duration? bounceDuration,
    Duration? fadeDuration,
    Duration? hoverDuration,
    Duration? delayDuration,
    bool? leftClickShowsMenu,
    bool? rightClickShowsMenu,
  }) {
    return PieTheme(
      brightness: brightness ?? this.brightness,
      overlayColor: overlayColor ?? this.overlayColor,
      pointerColor: pointerColor ?? this.pointerColor,
      pointerDecoration: pointerDecoration ?? this.pointerDecoration,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      buttonThemeHovered: buttonThemeHovered ?? this.buttonThemeHovered,
      iconSize: iconSize ?? this.iconSize,
      radius: radius ?? this.radius,
      spacing: spacing ?? this.spacing,
      customAngleDiff: customAngleDiff ?? this.customAngleDiff,
      angleOffset: angleOffset ?? this.angleOffset,
      customAngle: customAngle ?? this.customAngle,
      customAngleAnchor: customAngleAnchor ?? this.customAngleAnchor,
      buttonSize: buttonSize ?? this.buttonSize,
      pointerSize: pointerSize ?? this.pointerSize,
      tooltipPadding: tooltipPadding ?? this.tooltipPadding,
      tooltipTextStyle: tooltipTextStyle ?? this.tooltipTextStyle,
      tooltipTextAlign: tooltipTextAlign ?? this.tooltipTextAlign,
      tooltipCanvasAlignment:
          tooltipCanvasAlignment ?? this.tooltipCanvasAlignment,
      tooltipUseFittedBox: tooltipUseFittedBox ?? this.tooltipUseFittedBox,
      bounceDuration: bounceDuration ?? this.bounceDuration,
      fadeDuration: fadeDuration ?? this.fadeDuration,
      hoverDuration: hoverDuration ?? this.hoverDuration,
      delayDuration: delayDuration ?? this.delayDuration,
      leftClickShowsMenu: leftClickShowsMenu ?? this.leftClickShowsMenu,
      rightClickShowsMenu: rightClickShowsMenu ?? this.rightClickShowsMenu,
    );
  }
}
