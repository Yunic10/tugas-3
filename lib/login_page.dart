import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_3/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  dynamic namauser;

  void _saveUsername() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namacontroller, placeholder, isPassword){
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  _showDialog(pesan, alamat){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>alamat,),);
              }, 
              child: const Text("OK"),
              ),
          ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan Password', false),
            _showInput(_passwordController, 'Masukkan Password', true),
            ElevatedButton(
              onPressed: (){
                if(_usernameController.text == 'yudith' && _passwordController.text == "yudith123"){
                  _saveUsername();
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()),);
                }else{
                  _showDialog("Username atau Password Salah", LoginPage());
                }
              }, 
              child: const Text('Login'),
              ),
          ],
        ),
      ),
    );
  }
}