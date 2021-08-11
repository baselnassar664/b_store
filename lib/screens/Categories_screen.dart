import 'package:b_store/api/categories_api_controller.dart';
import 'package:b_store/models/Categories.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:b_store/widget/appar_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Categories> _categories = [];
  late Future<List<Categories>> _futureCategories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureCategories=  CategoriesApiController().getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ApparText( text: 'Categories',),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FutureBuilder<List<Categories>>(
    future: _futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey.shade500,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          _categories = snapshot.data ?? [];
          return ListView.builder(
             padding: EdgeInsets.only(
               top: SizeConfig.scaleHeight(30),
               left:SizeConfig.scaleWidth(30), 
               right:SizeConfig.scaleWidth(30),
             ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              Categories user = _categories[index];
              return Row(
               children: [
                 Container(
                   margin: EdgeInsets.only(
                     bottom: SizeConfig.scaleHeight(20)
                   ),
                   width: SizeConfig.scaleWidth(100),
                     height:SizeConfig.scaleHeight(100),

                     child: Image.network(_categories[index].imageUrl,fit: BoxFit.cover,),),
                 SizedBox(width: SizeConfig.scaleWidth(20),),
                 Text(_categories[index].nameEn),
                 Spacer(),
                 IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 20,))

               ],
              );
            },
          );
        } else {
          //NO DATA || ERROR
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning,
                  size: 80,
                ),
                Text(
                  'NO DATA',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          );
        }
      },
    ),
    );
  }
}
