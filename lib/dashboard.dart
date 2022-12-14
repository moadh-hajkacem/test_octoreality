import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_octoreality_moadh/question.dart';

class Dashborad extends StatefulWidget {
  const Dashborad({Key? key}) : super(key: key);

  @override
  State<Dashborad> createState() => _DashboradState();
}

class _DashboradState extends State<Dashborad> {
  var currentIndex = 0;
  List<String> iconLabel = ["Accueil", "Chat", "Alertes", "Profil"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .002,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          listOfIcons[index],
                          size: size.width * .076,
                          color: index == currentIndex
                              ? Colors.green.shade200
                              : Colors.black38,
                        ),
                        Text(
                          iconLabel[index],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade200,
                  foregroundColor: Colors.white,
                  radius: 50.0,
                  child: const Text("FBF"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/hiemoji.jpg",
                  scale: 5,
                ),
                title: const Text(
                  "Hello Foulen Ben Foulen",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              ListTile(
                title: const Text(
                  "C'est le moment de nous en dire plus sur vous",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                trailing: Image.asset("assets/angelemoji.jpg"),
              ),
              Image.asset("assets/clickhere.png"),
              ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pink.shade300)),
                  child: const Text(
                    "Commencer !",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen()));
                  },
                ),
              ),
              Card(
                color: Colors.grey.shade200,
                child: ListTile(
                  title: const Text(
                    "Profil incomplet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Am??liorez votre profil"),
                  leading: Icon(
                    Icons.person,
                    color: Colors.pink.shade300,
                  ),
                  trailing: ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(width: 150, height: 40),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink.shade300)),
                      child: Row(
                        children: const [
                          Center(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Compl??ter   ',
                                  ),
                                  WidgetSpan(
                                    child: Icon(Icons.create_outlined),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    color: Colors.grey.shade200,
                    child: Column(
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            children: [
                              const TextSpan(
                                text: 'Suivi du poids  ',
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CircularPercentIndicator(
                          radius: 150.0,
                          lineWidth: 8.0,
                          backgroundColor: Colors.indigo.shade900,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.pink.shade400,
                                    size: 40,
                                  )),
                              const Text("saisissez",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text("votre poids",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    child: Column(
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Exercice  ',
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CircularPercentIndicator(
                          radius: 150.0,
                          lineWidth: 8.0,
                          backgroundColor: Colors.indigo.shade900,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.pink.shade400,
                                  )),
                              const Text("connectez",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text("votre app",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text("sant??",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ]))),
          ],
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
