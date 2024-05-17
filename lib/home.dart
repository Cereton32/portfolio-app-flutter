import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget _aboutAchievements(String num, String type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "Soho",
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            type,
            style: TextStyle(
              fontFamily: "Soho",
            ),
          ),
        )
      ],
    );
  }

  Widget _mySpec(IconData icon, String text) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Soho",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      height: 115,
      width: 105,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: PopupMenuButton(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          icon: Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                child: Text(
                  'Projects',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/project');
                },
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: TextButton(
                child: Text(
                  'About Me',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              value: 2,
            )
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: SlidingSheet(
              elevation: 10,
              cornerRadius: 50,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.38, 0.7, 1.0],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              body: Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset(
                          'assests/bnw.png',
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.49,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Abhishek kumar',
                            style: TextStyle(
                              fontFamily: "Soho",
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Software Engineer',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Soho",
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(left: 20, top: 30, right: 20),
                  height: 1000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _aboutAchievements('12', ' Projects'),
                          _aboutAchievements('02', ' Internship '),
                          _aboutAchievements('11', ' Messages'),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Specialized In',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Soho",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _mySpec(FontAwesomeIcons.android, 'Flutter'),
                              _mySpec(FontAwesomeIcons.google, 'Firebase'),
                              _mySpec(FontAwesomeIcons.unlock, 'Appwrite'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _mySpec(FontAwesomeIcons.php, 'Php'),
                              _mySpec(FontAwesomeIcons.nodeJs, 'NodeJS'),
                              _mySpec(FontAwesomeIcons.java, 'Express JS'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _mySpec(FontAwesomeIcons.html5, 'Html'),
                              _mySpec(FontAwesomeIcons.css3, 'Css'),
                              _mySpec(FontAwesomeIcons.java, 'Javascript'),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _mySpec(FontAwesomeIcons.python, 'Python'),
                              _mySpec(FontAwesomeIcons.c, 'c++'),
                              _mySpec(FontAwesomeIcons.java, 'java'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
