import 'package:event_book_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

import '../pages/bottomnav.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();

  List<String> eventTypes = [
    'Hackathon', 'Marathon', 'Concert', 'Food', 'Clothing', 'Book Fair'];
  String? selectedEventType;

  List<String> assetImages = [
    'images/event1.jpeg',
    'images/event2.jpg',
  ];
  String? selectedAssetImage;

  Future<void> selectAssetImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: assetImages.map((path) {
            return ListTile(
              leading: Image.asset(path, width: 40, height: 40, fit: BoxFit.cover),
              title: Text(path.split('/').last),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  selectedAssetImage = path;
                });
              },);
          }).toList(),
        );},);}

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 10, minute: 00);

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;

      });
    }
  }
  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    //convert TimeOfDay to DateTime
    final dateTime = DateTime(now.year, now.month, now.day, time.hour,time.minute);
    return DateFormat ('hh:mm.a').format(dateTime);
  }

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              GestureDetector(
                 onTap:(){
                  Navigator.pushAndRemoveUntil(
                   context,
                    MaterialPageRoute(builder: (context) => BottomNav()), // Navigate to BottomNav
                   (route) => false, // Removes all previous routes
                   );
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 4),
              Text(
                'Upload Event',
                style: TextStyle(
                  color: Color(0xff6351ec),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            SizedBox(height: 20),
            selectedAssetImage != null
                ? Image.asset(
              selectedAssetImage!,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            )
                : Center(
              child: GestureDetector(
                onTap: selectAssetImage,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              ' Event Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: namecontroller,
                style: TextStyle(
                  color: Color(0xff6351ec),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ticket Price',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: pricecontroller,
                style: TextStyle(
                  color: Color(0xff6351ec),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Price',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedEventType,
                  hint: Text(
                    'Select Event Type',
                    style: TextStyle(color: Color(0xff6351ec), fontWeight: FontWeight.w500),
                  ),
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: Color(0xff6351ec)),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedEventType = newValue;
                    });
                  },
                  items: eventTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(
                        type,
                        style: TextStyle(color: Color(0xff6351ec)),
                      ),);
                  }).toList(),
                ),),),

            SizedBox(height: 20),
            Row(children: [
              GestureDetector(
                onTap: (){
                  _pickDate();
                },
                child: Icon(Icons.calendar_month_outlined,
                    color: Colors.blue[400],size:30),
              ),
              SizedBox(width: 10,),
              Text(
                DateFormat('yyyy-MM-dd').format(selectedDate),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              SizedBox(width: 20),
              GestureDetector(
                onTap:(){
                 _pickTime();
                 },
                child: Icon(Icons.watch_later_outlined,
                    color: Colors.blue[400],size:30),),
              SizedBox(width: 10,),
              Text(
                formatTimeOfDay(selectedTime),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),)
            ],),

            SizedBox(height: 17),
            Text(
              'Event Detail',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: detailcontroller,
                maxLines: 6,
                style: TextStyle(
                  color: Color(0xff6351ec),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'What will be on that event....',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                String id = randomAlphaNumeric(10);

                Map<String, dynamic> uploadevent = {
                  "Image": selectedAssetImage ?? '',
                  "Name": namecontroller.text,
                  "Price": pricecontroller.text,
                  "Detail": detailcontroller.text,
                  "Date":  DateFormat('yyyy-MM-dd').format(selectedDate),
                  "Time":formatTimeOfDay(selectedTime),
                };

                await DatabaseMethods().addEvent(uploadevent, id).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Event Uploaded Successfully!!!",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );

                  setState(() {
                    namecontroller.text = "";
                    pricecontroller.text = "";
                    detailcontroller.text = "";
                    selectedAssetImage = null;
                    selectedEventType = null;
                  });
                });
              },
              child: Center(
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xff6351ec),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Upload',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UploadEvent extends StatefulWidget {
//   const UploadEvent({super.key});
//
//   @override
//   State<UploadEvent> createState() => _UploadEventState();
// }
//
// class _UploadEventState extends State<UploadEvent> {
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController pricecontroller = TextEditingController();
//   TextEditingController detailcontroller = TextEditingController();
//   List<String> eventTypes = ['Hackathon', 'Marathon', 'Concert', 'Food', 'Clothing', 'Book Fair'];
//   String? selectedEventType;
//
//   // Asset image selection
//   List<String> assetImages = [
//     'images/event1.jpeg',
//     'images/event2.jpg',
//   ];
//   String? selectedImagePath;
//
//   Future<void> selectAssetImage() async {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return ListView(
//           shrinkWrap: true,
//           children: assetImages.map((path) {
//             return ListTile(
//               leading: Image.asset(path, width: 40, height: 40, fit: BoxFit.cover),
//               title: Text(path.split('/').last),
//               onTap: () {
//                 Navigator.pop(context);
//                 setState(() {
//                   selectedImagePath = path;
//                 });
//               },
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
//
//   Future<void> uploadEvent() async {
//     if (selectedImagePath == null ||
//         namecontroller.text.isEmpty ||
//         pricecontroller.text.isEmpty ||
//         selectedEventType == null ||
//         detailcontroller.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields and select an image")));
//       return;
//     }
//
//     // Upload to Firebase Firestore
//     await FirebaseFirestore.instance.collection('events').add({
//       'name': namecontroller.text.trim(),
//       'price': double.tryParse(pricecontroller.text.trim()) ?? 0,
//       'category': selectedEventType,
//       'details': detailcontroller.text.trim(),
//       'imageUrl': selectedImagePath,
//       'timestamp': Timestamp.now(),
//     });
//
//     // Reset the form
//     setState(() {
//       namecontroller.clear();
//       pricecontroller.clear();
//       detailcontroller.clear();
//       selectedEventType = null;
//       selectedImagePath = null;
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("✅ Event successfully uploaded!")));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 40, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
//               ),
//               SizedBox(width: MediaQuery.of(context).size.width / 4),
//               Text(
//                 'Upload Event',
//                 style: TextStyle(
//                   color: Color(0xff6351ec),
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ]),
//             SizedBox(height: 20),
//
//             selectedImagePath != null
//                 ? Image.asset(selectedImagePath!, height: 120, width: 120)
//                 : Center(
//               child: GestureDetector(
//                 onTap: selectAssetImage,
//                 child: Container(
//                   height: 120,
//                   width: 120,
//                   decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Icon(Icons.camera_alt_outlined, color: Colors.black),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//
//             labelText('Event Name'),
//             inputField(namecontroller, 'Enter your name'),
//             SizedBox(height: 20),
//
//             labelText('Ticket Price'),
//             inputField(pricecontroller, 'Enter Price'),
//             SizedBox(height: 20),
//
//             labelText('Select Category'),
//             Container(
//               margin: EdgeInsets.only(right: 20),
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                 color: Color(0xffececf8),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: selectedEventType,
//                   hint: Text('Select Event Type', style: TextStyle(color: Color(0xff6351ec), fontWeight: FontWeight.w500)),
//                   isExpanded: true,
//                   icon: Icon(Icons.arrow_drop_down, color: Color(0xff6351ec)),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedEventType = value;
//                     });
//                   },
//                   items: eventTypes.map((String type) {
//                     return DropdownMenuItem<String>(
//                       value: type,
//                       child: Text(type, style: TextStyle(color: Color(0xff6351ec))),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             labelText('Event Detail'),
//             inputField(detailcontroller, 'What will be on that event....', maxLines: 6),
//             SizedBox(height: 20),
//
//             Center(
//               child: GestureDetector(
//                 onTap: uploadEvent,
//                 child: Container(
//                   width: 150,
//                   margin: EdgeInsets.only(right: 20),
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Color(0xff6351ec),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     'Upload',
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget labelText(String text) => Text(
//     text,
//     style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
//   );
//
//   Widget inputField(TextEditingController controller, String hint, {int maxLines = 1}) {
//     return Container(
//       margin: EdgeInsets.only(right: 20),
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
//       child: TextField(
//         controller: controller,
//         maxLines: maxLines,
//         style: TextStyle(color: Color(0xff6351ec), fontWeight: FontWeight.w500),
//         decoration: InputDecoration(
//           hintText: hint,
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.all(12),
//         ),
//       ),
//     );
//   }
// }
