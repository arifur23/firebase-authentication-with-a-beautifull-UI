import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/Screens/goals_screen.dart';
import 'package:firebase_authentication/Screens/login_screen.dart';
import 'package:firebase_authentication/Screens/my_body_screen.dart';
import 'package:firebase_authentication/classes/applicationState.dart';
import 'package:firebase_authentication/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userName = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const sizeConst = 110.0;
    return Consumer<ApplicationState>(
      builder: (context, appState, child) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 25,top: 10),
            child: Builder(
              builder: (BuildContext context) {
                return const IconButton(
                  icon:  Icon(Icons.arrow_back_ios,size: 20,),
                  onPressed: null,
                );
              },
            ),
          ),
          title:  Text('${appState.getUserData()?.displayName}'),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20,top: 10),
              child: IconButton(onPressed: null
              //     () async {
              //   appState.signOut();
              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              // }
              ,
                  icon:  Icon(Icons.menu_open_rounded,color: Colors.black,)),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 40,right: 25,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: sizeConst,
                      width: sizeConst,
                      child: Stack(
                        children:  [
                          ShaderMask(
                              shaderCallback: (rect){
                                return const SweepGradient(
                                    startAngle: 0.0,
                                    endAngle: 3.14 * 2,
                                    stops:  [0.5,0.5],
                                    center: Alignment.center,
                                    colors: [Color(0xFFED7333),Colors.transparent]
                                ).createShader(rect);
                              },
                            child: Container(
                              height: sizeConst,
                              width: sizeConst,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                            ),
                          ),
                           Center(
                             child: Container(
                               height: sizeConst - 5,
                               width: sizeConst - 5,
                               decoration: const BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white
                               ),
                             ),
                           ),
                           const Center(
                            child:  CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage('assets/image.jpg'),
                            ),
                          )
                        ]
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 2,
                          decoration: const BoxDecoration(
                              color:  Color(0xFFF6F6F6)
                          ),
                          child: const Text(''),
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('Joined',style: TextStyle(fontWeight: FontWeight.w500,color:  Colors.black.withOpacity(.3)),),
                            const SizedBox(height: 10,),
                            const Text('6 mon ago',style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    )
                  ]
                ),
                const SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('David',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color:  Colors.black)),
                    Text('Clerisseau',style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400,color:  Colors.black.withOpacity(.3)))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children:  [
                      Item(iconData: Icons.adb_rounded,iconColor:const Color(0xFFEE7537),boxColor: const Color(0xFFFFF0E7),title: 'Goals',onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const GoalsScreen();
                        }));
                      },),
                      Item(iconData: Icons.account_circle_rounded,iconColor: const Color(0xFF5532FA),boxColor: const Color(0xFFECEBFF),title: 'My Body',onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)
                        { return const MyBodyScreen();}));
                      },),
                      Item(iconData: Icons.settings,iconColor: const Color(0xFFEE7537),boxColor: const Color(0xFFFFF0E7),title: 'Settings',onPressed: (){},),
                    ],
                  ),
                ),
                const SizedBox(height: 60,),
                Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFF6F5F8)
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      appState.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        const Padding(
                          padding:  EdgeInsets.only(left: 12),
                          child:  Icon(Icons.logout),
                        ),
                        // const SizedBox(width: 10,),
                         Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Sing Out',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.6)),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
