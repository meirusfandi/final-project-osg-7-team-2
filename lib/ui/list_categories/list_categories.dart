import 'package:final_project_osg7/core/model/model_categories.dart';
import 'package:final_project_osg7/core/network/service_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCategoriesScreen extends StatelessWidget {

  ServiceCategories _serviceCategories;

  @override
  void initState() {
    _serviceCategories = ServiceCategories();
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
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Text(
                              data.strCategory,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0
                            ),
                            child: Text(
                              data.strCategoryDescription,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
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
