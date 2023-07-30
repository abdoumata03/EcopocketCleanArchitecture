// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_info_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todaysTotalHash() => r'5c5aeb10d8c7190782b7ca84d1e473a918ca2ae7';

/// See also [todaysTotal].
@ProviderFor(todaysTotal)
final todaysTotalProvider = AutoDisposeFutureProvider<double>.internal(
  todaysTotal,
  name: r'todaysTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todaysTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodaysTotalRef = AutoDisposeFutureProviderRef<double>;
String _$yesterdaysTotalHash() => r'0cb49565c99c2b4f9370dcbf207a355545a3dbe9';

/// See also [yesterdaysTotal].
@ProviderFor(yesterdaysTotal)
final yesterdaysTotalProvider = AutoDisposeFutureProvider<double>.internal(
  yesterdaysTotal,
  name: r'yesterdaysTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$yesterdaysTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef YesterdaysTotalRef = AutoDisposeFutureProviderRef<double>;
String _$getTodaysCategoriesInfoListHash() =>
    r'0a4b205c161799ef83dda9a73d40025c1e34fb60';

/// See also [getTodaysCategoriesInfoList].
@ProviderFor(getTodaysCategoriesInfoList)
final getTodaysCategoriesInfoListProvider =
    AutoDisposeFutureProvider<CategoryInfoList>.internal(
  getTodaysCategoriesInfoList,
  name: r'getTodaysCategoriesInfoListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTodaysCategoriesInfoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTodaysCategoriesInfoListRef
    = AutoDisposeFutureProviderRef<CategoryInfoList>;
String _$getYesterdaysCategoriesInfoListHash() =>
    r'aaacdd9087f23192d77b91b40cd93a5e77b31000';

/// See also [getYesterdaysCategoriesInfoList].
@ProviderFor(getYesterdaysCategoriesInfoList)
final getYesterdaysCategoriesInfoListProvider =
    AutoDisposeFutureProvider<CategoryInfoList>.internal(
  getYesterdaysCategoriesInfoList,
  name: r'getYesterdaysCategoriesInfoListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getYesterdaysCategoriesInfoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetYesterdaysCategoriesInfoListRef
    = AutoDisposeFutureProviderRef<CategoryInfoList>;
String _$getSpendingsHash() => r'30add806ed231f07e2aa9152d4275dcece2adfb5';

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

typedef GetSpendingsRef = FutureProviderRef<double>;

/// See also [getSpendings].
@ProviderFor(getSpendings)
const getSpendingsProvider = GetSpendingsFamily();

/// See also [getSpendings].
class GetSpendingsFamily extends Family<AsyncValue<double>> {
  /// See also [getSpendings].
  const GetSpendingsFamily();

  /// See also [getSpendings].
  GetSpendingsProvider call({
    required DateRange range,
  }) {
    return GetSpendingsProvider(
      range: range,
    );
  }

  @override
  GetSpendingsProvider getProviderOverride(
    covariant GetSpendingsProvider provider,
  ) {
    return call(
      range: provider.range,
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
  String? get name => r'getSpendingsProvider';
}

/// See also [getSpendings].
class GetSpendingsProvider extends FutureProvider<double> {
  /// See also [getSpendings].
  GetSpendingsProvider({
    required this.range,
  }) : super.internal(
          (ref) => getSpendings(
            ref,
            range: range,
          ),
          from: getSpendingsProvider,
          name: r'getSpendingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSpendingsHash,
          dependencies: GetSpendingsFamily._dependencies,
          allTransitiveDependencies:
              GetSpendingsFamily._allTransitiveDependencies,
        );

  final DateRange range;

  @override
  bool operator ==(Object other) {
    return other is GetSpendingsProvider && other.range == range;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, range.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getCategoryTransactionsHash() =>
    r'a5f982c0597b2e32d089a0a030f82ce4a65aba2c';
typedef GetCategoryTransactionsRef
    = AutoDisposeFutureProviderRef<TransactionList>;

/// See also [getCategoryTransactions].
@ProviderFor(getCategoryTransactions)
const getCategoryTransactionsProvider = GetCategoryTransactionsFamily();

/// See also [getCategoryTransactions].
class GetCategoryTransactionsFamily
    extends Family<AsyncValue<TransactionList>> {
  /// See also [getCategoryTransactions].
  const GetCategoryTransactionsFamily();

  /// See also [getCategoryTransactions].
  GetCategoryTransactionsProvider call({
    required DateRange range,
    required int categoryId,
  }) {
    return GetCategoryTransactionsProvider(
      range: range,
      categoryId: categoryId,
    );
  }

  @override
  GetCategoryTransactionsProvider getProviderOverride(
    covariant GetCategoryTransactionsProvider provider,
  ) {
    return call(
      range: provider.range,
      categoryId: provider.categoryId,
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
  String? get name => r'getCategoryTransactionsProvider';
}

/// See also [getCategoryTransactions].
class GetCategoryTransactionsProvider
    extends AutoDisposeFutureProvider<TransactionList> {
  /// See also [getCategoryTransactions].
  GetCategoryTransactionsProvider({
    required this.range,
    required this.categoryId,
  }) : super.internal(
          (ref) => getCategoryTransactions(
            ref,
            range: range,
            categoryId: categoryId,
          ),
          from: getCategoryTransactionsProvider,
          name: r'getCategoryTransactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCategoryTransactionsHash,
          dependencies: GetCategoryTransactionsFamily._dependencies,
          allTransitiveDependencies:
              GetCategoryTransactionsFamily._allTransitiveDependencies,
        );

  final DateRange range;
  final int categoryId;

  @override
  bool operator ==(Object other) {
    return other is GetCategoryTransactionsProvider &&
        other.range == range &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, range.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$getCategoriesHash() => r'1747ac979b24ad3aefd3943e092666d8e5991a12';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = AutoDisposeFutureProvider<CategoryList>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = AutoDisposeFutureProviderRef<CategoryList>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
