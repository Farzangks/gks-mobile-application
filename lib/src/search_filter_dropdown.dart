import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:itq_utils/itq_utils.dart';

class SearchFilterDropdown extends StatefulWidget {
  SearchFilterDropdown({super.key});

  @override
  State<SearchFilterDropdown> createState() => _SearchFilterDropdownState();
}

class _SearchFilterDropdownState extends State<SearchFilterDropdown> {
  final email = TextEditingController();

  final compUniqueId = TextEditingController();

  final password = TextEditingController();

  final forgotEdtEmail = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _currentUser;

  String _selectedOption = 'Relevance';
  final List<String> _options = [
    'Relevance',
    'Popularity',
    'Price: Low to high',
    'Price: High to low',
  ];


  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.disconnect();
  }


  // final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight()* 0.6,
      decoration: boxDecorationWithRoundedCorners(
        border: const Border.symmetric(horizontal: BorderSide(color: AppColors.onBoardingBgColors,width: 3,)),
        backgroundColor: context.cardColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  35.height,
                  Text("Sort By",
                      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22) ),
                  35.height,
                  Divider(),
                  const SizedBox(height: 12),
                  ..._options.map((option) => _buildOptionTile(option)),

                  // const SortByDropdown()
                ]),
          )),
    );
  }
  Widget _buildOptionTile(String option) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = option;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option,style: TextStyle(fontSize: 20),),
            _selectedOption == option?
              const Icon(Icons.circle_outlined, color: Colors.green):const Icon(Icons.circle_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
