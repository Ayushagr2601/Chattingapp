import 'package:chatter/app.dart';
import 'package:chatter/helpers.dart';
import 'package:chatter/pages/calls_page.dart';
import 'package:chatter/pages/contacts_page.dart';
import 'package:chatter/pages/messages_page.dart';
import 'package:chatter/pages/notifications_page.dart';
import 'package:chatter/screens/prfile_screen.dart';
import 'package:chatter/theme.dart';
import 'package:chatter/widgets/glowing_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const[
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitles = const[
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];
  void _onNavigationItemSelected(index){
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: ValueListenableBuilder(
              valueListenable: title,
              builder: (BuildContext context, String value,_){
                return Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16
                  ),
                );
              },
            ),
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(icon: Icons.search, onTap: (){
            print("To do search");
          },),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Hero(
              tag: 'hero-profile-picture',
              child: Avatar.small(url: context.currentUserImage,
              onTap: (){
                Navigator.of(context).push(ProfileScreen.route);
              },),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }


}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected}) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {

  var selectedIndex = 0;
  void handleItemSelected(int index){
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      shadowColor: AppColors.textLigth,
      color: (brightness == Brightness) ? Colors.transparent : null,
      margin: EdgeInsets.all(0),
      child: SafeArea(
        top: false,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 16,left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationBarItem(
                  isSelected: (selectedIndex==0),
                  index: 0,
                  label: 'Messages',
                  icon: CupertinoIcons.bubble_left_bubble_right_fill,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  isSelected: (selectedIndex==1),
                  index: 1,
                  label: 'Notifications',
                  icon: CupertinoIcons.bell_solid,
                  onTap: handleItemSelected,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GlowingActionButton(
                      color: AppColors.secondary,
                      icon: CupertinoIcons.add,
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => const Dialog(
                            child: AspectRatio(
                              aspectRatio: 8/7,
                                child: ContactsPage(),
                            ),
                        ),
                        );
                    },
                  ),
                ),
                _NavigationBarItem(
                  isSelected: (selectedIndex==2),
                  index: 2,
                  label: 'Calls',
                  icon: CupertinoIcons.phone_fill,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  isSelected: (selectedIndex==3),
                  index: 3,
                  label: 'Contacts',
                  icon: CupertinoIcons.person_2_fill,
                  onTap: handleItemSelected,
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({Key? key, required this.label, required this.icon, required this.index,  this.isSelected = false, required this.onTap,}) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            SizedBox(height: 8,),
            Text(
              label,
              style: isSelected ?
              const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.secondary) :
              const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
