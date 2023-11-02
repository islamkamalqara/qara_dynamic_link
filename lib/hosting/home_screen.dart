import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_firebase_app/base/Helper/app_event.dart';
import 'package:web_firebase_app/base/Helper/app_state.dart';
import 'package:web_firebase_app/data/model/publicScanModel.dart';
import 'package:web_firebase_app/entity/product_entity.dart';
import 'package:web_firebase_app/logic/public_scan_bloc.dart';
import 'package:web_firebase_app/widgets/app_colors.dart';
import 'package:web_firebase_app/widgets/app_screen.dart';
import 'package:web_firebase_app/widgets/no_data.dart';

import '../widgets/loading_widget.dart';

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
//List<ProductEntity> product_entity_list = [];

@override
  void initState() {

  publicScanBloc.add(GetPublicScanData(
    qr_value: /* "A101-00000005742"*/
    "qara.net?-ORDER-lob18a18gzxus687223zn123"
  ));

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder(
      bloc: publicScanBloc,
      builder: (context,state){
        if(state is Loading){
      return LoadingWidget();
        }
        else if(state is Done){
          return StreamBuilder<PublicScanModel>(
              stream: publicScanBloc.public_scan_data_subject,
              builder: (context,snapshot){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return LoadingWidget();

                  case ConnectionState.done:
                    return Text('');
                  case ConnectionState.waiting:
                    return LoadingWidget();

                  case ConnectionState.active:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    else if (snapshot.data?.status ==201) {

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
                                      style:  TextStyle(color: AppColors.orange,fontSize: 16),
                                    )),
                                Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                  child:  Divider(
                                    color: AppColors.appGray,
                                    endIndent: 20,
                                    indent: 20,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      '${snapshot.data?.body?[0].products?[0].name}',
                                      style:  TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                  child:  Image.asset("assets/electrical-panel.png",
                                  ),
                                ),

                                Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                    child: product_data(
                                        values: snapshot.data?.body?[0].products![0].values)
                                )

                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    else
                      return no_data_widget(context: context,
                      text: "product not origin");
                }
              });

        }else if(state is ErrorLoading){
          return no_data_widget(context: context,
          text: "error");
        }
        return Container();
      },
    );




  }

  Widget product_data({ List<Values>? values}){
  return ListView.builder(
    shrinkWrap: true,
      itemCount: values!.length,
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
            Text(values[index].value!.name!),
            Text(values[index].key!.name!),

          ],
        ),
      ),
      )    );
  });

  }
}