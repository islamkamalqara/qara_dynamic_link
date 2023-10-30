import 'package:flutter/material.dart';
import 'package:web_firebase_app/entity/product_entity.dart';
import 'package:web_firebase_app/widgets/app_colors.dart';
import 'package:web_firebase_app/widgets/app_screen.dart';

class HomeScreen extends StatefulWidget{
  final String qrCode;
  HomeScreen({required this.qrCode});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }

}

class HomeScreenState extends State<HomeScreen>{
List<ProductEntity> product_entity_list = [];

@override
  void initState() {
  product_entity_list = [
    ProductEntity(name: "أعمدة", content: "٣"),
    ProductEntity(name: "قواطيع", content: "ISOLTR"),
    ProductEntity(name: "طرق", content: "١٨"),
    ProductEntity(name: "أمبير", content: "٦٣"),
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppScreen(
      title: "Firebase Hosting",
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child:    const CircleAvatar(
                backgroundImage: AssetImage('assets/Character.png'),
                radius:  100.0,
          ) ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'منتج أصلى',
                    style:  TextStyle(color: AppColors.orange),
                  )),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                child:  Divider(
                  color: AppColors.appGray,
                  endIndent: 50,
                  indent: 50,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'علبة السويدى',
                    style:  TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                child:  Image.asset("assets/electrical-panel.png",
                  ),
              ),

              Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                  child: product_data(product_entity: product_entity_list)
              )

            ],
          ),
        ),
      ),
    );


  }

  Widget product_data({required List<ProductEntity> product_entity}){
  return ListView.builder(
    shrinkWrap: true,
      itemCount: product_entity.length,
      itemBuilder: (context,index){
    return Center(
      child:  Padding(padding: EdgeInsets.symmetric(vertical: 10),
        child:Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: BoxDecoration(
          color: index %2 ==1 ?AppColors.white : AppColors.appGray,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product_entity[index].content),
            Text(product_entity[index].name),

          ],
        ),
      ),
      )    );
  });

  }
}