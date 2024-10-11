import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:rada360/common/mixins/after_first_frame.dart';
import 'package:rada360/common/values/my_colors.dart';
import 'package:rada360/common/values/my_devices.dart';
import 'package:rada360/config/routes.dart';
import 'package:rada360/model/common/common.dart';
import 'package:rada360/presentation/common/k_text.dart';
import 'package:rada360/presentation/onboard/onboard_cubit.dart';
import 'package:rada360/presentation/onboard/widgets/onboard_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with AfterFirstFrameMixin {
  OnboardCubit onboardCubit = OnboardCubit();

  PageController pageController = PageController();

  List<Widget> pages = [];

  @override
  void initState() {
    String description = lorem(paragraphs: 1, words: 40);
    pages = [
      OnboardWidget(
        pageInfo: PageInfo(
            index: 0,
            title: "KẾT NỐI KHÁCH HÀNG VÀ CƠ SỞ THẨM MỸ",
            description: description),
        skipCallback: () {},
      ),
      OnboardWidget(
        pageInfo: PageInfo(
            index: 1,
            title: "THANH TOÁN DỄ DÀNG, NHANH GỌN",
            description: description),
        skipCallback: () {},
      ),
      OnboardWidget(
        pageInfo: PageInfo(
            index: 2,
            title: "GIAO DIỆN THÂN THIỆN, DỄ SỬ DỤNG",
            description: description),
        skipCallback: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => onboardCubit,
      child: BlocConsumer<OnboardCubit, OnboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(),
            bottomSheet: _buildBottomSheet(),
          );
        },
      ),
    );
  }

  _buildBottomSheet() {
    final width = MyDevices.screenWidth;
    final initialPage = onboardCubit.state.currentIndex ?? 0;

    return SafeArea(
      bottom: true,
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24.0),
                child: CarouselSlider(
                    items: pages,
                    options: CarouselOptions(
                      height: width / (304 / 198),
                      viewportFraction: 1.0,
                      initialPage: initialPage,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      enlargeFactor: 1.0,
                      onPageChanged: (page, _) {
                        onboardCubit.onPageChange(page);
                      },
                      scrollDirection: Axis.horizontal,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pages.asMap().entries.map((e) {
                  final index = e.key;
                  return Container(
                    width: 24,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: index == initialPage ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  );
                }).toList(),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(MyColors.buttonColor),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12))),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RoutePaths.phoneInputPage);
                    },
                    child: const KText(
                      text: "Đăng ký/Đăng nhập",
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )),
              ),
              TextButton(
                  onPressed: () {},
                  child: const KText(
                    text: "Để sau",
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB8B8B8),
                    ),
                  )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  _buildBody() {
    return Container(
      color: const Color(0xFFFBD9E2),
    );
  }

  @override
  void afterFirstFrame(BuildContext context) {}
}
