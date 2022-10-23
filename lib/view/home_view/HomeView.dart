import 'package:binbiralem/core/base/BaseView.dart';
import 'package:binbiralem/view/home_view/HomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onBuild: (BuildContext context, HomeViewModel homeViewModel) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(),
        );
      },
    );
  }
}
