import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../global/constants.dart';


class GuessScreen extends StatefulWidget {
  static String id = '/guessScreen';

  const GuessScreen({Key? key}) : super(key: key);

  @override
  State<GuessScreen> createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  int? res = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: GRADIENT),
        ),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) , bottomRight: Radius.circular(20)  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffB83AF3),
                      Color(0xff6950FB),
                    ],
                  )),
              child: ListView.separated(
                itemBuilder: (ctx, index) => matchItem(context),
                separatorBuilder: (ctx, index) => const Divider(color: Colors.grey,),
                itemCount: 10,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)  ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Text("Yesterday Winners")),
                  ),

                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(5),
                      itemBuilder: (context, index) => winners(),
                      separatorBuilder: (ctx, index) => const Divider(color: Colors.grey,),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget matchItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 90,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://upload.wikimedia.org/wikipedia/ar/archive/8/8a/20210729153619%21%D8%B4%D8%B9%D8%A7%D8%B1_%D8%A7%D9%84%D9%86%D8%A7%D8%AF%D9%8A_%D8%A7%D9%84%D8%A3%D9%87%D9%84%D9%8A_%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A.png'),),),
                  Text(
                    "team1",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 90,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://upload.wikimedia.org/wikipedia/ar/archive/8/8a/20210729153619%21%D8%B4%D8%B9%D8%A7%D8%B1_%D8%A7%D9%84%D9%86%D8%A7%D8%AF%D9%8A_%D8%A7%D9%84%D8%A3%D9%87%D9%84%D9%8A_%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A.png'),),),
                  Text(
                    "team2",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                '9:00',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '28/03/2022',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  onPressed:()=>  showDialog(context: context, builder: (context)=>alert()),
                  color: Colors.amber,
                  child: Text(
                    "team 1 Win",
                  )),
              MaterialButton(
                  onPressed:()=>  showDialog(context: context, builder: (context)=>alert()),
                  color: Colors.amber,
                  child: Text(
                    "Guess Tie",
                  )),
              MaterialButton(
                  onPressed:()=>  showDialog(context: context, builder: (context)=>alert()),
                  color: Colors.amber,
                  child: Text(
                    "team 2 win",
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget winners() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png"),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text("Winner 1"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: Color.fromARGB(255, 255, 230, 0),
                      size: 10,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '45',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/coin.svg',
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '23112',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget alert() {
    return AlertDialog(
      content: Container(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRadioValues(10),
            SizedBox(height: 15,),
            buildRadioValues(100),
            SizedBox(height: 15,),
            buildRadioValues(1000),
            SizedBox(height: 15,),
            buildRadioValues(5000),
          ],
        ),
      ),
    );
  }

  Row buildRadioValues(int valu) {
    return Row(
      children: [
        Radio(
          value: valu,
          groupValue: res,
          onChanged: (int? val) {
            setState(() {
              res = val;
              print(res);
              Navigator.pop(context);
            });
          },
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/coin.svg',
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '$valu',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
