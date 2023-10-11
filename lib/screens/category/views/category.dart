import 'package:fitnass/screens/seeAll/see_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(
          title: Text('دسته بندی',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: CategoryList(),
      );
    
  }
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryItem(
          title: 'فول بادی',    
          color1: Color(0xffff9a9e),
          color2: Color(0xfffecfef),   
          
        ),
        CategoryItem(
          title: 'شکم و پهلو',     
                   color1: Color(0xff84fab0),
          color2: Color(0xff8fd3f4),   
        ),
        CategoryItem(
          title: 'سرشانه و پشت',
                  color1: Color(0xffE0C3FC),
          color2: Color(0xff8EC5FC),   
        ),
        CategoryItem(
          title: 'پا',
                     color1: Color(0xffFA709A),
          color2: Color(0xffFEE140),   
        ),
                CategoryItem(
          title: 'حرکات باسن',
                     color1: Color(0xffD4FC79),
          color2: Color(0xff96E6A1),   
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color1;
  final Color color2;

  CategoryItem({required this.title, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1,color2])
        ),
        child: InkWell(
          onTap: () async{
                       SharedPreferences _prefs = await SharedPreferences.getInstance();
              final SharedPreferences prefs = await _prefs;
              await prefs.setString('params', this.title);
              Get.to(()=>SeeAllPage());
          },
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   iconPath,
                //   width: 60,
                //   height: 60,
                //   color: Colors.white,
                // ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
