// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$demoModeHash() => r'77d438e498e08c70aaddbdab0d9844d817f43402';

/// Enables Demo Mode!
///
/// A primary function of this is to cause the Repositories to start generating
/// random data on a regular interval.
///
/// Copied from [DemoMode].
@ProviderFor(DemoMode)
final demoModeProvider = AutoDisposeNotifierProvider<DemoMode, bool>.internal(
  DemoMode.new,
  name: r'demoModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$demoModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DemoMode = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
