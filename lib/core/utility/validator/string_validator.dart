extension StringValidator on String? {
  bool isValidPasswordNumber({int size = 6}) {
    return (this?.length ?? 0) > size ? true : false;
  }
}
