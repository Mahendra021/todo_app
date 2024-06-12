import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/dio/api_service.dart';
import 'package:todo_app/app/data/model/todo.dart';

enum TodoListFilter {
  all,
  active,
  completed,
}

class HomeController extends GetxController {
  Rx<PageController> pageController = PageController(initialPage: 0).obs;
  RxInt currentPage = 0.obs;

  Rx<TodoListFilter> filter = TodoListFilter.all.obs;

  RxList<TodoModel> todoList = <TodoModel>[].obs;
  RxList<TodoModel> filterList = <TodoModel>[].obs;

  @override
  void onInit() {
    getTodoList();
    super.onInit();
  }

  Future<void> getTodoList() async {
    APIManager.getTodos().then((response) {
      if (response.statusCode == 200) {
        todoList.value = todoModelFromJson(jsonEncode(response.data));
        filterList.value = todoModelFromJson(jsonEncode(response.data));
      }
    }).catchError((onError) {
      debugPrint(onError);
    });
  }

  getFilterList(value) {
    filterList.value = [];
    if (value == TodoListFilter.completed) {
      for (var todo in todoList) {
        if (todo.completed) filterList.add(todo);
      }
    } else if (value == TodoListFilter.active) {
      for (var todo in todoList) {
        if (!todo.completed) filterList.add(todo);
      }
    } else {
      for (var todo in todoList) {
        filterList.add(todo);
      }
    }
    print(todoList.length);
    print(filterList.length);
  }
}
