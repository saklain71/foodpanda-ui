import 'package:flutter/material.dart';

class FastFood extends StatelessWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Panda Pick' , style: TextStyle(color: Color(0xff323232) , fontSize: 15,),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .278,
                  child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Text('Food');
                      }),
                ),
              ),
              Text('Panda exclusives' , style: TextStyle(color: Color(0xff323232) , fontSize: 15),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .278,
                  child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Text('Food');
                      }),
                ),
              ),
              Text('All Restuarent' , style: TextStyle(color: Color(0xff323232) , fontSize: 15),),

              Container(
                height: MediaQuery.of(context).size.height * .3,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Text('Food');
                    }),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
