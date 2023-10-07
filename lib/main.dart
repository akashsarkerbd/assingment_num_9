import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akash Sarker',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class ClothingItem {
  final String name;
  final String imageUrl;
  final String color;
  final String size;
  final double price;

  ClothingItem({
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.price,
  });
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<int> itemCounts = List<int>.generate(3, (index) => 0);
  List<double> unitPrices = [51.0, 30.0, 43.0];
  double totalAmount = 0.0;

  void updateTotalAmount() {
    setState(() {
      totalAmount = itemCounts.fold(0.0, (prev, count) =>
      prev + (unitPrices[itemCounts.indexOf(count)] * count));
    });
  }

  void showCongratulatorySnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<ClothingItem> items = [
      ClothingItem(
        name: 'Pullover',
        imageUrl:
        'https://img.freepik.com/free-psd/isolated-white-t-shirt-front-view_125540-1194.jpg?w=740&t=st=1696679695~exp=1696680295~hmac=6ebc81897e20fed098b754af99d2178ea05368cb1d1860f17b294f24b79591b4',
        color: 'Black',
        size: 'L',
        price: 51.0,
      ),
      ClothingItem(
        name: 'T-Shirt',
        imageUrl:
        'https://img.freepik.com/premium-psd/t-shirt-front-back_303714-1883.jpg?w=740',
        color: 'White',
        size: 'L',
        price: 30.0,
      ),
      ClothingItem(
        name: 'Sport Dress',
        imageUrl:
        'https://img.freepik.com/free-photo/standing-courier-man-having-his-arms-crossed-medium-shot_23-2148419042.jpg?w=740&t=st=1696680029~exp=1696680629~hmac=1c38716df1818d948d83c3500ac3eedd45b9b002f76a38cd6db9840d218e12a7',
        color: 'Black',
        size: 'M',
        price: 43.0,
      ),
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'My Bag',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (int index = 0; index < itemCounts.length; index++)
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.green,
                                    width: double.infinity,
                                    height: 150,
                                    child: Image.network(
                                      items[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(items[index].name, style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
                                            trailing: Icon(Icons.more_vert),
                                          ),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Color: ${items[index].color}   Size: ${items[index].size}',
                                                style: TextStyle(fontWeight:FontWeight.bold),)),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Card(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        if (itemCounts[index] >
                                                            0) {
                                                          setState(() {
                                                            itemCounts[index]--;
                                                            updateTotalAmount();
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(Icons.remove),
                                                    ),
                                                    elevation: 10,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                  ),
                                                ),
                                                Text('${itemCounts[index]}'),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Card(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          itemCounts[index]++;
                                                          updateTotalAmount();
                                                        });
                                                      },
                                                      icon: Icon(Icons.add),
                                                    ),
                                                    elevation: 10,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 20),
                                                  child:
                                                  Text("${items[index].price}\$"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total amount: ',style:
                                TextStyle(fontWeight:FontWeight.bold),),

                                Text('${totalAmount.toStringAsFixed(2)}\$',
                                  style: TextStyle(fontWeight:FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              showCongratulatorySnackbar();
                            },
                            child: Text('CHECK OUT'),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
