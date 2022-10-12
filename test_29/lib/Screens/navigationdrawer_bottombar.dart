import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'class.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  static const _pages = <Widget>[
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];


  @override
  void initState() {
    super.initState();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF253551),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex), //New
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
          color: const Color(0xFF253551),


                height: 80,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                child: GestureDetector(onTap: (){
                  Navigator.of(context).pop();
                },
                child:const Icon(Icons.arrow_forward_ios,
                size: 20,color: Colors.white,),),),

              ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
                title: const Text(
                  'Shop',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.pop(context);
                },
                title: const Text(
                  'search',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar:
        BottomNavigationBar(onTap: _onTap,
            backgroundColor: const Color(0xFF253551),
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.greenAccent,
            selectedItemColor: Colors.red,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'search',
              )
            ]
          // _onTap function

        ));
  }

  void _onTap(int index) {
     setState(() {
       _selectedIndex = index;
     }
       );
     }

     }






