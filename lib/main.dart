import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home.dart';
import 'projects.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Soho'),
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/project': (context) => MyProject(),
      '/': (context) => MyHome(),
      '/about': (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _openGmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'abhishekrajveer715@gmail.com',
    );

    // Launch Gmail if it's available, otherwise throw an error
    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch $_emailLaunchUri';
    }
  }

  void _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $url\nError: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60,left: 0),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assests/bnw.png',
                  width: 600,
                  height: double.infinity,

                ),
              ),
            ),
            10.heightBox,
            Container(

              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.7),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   'Hello I am',
                  //   style: TextStyle(color: Colors.white, fontSize: 30),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Abhishek Kumar',
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Software Developer',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        _openGmail();
                      },
                      child: Text('Hire Me'),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white, // Background Color
                      ),
                    ),
                    width: 120,
                  ),
                  SizedBox(
                    height: 05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchURL('https://www.instagram.com/_cereton_/');
                        },
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURL('https://www.linkedin.com/in/abhishek-kumar-882877229/');
                        },
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURL('https://github.com/Cereton32');
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
