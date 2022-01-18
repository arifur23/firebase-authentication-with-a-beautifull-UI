import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/Screens/drawer_screen.dart';
import 'package:firebase_authentication/Screens/home_screen.dart';
import 'package:firebase_authentication/Screens/login_screen.dart';
import 'package:firebase_authentication/classes/applicationState.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'classes/applicationState.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: (context, _) => const App(),
      )
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Meetup Learning',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0
        ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {


  HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool user;



   Widget currentUserIn()  {
     var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null){
      return const HomeScreen();
    }
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();

  }
}

// Scaffold(
//   body:  currentUserIn()
//
//   // ListView(
//   //   children: <Widget>[
//   //     Image.asset('assets/codelab.png'),
//   //     const SizedBox(height: 8),
//   //     const IconAndDetail(Icons.calendar_today, 'October 10th'),
//   //     const IconAndDetail(Icons.location_city, 'San Francisco '),
//   //
//   //     Consumer<ApplicationState>(
//   //       builder: (context, appState, _) => Authentication(
//   //         email: appState.email,
//   //         loginState: appState.loginState,
//   //         startLoginFlow: appState.startLoginFlow,
//   //         verifyEmail: appState.verifyEmail,
//   //         signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
//   //         cancelRegistration: appState.cancelRegistration,
//   //         registerAccount: appState.registerAccount,
//   //         signOut: appState.signOut,
//   //       ),
//   //     ),
//   //
//   //     // ChangePassword(),
//   //
//   //     const Divider(
//   //       height: 8,
//   //       thickness: 1,
//   //       indent: 8,
//   //       endIndent: 8,
//   //       color: Colors.grey,
//   //     ),
//   //     const Header("What we'll be doing"),
//   //     const Paragraph(
//   //       'Join us for a day full of Firebase Workshops and Coffee!',
//   //     ),
//   //   ],
//   // ),
// );