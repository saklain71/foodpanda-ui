import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodpanda/Constants/MyColors.dart';
import 'package:foodpanda/Data/ApiRepository.dart';
import 'package:foodpanda/Widgets/MyDrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  List products = [];

    void fetcApi() async{
     products = (await ApiRepository.fetchProducts())!;
     //print("products $products");
     print(products.length);
     print(products[0].id);

   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetcApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Food Panda"),
          //backgroundColor: const Color.fromRGBO(191, 46, 97, 10),
          backgroundColor: MyColors.primaryColor,
          elevation: 0,
          actions: [
            Icon(Icons.notification_add),
            SizedBox(width: 20),
            PopupMenuButton<String>(
          // Define the items in the menu
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'item1',
                child: Text('Item 1'),
              ),
              PopupMenuItem<String>(
                value: 'item2',
                child: Text('Item 2'),
              ),
              PopupMenuItem<String>(
                value: 'item3',
                child: Text('Item 3'),
              ),
            ];
          },
          // Handle the item selection
          onSelected: (String value) {
            // Add your logic here for what to do when a menu item is selected
            switch (value) {
              case 'Breakfast':
              // Handle item 1 selection
                break;
              case 'Lunch':
              // Handle item 2 selection
                break;
              case 'Dinner':
              // Handle item 3 selection
                break;
            }
          },
        )
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: MyColors.primaryColor,
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10
                  ),
                  child: TextFormField(
                    controller: _controller,
                    autocorrect: true,
                    autofocus: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "search here to get food",
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: products != null ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: SizedBox(
                    width: 300,
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.pink,
                            radius: 108,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage('${products[index].image}'), //NetworkImage
                              radius: 100,
                            ), //CircleAvatar
                          ), //CircleAvatar
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                         //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                           Expanded(
                             child: Text(
                              '${products[index].description}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ), //Textstyle
                          ),
                           ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${products[index].price}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                ), //Textstyle
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.pink)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.touch_app),
                                      Text('Visit')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ) //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                );
            }) : Container(),
              ),
            ]
        ),
      ),
    );
  }
}
