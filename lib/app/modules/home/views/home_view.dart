import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasari_flutter/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: Column(
        children: [
          // Form untuk menambah To-Do List
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.todoController,
                    decoration: InputDecoration(
                      hintText: "Tambah To-Do List",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.addTodo();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          // Daftar To-Do List
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.todoList[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Aksi Edit
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Edit To-Do List"),
                                  content: TextField(
                                    controller: controller.todoController,
                                    decoration: InputDecoration(
                                      hintText: "Edit To-Do List",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.editTodo(index);
                                        Get.back();
                                      },
                                      child: Text("Simpan"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            // Aksi Delete
                            controller.deleteTodo(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
