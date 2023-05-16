import 'package:cars/service/storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

import '../model/car.dart';
import 'carDetails.dart';

final storage = FirebaseStorage.instance;

// Create a storage reference from our app
final storageRef = storage.ref();

class CarListScreen extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  List<Car> _cars = [];
  List<String> _images = [];
  List cars = [
    {
      "id": '1',
      "name": 'Honda Civic',
      "description": 'A reliable car for everyday use',
      "imageUrl": 'https://loremflickr.com/640/480/transport',
      "price": 25000,
      "imagePath":[
        "cars/1.jpeg",
        "cars/11.png",
      ],
      "images":[]
    },
    {
      "id": '2',
      "name": 'Toyota Camry',
      "description": 'A spacious and comfortable sedan',
      "imageUrl": 'https://loremflickr.com/640/480/transport',
      "price": 30000,
      "imagePath":[
        "cars/2.jpeg",
        "cars/22.jpg",
      ],
      "images":[]
    },
    {
      "id": '3',
      "name": 'Nissan Altima',
      "description": 'A fuel-efficient car with modern features',
      "imageUrl": 'https://loremflickr.com/640/480/transport',
      "price": 28000,
      "imagePath":[
        "cars/3.jpeg",
        "cars/33.jpg",
      ],
      "images":[]
    },
  ];

  @override
  void initState() {
    super.initState();
    // _uploadCars();
    _fetchCars();
  }

  _uploadCars(){
    cars.forEach((car) async {
      await FirebaseFirestore.instance.collection('cars').doc(car['id']).set(car);

    });
  }

  _fetchCars() async {
    // fetch Cars
    QuerySnapshot cars_col_snapshot =
        await FirebaseFirestore.instance.collection('cars').get();

    // Sotrage

    // cars_col_snapshot.docs.forEach((doc) async {
    //   List images = [];
    //   doc['imagePath'].map((image) async {

    //     String newimg = image.split('/')[1];
    //     String url = await storageRef.child('cars').child("${newimg}").getDownloadURL();
    //     print(url);
    //     FirebaseFirestore.instance.collection('cars').doc(doc.id)
    //         .update({'images': FieldValue.arrayUnion([url])});
    //   }).toList();
    // });
    // String url =await storageRef.child('cars').child("2.jpeg").getDownloadURL();
    // print(url);

    // list result of storage
    // ListResult result = await storageRef.child('cars').listAll();
    // print(result.items);

    setState(() {
      // cars_col_snapshot.docs.forEach((doc) async {
      //   List images = [];
      //   doc['imagesPath'].map((image) async {
      //     String url = await storageRef.child("${image}").getDownloadURL();
      //     images.add(url);
      //   }).toList();

      //   await FirebaseFirestore.instance
      //       .collection('cars')
      //       .doc(doc.id)
      //       .set({'images': images});
      // });

      _cars = cars_col_snapshot.docs
          .map((doc) => Car(
                id: doc.id,
                name: doc['name'],
                description: doc['description'],
                images: doc['images'],
                price: doc['price'],
              ))
          .toList();

      // _cars = [
      //   Car(
      //     id: '1',
      //     name: 'Honda Civic',
      //     description: 'A reliable car for everyday use',
      //     imageUrl: 'https://loremflickr.com/640/480/transport',
      //     price: 25000,
      //   ),
      //   Car(
      //     id: '2',
      //     name: 'Toyota Camry',
      //     description: 'A spacious and comfortable sedan',
      //     imageUrl: 'https://loremflickr.com/640/480/transport',
      //     price: 30000,
      //   ),
      //   Car(
      //     id: '3',
      //     name: 'Nissan Altima',
      //     description: 'A fuel-efficient car with modern features',
      //     imageUrl: 'https://loremflickr.com/640/480/transport',
      //     price: 28000,
      //   ),
      // ];
    });
  }

  _fetchImages() async {}

  @override
  Widget build(BuildContext context) {
    if (_cars.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cars'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cars'),
        ),
        body: ListView.builder(
          itemCount: _cars.length,
          itemBuilder: (BuildContext context, int index) {
            final car = _cars[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailsScreen(carId:car.id),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(car.images[0]),
                    SizedBox(height: 8),
                    Text(
                      car.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(car.description),
                    SizedBox(height: 8),
                    Text(
                      '\$${car.price}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
