import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/pages/navigation_page.dart';
import 'package:animate_do_app/pages/twiter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: FadeIn(child: const Text('Animate_do')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TwitterPage()));
            }, 
            icon: const FaIcon(FontAwesomeIcons.twitter)
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => const Page1()));
            }, 
            
            icon: FadeInLeft(
              from: 100,
              child: const Icon(Icons.navigate_next_sharp, size: 30,),
            ),
          )
        ],
      ),
      
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (BuildContext context) => const NavigationPage()
              )
            );
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElasticIn(
              delay: const Duration(milliseconds: 1500),
              child: const Icon(Icons.new_releases, color: Colors.blue, size: 40 )
            ),

            FadeInDown(
              duration: const Duration(milliseconds: 1000),
              child: const Text(' Title', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200) )
            ),

            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text('Am Little text', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w200) )
            ),

            FadeInLeft(
              delay: const Duration(milliseconds: 1000),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}