import 'package:flutter/material.dart';
import 'package:itq_utils/itq_utils.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'About App',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          30.height,
          const Text(
            "Last Update 17/11/2024",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          16.height,
          const Text(
            "LLörem ipsum decisade gasm. Kan geon medan teleligt vidosam. Agnostiism peren i plasest. Nigt trir. Kringmyndighet tredade doning,",
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
          30.height,
          const Text(
            "About App",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          16.height,
          const Text(
            "Lörem ipsum decisade gasm. Kan geon medan teleligt vidosam. Agnostiism peren i plasest. Nigt trir. Kringmyndighet tredade doning, irade när. Ber kosläpp. Vuvuzela beras om intrabäras. Mäbälig ede och ileck spektigt. Disa spepp asktåg vak tigt. Nänehet gagusk.",
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
        ]),
      ),
    );
  }
}
