// ignore_for_file: avoid_print

import 'package:calculator/module/ADT/app_stack/node.dart';

class ADTStack<T> {
  Node? _top;
  late int _height;

  ADTStack([T? value]) {
    Node newNode = Node(value);
    _top = newNode;
    _height = 0;
  }

  bool get isEmpty => _isEmpty();
  bool get isNotEmpty => !_isEmpty();
  T get last => _last();
  int get length => _height;

  void printList() {
    Node? temp = _top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void push(T value) {
    Node? newNode = Node(value);
    if (_height == 0) {
      _top = newNode;
    } else {
      newNode.next = _top;
      _top = newNode;
    }
    _height++;
  }

  Node? pop() {
    Node? temp = _top;
    if (_height == 0) return null;
    _top = temp?.next;
    temp?.next = null;
    _height--;
    return temp;
  }

  bool _isEmpty() {
    if (_top?.value == null) {
      return true;
    } else {
      return false;
    }
  }

  T _last() {
    return _top?.value;
  }
}
