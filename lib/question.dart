import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:group_button/group_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_octoreality_moadh/dashboard.dart';
import 'package:test_octoreality_moadh/remerciment.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;
  List<bool> isCardEnabled = [];
  List<String> reponse = ['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          height: 120,
          child: CupertinoNavigationBar(
            leading: Material(
              child: IconButton(
                icon: Icon(CupertinoIcons.back, color: Colors.green[200]),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Colors.white,
            middle: const Text(
              "Questionnaire",
            ),
            trailing: CircularPercentIndicator(
              backgroundWidth: 3,
              progressColor: Colors.green.shade200,
              radius: 50.0,
              lineWidth: 3.0,
              percent: 0.2.clamp(.0, 1.0),
              backgroundColor: Colors.grey.shade200,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "5/20",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          const Text(
            "Une question à choix unique",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            "Une seule réponse possible !",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                isCardEnabled.add(false);
                return GestureDetector(
                    onTap: () {
                      isCardEnabled.replaceRange(0, isCardEnabled.length, [
                        for (int i = 0; i < isCardEnabled.length; i++) false
                      ]);
                      isCardEnabled[index] = true;
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 40,
                      width: 90,
                      child: Card(
                        color: isCardEnabled[index]
                            ? Colors.indigo.shade900
                            : Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Réponse ${reponse[index]}',
                            style: TextStyle(
                                color: isCardEnabled[index]
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ));
              }),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 375, height: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pink.shade300)),
              child: const Text(
                "Suivant",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Remerciement()));
              },
            ),
          ),
        ],
      ),
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
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_filled,
    Icons.chat_bubble_outline,
    Icons.notifications_none,
    Icons.person_outline_rounded,
  ];
}
