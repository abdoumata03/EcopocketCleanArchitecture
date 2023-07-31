// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_type_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetTypeHash() => r'c589f575ccedbd9c3d670a3f8e714b8f2c9e855b';

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

abstract class _$BudgetType extends BuildlessAutoDisposeNotifier<BudgetTypes> {
  late final BudgetTypes budgetType;

  BudgetTypes build({
    required BudgetTypes budgetType,
  });
}

/// See also [BudgetType].
@ProviderFor(BudgetType)
const budgetTypeProvider = BudgetTypeFamily();

/// See also [BudgetType].
class BudgetTypeFamily extends Family<BudgetTypes> {
  /// See also [BudgetType].
  const BudgetTypeFamily();

  /// See also [BudgetType].
  BudgetTypeProvider call({
    required BudgetTypes budgetType,
  }) {
    return BudgetTypeProvider(
      budgetType: budgetType,
    );
  }

  @override
  BudgetTypeProvider getProviderOverride(
    covariant BudgetTypeProvider provider,
  ) {
    return call(
      budgetType: provider.budgetType,
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
  String? get name => r'budgetTypeProvider';
}

/// See also [BudgetType].
class BudgetTypeProvider
    extends AutoDisposeNotifierProviderImpl<BudgetType, BudgetTypes> {
  /// See also [BudgetType].
  BudgetTypeProvider({
    required this.budgetType,
  }) : super.internal(
          () => BudgetType()..budgetType = budgetType,
          from: budgetTypeProvider,
          name: r'budgetTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetTypeHash,
          dependencies: BudgetTypeFamily._dependencies,
          allTransitiveDependencies:
              BudgetTypeFamily._allTransitiveDependencies,
        );

  final BudgetTypes budgetType;

  @override
  bool operator ==(Object other) {
    return other is BudgetTypeProvider && other.budgetType == budgetType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, budgetType.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  BudgetTypes runNotifierBuild(
    covariant BudgetType notifier,
  ) {
    return notifier.build(
      budgetType: budgetType,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
