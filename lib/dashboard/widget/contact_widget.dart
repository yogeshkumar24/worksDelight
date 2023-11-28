import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.contact,
    required this.description,
  });

  final String contact;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contact,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 13),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(36), // Image radius
                  child: Image.network('https://picsum.photos/250?image=9',
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Abc',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Father Name'),
                  Text('878433993'),
                  Text('abc@gmail.com'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
