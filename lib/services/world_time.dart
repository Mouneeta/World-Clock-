import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String url;
  late int isDaytime = 0;


  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async{

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property

      if (now.hour > 6 && now.hour < 16) {
        isDaytime = 1;
      } else {
        isDaytime = 2;
      }

      time = DateFormat.jm().format(now);

    }
    catch (e){
      print('caught error: $e');
      time = 'could not get time data';
    }




  }

}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
//instance.getTime();