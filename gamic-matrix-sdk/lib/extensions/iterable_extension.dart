
extension IterableEx<E> on Iterable<E> {

  E? get tryFirst {
    try {
      return first;
    } catch (e) {
      return null;
    }
  }

  E? get tryLast {
    try {
      return last;
    } catch (e) {
      return null;
    }
  }

}