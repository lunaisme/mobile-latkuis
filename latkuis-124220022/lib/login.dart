import 'package:belajar_kuis/dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';

  String password = '';
  bool isLogin = true;
  bool visible = true;

  _navigatePage() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Dashboard(nama: username);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [_usernameField(), _passwordField(), _loginButton(context)],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        style: TextStyle(color: Colors.red),
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.red),
          labelText: 'Username',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          // prefixIcon: Icon(Icons.people)
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off)),
          labelText: 'Password',
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          // prefixIcon: Icon(Icons.people)
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'admin' && password == 'admin') {
            setState(() {
              text = 'login berhasil';
              isLogin = true;
              _navigatePage();
            });
          } else {
            text = 'login gagal';
            isLogin = false;
          }
          SnackBar snackBar = SnackBar(
            backgroundColor: isLogin ? Colors.green : Colors.red,
            content: Text(text),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login'),
      ),
    );
  }
}
