class ApiResult<T, V> {
  final T? response;
  final V? exception;

  const ApiResult({
    this.response,
    this.exception,
  });

  isSuccessful() {
    return response != null && exception == null;
  }
}
