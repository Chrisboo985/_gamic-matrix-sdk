import 'dart:math' as math;
import 'dart:convert';

extension ListEx<E> on List<E> {

  List<T> mapWithIndex<T>(T Function(E e, int index) toElement) {
    int index = 0;
    final List<T> result = [];
    forEach((element) {
      final t = toElement(element, index);
      result.add(t);
      index += 1;
    });
    return result;
  }

  String? get jsonString {
    try {
      final json2 = const JsonEncoder.withIndent(' ').convert(this);
      return json2;
    } catch (e) {
      return null;
    }
  }

  List<List<E>> separateBy({required int step}) {
    if (isEmpty) return [];
    final List<List<E>> result = [];
    int index = 0;
    while (index * step < length) {
      final end = math.min(index * step + step, length);
      final t = sublist(index * step, end);
      result.add(List.of(t));
      index += 1;
    }
    return result;
  }

}