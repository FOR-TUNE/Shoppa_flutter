import 'package:flutter/material.dart';
import 'package:shoppa_app/components/defaultButton.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import '../../../constants/constants.dart';

class POIUploadContent extends StatefulWidget {
  const POIUploadContent({super.key});

  @override
  State<POIUploadContent> createState() => _POIUploadContentState();
}

class _POIUploadContentState extends State<POIUploadContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getPropHeight(10),
              ),
              Text("NIN", style: headerStyle2),
              const SizedBox(height: 16),
              Text('Upload a picture of your NIN', style: subHeaderStyle),
              SizedBox(
                height: getPropHeight(45),
              ),
              InkWell(
                  onTap: (() {}),
                  child: Container(
                    height: getPropHeight(226),
                    width: getPropWidth(379),
                    decoration: BoxDecoration(
                        color: subTextColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: subHeaderTextColor,
                          size: getPropHeight(80),
                        ),
                        SizedBox(
                          height: getPropHeight(13),
                        ),
                        Text(
                          "Click to Upload a picture from your phone ",
                          style: subHeaderStyle,
                        )
                      ],
                    )),
                  )),
              SizedBox(
                height: getPropHeight(38),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: getPropHeight(24),
                      color: secondaryButtonTextColor,
                    ),
                    const Text(
                      "Use Camera Instead",
                      style: TextStyle(color: secondaryButtonTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getPropHeight(52),
              ),
              DefaultButton(
                text: "Submit",
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
