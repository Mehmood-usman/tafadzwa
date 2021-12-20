import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafadzwa/get_x/data_controller.dart';

class Employee extends StatelessWidget {
  static String id = "/employee";
  const Employee({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<DataProvider>(context);

    final controller = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Account"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GetX<DataController>(
                        builder: (_) =>(Text(controller.user.value.username)))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
