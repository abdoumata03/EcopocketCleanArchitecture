// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDateRangeHash() => r'daceec782a66faa9b5c1b4934b0cde9af3b5daff';

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

typedef GetDateRangeRef = AutoDisposeProviderRef<DateRange>;

/// See also [getDateRange].
@ProviderFor(getDateRange)
const getDateRangeProvider = GetDateRangeFamily();

/// See also [getDateRange].
class GetDateRangeFamily extends Family<DateRange> {
  /// See also [getDateRange].
  const GetDateRangeFamily();

  /// See also [getDateRange].
  GetDateRangeProvider call(
    TimePeriod period,
  ) {
    return GetDateRangeProvider(
      period,
    );
  }

  @override
  GetDateRangeProvider getProviderOverride(
    covariant GetDateRangeProvider provider,
  ) {
    return call(
      provider.period,
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
  String? get name => r'getDateRangeProvider';
}

/// See also [getDateRange].
class GetDateRangeProvider extends AutoDisposeProvider<DateRange> {
  /// See also [getDateRange].
  GetDateRangeProvider(
    this.period,
  ) : super.internal(
          (ref) => getDateRange(
            ref,
            period,
          ),
          from: getDateRangeProvider,
          name: r'getDateRangeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDateRangeHash,
          dependencies: GetDateRangeFamily._dependencies,
          allTransitiveDependencies:
              GetDateRangeFamily._allTransitiveDependencies,
        );

  final TimePeriod period;

  @override
  bool operator ==(Object other) {
    return other is GetDateRangeProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
