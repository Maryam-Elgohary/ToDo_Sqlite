import 'package:flutter/material.dart';
import 'package:todo/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/R.a38d2d1637658c755b4e5bf15aa4162a?rik=fTEMD%2bkCxkRHtg&riu=http%3a%2f%2fgetdrawings.com%2ffree-icon-bw%2favatar-icon-images-14.png&ehk=mWmYQyNCT3q9PMfW3qiC56tcdNA%2fuB7%2bEigcMiUockM%3d&risl=&pid=ImgRaw&r=0"),
              ),
              accountName: Text("Maryam Elgohary"),
              accountEmail: Text("maryamelgohary4@gmail.com"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: ((context) => const HomeScreen())),
                    )),
          ],
        ),
      ),
    );
  }
}
