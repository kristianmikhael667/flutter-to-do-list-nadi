import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasari_flutter/app/cache_manager/auth_manager.dart';
import 'package:nasari_flutter/app/cache_manager/cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:nasari_flutter/app/services/dio_client/dio_client.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin, CacheManager {
  static var dioClient = DioClient(Dio());
  final authManager = Get.find<AuthManagerController>();
  final TextEditingController todoController = TextEditingController();
  //  Save to-do-list
  RxList<String> todoList = <String>[].obs;

  // Method Create To-Do List
  void addTodo() {
    var newTodo = todoController.text;
    if (newTodo.isNotEmpty) {
      todoList.add(newTodo);
      todoController.clear();
    }
  }

  // Method Update To-Do List
  void editTodo(int index) {
    var editedTodo = todoController.text;
    if (editedTodo.isNotEmpty) {
      todoList[index] = editedTodo;
      todoController.clear();
    }
  }

  // Method Remove To-Do List
  void deleteTodo(int index) {
    todoList.removeAt(index);
  }
}
