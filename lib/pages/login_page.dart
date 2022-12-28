import 'package:chatter/screens/home_screen.dart';
import 'package:chatter/screens/screens.dart';
import 'package:flutter/material.dart';
class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.purple, Colors.blue]
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade300,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.menu_rounded,
          ),
        ),
        title: const Text("MonkeyChat",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.shopping_bag_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 170.0, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 3.5, horizontal:20.0),
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10.0, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 3.5, horizontal:20.0),
                    hintText: "Password",
                    suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        _obscureText=!_obscureText;
                      });
                    },
                      child: Icon(_obscureText ?Icons.visibility :Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    )
                ),
                obscureText: _obscureText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
