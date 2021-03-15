import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AST PRODUCTS',
          style: const TextStyle(
            // color: Colors.black38,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text(
                      "Search",
                      // textAlign: TextAlign.center,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 1.2),
                    borderRadius: BorderRadius.circular(29.5)),
              ),
              trailing: FlatButton.icon(
                label: Text("Filter"),
                textColor: Colors.blueAccent,
                icon: Icon(
                  Icons.sort,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  return showDialog(
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          contentPadding: EdgeInsets.all(10),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Text("Filter"),
                                Text(
                                  "Reset",
                                  style:
                                      TextStyle(color: Colors.lightBlueAccent),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: "Minimum",
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: "Maximum",
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Item Filter"),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                buildListTile('Category 1'),
                                buildListTile('Category 2'),
                                buildListTile('Category 3'),
                                buildListTile('Category 4'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Item Color"),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildColorContainer(Colors.blue),
                                buildColorContainer(Colors.red),
                                buildColorContainer(Colors.black),
                                buildColorContainer(Colors.green)
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: RaisedButton(
                                color: Colors.indigo,
                                child: Text(
                                  "Apply Filters",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        );
                      },
                      context: context);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(
                "Categories",
                style: const TextStyle(fontSize: 22),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildGestureDetector("Category 0", Icons.bathtub),
                  buildGestureDetector("Category 1", Icons.kitchen),
                  buildGestureDetector("Category 2", Icons.kitchen_outlined),
                  buildGestureDetector("Category 2", Icons.kitchen_outlined),
                  buildGestureDetector("Category 2", Icons.kitchen_outlined),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 2),
              children: [
                gridWidgets(AssetImage("assets/images/chair1.jpg"),
                    "Chair Desey - black", "50.0", "4.5"),
                gridWidgets(AssetImage("assets/images/chair2.jpg"),
                    "Chair 2 - black", "50.0", "4.5"),
                gridWidgets(AssetImage("assets/images/chair3.jpg"),
                    "Chair 3 - black", "50.0", "4.5"),
                gridWidgets(AssetImage("assets/images/chair1.jpg"),
                    "Chair 4 - black", "50.0", "4.5")
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildColorContainer(Color color) {
    return Container(
      margin: EdgeInsets.only(left: 35),
      height: 25,
      width: 25,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  ListTile buildListTile(String title) {
    return ListTile(
      leading: Icon(Icons.category),
      title: Text(title),
      trailing: IconButton(
        icon: Icon(Icons.done),
        onPressed: () {},
      ),
    );
  }

  Widget buildGestureDetector(String title, IconData icon) {
    return GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 6,
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: Colors.indigo[300],
                    size: 45,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                  )
                ],
              )),
        ));
  }

  Widget gridWidgets(
      AssetImage image, String title, String price, String rating) {
    return Container(
      alignment: Alignment.center,

      //padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(image: image),
                )),
            Text(title),
            Text(price),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text(rating),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 15,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget filterContainer(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
