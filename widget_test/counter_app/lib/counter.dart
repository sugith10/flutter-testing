class Counter {
  int _count = 0;

  int get count => _count;

  void increment() {
    print(count);
    _count++;
  }
}
