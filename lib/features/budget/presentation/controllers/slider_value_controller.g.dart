// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_value_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sliderValueHash() => r'7fc4b17fba080c00dcd576ea583c0a5bbaa7ccce';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SliderValue extends BuildlessAutoDisposeNotifier<double> {
  late final double? value;

  double build({
    required double? value,
  });
}

/// See also [SliderValue].
@ProviderFor(SliderValue)
const sliderValueProvider = SliderValueFamily();

/// See also [SliderValue].
class SliderValueFamily extends Family<double> {
  /// See also [SliderValue].
  const SliderValueFamily();

  /// See also [SliderValue].
  SliderValueProvider call({
    required double? value,
  }) {
    return SliderValueProvider(
      value: value,
    );
  }

  @override
  SliderValueProvider getProviderOverride(
    covariant SliderValueProvider provider,
  ) {
    return call(
      value: provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sliderValueProvider';
}

/// See also [SliderValue].
class SliderValueProvider
    extends AutoDisposeNotifierProviderImpl<SliderValue, double> {
  /// See also [SliderValue].
  SliderValueProvider({
    required this.value,
  }) : super.internal(
          () => SliderValue()..value = value,
          from: sliderValueProvider,
          name: r'sliderValueProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sliderValueHash,
          dependencies: SliderValueFamily._dependencies,
          allTransitiveDependencies:
              SliderValueFamily._allTransitiveDependencies,
        );

  final double? value;

  @override
  bool operator ==(Object other) {
    return other is SliderValueProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  double runNotifierBuild(
    covariant SliderValue notifier,
  ) {
    return notifier.build(
      value: value,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
