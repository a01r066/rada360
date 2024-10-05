
extension DynamicX on dynamic {
  String stringify() {
    return '{$runtimeType: ${jsonEncode(this)}}';
  }
}
