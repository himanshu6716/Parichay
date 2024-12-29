import 'package:flutter/material.dart';
import 'package:parichay/res/common_widgets/rounded_Button.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                child: const Icon(Icons.camera_alt),
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: TabBar(
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Account',
                  ),
                  Tab(
                    text: 'Personal',
                  ),
                  Tab(
                    text: 'Professional',
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              children: [
                _account_info(context),
                Center(
                  child: Text('Personal'),
                ),
                Center(
                  child: Text('Professional'),
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }
}

_account_info(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Height',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Birthdate',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Caste',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'City',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('George Smith'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Male'),
                  SizedBox(
                    height: 10,
                  ),
                  Text("5'8 ft"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("25 June,1991"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Catholic Christian"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("New York"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          RoundedButton(
            onPressed: () {},
            title: 'Edit Profile',
            fontSize: 14,
            color: Colors.red,
            txtColor: Colors.white,
          )
        ],
      ),
    ),
  );
}
