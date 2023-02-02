import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> route = {};

void addRoute(String path, Widget widget) {
  route[path] = (BuildContext c) {
    return widget;
  };
}
