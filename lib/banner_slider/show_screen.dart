import 'package:carousel_slider/carousel_slider.dart';
import 'package:componets_creation/banner_slider/data.dart';
import 'package:componets_creation/banner_slider/image_viewer_helper.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? motionTabBarController;
  int innerCurrentPage = 0;
  int outerCurrentPage = 1;
  late CarouselSliderController innerCarouselSliderController =
      CarouselSliderController();
  late CarouselSliderController outerCarouselSliderController =
      CarouselSliderController();
  @override
  void initState() {
    // TODO: implement initState
    motionTabBarController =
        MotionTabBarController(initialIndex: 1, length: 4, vsync: this);
    // innerCarouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("show "),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              _innerBAnnerSlider(context),
              _outerBAnnerSlider(context)
            ],
          ),
        ));
  }

  Widget _innerBAnnerSlider(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Inner Indicator style ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .25,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              //slider
              Positioned.fill(
                child: CarouselSlider(
                    carouselController: innerCarouselSliderController,
                    items: AppData.innerStyleImages.map((imagePath) {
                      return Builder(builder: (BuildContext context) {
                        return ImageViewerHelper.Show(
                            context: context,
                            url: imagePath,
                            fit: BoxFit.cover);
                      });
                    }).toList(),
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            innerCurrentPage = index;
                          });
                        },
                        viewportFraction: 0.8)),
              ),
              // bottom navigater
              Positioned(
                bottom: 20,
                child: Row(
                    children:
                        List.generate(AppData.innerStyleImages.length, (index) {
                  bool isSelected = index == innerCurrentPage;

                  return GestureDetector(
                    onTap: () {
                      innerCarouselSliderController.animateToPage(index);
                    },
                    child: AnimatedContainer(
                      height: 10,
                      width: isSelected ? 55 : 17,
                      margin:
                          EdgeInsets.symmetric(horizontal: isSelected ? 5 : 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              isSelected ? Colors.white : Colors.grey.shade300),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    ),
                  );
                })),
              )
              // side Icon
              ,
              Positioned(
                  left: 12,
                  child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: IconButton(
                        onPressed: () {
                          innerCarouselSliderController
                              .animateToPage(innerCurrentPage - 1);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ))),
              // Right arrow
              Positioned(
                  right: 12,
                  child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: IconButton(
                        onPressed: () {
                          innerCarouselSliderController
                              .animateToPage(innerCurrentPage + 1);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ))),
            ],
          ),
        )
      ],
    );
  }

  Widget _outerBAnnerSlider(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Outer Indicator style ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .25,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              //slider
              Positioned.fill(
                child: CarouselSlider(
                    carouselController: outerCarouselSliderController,
                    items: AppData.outerStyleImages.map((imagePath) {
                      return Builder(builder: (BuildContext context) {
                        return ImageViewerHelper.Show(
                            context: context,
                            url: imagePath,
                            fit: BoxFit.cover);
                      });
                    }).toList(),
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        // aspectRatio: 16 / 9,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            outerCurrentPage = index;
                          });
                        },
                        viewportFraction: 0.8)),
              ),
              // bottom navigater
              Positioned(
                bottom: 20,
                child: Row(
                    children:
                        List.generate(AppData.outerStyleImages.length, (index) {
                  bool isSelected = index == outerCurrentPage;

                  return GestureDetector(
                    onTap: () {
                      outerCarouselSliderController.animateToPage(index);
                    },
                    child: AnimatedContainer(
                      height: 10,
                      width: isSelected ? 55 : 17,
                      margin:
                          EdgeInsets.symmetric(horizontal: isSelected ? 5 : 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade300),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    ),
                  );
                })),
              )
              // side Icon
              ,
              Positioned(
                  left: 12,
                  child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: IconButton(
                        onPressed: () {
                          outerCarouselSliderController
                              .animateToPage(outerCurrentPage - 1);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ))),
              // Right arrow
              Positioned(
                  right: 12,
                  child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(103, 224, 16, 16)
                          .withOpacity(0.6),
                      child: IconButton(
                        onPressed: () {
                          outerCarouselSliderController
                              .animateToPage(outerCurrentPage + 1);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ))),
            ],
          ),
        )
      ],
    );
  }
}
