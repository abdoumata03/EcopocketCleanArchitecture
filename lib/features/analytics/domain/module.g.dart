// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyticsRepositoryHash() =>
    r'a193c3d3c4d87eec605d3ae560a641850338c0d9';

/// See also [analyticsRepository].
@ProviderFor(analyticsRepository)
final analyticsRepositoryProvider = Provider<AnalyticsRepository>.internal(
  analyticsRepository,
  name: r'analyticsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalyticsRepositoryRef = ProviderRef<AnalyticsRepository>;
String _$categoryStatsHash() => r'9efdc3ef9f6640ec42a3766af1b4ee1d50315955';

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

typedef CategoryStatsRef = AutoDisposeFutureProviderRef<CategoryInfoList>;

/// See also [categoryStats].
@ProviderFor(categoryStats)
const categoryStatsProvider = CategoryStatsFamily();

/// See also [categoryStats].
class CategoryStatsFamily extends Family<AsyncValue<CategoryInfoList>> {
  /// See also [categoryStats].
  const CategoryStatsFamily();

  /// See also [categoryStats].
  CategoryStatsProvider call(
    DateRange dateRange,
  ) {
    return CategoryStatsProvider(
      dateRange,
    );
  }

  @override
  CategoryStatsProvider getProviderOverride(
    covariant CategoryStatsProvider provider,
  ) {
    return call(
      provider.dateRange,
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
  String? get name => r'categoryStatsProvider';
}

/// See also [categoryStats].
class CategoryStatsProvider
    extends AutoDisposeFutureProvider<CategoryInfoList> {
  /// See also [categoryStats].
  CategoryStatsProvider(
    this.dateRange,
  ) : super.internal(
          (ref) => categoryStats(
            ref,
            dateRange,
          ),
          from: categoryStatsProvider,
          name: r'categoryStatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryStatsHash,
          dependencies: CategoryStatsFamily._dependencies,
          allTransitiveDependencies:
              CategoryStatsFamily._allTransitiveDependencies,
        );

  final DateRange dateRange;

  @override
  bool operator ==(Object other) {
    return other is CategoryStatsProvider && other.dateRange == dateRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateRange.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
