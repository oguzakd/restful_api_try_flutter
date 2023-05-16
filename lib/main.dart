import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restful_api_try/model/user_model.dart';
import 'package:restful_api_try/service/user_service.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  UserService userService = UserService(); 

  List<UsersModelData?>? users = [];

  bool? isLoading;

  @override
  void initState(){
    userService.fetchUsers().then((value) {
      if(value!=null && value.data!=null){
        setState(() {
        users = value.data;
        isLoading = true; 
        });
      }else{
        print("veriler boş geldi");
        setState(() {
        isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Material App Bar"),
        ),
        body: ListView.builder(
           itemCount: users!.length,
           itemBuilder: (context, index) {
             return ListTile(
              title: Text("${users![index]!.firstName! + users![index]!.lastName! }"),
              subtitle: Text(users![index]!.email!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users![index]!.avatar!),
              ),
             );
           },
        ),
      ),
    );
  }
}