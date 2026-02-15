import 'package:flutter/material.dart';

class NutritionTableScreen extends StatefulWidget {
  @override
  _NutritionTableScreenState createState() => _NutritionTableScreenState();
}
/*
هنا هنعمل الكلاس ده و يكونStatefulWidget علشان هيكون فيه حاجات بتتغير جو ال page دي
و  هنعمل override  و نجيب private class  علشان نجيب ال state  بتاعت ال page  بتاعتنا
 */

class Dessert {
  final String name;
  final int calories;
  bool Selection;

  Dessert(this.name, this.calories, this.Selection);
}
/*
هنا انا عملت class علشان يكون جواه الداتا بتاعت ال desserts
الاسم و عدد السعرات و هل اخترنا الحاجه دي ولا لا و بعدين هباصي الكلام ده
لكونستراكور علشان نقدر نسختدمه
 */

class _NutritionTableScreenState extends State<NutritionTableScreen> {
  List<Dessert> desserts = [
    Dessert('Frozen yogurt', 159, false),
    Dessert('Ice cream sandwich', 237, false),
    Dessert('Eclair', 262, false),
    Dessert('Cupcake', 305, false),
    Dessert('Gingerbread', 356, false),
    Dessert('Jelly bean', 375, false),
    Dessert('Lollipop', 392, false),
    Dessert('Honeycomb', 408, false),
    Dessert('Donut', 452, false),
  ];
/*
هنا انا عندي ال private class و ده اللي بيجيب الحاله بتاعت ال page  بتاعتي
اول حاجه هنعمل ال list بتاعت الحلويات بتاعتنا و نباصي بالترتيب الاسم بعدين عدد السعرات بعدين
هنخليها في الاول false علشان مش طبيعي اول ما افتح ال app
نكون مختارين حاجه مثلا فخلينا ال initial value بتاعتهم ب false علشان احنا مش بنفتح نلاقي حاجات عشوائيه مختاره بس
 */
  int getTotalCalories() {
    return desserts
        .where((d) => d.Selection)
        .fold(0, (sum, item) => sum + item.calories);
  }
  /*
   هنا دي الfunction اللي بتشوف احنا اخترنا الحاجه ولا لا ول اخترانها بنعمل sum  لل كان موجود + الايتم اللي تم اختياره
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data tables'),// هنا ده البار اللي بيبقي فوق و بنخلي شكله كده و لون كده برضو
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(// هنا علشان الصفحه مكفتش و ميجبش ايرور ان الصفحه بتاعتي مش مكفيه فنقدر ننزل تحتو شويه
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                child: Text(
                  'Nutrition',// هنا علشان نحط الكلمه
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Card(// هنا علشان نعمل زي شادو لل كارد بتاعنا و يكون في table
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                child: DataTable(// من هنا بقي هنبدء نرص  الداتا بتاعتنا عن طريق ال columns  و ال rows
                  headingRowColor: .all(Colors.grey[100]),
                  columns: [
                    DataColumn(// عمود الاسم
                        label: Text('Dessert (100g)',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(// عمود السعرات
                        label: Text('Calories',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        numeric: true),
                  ],
                  rows: desserts.map((dessert) {
                    return DataRow(// نوزع بقي هنا الداتا بتاعتنا علشان تبقي علي شكل صفوف و نحدد هل احنا اخترنا الحاجه دي ولا لا
                      // لو اخترنا الحاجه دي ترجع ترو فنقدر نحسبها في الفانكشن اللي اسمها getTotalCalories()
                      selected: dessert.Selection,
                      onSelectChanged: (bool? selected) {
                        setState(() {
                          dessert.Selection = selected ?? false;
                        });
                      },
                      cells: [// خانه علشان الاسم بتاع الحاجه و خانه علشان عدد السعرات
                        DataCell(Text(dessert.name)),
                        DataCell(Text(dessert.calories.toString())),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),
              Container(// دي بقي علشان نعمل شكل المربع اللي تحت اللي جواه الحسبه بتاعت ال total calories
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Calories:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    Text(
                      "${getTotalCalories()}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}