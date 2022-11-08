// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/proofOfIdentity/utiiBillUpload/utilBillUploadContent.dart';
import '../../../constants/colors.dart';

class UtilBillUploadScreen extends StatelessWidget {
  static String routeName = '/UtilBill Upload Screen';
  const UtilBillUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: const SafeArea(child: UtilBillUploadContent()));
  }
}
