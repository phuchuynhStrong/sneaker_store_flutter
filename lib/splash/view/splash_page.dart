import 'package:androidker_sneaker/gen/assets.gen.dart';
import 'package:androidker_sneaker/splash/cubit/splash_cubit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: BlocListener<SplashCubit, bool>(
        listener: (context, value) {
          if (value) {
            context.go('/home');
          }
        },
        child: Builder(
          builder: (context) => SplashView(
            cubit: context.read<SplashCubit>(),
          ),
        ),
      ),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.cubit});
  final SplashCubit cubit;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.lottie.splashLottie,
              repeat: false,
              onLoaded: (composition) {
                _lottieController
                  ..duration = composition.duration
                  ..forward().whenComplete(() {
                    context.read<SplashCubit>().markDone();
                  });
              },
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Androidker is opening the store',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
