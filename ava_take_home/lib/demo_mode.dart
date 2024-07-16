import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo_mode.g.dart';

/// Enables Demo Mode!
///
/// A primary function of this is to cause the Repositories to start generating
/// random data on a regular interval.
@riverpod
class DemoMode extends _$DemoMode {
  @override
  bool build() {
    return false;
  }

  void toggleDemoMode() {
    state = !state;
  }
}
