import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_balance/db/database_provider.dart';
import 'package:zero_balance/screens/add_expense_screen.dart';
import 'package:zero_balance/screens/category_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Image.asset("assets/images/zerobalance_logo.png"),
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_none),
              iconSize: 24.0,
              onPressed: () {}),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                iconSize: 24.0,
                onPressed: () {}),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Hello, Parth!",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Let's help you stay on top \nof your finances",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 40.0,
                  child: OutlinedButton(
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 10.0,
                        ),
                        Text(
                          " add expense",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpenseScreen()));
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 120.0,
              child: Card(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 15.0),
                      child: Text(
                        "Total spent this month",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 10.0,
                        trackShape: const RoundedRectSliderTrackShape(),
                        thumbColor: Colors.white,
                        valueIndicatorShape:
                            const PaddleSliderValueIndicatorShape(),
                        valueIndicatorColor: Colors.black,
                        valueIndicatorTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      child: FutureBuilder(
                        future: DatabaseProvider.getTotal(),
                        builder: (BuildContext context, AsyncSnapshot snapshot ){
                          if (snapshot.hasData) {
                            if (snapshot.data[0]['Total'] != null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Slider(
                                    min: 0.0,
                                    max: 60.0,
                                    value: (snapshot.data[0]['Total']/1000),
                                    onChanged: (value) {},
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text("₹ ${snapshot.data[0]['Total'].toString()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              );
                            }
                          }
                          return Column(
                            children: [
                              Slider(
                                min: 0.0,
                                max: 60.0,
                                value: 0,
                                onChanged: (value) {},
                              ),
                              const Text("₹ 0",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18.0),
                              ),
                            ],
                          );
                        },
                      )


                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("favourite categories",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Text("manage",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue)),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 41.0,
                          backgroundColor: Color(0xffEB6842),
                          child: CircleAvatar(
                            radius: 38.0,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 33.0,
                              backgroundColor: Color(0xffEB6842),
                              child: Icon(
                                Icons.lunch_dining,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Food",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(category: "Food" )));
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 41.0,
                          backgroundColor: Color(0xff77ADD9),
                          child: CircleAvatar(
                            radius: 38.0,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 33.0,
                              backgroundColor: Color(0xff77ADD9),
                              child: Icon(
                                Icons.ondemand_video,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Entertainment",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(category: "Entertainment",)));
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 41.0,
                          backgroundColor: Color(0xff8D62F7),
                          child: CircleAvatar(
                            radius: 38.0,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 33.0,
                              backgroundColor: Color(0xff8D62F7),
                              child: Icon(
                                Icons.local_mall,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Shopping",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: Colors.grey[700]),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(category: "Shopping",)));
                    },
                  ),
                ],
              )),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("popular rewards",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text("pay with zerobalance card",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                  ],
                ),
                const Text("explore all",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue)),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: SizedBox(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                    width: 250.0,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Image.network(
                              "http://media.corporate-ir.net/media_files/IROL/17/176060/Oct18/Amazon%20logo.PNG",
                              height: 30.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "10% cashback",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 8.0),
                            child: Text(
                              "Activate offer to reveal \nthe code",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text(
                              "Activate",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 180.0,
                    width: 250.0,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, left: 20.0),
                            child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/0/09/Zomato_company_logo.png",
                              height: 20.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 8.0),
                            child: Text(
                              "10% cashback",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 8.0),
                            child: Text(
                              "Activate offer to reveal \nthe code",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 15.0),
                            child: Text(
                              "claim reward",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 195.0,
              child: Card(
                color: const Color(0xffCC5FFB),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 22.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Help your',
                              style: TextStyle(
                                  color: Color(0xffF9EAFE), fontSize: 24.0)),
                          Row(
                            children: const [
                              Text('friends',
                                  style: TextStyle(
                                      color: Color(0xffF9EAFE),
                                      fontSize: 24.0)),
                              Text(' balance',
                                  style: TextStyle(
                                      color: Color(0xffF9EAFE),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.0)),
                            ],
                          ),
                          const Text('their finances',
                              style: TextStyle(
                                  color: Color(0xffF9EAFE), fontSize: 24.0)),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 40.0,
                            child: MaterialButton(
                              color: const Color(0xffC1FC00),
                              child: Row(
                                children: const <Widget>[
                                  Text("refer friend",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    Icons.call_made,
                                    size: 15.0,
                                  )
                                ],
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:16.0, top: 16.0),
                            child: Image.asset('assets/images/refer.png', height: 120.0,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ]),
      ),
    );
  }
}
