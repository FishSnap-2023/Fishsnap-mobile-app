import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  bool _isEditing = false;
  String _bio =""; // Replace with actual bio
  String _nickname = ''; // Replace with actual nickname

  @override
  void dispose() {
    _bioController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const Text(
              'jennykh05@gmail.com',
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
            if (_isEditing)
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _bioController,
                      decoration:const  InputDecoration(labelText: 'Bio'),
                    ),
                    TextFormField(
                      controller: _nicknameController,
                      decoration: const InputDecoration(labelText: 'Nickname'),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _bio = _bioController.text;
                          _nickname = _nicknameController.text;
                          _isEditing = false;
                        });
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              )
            else
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isEditing = true;
                    _bioController.text = _bio;
                    _nicknameController.text = _nickname;
                  });
                },
                child: const Text('Edit Profile'),
              ),
          ],
        ),
      ),
    );
  }
}