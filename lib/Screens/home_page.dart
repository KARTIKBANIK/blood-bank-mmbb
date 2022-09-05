import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false, //remove appbar default icon....
        toolbarHeight: 150, //appbar heigth....

        //rounded appbar....
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          'BLOOD BANK APP',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 10,
          right: 10,
        ),
        child: Container(
          child: GridView(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "images/blood.png",
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "images/ambulence.png",
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "images/doctor.png",
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "images/fiire.png",
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ),

      // CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Colors.red,
      //   items: [
      //     GestureDetector(
      //         onTap: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) => HomePage()));
      //         },
      //         child: Icon(Icons.home, size: 30, color: Colors.white)),
      //     // Icon(Icons.report, size: 30, color: Colors.redAccent),
      //     GestureDetector(
      //         onTap: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) => Fav()));
      //         },
      //         child: Icon(Icons.favorite, size: 30, color: Colors.white)),
      //     // Icon(Icons.settings, size: 30, color: Colors.redAccent),
      //     GestureDetector(
      //         onTap: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) => Profile()));
      //         },
      //         child: Icon(Icons.person, size: 30, color: Colors.white)),
      //   ],
      //   // items: items,
      //   // index: index,
      //   // onTap: (index) => setState(() {
      //   //   this.index = index;
      //   // }),
      //   // backgroundColor: Colors.transparent,
      //   // color: Colors.red,
      // ),
    );
  }
}
