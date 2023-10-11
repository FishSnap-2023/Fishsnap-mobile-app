import 'package:fishsnap/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  bool _isEditing = false;
  String _bio = "Fish Lover";
  String _nickname = "Jenny";

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  void dispose() {
    _bioController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                const SizedBox(height: 8),
                Text(
                  _isEditing ? _nicknameController.text : _nickname,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'jenny@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _isEditing ? _bioController.text : _bio,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                              bio: _bio,
                              nickname: _nickname,
                            ),
                          ),
                        );
                      },
                      child: const Text('Edit Profile'),
                    ),
                const SizedBox(height: 25),
                ProfileRow(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {
                  // Handle Notifications action
                }),
                const SizedBox(height: 10),
                ProfileRow(
                  icon: Icons.settings,
                  title: 'Settings', 
                  onTap: () {
                  // Handle Settings action
                }),
                const SizedBox(height: 10),
                ProfileRow(
                  icon: Icons.people,
                  title: 'Invite Friends', 
                  onTap: () {
                  // Handle Invite Friends action
                }),
                const SizedBox(height: 10),
                ProfileRow(
                  icon: Icons.star,
                  title: 'Rate Us', 
                  onTap: () {
                  // Handle Rate Us action
                }),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _signOut,
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String bio;
  final String nickname;

  const EditProfilePage({Key? key, required this.bio, required this.nickname}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _bioController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bioController.text = widget.bio;
    _nicknameController.text = widget.nickname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            TextFormField(
              controller: _nicknameController,
              decoration: const InputDecoration(labelText: 'Nickname'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(icon, size: 26),
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
