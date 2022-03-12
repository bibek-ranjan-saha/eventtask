import 'package:eventtask/models/event.dart';
import 'package:http/http.dart' as http;

class RemoteCalls {
  //creating a class level object of http to reuse in multiple api calls
  var client = http.Client();

  //call this method to create event providing the data
  Future<Event?> createEvent(
      int? id,
      int? creator,
      int? type,
      int? price,
      int? cType,
      String? location,
      String? file,
      String? title,
      String? description,
      String? start,
      String? end) async {
    var url = Uri.parse(
        "http://104.155.187.128:9999/api/upload/v1/event/updateEvent");
    var body = {
      "id": id,
      "creator": creator,
      "type": type,
      "price": price,
      "currency_type": cType,
      "location": location,
      "file": file,
      "title": title,
      "description": description,
      "start_at": start,
      "end_at": end
    };
    var response = await client.post(url, body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return eventFromJson(jsonString);
    } else {
      return null;
    }
  }
}
