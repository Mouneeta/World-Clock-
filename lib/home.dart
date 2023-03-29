import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings?.arguments as Map;
    print(data);

    //set background
    String bgImage;
    if (data['isDaytime']==1) {
      bgImage = 'day.png';
    } else {
      bgImage = 'night.png';
    }

    Color bgColor;
    if (data['isDaytime']==1) {
      bgColor = Colors.blue;
    } else {
      bgColor = Colors.indigo;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assest/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0,0),

            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                    },
                ),
              SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],

                      style: TextStyle(
                        fontSize: 66.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Colors.white,
                  ),
                ),
               ],
             ),
          ),
        ),
      ),
    );
  }
}
