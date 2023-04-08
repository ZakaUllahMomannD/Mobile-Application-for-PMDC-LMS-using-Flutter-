import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pmdc_version_4_flutter/core/enums/view_state.dart';
import 'package:pmdc_version_4_flutter/ui/admin/admin_homepage/admin_home_page.dart';
import 'package:pmdc_version_4_flutter/ui/admin/admin_homepage/admin_homescreen_provider.dart';

import 'package:pmdc_version_4_flutter/widgets/alert_dialog_box.dart';
import 'package:pmdc_version_4_flutter/widgets/custom_textfield.dart';
import 'package:pmdc_version_4_flutter/widgets/signin_login_btn_widget.dart';

import 'package:provider/provider.dart';

import '../../../../constants/constants.dart';

const String staticAssetsPath = "assets/images";

class FeeSubmissionScreen extends StatefulWidget {
  FeeSubmissionScreen({Key? key}) : super(key: key);

  @override
  State<FeeSubmissionScreen> createState() => _FeeSubmissionScreenState();
}

class _FeeSubmissionScreenState extends State<FeeSubmissionScreen> {
  TextEditingController paid = TextEditingController();
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  String? section;
  String? program;
  String? classNoo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminHomeScreenProvider>(builder: (context, model, ch) {
      return ModalProgressHUD(
        inAsyncCall: model.state == ViewState.busy,
        progressIndicator: CircularProgressIndicator(
          color: kAppColor,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kAppColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              title: Center(
                  child: Text(
                'Fee Submission',
                style: TextStyle(color: Colors.black),
              ))),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Student name',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          chapterNameController: model.studentName,
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill the field";
                            } else {}
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Student Id',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          readOnly: true,
                          chapterNameController: model.idd,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill";
                            } else {}
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Total Fee',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: model.totalFee,
                          keyboardType: TextInputType.name,
                          cursorColor: kAppColor,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: InputBorder.none,
                            fillColor: kTextFieldColor,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill";
                            } else {}
                            return null;
                          },
                          // maxLines: 3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Paid',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          readOnly: true,
                          chapterNameController: model.paid,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill";
                            } else {}
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'UnPaid',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          readOnly: true,
                          chapterNameController: model.unPaid,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill";
                            } else {}
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Submission',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          chapterNameController: paid,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill";
                            } else {}
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 20, top: 5, bottom: 5),
                      child: signIn_login_Btn_widget(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await model.addFeeRecord(context, paid.text);
                            }
                            // model.announcement.title = title.text;
                            // model.announcement.description = description.text;
                            // model.addAnnouncement(widget.screenIndex, context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UploadVideoLecture()));
                          },
                          containerText: 'Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

customBottomCard({asset, text, onTap}) {
  return Material(
    // clipBehavior,
    color: kAppColor,
    child: InkWell(
      splashColor: kAppColor.withOpacity(0.5),
      onTap: onTap,
      child: Container(
        height: 42,
        width: 100,
        // height: 42.h,
        // width: 100.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            ImageContainer(
              height: 18,
              width: 18,
              assets: asset,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 7,
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              width: 7,
            ),
          ],
        ),
      ),
    ),
  );
}

class ImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final String assets;
  final Color? color;

  /// This is for  local Asset
  final String? url;

  /// This one is for Network Image,
  final BoxFit fit;
//  final

  ImageContainer(
      {this.height,
      this.width,
      this.assets = "assets/static_assets/user_icon.png",
      this.radius = 0,
      this.url,
      this.fit = BoxFit.cover,
      this.color = Colors.transparent});
  @override
  Widget build(BuildContext context) {
    return url == null
        ? Container(
            height: this.height,
            width: this.width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  image: AssetImage(this.assets),
                  fit: fit,
                )),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: FadeInImage(
              width: this.width,
              height: this.height,
              image: NetworkImage(url!),
              placeholder: AssetImage(this.assets),
              fit: this.fit,
            ),
          );
  }
}
