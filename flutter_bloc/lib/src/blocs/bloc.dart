import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

//  Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (szEmail, szPassword) => true);

//  change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print(validEmail + " " + validPassword);

//    Scaffold.of(context).showSnackBar(SnackBar(
//      content: Text("Sending Message"),
//    ));
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

//final bloc = Bloc();
