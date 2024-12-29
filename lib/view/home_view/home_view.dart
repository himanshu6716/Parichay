import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parichay/res/common_widgets/rounded_Button.dart';
import 'package:parichay/view/set_pref_view/set_preference_view.dart';

import '../../res/common_widgets/user_profiles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isVisible = true;
  List proArr = [
    {
      "name": "Samantha Smith",
      "age": "26 Years |",
      "height": "5'6 feet",
      "image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      "country": "New York",
      "caste": "Catholic Christian",
      "designation": "UI UX Designer",
      "education": "Computer Science",
    },
    {
      "name": "Elise",
      "age": "24 Years |",
      "height": "5'4 feet",
      "image":
          "https://plus.unsplash.com/premium_photo-1675034393381-7e246fc40755?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
      "country": "Santiago",
      "caste": "Muslim",
      "designation": "App Developer",
      "education": "M.Tech",
    },
    {
      "name": "Jenifer",
      "age": "25 Years |",
      "height": "5'3 feet",
      "image":
          "https://images.unsplash.com/photo-1503104834685-7205e8607eb9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHN8ZW58MHx8MHx8fDA%3D",
      "country": "California",
      "caste": "Brahmin",
      "designation": "Software Developer",
      "education": "Diploma",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SoulMeet',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileSetupView()));
              },
              child: Text(
                'Set Preference',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: proArr.length,
              itemBuilder: ((context, index) {
                var uObj = proArr[index] as Map? ?? {};
                return Card(
                  elevation: 5,
                  color: Color(0xFFEFEFEF),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Row(
                            children: [
                              Text(
                                uObj["name"],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text(uObj["age"],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              Text(uObj["height"],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(uObj["caste"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                  Text(uObj["country"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(uObj["education"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                  Text(uObj["designation"],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Container(
                                height: 100,
                                // height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .5,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: uObj["image"].length,
                                    itemBuilder: (context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          child: Image.network(
                                            uObj["image"],
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: RoundedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserDetails()));
                                    },
                                    title: 'More Info',
                                    fontSize: 14,
                                    color: Colors.white,
                                    txtColor: Colors.red),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: RoundedButton(
                                    onPressed: () {},
                                    title: 'Connect Request',
                                    fontSize: 14,
                                    color: Colors.red,
                                    txtColor: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
