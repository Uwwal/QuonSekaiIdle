class Tuple<T1 extends Object, T2 extends Object>{
  final T1 item1;
  final T2 item2;

  Tuple(this.item1, this.item2);

  dynamic operator [](int index){
    if(index == 0){
      return item1;
    }
    if(index == 1){
      return item2;
    }
    throw IndexError.withLength(index, 2);
  }

  num operator -(Object other) {
    switch (other.runtimeType) {
      case const (Tuple<Object, num>):
        if (item2 is num) {
          return (item2 as num) - (other as Tuple<Object, num>).item2;
        } else {
          throw UnsupportedError('Unsupported type for - operator');
        }
      case num:
      case int:
        return (item2 as num) - (other as num);
      default:
        throw UnsupportedError('Unsupported type for - operator');
    }
  }

}