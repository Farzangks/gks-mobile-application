import 'package:flutter/material.dart';


class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController location = TextEditingController();



  @override
  Widget build(BuildContext context) {
    name.text = 'John Doe';
    mail.text = 'johndoe@gmail.com';
    number.text = '978546132086743';
    location.text = 'Budhapara raipur (C.g.)';
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: BoxShadow.lerpList(
                    [
                      const BoxShadow(color: Colors.white, blurRadius: 10.0),
                    ],
                    [
                      const BoxShadow(color: Colors.grey, blurRadius: 20.0),
                    ],
                    .5,
                  ),
                  color: Colors.white,
                ),
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
          ),
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile image
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://www.w3schools.com/howto/img_avatar.png'), // Replace with user's profile image
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: const Color(0xFFB0E057),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField('Name',name),
                const SizedBox(height: 16),
                _buildTextField('Mail',mail),
                const SizedBox(height: 16),
                _buildTextField('Number',number),
                const SizedBox(height: 16),
                _buildTextField('Location',location),
                const SizedBox(height: 16),
                // Email TextField
               
                const SizedBox(height: 30),
                // Update Button
                ElevatedButton(
                  onPressed: () {
                    // Handle update button press
                  },
                  style: ElevatedButton.styleFrom(elevation: 20,shadowColor:const Color(0xFFB0E057),
                    backgroundColor: const Color(0xFFB0E057), // Button color
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTextField(String label,TextEditingController controller) {
    return  Container(
      decoration:
      BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFB0E057)),
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: const TextStyle(fontSize: 14,color:  Color(0xFFB0E057),fontWeight: FontWeight.bold),),
             TextField(controller: controller,
              decoration: const InputDecoration(border:InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
