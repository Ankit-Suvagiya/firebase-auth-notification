
import 'package:auth_buttons/auth_buttons.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firedemo/sign_in.dart';
import 'package:firedemo/user_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const FlutterLogo(
//                   size: 250,
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     signInWithGoogle().then(
//                           (result) {
//                         if (result != null) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => UserPage(),
//                             ),
//                           );
//                         }
//                       },
//                     );
//                   },
//                   child: Container(
//                     height: 55,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.grey, width: 2),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // Image.network(
//                         //   "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/800px-Google_%22G%22_Logo.svg.png",
//                         //   width: 35,
//                         // ),
//                         Text(
//                           "Sign In with Google",
//                           style: TextStyle(color: Colors.grey, fontSize: 20),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(pushfirebasehandler);

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: "key1",
            channelName: "name",
            channelDescription: "this is the messege",
            playSound: true,
            enableLights: true,
            enableVibration: true
        )
      ]);
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

final FirebaseAuth auth = FirebaseAuth.instance;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      child: Center(
        child: GoogleAuthButton(
          onPressed: () async {
            Notify();
              // // GoogleSignInAccount? googleSignInAccount= await _googleSignIn.signIn();
              // // GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount!.authentication;
              // // AuthCredential credential= GoogleAuthProvider.credential(
              // //   idToken: googleSignInAuthentication.idToken,
              // //   accessToken: googleSignInAuthentication.accessToken
              // // );
              // // await auth.signInWithCredential(credential).then((value) async {
              // //   CollectionReference users1=FirebaseFirestore.instance.collection("users");
              // //   //FirebaseAuth _auth=FirebaseAuth.instance;
              // //   var email=auth.currentUser!.email;
              // //   var name=auth.currentUser!.displayName;
              // //   var mobile=auth.currentUser!.phoneNumber;
              // //   users1.add({"email":value.user!.email,"name":value.user!.displayName,"mobile":value.user!.phoneNumber}).whenComplete(() => print("add record"));
              // // }).whenComplete((){
              // //   print("complete");
              // //   Navigator.push(
              // //     context,
              // //     MaterialPageRoute(builder: (context) => const Homepage1()),
              // //   );
              // });


            // FirebaseAuth _auth = FirebaseAuth.instance;
            // await _auth.signInWithEmailAndPassword(email: "ankit@gmail.com", password: "1234@Avfd").whenComplete((){
            //   print("signin password");
            // });



              // await _auth.createUserWithEmailAndPassword(
              //   email: "viashal@gmail.com",
              //   password: "1234@Avfd",
              // ).whenComplete((){ print("register user"); });
          },
          //child: const Text("add"),
        ),
      ),
    );
  }
}


// class AuthenticationHelper {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   get user => _auth.currentUser;
//
//   //SIGN UP METHOD
//   Future signUp({required String email, required String password}) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//
//   //SIGN IN METHOD
//   Future signIn({required String email, required String password}) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//
//   //SIGN OUT METHOD
//   Future signOut() async {
//     await _auth.signOut();
//
//     print('signout');
//   }
// }
//
//


class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  _Homepage1State createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.yellow[100],
        child: Center(
          child: FlatButton(child: Text("logout"),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('data').doc(auth.currentUser!.uid).set({'text': 'data added through app'});
              print("logout");
              Navigator.pop(context);
            // auth.signOut().whenComplete(() async {
            //
            // });
            },

          ),
        ),
      ),
    );
  }
}

Future<void> Notify() async {
  print("helllo");
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: "key1",
          title: "title",
          body: "this is the body"
      ),
  );
}

Future<void> pushfirebasehandler(RemoteMessage message)async{
  print("helo fire");
  print("firebase notifivcation ${message.data}");
  await AwesomeNotifications().createNotificationFromJsonData(message.data);
}



