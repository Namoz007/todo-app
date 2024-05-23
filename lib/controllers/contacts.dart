import 'dart:math';

import 'package:dars_18/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsController{
  List<Contact> _contacts = [
    Contact(name: 'Tom', phone: '+998 99 999 99 99',color: Colors.blue),
    Contact(name: 'Jerry', phone: '+998 98 999 99 99',color: Colors.brown),
    Contact(name: 'Spike', phone: '+998 97 999 99 99'),
  ];

  List<Contact> get contactList {
    return [..._contacts];
  }


  void delete(int index){
    _contacts.removeAt(index);
  }

  void rename(String name,int index){
    _contacts[index].name = name;
  }

  void add(String name,String phone){
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    _contacts.add(Contact(name: name, phone: phone,color: Color.fromARGB(255, red, green, blue)));
  }
}