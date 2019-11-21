import 'package:final_project_osg7/core/model/model_categories.dart';
import 'package:final_project_osg7/core/network/service_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ServiceCategories _serviceCategories;


  @override
  void initState() {
    _serviceCategories = ServiceCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal Categories'
        ),
      ),
      body: FutureBuilder<ModelCategories>(
        future: _serviceCategories.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.categories.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data.categories[index];
                  return snapshot.data.categories == null
                      ? Text("No categories found.")
                      : InkWell(
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Image.network(
                              data.strCategoryThumb
                            ),
                          ),
                          Text(
                            data.strCategory,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            data.strCategoryDescription,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
        },
      ),
    );
  }
}