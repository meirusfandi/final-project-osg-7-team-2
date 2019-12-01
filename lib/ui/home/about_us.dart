import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

RootResponse rootResponseFromJson(String str) => RootResponse.fromJson(json.decode(str)); 

String rootResponseToJson(RootResponse data) => json.encode(data.toJson()); 
class RootResponse {
  Data data; 
  RootResponse({
    this.data,
  }); 
  
  factory RootResponse.fromJson(Map<String, dynamic> json) => RootResponse(
    data: Data.fromJson(json["data"]),
  ); 
  
  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  }; 
} 

class Data {
  int id;
  String email;
  String firstName;     
  String lastName;     
  String avatar; 
  
  Data({
    this.id,         
    this.email,         
    this.firstName,         
    this.lastName,         
    this.avatar,     
  }); 
     
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"], 
    email: json["email"],         
    firstName: json["first_name"],         
    lastName: json["last_name"],         
    avatar: json["avatar"],
  ); 
     
  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,         
    "first_name": firstName,         
    "last_name": lastName,         
    "avatar": avatar,     
  }; 
} 

Future<RootResponse> getData() async {   
  Response response = await get('https://reqres.in/api/users/1');   
  if (response.statusCode == 200)     
    return rootResponseFromJson(response.body);   
  else     
    throw Exception('error code: ${response.statusCode}'); 
}

class _AboutUsState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: FutureBuilder<RootResponse>(
        future: getData(),   
        builder: (
          BuildContext context, 
          AsyncSnapshot snapshot
        ) {
          RootResponse rootResponse = snapshot.data;
          return Center(
            child: Text(rootResponse.data.email),     
          );   
        }, 
      ), 
    );
  }
}