import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firestore/authentication/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;

  RegisterScreen({this.toggleView});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //TODO agregar authService
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Correo Electrónico'),
                validator: (val) => val.isEmpty ? 'Ingresa un correo' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Contraseña'),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Password muy corto debe ser de 6+ caracteres'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.red[400],
                  child: Text(
                    'Registro',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      //TODO add registerWithEmailAndPassword
                      bool success = await _authService
                          .createUserWithEmailAndPassword(email, password);
                      if (!success) {
                        setState(() {
                          error = 'Sucedió un error';
                        });
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
