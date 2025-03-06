
  import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({
    super.key,
    required this.iconImage,
    required this.iconFunction
  });
  final String iconImage;
  final Function iconFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
       borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(
        padding: EdgeInsets.all(0),
          onPressed: () {
            
          },
          icon: Image.asset(
            iconImage,
            width: 20,
          )),
    );
  }
}

class Amplifydivider extends StatelessWidget {
  const Amplifydivider({super.key, required this.dividertext});

  final String dividertext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            dividertext,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}


class EmailAddress extends StatelessWidget {
  const EmailAddress({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null) {
          return 'Enter email';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter Email',
        filled: true,
        fillColor: Colors.grey[50],
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blueGrey[100]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.blueGrey[100]!),
        ),
      ),
    );
  }
}


class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null) {
              return 'Enter your full name';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Full Name',
            hintText: 'Enter Full Name',
            filled: true,
            fillColor: Colors.grey[50],
            hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blueGrey[100]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.blueGrey[100]!),
            ),
          ),
        );
  }
}
