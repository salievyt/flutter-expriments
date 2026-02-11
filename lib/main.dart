import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainPage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final accountName = Text('Name');
  final accountEmail = Text('Email');
  List<String> settings = ["Язык", "Тема", "О программе"];
  List<IconData> icons = [Icons.language, Icons.color_lens, Icons.info];

  final MaterialColor defaultColor = Colors.grey;
  final MaterialColor activeColor = Colors.blue;
  final MaterialColor activatedColor = Colors.grey;

  void changeMode(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 16,),
                          Text("TODAY", style: TextStyle(color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Text("      Press or hold +\n to create a new task", style: TextStyle(fontSize: 16,),),
                      SizedBox(height: 67,),
                      Row(
                        children: [
                          SizedBox(width: 56,),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("TOMORROW", style: TextStyle(color: Colors.blue, fontSize: 32, fontWeight: FontWeight.bold),),
                                Text("NEXT WEEK", style: TextStyle(color: Colors.grey, fontSize: 32, fontWeight: FontWeight.bold),),
                                Text("LATER", style: TextStyle(color: Colors.grey, fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                              ]
                          )
                        ],
                      )
                    ],
                  ),
                ]
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => DrinkWater()),
                  );
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinkWater extends StatefulWidget {
  const DrinkWater({super.key});

  @override
  State<DrinkWater> createState() => _DrinkWaterState();
}

class _DrinkWaterState extends State<DrinkWater> {
  int count = 0;

  // Цвет основной иконки и выбранного цвета
  Color mainColor = Colors.lightBlue;

  // Список доступных цветов
  List<Color> colors = [
    Colors.lightGreenAccent,
    Colors.deepPurpleAccent,
    Colors.pinkAccent,
    Colors.purple,
    Colors.orange,
    Colors.greenAccent,
  ];

  void swapColors(int index) {
    setState(() {
      // Меняем местами цвет основной иконки и выбранного
      Color temp = mainColor;
      mainColor = colors[index];
      colors[index] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: const Text("Drink Water"),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Done", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),),
            ),
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
            )
        ),
        child: SafeArea(
          child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: mainColor,
                    child: Icon(Icons.water_drop, color: Colors.white, size: 40,),
                  ),
                  const SizedBox(height: 16,),
                  Row(
                      children: [
                        SizedBox(width: 16,),
                        for (int i = 0; i < colors.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () => swapColors(i),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: colors[i],
                              ),
                            ),
                          ),
                      ]
                  ),
                  const SizedBox(height: 16,),
                  Row(
                      children: [
                        SizedBox(width: 16,),
                        Text("Title", style: TextStyle(color: Colors.grey ,fontSize: 20, fontWeight: FontWeight.normal),),
                        SizedBox(width: 233,),
                        Text("Take vitamins", style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.normal),),
                      ]
                  ),
                  const SizedBox(height: 16,),
                  Row(
                      children: [
                        SizedBox(width: 16,),
                        Text("Every day", style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.normal),),
                      ]
                  ),
                  const SizedBox(height: 32,),
                  Text("Repetitions per day", style: TextStyle(color: Colors.grey ,fontSize: 18),),
                  const SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          setState(() {
                            if (count > 0) {
                              count--;
                            }
                          });
                        },
                        child: Icon(Icons.remove_circle_outline, size: 40, color: Colors.black,),
                      ),
                      SizedBox(width: 8,),
                      Text("$count", style: TextStyle(color: Colors.black ,fontSize: 32, fontWeight: FontWeight.normal),),
                      SizedBox(width: 8,),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          setState(() {
                            count++;
                          });
                        },
                        child: Icon(Icons.add_circle_outline, size: 40, color: Colors.blue,),
                      ),
                    ],
                  )
                ],
              )
          ),
        )
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CupertinoNavigationBar(
            // middle: const Text("Drink Water"),
            // trailing: CupertinoButton(
            //   padding: EdgeInsets.zero,
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: const Text("Done", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),),
            // ),
            // leading: CupertinoButton(
            //   padding: EdgeInsets.zero,
            //   onPressed: (){
            //     Navigator.pop(context);
            //   },
            //   child: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
            // )
        ),
        body: Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.water_drop, size: 36,color: Colors.white,),
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Text("Water", style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.normal),),
                    ]
                  ),
                  SizedBox(width: 18,),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.cable, size: 36,color: Colors.white,),
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Text("Electricity", style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.normal),),
                    ],
                  ),

                  SizedBox(width: 18,),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.medical_information, size: 36,color: Colors.white,),
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Text("Medicine", style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.normal),)
                    ],
                  ),
                  SizedBox(width: 18,),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.book, size: 36,color: Colors.white,),
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Text("Books", style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.normal),)
                    ],
                  ),
                ],
              ),
              TextButton(onPressed: (){}, child: Text("See all", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.normal),))
            ],
          ),
        )
      ),

    );
  }
}
