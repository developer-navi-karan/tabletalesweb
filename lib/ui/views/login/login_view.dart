import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.desktop.dart';
import 'login_view.form.dart';
import 'login_view.tablet.dart';
import 'login_view.mobile.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'emailAddressInput'),
  FormTextField(name: 'passwordInput'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const LoginViewMobile(),
      tablet: (_) => const LoginViewTablet(),
      desktop: (_) => const LoginViewDesktop(),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void disposeForm() {
    disposeForm();
    super.disposeForm();
  }
}
