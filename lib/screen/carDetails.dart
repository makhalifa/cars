import 'package:cars/model/rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../model/car.dart';

class CarDetailsScreen extends StatefulWidget {
  final String carId;

  const CarDetailsScreen({Key? key, required this.carId}) : super(key: key);

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  Car _car = Car(
    id: '',
    name: '',
    description: '',
    price: 0,
    images: [],
  );
  late List<dynamic> ratings = [Rating(id: '', comment: '', rate: '')];
  late double totalRating;

  @override
  void initState() {
    super.initState();
    _fetchCarDetails();
  }

  _fetchCarDetails() async {
    FirebaseFirestore.instance
        .collection('cars')
        .doc(widget.carId)
        .get()
        .then((car) => {
              setState(() {
                _car = Car(
                  id: car.id,
                  name: car['name'],
                  description: car['description'],
                  price: car['price'],
                  images: car['images'],
                );
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    if (_car.id == '') {
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
          title: Text(_car.name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(_car.images[0]),
              SizedBox(height: 16),
              Text(
                _car.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(_car.description),
              SizedBox(height: 16),
              Text(
                '\$${_car.price}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(ratings[0].rate),
              SizedBox(height: 16),
              Text(ratings[0].comment),
            ],
          ),
        ),
      );
    }
  }
}
