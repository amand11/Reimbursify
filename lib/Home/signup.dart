// import 'package:tripmanager/Home/home.dart';
import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/profile.dart' as p;
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/profileclass.dart' as profclass;
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tripmanager/classes/profileclass.dart';

import '../homepage.dart';

class Signup extends StatefulWidget {
  final Profile userclass;
  Signup(this.userclass);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Signup> {
  String Uid = "1";

  //TextEditingController Uid = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Employee_code = TextEditingController();
  TextEditingController Department = TextEditingController();
  TextEditingController Designation = TextEditingController();
  TextEditingController Grade_pay = TextEditingController();
  TextEditingController Account_number = TextEditingController();
  TextEditingController Ifsc_code = TextEditingController();
  String Pay_scale;
  String drop_value;
  TextEditingController Google_account = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    Name.text = this.widget.userclass.name;
    Google_account.text = this.widget.userclass.google;
    Employee_code.text = this.widget.userclass.id;
    Ifsc_code.text = this.widget.userclass.ifsc_code;
    Department.text = this.widget.userclass.dep;
    Designation.text = this.widget.userclass.designation;
    Grade_pay.text = this.widget.userclass.grade_pay;
    Pay_scale = this.widget.userclass.pay_scale;
    if(Pay_scale == ''){
      drop_value = '1';
    }
    else{
      drop_value = Pay_scale;
    }
    Account_number.text = this.widget.userclass.acc_number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Edit Profile'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.purple[200], Colors.purple[200]]),
                  ),
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //CircleAvatar(
                            //
                            //                           radius: 50.0,
                            //                         ),

                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Name,
                                  // initialValue: nm,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    //hintText: 'What do people call you?',
                                    labelText: 'Name *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),

                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Employee_code,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Employee Code *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),

                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Department,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Department *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),

                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Designation,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Designation *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),
                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Grade_pay,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Basic Pay *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),
                              FractionallySizedBox(
                                widthFactor: 0.9,
                                child: DropdownButtonFormField(
                                  value: drop_value,
                                  items: List<String>.generate(18, (i) => (i + 1).toString())
                                  .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                    }).toList(),
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Pay Level *',
                                  ),
                                  onChanged: (value){
                                    Pay_scale = value;
                                    setState((){
                                      drop_value = value;
                                    });
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),
                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Account_number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Account Number *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),
                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Ifsc_code,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Ifsc Code *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),
                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Google_account,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Email *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                )),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {
              setState(() {
                //deleteProfile(Uid);
                if (_formKey.currentState.validate()) {
                  updateProfile(
                      Name.text,
                      Employee_code.text,
                      Department.text,
                      Designation.text,
                      Grade_pay.text,
                      Pay_scale,
                      Account_number.text,
                      Ifsc_code.text,
                      Google_account.text,
                      Uid);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => p.Profile()),
                  );
                }
              });
              // insertProfile(Uid, Name.text, Employee_code.text, Department.text, Designation.text, Grade_pay.text, Account_number.text, Ifsc_code.text, Google_account.text);

              //Navigator.pop(context, "Your profile has been saved.");
            }),
      ),
    );
  }
} //backgroundColor: Colors.white,
//         body: Container(
//           width: double.maxFinite,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Colors.red,
//                 backgroundImage: NetworkImage(
//                     widget.dummy.dp),
//                 maxRadius: 100.0,
// //                child: Image(image: ),
//               ),
//               Card(
//                 color: Colors.red,
//                 margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
//                 child: Container(
//                   height: 50.0,
// //                  alignment: Alignment.center,
//                   width: 300.0,
// //                  padding: EdgeInsets.all(20.0),
//                   color: Colors.amber,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Icon(
//                         Icons.account_box,
//                         size: 40.0,
//                       ),
//                       Divider(
//                         color: Colors.black,
//                         thickness: 5,
//                         height: 100,
//                       ),
//                       Text(
//                         widget.dummy.name,
//                         style: TextStyle(fontSize: 30.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 color: Colors.red,
//                 margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
//                 child: Container(
//                   height: 50.0,
// //                  alignment: Alignment.center,
//                   width: 300.0,
// //                  padding: EdgeInsets.all(20.0),
//                   color: Colors.amber,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Icon(
//                         Icons.account_balance,
//                         size: 40.0,
//                       ),
//                       Container(
//                         width: 90.0,
//                       ),
//                       Text(
//                         '₹ ' + widget.dummy.bal.toString(),
//                         style: TextStyle(fontSize: 30.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               RaisedButton(
//                 color: Colors.green,
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return Dialog(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40)),
//                           child: Container(
//                             height: 100.0,
//                             margin: EdgeInsets.all(20.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Center(
//                                   child: TextField(
//                                     controller: balance,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: 'New Balance'),
//                                     keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
//                                   ),
//
//                                 ),
//                                 FlatButton(
//                                   color: Colors.red,
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//                                   onPressed: () {
//                                     setState(() {
//                                       widget.dummy.bal = double.parse(balance.text);
//                                     });
//                                   },
//                                   child: Text('Update'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 },
//                 child: Text(
//                   'Reset Account',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//               RaisedButton(
//                 color: Colors.green,
//                 onPressed: () {},
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
