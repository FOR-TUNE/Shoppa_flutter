// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/screens/proofOfIdentity/votersCardUpload/votersCardUploadContent.dart';
import '../../../constants/colors.dart';

class VotersCardUploadScreen extends StatelessWidget {
  static String routeName = "/Voters Card Upload Screen";
  const VotersCardUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: const SafeArea(child: VotersCardUploadContent()));
  }
}
