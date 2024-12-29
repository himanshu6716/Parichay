import 'package:flutter/material.dart';
import 'package:parichay/view/chat_view/conversation_view.dart';
import 'package:parichay/res/common_widgets/rounded_Button.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chat',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
              body: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4)),
                child: TabBar(
                  // indicator: BoxDecoration(
                  //     color: Colors.green[300],
                  //     borderRadius: BorderRadius.circular(4.0)),
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Accepted',
                    ),
                    Tab(
                      text: 'New Request',
                    ),
                    Tab(
                      text: 'Pending',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  _acceptedRequested(context),
                  _newRequest(context),
                  _pendingRequest(context),
                ],
              ))
            ],
          )),
        ),
      ),
    );
  }
}

_acceptedRequested(BuildContext context) {
  List<String> imageData = [
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1675034393381-7e246fc40755?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1503104834685-7205e8607eb9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHN8ZW58MHx8MHx8fDA%3D"
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.separated(
        itemCount: imageData.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              thickness: 2,
            ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConversationView()));
              },
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageData[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Samantha Smith',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'You are online here',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'today 6:00 pm',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        }),
  );
}

_newRequest(BuildContext context) {
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
  ];
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    itemCount: proArr.length,
    itemBuilder: ((context, index) {
      var uObj = proArr[index] as Map? ?? {};
      return Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * .3,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                                borderRadius: BorderRadius.circular(2),
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => UserDetails()),
                            // );
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
                          title: 'Accept Request',
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
  );
}

_pendingRequest(BuildContext context) {
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
  ];
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    itemCount: proArr.length,
    itemBuilder: ((context, index) {
      var uObj = proArr[index] as Map? ?? {};
      return Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * .3,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                                borderRadius: BorderRadius.circular(2),
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => UserDetails()),
                            // );
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
                          title: 'Pending Request',
                          fontSize: 14,
                          color: Colors.white,
                          txtColor: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}
