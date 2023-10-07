import 'package:flutter/material.dart';




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
          title: 'حرکات پا',
          color: Colors.blue,
          iconPath: 'assets/foot.svg', // مسیر SVG آیکون حرکات پا
        ),
        CategoryItem(
          title: 'تقویت شانه',
          color: Colors.green,
          iconPath: 'assets/shoulder.svg', // مسیر SVG آیکون تقویت شانه
        ),
        CategoryItem(
          title: 'حرکات باسن',
          color: Colors.orange,
          iconPath: 'assets/butt.svg', // مسیر SVG آیکون حرکات باسن
        ),
        CategoryItem(
          title: 'حرکات نرمشی',
          color: Colors.purple,
          iconPath: 'assets/stretch.svg', // مسیر SVG آیکون حرکات نرمشی
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String iconPath;

  CategoryItem({required this.title, required this.color, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          // اقداماتی که باید در صورت فشار دادن روی گزینه انجام شود
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
    );
  }
}
