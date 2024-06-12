import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class TodoView extends GetView<HomeController> {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {
                  controller.filter.value = TodoListFilter.all;
                  controller.getFilterList(TodoListFilter.all);
                },
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  foregroundColor: MaterialStateProperty.all(
                    controller.filter.value == TodoListFilter.all ? Colors.blue : Colors.black,
                  ),
                ),
                child: const Text('All'),
              ),
              TextButton(
                onPressed: () {
                  controller.getFilterList(TodoListFilter.active);
                  controller.filter.value = TodoListFilter.active;
                },
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  foregroundColor: MaterialStateProperty.all(
                    controller.filter.value == TodoListFilter.active ? Colors.blue : Colors.black,
                  ),
                ),
                child: const Text('Not Completed'),
              ),
              TextButton(
                onPressed: () {
                  controller.getFilterList(TodoListFilter.completed);
                  controller.filter.value = TodoListFilter.completed;
                },
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  foregroundColor: MaterialStateProperty.all(
                    controller.filter.value == TodoListFilter.completed
                        ? Colors.blue
                        : Colors.black,
                  ),
                ),
                child: const Text('Completed'),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => RefreshIndicator.adaptive(
                onRefresh: () => controller.getTodoList(),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 2),
                  itemBuilder: (context, index) => Material(
                    color: Colors.white,
                    elevation: 6,
                    child: InkWell(
                      onTap: () {
                        controller.filterList[index].completed =
                            !controller.filterList[index].completed;
                        controller.filterList.refresh();
                        controller.todoList.value = controller.todoList.map((element) {
                          if (element.id == controller.filterList[index].id) {
                            element.completed = !element.completed;
                          }
                          return element;
                        }).toList();
                      },
                      child: ListTile(
                        leading: Checkbox(
                          value: controller.filterList[index].completed,
                          onChanged: (value) {
                            controller.filterList[index].completed = value!;
                            controller.filterList.refresh();
                            controller.todoList.value = controller.todoList.map((element) {
                              if (element.id == controller.filterList[index].id) {
                                element.completed = value;
                              }
                              return element;
                            }).toList();
                          },
                        ),
                        title: Text(
                          controller.filterList[index].title,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: controller.filterList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
