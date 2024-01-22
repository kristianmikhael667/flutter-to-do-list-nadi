import 'package:flutter/material.dart';
import 'package:nasari_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasari_flutter/constants/color_palette.dart';
import 'package:nasari_flutter/constants/text_styles.dart';
import 'package:nasari_flutter/constants/tools.dart';
import 'package:nasari_flutter/widgets/button_widget.dart';
import 'package:nasari_flutter/widgets/forms_widget.dart';
import 'package:nasari_flutter/widgets/loading_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("rebuild ?");
    return WillPopScope(
      onWillPop: () {
        if (controller.pageController.page == 0) {
          return Future.value(true);
        } else {
          controller.pageController.animateTo(0,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
          return Future.value(false);
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              color: ColorPalette.primary,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,
              body: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    loginPage(),
                  ]),
            ),
            Obx(
              () => Material(
                type: MaterialType.transparency,
                child: LoadingDialog(
                    isLoading: controller.isLoading.value, text: 'Loading...'),
              ),
            )
          ],
        );
      }),
    );
  }

  Widget loginPage() {
    GlobalKey<FormState> formKey =
        GlobalKey<FormState>(debugLabel: 'loginForm');
    return Form(
      key: formKey,
      child: ListView(
        // pke listview widthnya jdi jebol, tambalannya wrap children pake row
        // mainAxisAlignment: MainAxisAlignment.center,
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(
            height: 114.h,
          ),
          Image.asset(
            "assets/images/nadi.png",
            height: 105.h, // todo scale size bwt tablet? wkwkw
          ),
          SizedBox(
            height: 65.h,
          ),
          CustomFormField(
            controller: controller.phoneTextController,
            textInputType: TextInputType.number,
            title: 'Nomor telepon',
            hintText: 'Input: 089668997397',
            borderColor: Colors.transparent,
            fillColor: const Color(0xffF9F9F9),
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            radius: 18,
            textStyle: FontTextStyle.blackTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.white,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Wajib Diisi';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomFormField(
            controller: controller.pinTextController,
            textInputType: TextInputType.number,
            title: 'PIN Password',
            obsecureText: true,
            hintText: 'Input: 112233',
            borderColor: Colors.transparent,
            fillColor: const Color(0xffF9F9F9),
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            radius: 18,
            textStyle: FontTextStyle.blackTextStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.white,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Wajib Diisi';
              }
              return null;
            },
          ),
          SizedBox(
            height: 65.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button.text(
                  text: "Login",
                  height: 58.h,
                  width: 220.w,
                  circularRadius: 22.h,
                  backgroundColor: ColorPalette.secondary,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      controller.loginAction(
                          controller.phoneTextController.text,
                          controller.pinTextController.text);
                    } else {
                      snackbarWidget('Form Kosong', 'Silahkan isi Form',
                          Duration(seconds: 2));
                    }
                  },
                  fontSize: 16.sp,
                  fontWeight: FontWeightEnum.semiBold,
                  textColor: Colors.white),
            ],
          ),
          SizedBox(
            height: 143.h,
          ),
        ],
      ),
    );
  }
}
