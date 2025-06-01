import 'package:flutter/material.dart';

class Doctor {
  String name;
  String image;
  Color imageBox;
  List<String> specialties;
  double score;
  String bio;
  List<Calendar> calendar;
  List<Time> time;

  Doctor({
    required this.name,
    required this.image,
    required this.imageBox,
    required this.specialties,
    required this.score,
    required this.bio,
    required this.calendar,
    required this.time,
  });

  static List<Doctor> getDoctors() {
    List<Doctor> doctors = [];

    doctors.add(
      Doctor(
        name: 'Dr. Jenny Wilson',
        image: 'assets/images/img1.png',
        imageBox: const Color(0xffFFA340).withValues(alpha: .3),
        specialties: ['Dental Surgeon', 'Aesthetic Surgeon', 'General Dentist'],
        score: 4.8,
        bio:
            'Dr. Jenny Wilson (Implantologist),  is a Dentist in America, she has 20 years of experience.',
        calendar: [
          Calendar(dayNumber: 14, dayName: 'Sun', isSelected: false),
          Calendar(dayNumber: 15, dayName: 'Mon', isSelected: false),
          Calendar(dayNumber: 16, dayName: 'Tue', isSelected: true),
          Calendar(dayNumber: 17, dayName: 'Wed', isSelected: false),
        ],
        time: [
          Time(time: '09:00 AM', isSelected: true),
          Time(time: '11:00 AM', isSelected: false),
          Time(time: '03:00 PM', isSelected: false),
        ],
      ),
    );

    doctors.add(
      Doctor(
        name: 'Dr. Kristin Watson',
        image: 'assets/images/img2.png',
        imageBox: const Color(0xff3CFFC4).withValues(alpha: .3),
        specialties: ['Dental Surgeon', 'Aesthetic Surgeon', 'General Dentist'],
        score: 4.8,
        bio:
            'Dr. Kristin Watson (Implantologist),  is a Dentist in America, she has 20 years of experience.',
        calendar: [
          Calendar(dayNumber: 14, dayName: 'Sun', isSelected: false),
          Calendar(dayNumber: 15, dayName: 'Mon', isSelected: false),
          Calendar(dayNumber: 16, dayName: 'Tue', isSelected: true),
          Calendar(dayNumber: 17, dayName: 'Wed', isSelected: false),
        ],
        time: [
          Time(time: '09:00 AM', isSelected: true),
          Time(time: '11:00 AM', isSelected: false),
          Time(time: '03:00 PM', isSelected: false),
        ],
      ),
    );
    doctors.add(
      Doctor(
        name: 'Dr. Alice',
        image: 'assets/images/img1.png',
        imageBox: const Color(0xffFFA340).withValues(alpha: .3),
        specialties: [
          'Aesthetic Surgeon'
              'General Dentist',
        ],
        score: 4.8,
        bio:
            'Dr. Alice (Implantologist),  is a Dentist in America, she has 20 years of experience.',
        calendar: [
          Calendar(dayNumber: 14, dayName: 'Sun', isSelected: false),
          Calendar(dayNumber: 15, dayName: 'Mon', isSelected: false),
          Calendar(dayNumber: 16, dayName: 'Tue', isSelected: true),
          Calendar(dayNumber: 17, dayName: 'Wed', isSelected: false),
        ],
        time: [
          Time(time: '09:00 AM', isSelected: true),
          Time(time: '11:00 AM', isSelected: false),
          Time(time: '03:00 PM', isSelected: false),
        ],
      ),
    );

    doctors.add(
      Doctor(
        name: 'Dr. May',
        image: 'assets/images/img2.png',
        imageBox: const Color(0xff3CFFC4).withValues(alpha: .3),
        specialties: ['Dental Surgeon', 'Aesthetic Surgeon', 'General Dentist'],
        score: 4.8,
        bio:
            'Dr. May (Implantologist),  is a Dentist in America, she has 20 years of experience.',
        calendar: [
          Calendar(dayNumber: 14, dayName: 'Sun', isSelected: false),
          Calendar(dayNumber: 15, dayName: 'Mon', isSelected: false),
          Calendar(dayNumber: 16, dayName: 'Tue', isSelected: true),
          Calendar(dayNumber: 17, dayName: 'Wed', isSelected: false),
        ],
        time: [
          Time(time: '09:00 AM', isSelected: true),
          Time(time: '11:00 AM', isSelected: false),
          Time(time: '03:00 PM', isSelected: false),
        ],
      ),
    );

    return doctors;
  }
}

class Calendar {
  final int dayNumber;
  final String dayName;
  bool isSelected;

  Calendar({
    required this.dayName,
    required this.dayNumber,
    required this.isSelected,
  });
}

class Time {
  final String time;
  bool isSelected;

  Time({required this.time, required this.isSelected});
}
