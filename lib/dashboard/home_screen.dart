import 'package:flutter/material.dart';
import 'package:work_delight_task/auth/service/auth_service.dart';
import 'package:work_delight_task/auth/ui/login_screen.dart';
import 'package:work_delight_task/dashboard/widget/contact_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text('Home Page'), actions: [
        GestureDetector(
            onTap: () {
              _signOut(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.logout),
            ))
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 130,
                              width: 130,
                              child: Image.network(
                                  'https://picsum.photos/250?image=9')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildProfileInfo('Adrin Tehran', '12 years'),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildProfileInfo('CE_1 2nd Grade', 'Campus A'),
                              const SizedBox(
                                height: 10,
                              ),
                              _buildProfileInfo('Blood Type B+', ''),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('Allergies',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _nameBox('Insects'),
                          const SizedBox(width: 20),
                          _nameBox('Drug'),
                          const SizedBox(width: 20),
                          _nameBox('Pet'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Icon(
                            Icons.account_tree,
                            color: Colors.lightBlueAccent,
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Student has Asthma',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('Vaccinated on 2021.10.07, got 2 doses'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8),
                        child: const Text('Test Covid_tehan.pdf'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 2,
                  color: Colors.red),
              const SizedBox(height: 20),
              const ContactWidget(
                  contact: 'Primary Emergency Contact',
                  description: 'First point of contact'),
              const SizedBox(height: 20),
              const ContactWidget(
                  contact: 'Secondary Emergency Contact',
                  description: 'if no answer from primary'),
              const SizedBox(height: 20),
              const ContactWidget(
                  contact: 'Additional Emergency Contact',
                  description: 'others'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    auth.signOut();
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Widget _buildProfileInfo(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        Text(subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _nameBox(String name) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
