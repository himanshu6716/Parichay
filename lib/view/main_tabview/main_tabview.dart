import 'package:flutter/material.dart';
import 'package:parichay/view/account/account_view.dart';
import 'package:parichay/view/bookmark_view/bookmark_view.dart';
import 'package:parichay/view/chat_view/chat_view.dart';
import 'package:parichay/view/home_view/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int currentTab = 0;
  final List<Widget> pages = [
    const HomeView(),
    const BookMarkView(),
    const ChatView(),
    const AccountView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    currentScreen = const HomeView();
                    currentTab = 0;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.bookmark),
                onPressed: () {
                  setState(() {
                    currentScreen = const BookMarkView();
                    currentTab = 1;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.message_outlined),
                onPressed: () {
                  setState(() {
                    currentScreen = const ChatView();
                    currentTab = 2;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  setState(() {
                    currentScreen = const AccountView();
                    currentTab = 3;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
