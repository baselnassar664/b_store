import 'package:b_store/screens/Categories/Categories_screen.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/app_text.dart';
import 'package:b_store/widget/cotainerhome1.dart';
import 'package:b_store/widget/pageviewhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
         top: SizeConfig.scaleHeight(30),
        left: SizeConfig.scaleWidth(30),
        right: SizeConfig.scaleWidth(30),
      ),
      child: Column(
        children: [
          Container(
            height: SizeConfig.scaleHeight(147),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int selectedIndex) {
                setState(() {
                  _selectedIndex = selectedIndex;
                });
              },
              children: [
                PageViewHome(image: 'images/1.png',),
                PageViewHome(image: 'images/2.png',),
                PageViewHome(image: 'images/3.png',),
              ],
            ),
          ),
           SizedBox(height:SizeConfig.scaleHeight(30) ,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller:_pageController ,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Color(0xffC4C4C4),
                  activeDotColor:AppColors.app_color,
                  dotWidth: SizeConfig.scaleWidth(10),
                  dotHeight: SizeConfig.scaleHeight(10),
                  spacing: SizeConfig.scaleHeight(8),

                ),
              ),
            ],
          ),
          SizedBox(height:SizeConfig.scaleHeight(30) ,),
          Row(
            children: [
              AppText(text:'Categories', color: AppColors.app_text1, fontsize:SizeConfig.scaleTextFont(16),),
              Spacer(),
              TextButton(
                onPressed: (){
                 Get.to(CategoriesScreen());
                },
                  child: AppText(text:'see all', color: AppColors.app_text2, fontsize:SizeConfig.scaleTextFont(12),)),
            ],
          ),
          SizedBox(height:SizeConfig.scaleHeight(16) ,),
          SingleChildScrollView(
              scrollDirection:Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ContainerHome1(title: 'Clothes',image: 'images/clothes.jpg',),
                ContainerHome1(title: 'Shoes',image: 'images/shoes.jpg',),
                ContainerHome1(title: 'Headphones',image: 'images/wirless.jpg',),
                ContainerHome1(title: 'Bags',image: 'images/bags.jpg',),
                ContainerHome1(title: 'Watches',image: 'images/washes.jpg',right: 0,),
              ],
            ),
          )

        ],
      ),
    );
  }
}
