import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  _NotificationProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(' Notifications page', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: const FloatButton(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final notifications = Provider.of<_NotificationProvider>(context).number;

    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      currentIndex: 0,
      items:  [
        
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone)
        ),

        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.pink,)
                child: Container(
                  alignment: Alignment.center,
                  width: 13 ,
                  height: 13,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle
                  ),
                  child: Text('$notifications', style: const TextStyle(color: Colors.white, fontSize: 11),)
                  ,
                ),
              )
            ],
          )
        ),

        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.dog),
              Positioned(
                top: 0,
                right: 15,
                child: Icon(Icons.brightness_1, size: 8, color: Colors.pink,)
              )
            ] 
          )
        )
      ]
    );
  }
}

class FloatButton extends StatelessWidget {
  const FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int not = Provider.of<_NotificationProvider>(context, listen: false).number;
        not ++;
        Provider.of<_NotificationProvider>(context, listen: false).number = not;
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play, color: Colors.white,),
    );
  }
}

class _NotificationProvider extends ChangeNotifier {

  int _number = 0;

  int get number => _number;

  set number(int value) {
    _number = value;
    notifyListeners();
  }

}