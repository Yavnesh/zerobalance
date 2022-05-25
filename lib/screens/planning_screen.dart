import 'package:flutter/material.dart';
import 'package:zero_balance/db/database_provider.dart';
import 'package:zero_balance/model/expense.dart';
import 'package:intl/intl.dart';
import 'category_screen.dart';


class PlanningScreen extends StatefulWidget {
  final Expense? expense;
  const PlanningScreen({Key? key, this.expense}) : super(key: key);

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
          child: Text(
            "Planning",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                  height: 364.0,
                  child: Card(
                    color: const Color(0xff2C2C2E),
                    child: FutureBuilder(
                        future: DatabaseProvider.getAllExpenseByCategory(),
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.hasData){
                            if(snapshot.data != null){
                            }
                          }
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Icon(Icons.credit_card, color: Colors.white),
                                const Text(
                                  "this month's spend",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff777778)),
                                ),
                                FutureBuilder(
                                  future: DatabaseProvider.getTotal(),
                                  builder: (BuildContext context, AsyncSnapshot snapshot ){
                                    if (snapshot.hasData) {
                                      if (snapshot.data[0]['Total'] != null) {
                                        return Text(
                                          "₹ ${snapshot.data[0]['Total'].toString()}",
                                          style: const TextStyle(
                                              fontSize: 36.0,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xffF7F7F7)),
                                        );
                                      }
                                    }
                                    return const Text(
                                      "₹ 0",
                                      style: TextStyle(
                                          fontSize: 36.0,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffF7F7F7)),
                                    );
                                  },
                                )
                              ],
                            )
                          );
                    }
                    )
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
              child: Text(
                "categories",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            FutureBuilder(
                future: DatabaseProvider.getFoodTotal(),
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    if (snapshot.data[0]['Total'] != null) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                    category: "Food", amount : int.parse(snapshot.data[0]['Total'].toString())
                                  )));
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                          child: SizedBox(
                              height: 87.0,
                              child: Card(
                                color: const Color(0xff2C2C2E),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    children: <Widget>[
                                      const CircleAvatar(
                                        radius: 26.0,
                                        backgroundColor: Color(0xffEB6842),
                                        child: CircleAvatar(
                                          radius: 24.0,
                                          backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: Color(0xffEB6842),
                                            child: Icon(
                                              Icons.lunch_dining,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 22.0,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          const Text(
                                            "Food",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 7.0,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/swiggy.png",
                                                    height: 20.0),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/zomato.png",
                                                    height: 20.0),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/mcd.png",
                                                    height: 20.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 64.0,
                                      ),
                                      Text(
                                        '₹ ${snapshot.data[0]['Total'].toString()}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                  }
                }
                  return const SizedBox();
                }),
            FutureBuilder(
                future: DatabaseProvider.getEntertainmentTotal(),
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    if (snapshot.data[0]['Total'] != null) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                    category: "Entertainment", amount : int.parse(snapshot.data[0]['Total'].toString())
                                  )));
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                          child: SizedBox(
                              height: 87.0,
                              child: Card(
                                color: const Color(0xff2C2C2E),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    children: <Widget>[
                                      const CircleAvatar(
                                        radius: 26.0,
                                        backgroundColor: Color(0xff77ADD9),
                                        child: CircleAvatar(
                                          radius: 24.0,
                                          backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: Color(0xff77ADD9),
                                            child: Icon(
                                              Icons.ondemand_video,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 22.0,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          const Text(
                                            "Entertainment",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 7.0,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/swiggy.png",
                                                    height: 20.0),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/zomato.png",
                                                    height: 20.0),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/mcd.png",
                                                    height: 20.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 64.0,
                                      ),
                                      Text(
                                        '₹ ${snapshot.data[0]['Total'].toString()}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    }
                  }
                  return const SizedBox();
                }),
            FutureBuilder(
                future: DatabaseProvider.getShoppingTotal(),
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    if (snapshot.data[0]['Total'] != null) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  CategoryScreen(
                                    category: "Shopping", amount : int.parse(snapshot.data[0]['Total'].toString())
                                  )));
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
                          child: SizedBox(
                              height: 87.0,
                              child: Card(
                                color: const Color(0xff2C2C2E),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    children: <Widget>[
                                      const CircleAvatar(
                                        radius: 26.0,
                                        backgroundColor: Color(0xff8D62F7),
                                        child: CircleAvatar(
                                          radius: 24.0,
                                          backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: Color(0xff8D62F7),
                                            child: Icon(
                                              Icons.local_mall,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 22.0,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          const Text(
                                            "Shopping",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 7.0,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/swiggy.png",
                                                    height: 20.0),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/zomato.png",
                                                    height: 20.0),
                                              ),
                                              const SizedBox(
                                                width: 6.0,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                    "assets/images/mcd.png",
                                                    height: 20.0),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 64.0,
                                      ),
                                      Text(
                                        '₹ ${snapshot.data[0]['Total'].toString()}',
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    }
                  }
                  return const SizedBox(height: 0,);
                }),
            const SizedBox(
              height: 32.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: SizedBox(
                  child: Card(
                      color: const Color(0xff2C2C2E),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 20.0, top: 18.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                children: const <Widget>[
                                  Icon(
                                    Icons.credit_card_rounded,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "recent transactions",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            FutureBuilder<List<Expense>?>(
                                future: DatabaseProvider.getAllExpense(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Expense>?> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.error.toString(),
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  } else if (snapshot.hasData) {
                                    if (snapshot.data != null) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.length > 4 ? 4 : snapshot.data!.length,
                                          itemBuilder:
                                              (context, index) {
                                                int reverseIndex = snapshot.data!.length - 1 - index;
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: <
                                                                Widget>[
                                                              ClipRRect(
                                                                borderRadius: const BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        5.0)),
                                                                child:
                                                                Container(
                                                                  height:
                                                                  44.0,
                                                                  width: 44.0,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    border:
                                                                    Border(
                                                                      left: BorderSide(
                                                                          width: 4.0,
                                                                          color: snapshot.data![reverseIndex].expenseCategoryType == 'Food'
                                                                              ? const Color(0xffEB6842)
                                                                              : snapshot.data![reverseIndex].expenseCategoryType == 'Entertainment'
                                                                              ? const Color(0xff77ADD9)
                                                                              : const Color(0xff8D62F7)),
                                                                    ),
                                                                    color: const Color(
                                                                        0xff3a3a3b),
                                                                  ),
                                                                  child:
                                                                  Center(
                                                                    child:
                                                                    Icon(
                                                                      snapshot.data![reverseIndex].expenseCategoryType ==
                                                                          'Food'
                                                                          ? Icons.lunch_dining
                                                                          : snapshot.data![reverseIndex].expenseCategoryType == 'Entertainment'
                                                                          ? Icons.ondemand_video_rounded
                                                                          : Icons.local_mall,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 17.0,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    snapshot
                                                                        .data![
                                                                    reverseIndex]
                                                                        .merchant,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                        16.0,
                                                                        fontWeight: FontWeight
                                                                            .w500,
                                                                        color:
                                                                        Colors.white),
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                    4.0,
                                                                  ),
                                                                  Text(
                                                                    DateFormat.MMMMd().format(DateTime.parse(snapshot
                                                                        .data![
                                                                    reverseIndex]
                                                                        .date)),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                        12.0,
                                                                        fontWeight: FontWeight
                                                                            .w600,
                                                                        color:
                                                                        Color(0xff777778)),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          Text(
                                                            '₹ ${snapshot.data![reverseIndex].amount}',
                                                            style: const TextStyle(
                                                                fontSize:
                                                                18.0,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const Divider(
                                                      color:
                                                      Color(0xff49494B),
                                                    ),
                                                  ],
                                                );
                                              }

                                      );
                                    }
                                  }
                                  return const Padding(
                                    padding: EdgeInsets.only(bottom: 16.0),
                                    child: Text(
                                      "Add expense to view transactions",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  );
                                }),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_forward),
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}

