// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pieChartSectionsHash() => r'c9d405b5f6abfb7159c6f6a4761364a611218dc0';

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

typedef PieChartSectionsRef = AutoDisposeProviderRef<List<PieChartSectionData>>;

/// See also [pieChartSections].
@ProviderFor(pieChartSections)
const pieChartSectionsProvider = PieChartSectionsFamily();

/// See also [pieChartSections].
class PieChartSectionsFamily extends Family<List<PieChartSectionData>> {
  /// See also [pieChartSections].
  const PieChartSectionsFamily();

  /// See also [pieChartSections].
  PieChartSectionsProvider call(
    CategoryInfoList stats,
  ) {
    return PieChartSectionsProvider(
      stats,
    );
  }

  @override
  PieChartSectionsProvider getProviderOverride(
    covariant PieChartSectionsProvider provider,
  ) {
    return call(
      provider.stats,
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
  String? get name => r'pieChartSectionsProvider';
}

/// See also [pieChartSections].
class PieChartSectionsProvider
    extends AutoDisposeProvider<List<PieChartSectionData>> {
  /// See also [pieChartSections].
  PieChartSectionsProvider(
    this.stats,
  ) : super.internal(
          (ref) => pieChartSections(
            ref,
            stats,
          ),
          from: pieChartSectionsProvider,
          name: r'pieChartSectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pieChartSectionsHash,
          dependencies: PieChartSectionsFamily._dependencies,
          allTransitiveDependencies:
              PieChartSectionsFamily._allTransitiveDependencies,
        );

  final CategoryInfoList stats;

  @override
  bool operator ==(Object other) {
    return other is PieChartSectionsProvider && other.stats == stats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stats.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$analyticsControllerHash() =>
    r'355475d6cdfa7a6e546d0d0cc84f13a1ee008581';

/// See also [AnalyticsController].
@ProviderFor(AnalyticsController)
final analyticsControllerProvider =
    AsyncNotifierProvider<AnalyticsController, CategoryInfoList>.internal(
  AnalyticsController.new,
  name: r'analyticsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AnalyticsController = AsyncNotifier<CategoryInfoList>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
