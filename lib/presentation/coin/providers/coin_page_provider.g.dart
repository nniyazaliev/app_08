// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCurrencyRateHash() => r'd203024fea861e3d633183e899976bb016028bcb';

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

/// See also [getCurrencyRate].
@ProviderFor(getCurrencyRate)
const getCurrencyRateProvider = GetCurrencyRateFamily();

/// See also [getCurrencyRate].
class GetCurrencyRateFamily extends Family<AsyncValue<CoinModel>> {
  /// See also [getCurrencyRate].
  const GetCurrencyRateFamily();

  /// See also [getCurrencyRate].
  GetCurrencyRateProvider call(
    dynamic arg,
  ) {
    return GetCurrencyRateProvider(
      arg,
    );
  }

  @override
  GetCurrencyRateProvider getProviderOverride(
    covariant GetCurrencyRateProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'getCurrencyRateProvider';
}

/// See also [getCurrencyRate].
class GetCurrencyRateProvider extends AutoDisposeFutureProvider<CoinModel> {
  /// See also [getCurrencyRate].
  GetCurrencyRateProvider(
    dynamic arg,
  ) : this._internal(
          (ref) => getCurrencyRate(
            ref as GetCurrencyRateRef,
            arg,
          ),
          from: getCurrencyRateProvider,
          name: r'getCurrencyRateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCurrencyRateHash,
          dependencies: GetCurrencyRateFamily._dependencies,
          allTransitiveDependencies:
              GetCurrencyRateFamily._allTransitiveDependencies,
          arg: arg,
        );

  GetCurrencyRateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final dynamic arg;

  @override
  Override overrideWith(
    FutureOr<CoinModel> Function(GetCurrencyRateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCurrencyRateProvider._internal(
        (ref) => create(ref as GetCurrencyRateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CoinModel> createElement() {
    return _GetCurrencyRateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCurrencyRateProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCurrencyRateRef on AutoDisposeFutureProviderRef<CoinModel> {
  /// The parameter `arg` of this provider.
  dynamic get arg;
}

class _GetCurrencyRateProviderElement
    extends AutoDisposeFutureProviderElement<CoinModel>
    with GetCurrencyRateRef {
  _GetCurrencyRateProviderElement(super.provider);

  @override
  dynamic get arg => (origin as GetCurrencyRateProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
