// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/providers/GlobalStateProvider.dart';
import 'package:shoppa_app/services/AuthServiceClass.dart';
import 'package:shoppa_app/widgets/defaultButton.dart';
import 'package:shoppa_app/widgets/formError.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/auth/signUp/signUp_Screen2.dart';

class SignUpForm1 extends StatefulWidget {
  const SignUpForm1({super.key});

  @override
  State<SignUpForm1> createState() => _SignUpForm1State();
}

class _SignUpForm1State extends State<SignUpForm1> {
  bool isLoading = false;
  final _formkey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String phoneNum;
  late String email;
  final List<String> errors = [];

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First Name", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildFirstNameField(),
            SizedBox(height: getPropHeight(20)),
            Text("Last Name", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildLastNameField(),
            SizedBox(height: getPropHeight(20)),
            Text("Phone Number", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildPhoneNumField(),
            SizedBox(height: getPropHeight(20)),
            Text("Email Address", style: regTextStyle),
            SizedBox(height: getPropHeight(8)),
            buildEmailField(),
            SizedBox(height: getPropHeight(10)),
            FormError(errors: errors),
            SizedBox(height: getPropHeight(35)),
            DefaultButton(
              text: "Next",
              press: () async {
                // Check if user already exist
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  ref.read(globalLoading.notifier).state = true;
                  try {
                    String message = await const AuthApi().checkEmail(
                      email,
                      '/users/find',
                    );
                    if (message == 'User not found') {
                      ref.read(globalLoading.notifier).state = false;
                      await Future.delayed(const Duration(milliseconds: 300),
                          () {
                        return Navigator.of(context).pushNamed(
                          SignUpScreen2.routeName,
                          arguments: UserData1Arguments(
                            firstName: firstName,
                            lastName: lastName,
                            phoneNum: phoneNum,
                            email: email,
                          ),
                        );
                      });
                      ref.read(globalLoading.notifier).state = false;
                    } else {
                      ref.read(globalLoading.notifier).state = false;
                      await ConstantFunction.showFailureDialog(
                        context,
                        'Email already exists, \n Try new email',
                        () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  } catch (e) {
                    ref.read(globalLoading.notifier).state = false;
                    await ConstantFunction.showFailureDialog(
                      context,
                      'Could not verify email... Try again!',
                      () {
                        Navigator.pop(context);
                      },
                    );
                  }
                }
              },
            )
          ],
        ),
      );
    });
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: firstNameNullError);
          });
        }
        firstName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: firstNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Enter First Name"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: lastNameNullError);
          });
        }
        lastName = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: lastNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Enter Last Name"),
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildPhoneNumField() {
    return TextFormField(
      onSaved: (newValue) => phoneNum = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: phoneNumNullError);
          });
        }
        phoneNum = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: phoneNumNullError);
          });
          return "";
        }
        return null;
      },
      decoration: textFieldDecoration("Enter Phone Number"),
      keyboardType: TextInputType.number,
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
        onSaved: (newValue) => email = newValue!,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(emailNullError)) {
            setState(() {
              errors.remove(emailNullError);
            });
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(invalidEmailError)) {
            setState(() {
              errors.remove(invalidEmailError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(emailNullError)) {
            setState(() {
              errors.add(emailNullError);
            });
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(invalidEmailError)) {
            setState(() {
              errors.add(invalidEmailError);
            });
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: textFieldDecoration('Enter Email Address'));
  }
}
