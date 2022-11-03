import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_octoreality_moadh/dashboard.dart';

class Remerciement extends StatefulWidget {
  const Remerciement({Key? key}) : super(key: key);

  @override
  State<Remerciement> createState() => _RemerciementState();
}

class _RemerciementState extends State<Remerciement> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: Container(
            height: size.width * .155,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == currentIndex ? 0 : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .128,
                      height: index == currentIndex ? size.width * .014 : 0,
                    ),
                    Icon(
                      listOfIcons[index],
                      size: size.width * .076,
                      color: index == currentIndex
                          ? Colors.green.shade200
                          : Colors.black38,
                    ),
                    SizedBox(height: size.width * .03),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                "Merci pour votre réponse",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 375, height: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade300)),
                  child: Text(
                    "Retour au tableau de bord",
                    style:
                        TextStyle(fontSize: 15, color: Colors.indigo.shade900),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashborad()));
                  },
                ),
              ),
            ],
          )),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_filled,
    Icons.chat_bubble_outline,
    Icons.notifications_none,
    Icons.person_outline_rounded,
  ];
}
