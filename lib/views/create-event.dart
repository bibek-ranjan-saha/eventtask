import 'package:eventtask/constants/styles.dart';
import 'package:eventtask/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'event-type.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventController eventController = Get.put(EventController());
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.keyboard_arrow_left),
        ),
        title:
            heading(context, text: "Create New Event", weight: FontWeight.w800),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.25,
                width: width,
                decoration: BoxDecoration(
                    color: hexColor("F5F5F5"),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    aimage("upload-file", scale: 2),
                    SBox(context, 0.015),
                    heading(context, text: "Upload your file here")
                  ],
                ),
              ),
              SBox(context, 0.03),
              heading(context,
                  text: "TITLE",
                  weight: FontWeight.w500,
                  color: hexColor("565656")),
              SBox(context, 0.015),
              txtFieldContainer(
                context,
                eventController.title,
                controller: titleController,
                color: hexColor("f5f5f5"),
                borcolor: hexColor("F5F5F5"),
                hintText: "Type something",
                hintColor: Colors.black45,
              ),
              SBox(context, 0.03),
              heading(context,
                  text: "DESCRIPTION",
                  weight: FontWeight.w500,
                  color: hexColor("565656")),
              SBox(context, 0.015),
              txtFieldContainer(context,
                  eventController.description,
                  controller: descriptionController,
                  color: hexColor("f5f5f5"),
                  borcolor: hexColor("F5F5F5"),
                  hintText: "Type something",
                  hintColor: Colors.black45,
                  maxLines: 6),
              SBox(context, 0.03),
              button1(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SBox(context, 0.03),
                      heading(context, text: "Starting date and time"),
                      SBox(context, 0.02),
                      button1(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              heading(context, text: "Right after listing"),
                              const Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                          10,
                          color: Colors.white),
                      SBox(context, 0.03),
                      heading(context, text: "Ending date and time"),
                      SBox(context, 0.02),
                      button1(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              heading(context, text: "1 Day"),
                              const Icon(Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                          10,
                          color: Colors.white),
                      SBox(context, 0.02),
                    ],
                  ),
                  15,
                  color: hexColor("F5F5F5")),
              SBox(context, 0.05),
              navigate(
                context: context,
                page: const EventType(),
                child: button1(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          heading(context,
                              text: "Next",
                              weight: FontWeight.w600,
                              color: Colors.white)
                        ],
                      ),
                    ),
                    15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
