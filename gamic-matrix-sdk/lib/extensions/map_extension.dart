import 'dart:convert';

extension MapEx on Map {

  String? get jsonString {
    try {
      final json2 = const JsonEncoder.withIndent(' ').convert(this);
      return json2;
    } catch (e) {
      return null;
    }
  }

  Map? tryMapFor(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is Map) return value;
    return null;
  }

  Map<K, V>? mapFor<K, V>(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is Map) {
      try {
        return Map<K, V>.of(value.cast<K, V>());
      } catch (error) {
        print(error);
      }
    }
    return null;
  }

  String? stringFor(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is String) return value;
    if (value is num) return value.toString();
    return null;
  }

  int? intFor(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is int) return value;
    return null;
  }

  double? doubleFor(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is double) return value;
    return null;
  }

  List? tryListFor(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is List) return value;
    return null;
  }

  List<T>? listFor<T>(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    try {
      if (value is List) return value.cast<T>();
    } catch (e) {
      return null;
    }
    return null;
  }

  bool? boolFor(final dynamic key) {
    if (key == null) return null;
    final value = this[key];
    if (value is bool) return value;
    return null;
  }

  String get makeUriQueryString {
    return keys.map<String>((e) {
      final key = Uri.encodeComponent(e.toString());
      final value = Uri.encodeComponent(this[e] ?? '');
      return '$key=$value';
    }).join('&');
  }

}