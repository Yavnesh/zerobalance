import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zero_balance/db/database_provider.dart';

import 'add_expense_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String? category;
  final int? amount;

  const CategoryScreen({Key? key, this.category, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          category.toString(),
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Card(
                  color: const Color(0xff2C2C2E),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14.0, top: 20.0, bottom: 35.0),
                        child: Row(
                          children: [
                            Text(
                              "Last",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: Colors.grey[800]),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 28.0,
                                width: 80.0,
                                child: const Center(
                                  child: Text(
                                    "7 DAYS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff3A3A3B),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 28.0,
                                width: 80.0,
                                child: const Center(
                                  child: Text(
                                    "30 DAYS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Color(0xff777778)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff3A3A3B),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: 28.0,
                                width: 80.0,
                                child: const Center(
                                  child: Text(
                                    "90 DAYS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Color(0xff777778)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 21.0, bottom: 48.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: category.toString() == 'Food'
                                  ? const Color(0xffEB6842)
                                  : category.toString() == 'Entertainment'
                                      ? const Color(0xff77ADD9)
                                      : const Color(0xff8D62F7),
                              child: CircleAvatar(
                                radius: 23.0,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: category.toString() == 'Food'
                                      ? const Color(0xffEB6842)
                                      : category.toString() == 'Entertainment'
                                          ? const Color(0xff77ADD9)
                                          : const Color(0xff8D62F7),
                                  child: Icon(
                                    category.toString() == 'Food'
                                        ? Icons.lunch_dining
                                        : category.toString() == 'Entertainment'
                                            ? Icons.ondemand_video_rounded
                                            : Icons.local_mall,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const Text(
                                      "Spent this month",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff777778)),
                                    ),
                                    Text(
                                      "₹ ${amount.toString()}",
                                      style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xffF7F7F7)),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 26.0),
                        child: Container(
                          height: 250.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.flash_on_rounded,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 16.0),
                  const Text(
                    "Apps wise spends",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddExpenseScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Card(
                  color: const Color(0xff2C2C2E),
                  child: Column(
                    children: [
                      FutureBuilder(
                          future:
                              DatabaseProvider.getAllCategoryExpenseByMerchant(
                                  category.toString()),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length > 4
                                        ? 4
                                        : snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 19.0,
                                                right: 22.0,
                                                top: 22.0,
                                                bottom: 18.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        color: Colors.white,
                                                      ),
                                                      height: 44.0,
                                                      width: 44.0,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        child: Image.asset(
                                                            "assets/images/swiggy.png",
                                                            height: 40.0),
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
                                                          snapshot.data[index]
                                                              ['merchant'],
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                          height: 4.0,
                                                        ),
                                                        Text(
                                                          "₹ ${snapshot.data[index]['Total']}",
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Icon(
                                                  Icons.chevron_right,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            color: Color(0xff49494B),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }
                            return const SizedBox(
                              height: 0.0,
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "View All",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff777778)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffF7F7F7)),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Card(
                  color: const Color(0xff2C2C2E),
                  child: Column(
                    children: [
                      FutureBuilder(
                          future: DatabaseProvider.getAllCategoryExpense(
                              category.toString()),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
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
                                    itemCount: snapshot.data!.length > 4
                                        ? 4
                                        : snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      int reverseIndex =
                                          snapshot.data!.length - 1 - index;
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0,
                                                horizontal: 22.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5.0)),
                                                      child: Container(
                                                        height: 44.0,
                                                        width: 44.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          border: Border(
                                                            left: BorderSide(
                                                                width: 4.0,
                                                                color: Color(
                                                                    0xff83FFC5)),
                                                          ),
                                                          color:
                                                              Color(0xff3a3a3b),
                                                        ),
                                                        child: Center(
                                                          child: Icon(
                                                            category.toString() ==
                                                                    'Food'
                                                                ? Icons
                                                                    .lunch_dining
                                                                : category.toString() ==
                                                                        'Entertainment'
                                                                    ? Icons
                                                                        .ondemand_video_rounded
                                                                    : Icons
                                                                        .local_mall,
                                                            color: Colors.white,
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
                                                          snapshot.data[
                                                                  reverseIndex]
                                                              ['merchant'],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                          height: 4.0,
                                                        ),
                                                        Text(
                                                          DateFormat.MMMMd().format(
                                                              DateTime.parse(
                                                                  snapshot.data![
                                                                          reverseIndex]
                                                                      [
                                                                      'date'])),
                                                          style: const TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff777778)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  '₹ ${snapshot.data![reverseIndex]['amount']}',
                                                  style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xff83FFC5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            color: Color(0xff49494B),
                                          ),
                                        ],
                                      );
                                    });
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
