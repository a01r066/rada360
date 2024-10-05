extension ListX<T> on List<T> {
  /*
  - New element: ','
  - Base list: [12345]
  - Updated list: [1,2,3,4,5]
  Ex:
  final myExampleList = ['Sam', 'John', 'Maya'];
  print(myExampleList.separated(', ').join()); // Prints "Sam, John, Maya"
  */
  List<T> separated(T separator) {
    final newList = <T>[];
    for (var i = 0; i < length; i++) {
      if (i == 0) {
        newList.add(this[i]);
      } else {
        newList.add(separator);
        newList.add(this[i]);
      }
    }
    return newList;
  }
}
