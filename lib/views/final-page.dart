import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/event_controller.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventController eventController = Get.put(EventController());

    return Scaffold(
      appBar: AppBar(title: const Text("status"),),
      body: Center(child:  Text(eventController.message.value),),
    );
  }
}
