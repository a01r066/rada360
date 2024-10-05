import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/config/services_locator.dart';
import 'package:rada360/model/common/app_state_status.dart';
import 'package:rada360/presentation/splash/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashCubit splashCubit = SplashCubit(prefRepository: locator.get());

  @override
  void initState() {
    splashCubit.showLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashCubit,
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.status == AppStateStatus.success) {
            print("state.isNeedOnboarding: ${state.isNeedOnboarding}");
            if (state.isNeedOnboarding == true) {
              Navigator.of(context)
                  .pushReplacementNamed(RoutePaths.onBoardingPage);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(RoutePaths.homeControllerPage);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(),
          );
        },
      ),
    );
  }

  _buildBody() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
