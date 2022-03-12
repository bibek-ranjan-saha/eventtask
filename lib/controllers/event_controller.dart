import 'package:eventtask/models/event.dart';
import 'package:eventtask/services/remote_services.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool hasError = false.obs;
  RxString message = "not done".obs;
  Rx<Event>? data;

  RxInt? id , type, creator, price, cType;
  RxString? location, file, title, description, start, end;

  void createEvent() async {
    await RemoteCalls()
        .createEvent(
            id?.value,
            creator!.value,
            type!.value,
            price!.value,
            cType!.value,
            location!.value,
            file!.value,
            title!.value,
            description!.value,
            start!.value,
            end!.value)
        .then((value) {
      data?.value = value!;
      switch (value?.status) {
        case 1:
          {
            message.value = "successful";
            break;
          }
        case 2:
          {
            message.value = "Please enter correct data";
            break;
          }
        case 3:
          {
            message.value = "We are facing an internal error try again later";
            break;
          }
        default:
          {
            message.value = "Unknown Error Occurred";
          }
      }
    });
  }
}
