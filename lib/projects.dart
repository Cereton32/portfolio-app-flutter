import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'projects.dart';
class MyProject extends StatefulWidget {
  const MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  void _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $url\nError: $e');
    }
  }
  Widget projectCard(String lang, String title, String description, String star) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 220,
      child: Card(
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 30, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white70,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    star,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      _launchURL('https://github.com/Cereton32');
                    },
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        color: Color(0xff262628),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set the icon color to white
          onPressed: () {
            Navigator.of(context).pop(); // Add the navigation logic here
          },
        ),
        backgroundColor:Colors.black,
        title: Text('Projects',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 29),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              projectCard('FLUTTER', 'Doc_finder App', 'whre you find doctors', ''),
              projectCard("React-Js", 'Portfolio App', 'portfolio-of mne', ''),
              projectCard('PYTHON', 'Libaray Management system', 'entry exit of Book.', ''),
              projectCard('Node-js', 'ecommerce Web', 'eccomerce website.', ''),

              projectCard('FLUTTER', 'chat_app_ui', 'An online chat App', ''),
              projectCard('FLUTTER', 'insta-clone', 'instagram ui clone', ''),
              projectCard('Reactjs', 'website feature', 'Pasword-generator', ''),
              projectCard('Php-mysql', 'forum-website', 'An online discussion  web', ''),

            ],
          ),
        ),
      ),
    );
  }
}
