import 'package:ava_take_home/ui/theme.dart';
import 'package:flutter/widgets.dart';

/// Representation of how much a credit account is utilized.
///
/// Contains color representations, as well as display names.
enum Utilization {
  low(
    displayColor: AppColors.avaSecondary,
    inactiveColor: AppColors.avaSecondaryLight,
  ),
  medium(
    displayColor: AppColors.okayOrange,
    inactiveColor: AppColors.okayOrangeLight,
  ),
  high(
    displayColor: AppColors.badRed,
    inactiveColor: AppColors.badRedLight,
  );

  final Color displayColor;
  final Color inactiveColor;

  const Utilization({required this.displayColor, required this.inactiveColor});

  String get displayName {
    switch (this) {
      case low:
        return 'Excellent';
      case medium:
        return 'Fair';
      case high:
        return 'Poor';
    }
  }

  static Utilization fromPercentDouble(double utilizationPercentage) {
    return fromPercentInt((utilizationPercentage * 100).toInt());
  }

  static Utilization fromPercentInt(int utilizationPercentage) {
    switch (utilizationPercentage) {
      case >= 0 && <= 29:
        return Utilization.low;
      case >= 30 && <= 49:
        return Utilization.medium;
      case >= 50 && <= 75:
      default:
        return Utilization.high;
    }
  }
}
