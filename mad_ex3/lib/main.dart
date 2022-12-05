import 'package:flutter/material.dart';
import 'package:mad_ex3/success.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Forms Data',
        home: PersonalData()
    );
  }
}

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  late String _name;
  late String _email;
  late String _password;
  late String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'What do people call you?',
        labelText: 'Name *',
      ),
      validator: (String? value) {
        if (value == null){
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String? value) {


          _name = value!;

      },

    );
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: '',
          labelText: 'Email *',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty){
            return 'Email is required';
          }
          return null;
        },
        onSaved: (value) {

            _email = value!;

        }

    );
  }

  //
  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'The secret Identity',
        labelText: 'Password *',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty){
          return 'password is required';
        }
        return null;
      },
      onSaved: ( value) {
          _password = value!;

      },

    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'The one call away',
        labelText: 'Phone Number *',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty){
          return 'phone number is required';
        }
        return null;
      },
      onSaved: (value) {
          _phoneNumber=value!;
      },

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Data')),
      body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key:_formKey,
            child: Wrap(
                direction: Axis.horizontal,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0,
                children:<Widget>[
                _buildName(),
            _buildEmail(),
            _buildPassword(),
            _buildPhoneNumber(),
            ElevatedButton(

                  onPressed: (){
                    if (_formKey.currentState!=null && _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _formKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data stored')),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Success(
                          name:_name,email:_email,password:_password,phoneNumber:_phoneNumber),

                        )

                      );

                    }
                  },


            child: const Text(
                'Submit',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white)
            ),
          ),


          ]
      ),
    ),)
    ,

    );

  }
}




