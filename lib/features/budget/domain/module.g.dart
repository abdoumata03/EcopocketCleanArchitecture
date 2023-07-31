// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetRepositoryHash() => r'466aaa7d90d8f795daffebb0c7e05239b4cd6aa2';

/// See also [budgetRepository].
@ProviderFor(budgetRepository)
final budgetRepositoryProvider = Provider<BudgetRepository>.internal(
  budgetRepository,
  name: r'budgetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$budgetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BudgetRepositoryRef = ProviderRef<BudgetRepository>;
String _$categorySpendingHash() => r'908561fc30cfaaacb8e58e4f36a1cc728ef294ca';

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

typedef CategorySpendingRef = AutoDisposeFutureProviderRef<double>;

/// See also [categorySpending].
@ProviderFor(categorySpending)
const categorySpendingProvider = CategorySpendingFamily();

/// See also [categorySpending].
class CategorySpendingFamily extends Family<AsyncValue<double>> {
  /// See also [categorySpending].
  const CategorySpendingFamily();

  /// See also [categorySpending].
  CategorySpendingProvider call({
    required int categoryId,
    required DateRange dateRange,
  }) {
    return CategorySpendingProvider(
      categoryId: categoryId,
      dateRange: dateRange,
    );
  }

  @override
  CategorySpendingProvider getProviderOverride(
    covariant CategorySpendingProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      dateRange: provider.dateRange,
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
  String? get name => r'categorySpendingProvider';
}

/// See also [categorySpending].
class CategorySpendingProvider extends AutoDisposeFutureProvider<double> {
  /// See also [categorySpending].
  CategorySpendingProvider({
    required this.categoryId,
    required this.dateRange,
  }) : super.internal(
          (ref) => categorySpending(
            ref,
            categoryId: categoryId,
            dateRange: dateRange,
          ),
          from: categorySpendingProvider,
          name: r'categorySpendingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categorySpendingHash,
          dependencies: CategorySpendingFamily._dependencies,
          allTransitiveDependencies:
              CategorySpendingFamily._allTransitiveDependencies,
        );

  final int categoryId;
  final DateRange dateRange;

  @override
  bool operator ==(Object other) {
    return other is CategorySpendingProvider &&
        other.categoryId == categoryId &&
        other.dateRange == dateRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, dateRange.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
