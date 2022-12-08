import 'package:flutter/material.dart';
import 'package:flutter_ui/datalist.dart';

final regularBorderRadius = BorderRadius.circular(10);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.4),
                          hintText: 'Search',
                          filled: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: border(),
                          enabledBorder: border(),
                          focusedBorder: border(),
                        ),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.notifications_outlined),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.grey,
                          Colors.purple,
                          Colors.blue,
                        ],
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/pc.png',
                            width: 180,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GAMER DAY',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              sizedBox(10),
                              Text(
                                'UPGRADE YOUR GAMING GEAR',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              sizedBox(10),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text('Upgrade Now'))
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
              sizedBox(20),
              SizedBox(
                height: 45,
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    indicator: BoxDecoration(
                        color: Colors.black, borderRadius: regularBorderRadius),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      tabDecoration('All Product'),
                      tabDecoration('Laptop'),
                      tabDecoration('Smartphone'),
                      tabDecoration('Accessries'),
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(controller: _tabController, children: [
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemCount: productsDetail.length,
                      itemBuilder: (context, index) {
                        final data = productsDetail[index];
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: regularBorderRadius,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 4,
                                    spreadRadius: 4,
                                    offset: const Offset(0, 4))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                data.imgDir,
                                width: 200,
                                height: 120,
                              ),
                              sizedBox(5),
                              Text(
                                data.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              sizedBox(5),
                              Text(data.price.toString()),
                            ],
                          ),
                        );
                      }),
                  Container(),
                  Container(),
                  Container(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container tabDecoration(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: regularBorderRadius,
          border: Border.all(color: Colors.black.withOpacity(0.4), width: 1)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  SizedBox sizedBox(double hei) {
    return SizedBox(height: hei);
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.transparent));
  }
}
