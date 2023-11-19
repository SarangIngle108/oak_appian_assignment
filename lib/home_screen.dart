import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({Key? key,required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Hi, ${widget.username}!",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 25),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 50,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Current location",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp),
                            Text(" Hyderabad"),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.play_circle,
                            color: Colors.purple,
                          ),
                        ),
                        Text(
                          "How it works?",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    for (int i = 0; i < 2; i++)
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: MediaQuery.of(context).size.height / 5.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/img1_1.png", scale: 1,),
                      ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: MediaQuery.of(context).size.height/16,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search food or events",style: TextStyle(fontSize: 15),),
                        Icon(Icons.search,color: Colors.purple,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height/4.6,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0,0.0,0.0,0.0),
                      child: Text("Start crafting",style: TextStyle(color: Colors.purple,fontSize: 23),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22.0, 8.0,0.0, 0.0),
                          child: Card(
                            color: Colors.white,
                        /*    height: MediaQuery.of(context).size.height/5.6,
                            width: MediaQuery.of(context).size.width/2.5,*/
                            child: Column(
                              children: [
                                Image.asset("assets/images/img2_1.png",scale: 2,),
                                SizedBox(height: 5,),
                                Text("Default Platters"),
                              ],
                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4.0,8.0,22.0,0.0),
                          child: Card(
                            color: Colors.white,
                          /* decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             color: Colors.white,
                           ),
                            height: MediaQuery.of(context).size.height/5.6,
                            width: MediaQuery.of(context).size.width/2.5,*/
                            child: Column(
                              children: [
                                Image.asset("assets/images/img2_1.png",scale: 2,),
                                SizedBox(height: 5,),
                                Text("Default Platters"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 22.0),
               child: Row(
                 children: [
                   for(int i=0;i<2;++i)
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: Card(
                       color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Default Menu 1",style: TextStyle(fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              ClipRRect(
                                  child: Image.asset("assets/images/img3.jpeg",scale: 2,)),
                              Column(children: [
                                Text("3 starters"),
                                Text("3 maincourse"),
                                Text("3 deserts"),
                                Text("3 drinks"),
                              ],)
                            ],
                          ),
                          Row(children: [
                            Icon(Icons.person),
                            Text(" Min 800"),
                          ],),
                          Text("Starts at 777",style: TextStyle(color: Colors.purple),),
                        ],
                      ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 15),
              child: Container(
                height: MediaQuery.of(context).size.height/7,
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Top Categories",style: TextStyle(fontSize: 20),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                            Column(
                              children: [
                                Image.asset("assets/images/img4_1.png",scale: 2,),
                                SizedBox(height: 2,),
                                Text("starters"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                            Column(
                              children: [
                                Image.asset("assets/images/img4_2.png",scale: 1.9,),
                                SizedBox(height: 2,),
                                Text("Drinks"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                            Column(
                              children: [
                                Image.asset("assets/images/img4_3.png",scale: 1.9,),
                                SizedBox(height: 2,),
                                Text("Rice"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                            Column(
                              children: [
                                Image.asset("assets/images/img4_4.png",scale: 1.8,),
                                SizedBox(height: 2,),
                                Text("Curry"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                            Column(
                              children: [
                                Image.asset("assets/images/img4_1.png",scale: 2,),
                                Text("starters"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                            Column(
                              children: [
                                Image.asset("assets/images/img4_1.png",scale: 2,),
                                Text("starters"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                height: MediaQuery.of(context).size.height/5.1,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(" Starters",style: TextStyle(fontSize: 22),),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("More Starters",style: TextStyle(color: Colors.purple,fontSize: 12),),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i=0;i<6;++i)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,5.0,0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/img5.jpeg",scale: 2.0,),
                                  ),
                                  Text("Paneer Tikka"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                height: MediaQuery.of(context).size.height/5.1,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(" Main Course",style: TextStyle(fontSize: 22),),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("More Main Courses",style: TextStyle(color: Colors.purple,fontSize: 12),),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i=0;i<6;++i)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,5.0,0),
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Image.asset("assets/images/img6.jpeg",scale: 2.0,),
                                  ),
                                  Text("Paneer Tikka"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                height: MediaQuery.of(context).size.height/2.2,
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Services",style: TextStyle(fontSize: 22),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i=0;i<5;++i)
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/img7.png",scale: 2,),
                                  SizedBox(height: 10,),
                                  Text("Signature",style: TextStyle(fontSize: 22,color: Colors.purple),),
                                  SizedBox(height: 10,),
                                  Text("* High Quality Disposable Cutlery ",style: TextStyle(fontSize: 15),),
                                  SizedBox(height: 10,),
                                  Text("* High Quality Disposable Cutlery ",style: TextStyle(fontSize: 15),),
                                  SizedBox(height: 10,),
                                  Text("* Served by WaitStaff ",style: TextStyle(fontSize: 15),),
                                  SizedBox(height: 10,),
                                  Text("* Best for Weddings, Corprate events ",style: TextStyle(fontSize: 15),),
                                  Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(onPressed: (){}, child: Text("Know More")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
              child: Container(
                width: double.infinity,
                child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("How does it work ?",style: TextStyle(fontSize: 22),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Image.asset("assets/images/img8_1.png",scale: 1.6,),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customize Menu",style: TextStyle(color: Colors.purple,fontSize: 18),),
                            Text("Select items for single event",style: TextStyle(fontSize: 14),),
                            Text("or multiple events",style: TextStyle(fontSize: 14),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Choose Services",style: TextStyle(color: Colors.purple,fontSize: 18),),
                            Text("Select the type of services",style: TextStyle(fontSize: 14),),
                            Text("from varying cutlery, mode of",style: TextStyle(fontSize: 14),),
                            Text("serving options, and more",style: TextStyle(fontSize: 14),),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Image.asset("assets/images/img8_2.png",scale: 1.6,),


                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Image.asset("assets/images/img8_1.png",scale: 1.6,),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customize Menu",style: TextStyle(color: Colors.purple,fontSize: 18),),
                            Text("Select items for single event",style: TextStyle(fontSize: 14),),
                            Text("or multiple events",style: TextStyle(fontSize: 14),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Choose Services",style: TextStyle(color: Colors.purple,fontSize: 18),),
                            Text("Select the type of services",style: TextStyle(fontSize: 14),),
                            Text("from varying cutlery, mode of",style: TextStyle(fontSize: 14),),
                            Text("serving options, and more",style: TextStyle(fontSize: 14),),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Image.asset("assets/images/img8_2.png",scale: 1.6,),


                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Image.asset("assets/images/img8_1.png",scale: 1.6,),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customize Menu",style: TextStyle(color: Colors.purple,fontSize: 18),),
                            Text("Select items for single event",style: TextStyle(fontSize: 14),),
                            Text("or multiple events",style: TextStyle(fontSize: 14),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Choose Services",style: TextStyle(color: Colors.purple,fontSize: 18),),
                            Text("Select the type of services",style: TextStyle(fontSize: 14),),
                            Text("from varying cutlery, mode of",style: TextStyle(fontSize: 14),),
                            Text("serving options, and more",style: TextStyle(fontSize: 14),),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Image.asset("assets/images/img8_2.png",scale: 1.6,),


                      ],
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22,10,0,40),
              child: Container(
                color: Colors.white24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delicious food with",style: TextStyle(fontSize: 25),),
                    Text("professional service !",style: TextStyle(fontSize: 25),),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(side: BorderSide(color: Colors.amber, width: 2.0),),
        mini: true,
        backgroundColor: Colors.purple,
        onPressed: (){},
        child: Image.asset("assets/images/img.png"),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height/14.5,
        color: Colors.white,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           IconButton(onPressed:(){},icon: Icon(Icons.home,)),
           Padding(
             padding: const EdgeInsets.only(right: 16.0),
             child: IconButton(onPressed:(){},icon: Icon(Icons.favorite_border,)),
           ),

           Padding(
             padding: const EdgeInsets.only(left: 16.0),
             child: IconButton(onPressed:(){},icon: Icon(Icons.no_food_rounded,)),
           ),
           IconButton(onPressed:(){},icon: Icon(Icons.person_2,)),

         ],
       ),

      ),
    );
  }
}
