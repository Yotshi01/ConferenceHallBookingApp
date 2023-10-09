import 'package:flutter/material.dart';
import 'package:conference_hall_booking/navigation_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) => Scaffold(
    drawer: const NavigationDrawerFile(),
    appBar: AppBar(
      title: const Text('Edit Profile'),
      backgroundColor: Colors.amber,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container( color:Color.fromRGBO(255, 170, 0, 0.19), padding: EdgeInsets.only(
      top: 2, //+ MediaQuery.of(context).padding.top,
          bottom: 0.1,
          left: 17

      ),
        child: Column(
          // Wrap with Row
          children:[
          SizedBox(
          width: 400,
          //height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //padding: const EdgeInsets.all(24),
              //Icon(CupertinoIcons.person_alt_circle,size: 35),
              Icon(Icons.account_circle_rounded,
                  size: 120, color: Colors.black26),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom:15
                ),
                child: Text(
                  'Change picture',
                  style: TextStyle(
                      fontSize: 20, color: Colors.black),
                ),

              ),
            ],
          )
          )
        ],
      )

        ),

          const SizedBox(height: 20),
          Align( alignment: Alignment.topLeft,
            child: Text(

                "   Username",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
            ),),const SizedBox(height: 10),
          Align(
            child:
            Container(
                alignment: Alignment.centerLeft,
                width: 380,
                height: 45,
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0x28ffc677)),
                child: Text(
                    "   Enter Name",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                )
            ),),
          const SizedBox(height: 10),
          Align( alignment: Alignment.topLeft,
            child:Text(
                "   Email ID",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
            ),),const SizedBox(height: 10),
          Align(
            child:Container(
                alignment: Alignment.centerLeft,
                width: 380,
                height: 45,
                decoration:     BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0x28ffc677)),
                child: Text(
                    "   xyz@abc.com",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                )
            ),),const SizedBox(height: 10),
          Align( alignment: Alignment.topLeft,
            child:Text(
                "   Phone Number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
            ),),const SizedBox(height: 10),
          Align(
            child:
            Container(
                alignment: Alignment.centerLeft,
                width: 380,
                height: 45,
                decoration:     BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0x28ffc677)),
                child: Text(
                    "   +91 XXXXXXXXXX",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                )
            ),),const SizedBox(height: 10),
          Align( alignment: Alignment.topLeft,
            child:
            Text(
                "   Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
            ),),const SizedBox(height: 10),
          Align(
            child:Container(
                alignment: Alignment.centerLeft,
                width: 380,
                height: 45,
                decoration:     BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0x28ffc677)),
                child: Text(
                    "   Enter Password",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                )
            ),),const SizedBox(height: 35),
          Container(
            alignment: Alignment.center,
              width: 278,
              height: 45,
              decoration:     BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xd3ffab00)),
            child: Text(
                "Update",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                )
            ),
          )
  ],
  ),
    ),
  );
}