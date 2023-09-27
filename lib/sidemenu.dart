import 'package:flutter/material.dart';
import 'package:tugas_3/about_page.dart';
import 'package:tugas_3/home_page.dart';
import 'package:tugas_3/login_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Sidemenu')),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),
              ),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                    ),
                    );
              },
            ),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Anda yakin ingin logout?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Logout'),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage()), (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    );
                  }
                  );
              }
          )
        ],
      ),
    );
  }
}