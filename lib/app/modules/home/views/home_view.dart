import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/modules/home/views/profile_view.dart';
import 'package:todo_app/app/modules/home/views/todo_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: PageView(
          controller: controller.pageController.value,
          children: const [
            TodoView(),
            ProfileView(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Get.theme.colorScheme.background,
          currentIndex: controller.currentPage.value,
          onTap: (index) {
            controller.currentPage.value = index;
            controller.pageController.value.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
