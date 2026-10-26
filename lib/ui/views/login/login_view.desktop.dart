import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:tabletalesweb/ui/views/login/login_view.form.dart';
import 'package:tabletalesweb/ui/widgets/components/custom_text_field.dart';
import 'package:tabletalesweb/ui/widgets/components/floating_text_hint.dart';
import 'package:toastification/toastification.dart';

import 'login_viewmodel.dart';

class LoginViewDesktop extends ViewModelWidget<LoginViewModel> with $LoginView {
  const LoginViewDesktop({super.key});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Stack(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: kcAuthGradientColor,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 10,
                        child: Image.asset('assets/images/login_bg.jpeg'),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ]),
                  ]),
            ),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 10,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SvgPicture.asset(
                            //   'assets/logo/return_40.svg',
                            //   width: 160,
                            //   height: 48,
                            // ),
                            const SizedBox(
                              height: 12,
                            ),
                            const AutoSizeText(
                              "Welcome Back",
                              maxFontSize: 34,
                              minFontSize: 24,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                  color: kcDarkGreyColor,
                                  fontWeight: FontWeight.w600,
                                  height: 1.33),
                            ),
                            const AutoSizeText(
                              "Log in to your account to continue your application journey",
                              maxFontSize: 14,
                              minFontSize: 13,
                              maxLines: 2,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                  color: kcColor,
                                  fontWeight: FontWeight.w400,
                                  height: 1.81),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const FloatingTextHint(
                                        text: "Email Address",
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      CustomTexField(
                                        controller: emailAddressInputController,
                                        hint: "email@example.com",
                                        focusNode: emailAddressInputFocusNode,
                                        errorText: viewModel
                                            .emailAddressInputValidationMessage,
                                        textInputType:
                                            TextInputType.emailAddress,
                                      ),
                                    ]),
                              ),
                              Expanded(flex: 1, child: Container())
                            ]),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const FloatingTextHint(
                                        text: "Password",
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      CustomTexField(
                                        containObscureText: true,
                                        isPasswordField: true,
                                        controller: passwordInputController,
                                        hint: "Password",
                                        focusNode: passwordInputFocusNode,
                                        errorText: viewModel
                                            .passwordInputValidationMessage,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ]),
                              ),
                              Expanded(flex: 1, child: Container())
                            ]),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(children: [
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () {
                                    viewModel.onSubmit();
                                    if (viewModel.fieldsValidationMessages
                                        .isNotEmpty) return;

                                    viewModel
                                        .login(
                                            emailAddress: viewModel
                                                .emailAddressInputValue!
                                                .trim()
                                                .toLowerCase(),
                                            password:
                                                viewModel.passwordInputValue!)
                                        .then((value) async {
                                      viewModel.isLoading = false;
                                      viewModel.rebuildUi();
                                      value.fold((l) async {
                                        l.mapOrNull(
                                          serverError: (value) {
                                            viewModel.showToast(
                                                type: ToastificationType.error,
                                                title: value.title,
                                                description: value.description);
                                          },
                                          invalidCredentials: (value) {
                                            viewModel.showToast(
                                                type: ToastificationType.error,
                                                title: value.title,
                                                description: value.description);
                                          },
                                        );
                                      }, (r) async {
                                        viewModel.navigateToHome();
                                      });
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: kcButtonColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 18.0),
                                      child: Text(
                                        'Log In',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            fontSize: 14,
                                            color: kcWhite,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: Container())
                            ]),
                            const SizedBox(
                              height: 32,
                            ),
                            viewModel.fieldsValidationMessages.isNotEmpty
                                ? Column(children: [
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Row(children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(children: [
                                          Expanded(flex: 1, child: Container()),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text(
                                                viewModel
                                                    .fieldsValidationMessages
                                                    .values
                                                    .first
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0,
                                                  fontSize: 12,
                                                  color: Colors.redAccent,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(flex: 1, child: Container()),
                                        ]),
                                      ),
                                      Expanded(flex: 1, child: Container()),
                                    ]),
                                  ])
                                : Container()
                          ]),
                    ),
                    Expanded(flex: 1, child: Container()),
                  ]),
                ]),
          ),
        ]),
        Visibility(
          visible: viewModel.isLoading,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: kcPrimaryColor.withValues(alpha: 0.4),
            child: Center(
              child: LoadingAnimationWidget.threeRotatingDots(
                color: kcWhite,
                size: 100,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
