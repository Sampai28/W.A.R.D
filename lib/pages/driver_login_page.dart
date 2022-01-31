import 'package:flutter/material.dart';

import 'sign_up_page.dart';

class DriverLoginPage extends StatelessWidget {
  const DriverLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 20.0,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 25.0,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Driver Login',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                  ),
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    fillColor: Colors.grey.shade300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Material(
                      elevation: 3.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25.0,
                      ),
                    ),
                    SizedBox(width: 40.0),
                    Material(
                      elevation: 3.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).scaffoldBackgroundColor),
                  ),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  )),
                  child: const Text('New user? Create account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
