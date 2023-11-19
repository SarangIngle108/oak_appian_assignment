import 'package:blackcoffer_assignment/home_screen.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
   const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final usernameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(22.0,100,22,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Just a step away !",style: TextStyle(fontSize: 22),),
                SizedBox(height: 15,),
                TextField(
                  keyboardType: TextInputType.name,
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    )
                ),
                SizedBox(height: 8,),
                TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    )
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22,0,22,22),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.deepPurpleAccent,
              ),
                width: double.infinity,

                child: TextButton(onPressed: (){

                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(username: usernameController.toString())));

           /*      else{
                   SnackBar(
                     content: Text('This is a Snackbar!'),
                     duration: Duration(seconds: 2),
                     action: SnackBarAction(
                       label: 'Action',
                       onPressed: () {
                         // Add your action logic here
                       },
                     ),
                   );*/

                }, child:Text("Let's Start",style: TextStyle(color: Colors.white),))

            ),
          )
        ],
      ),

    );
  }
}
