// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percentage_calculator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calculatePercentageHash() =>
    r'c8a02c4dc4d3381b24816a95f1968d8fb8225f62';

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

typedef CalculatePercentageRef = AutoDisposeProviderRef<double>;

/// See also [calculatePercentage].
@ProviderFor(calculatePercentage)
const calculatePercentageProvider = CalculatePercentageFamily();

/// See also [calculatePercentage].
class CalculatePercentageFamily extends Family<double> {
  /// See also [calculatePercentage].
  const CalculatePercentageFamily();

  /// See also [calculatePercentage].
  CalculatePercentageProvider call({
    required double total,
    required double amount,
  }) {
    return CalculatePercentageProvider(
      total: total,
      amount: amount,
    );
  }

  @override
  CalculatePercentageProvider getProviderOverride(
    covariant CalculatePercentageProvider provider,
  ) {
    return call(
      total: provider.total,
      amount: provider.amount,
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
  String? get name => r'calculatePercentageProvider';
}

/// See also [calculatePercentage].
class CalculatePercentageProvider extends AutoDisposeProvider<double> {
  /// See also [calculatePercentage].
  CalculatePercentageProvider({
    required this.total,
    required this.amount,
  }) : super.internal(
          (ref) => calculatePercentage(
            ref,
            total: total,
            amount: amount,
          ),
          from: calculatePercentageProvider,
          name: r'calculatePercentageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calculatePercentageHash,
          dependencies: CalculatePercentageFamily._dependencies,
          allTransitiveDependencies:
              CalculatePercentageFamily._allTransitiveDependencies,
        );

  final double total;
  final double amount;

  @override
  bool operator ==(Object other) {
    return other is CalculatePercentageProvider &&
        other.total == total &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, total.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
