import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:provider/provider.dart';
import 'package:tafadzwa/get_x/data_controller.dart';
import 'package:tafadzwa/models/user_model.dart';

class Client extends StatefulWidget {
  static String id= "/home";
  const Client({Key? key}) : super(key: key);


  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<Client> {

  final controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Account"),
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
              )
            ],
          )),
    );
  }


}

