// ignore_for_file: avoid_print

import 'package:calculator/module/ADT/app_stack/node.dart';

class ADTStack<T> {
  Node? _top;
  late int _height;

  ADTStack([T? value]){
    Node newNode = Node(value);
    _top = newNode;
    _height = 1;
  }


  void printList(){
    Node? temp = _top;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void push(T value){
    Node? newNode = Node(value);
    if(_height == 0){
      _top = newNode;
    }else{
      newNode.next = _top;
      _top = newNode;
    }
    _height++;
  }

  Node? pop(){
    Node? temp = _top;
    if(_height == 0) return null;
    _top = temp?.next;
    temp?.next = null;
    _height--;
    return temp;
  }
}