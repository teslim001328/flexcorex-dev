import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../themes/colors.dart';
import '../../themes/app_theme.dart';
import '../../utils/constants.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int? _age;
  double? _weight;
  double? _height;
  String? _goal;
  String? _dietType;
  String? _workoutLevel;
  String? _equipment;

  final List<String> goals = ['Lose Weight', 'Build Muscle', 'Stay Fit'];
  final List<String> dietTypes = ['Vegan', 'Vegetarian', 'Pescatarian', 'Keto', 'Paleo', 'None'];
  final List<String> workoutLevels = ['Beginner', 'Intermediate', 'Advanced'];
  final List<String> equipmentOptions = ['Home', 'Gym', 'Both', 'None'];

  bool get isLastPage => _currentPage == 2;
  bool get isFirstPage => _currentPage == 0;
  ];

  void _nextPage() {
    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _handleSubmit() {
    if (_validateAndSaveForm()) {
      isLastPage ? _saveData() : _nextPage();
  }

  void _saveData() {
    // Placeholder for saving data locally.
    print('Saving data...');
    print('Name: $_name');
    print('Age: $_age');
    print('Weight: $_weight');
    print('Height: $_height');
    print('Goal: $_goal');
    print('Diet Type: $_dietType');
    print('Workout Level: $_workoutLevel');
    print('Equipment: $_equipment');
    Navigator.pushReplacementNamed(context, homeRoute);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.richCharcoalGray,
      appBar: AppBar(
        backgroundColor: AppColors.richCharcoalGray,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.richCharcoalGray,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text('Welcome to Flexcorex',
            style: AppTheme.lightTextTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(

          key: _formKey,
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            children: [
              _buildNameAgeStep(),
              _buildFitnessStep(),
              _buildWorkoutStep(),
            ],

          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.offWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isFirstPage)
                ElevatedButton(
                  onPressed: _previousPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mutedRoseGold,
                  ),
                  child: Text('Previous', style: AppTheme.darkTextTheme.bodyMedium),
                ),
              ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkEmeraldGreen,
                ),
                child: Text(
                    isLastPage ? 'Finish' : 'Next',
                    style: AppTheme.darkTextTheme.bodyMedium),
              ),
            ],
          ),


        ),
      ),
    );
  }

  Widget _buildNameAgeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What\'s your name and age?',
            style: AppTheme.darkTextTheme.bodyLarge),
        const SizedBox(height: 20),
        TextFormField(
          style: TextStyle(color: AppColors.matteBlack),
          decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: AppColors.matteBlack),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.matteBlack)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.matteBlack)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: AppColors.offWhite,),
          validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
          onSaved: (value) => _name = value ?? '',
        ),
        const SizedBox(height: 20),
        TextFormField(
          style: TextStyle(color: AppColors.matteBlack),
          decoration: InputDecoration(
            labelText: 'Age',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.offWhite,),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          validator: (value) => value!.isEmpty ? 'Please enter your age' : null,
          onSaved: (value) => _age = int.tryParse(value!),
        ),
        const SizedBox(height: 20),
        TextFormField(
          style: TextStyle(color: AppColors.matteBlack),
          decoration: InputDecoration(
            labelText: 'Weight (kg)',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.offWhite,
          ),
          validator: (value) => value!.isEmpty ? 'Please enter your weight' : null,
          onSaved: (value) => _weight = double.tryParse(value!),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')), // Allow decimals
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          style: TextStyle(color: AppColors.matteBlack),
          decoration: InputDecoration(
            labelText: 'Height (cm)',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.offWhite,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          validator: (value) => value!.isEmpty ? 'Please enter your height' : null,
          onSaved: (value) => _height = double.tryParse(value!),
        ),
      ],
    );
  }

  Widget _buildFitnessStep() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What are your fitness goals and dietary preferences?',
              style: AppTheme.darkTextTheme.bodyLarge),
          const SizedBox(height: 20),
          _buildGoalDropdown(),
          const SizedBox(height: 20),
          _buildDietTypeDropdown(),
        ],
    );
  }


  Widget _buildGoalStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text('What are your goals?', style: AppTheme.darkTextTheme.bodyLarge),
        const SizedBox(height: 20),
        DropdownButtonFormField<String>(
          style: TextStyle(color: AppColors.matteBlack),
          dropdownColor: AppColors.offWhite,
          decoration: InputDecoration(
            labelText: 'Goal',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            filled: true,
          ),
          value: _goal,
          items: goals.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) { // Added onChanged callback
            setState(() {
              _goal = newValue;
            });
          },
          validator: (value) => value == null ? 'Please select a goal' : null,
          onSaved: (value) => _goal = value!,
        ),
      ],
    );
  }

  Widget _buildDietTypeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What\'s your diet type?', style: AppTheme.darkTextTheme.bodyLarge),
        const SizedBox(height: 20),
        DropdownButtonFormField<String>(
          style: TextStyle(color: AppColors.matteBlack),
          dropdownColor: AppColors.offWhite,
          decoration: InputDecoration(
            labelText: 'Diet Type',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
          ),
          value: _dietType,
          items: dietTypes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) { // Added onChanged callback
            setState(() {
              _dietType = newValue;
            });
          },
          validator: (value) => value == null ? 'Please select a diet type' : null,
          onSaved: (value) => _dietType = value!,
        ),
      ],
    );
  }

  Widget _buildWorkoutStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What\'s your workout level and equipment available?',
            style: AppTheme.darkTextTheme.bodyLarge),
        const SizedBox(height: 20),
        DropdownButtonFormField<String>(
          style: TextStyle(color: AppColors.matteBlack),
          dropdownColor: AppColors.offWhite,
          decoration: InputDecoration(
            labelText: 'Workout Level',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
          ),
          value: _workoutLevel,
          items: workoutLevels.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) { // Added onChanged callback
            setState(() {
              _workoutLevel = newValue;
            });
          },
          validator: (value) => value == null ? 'Please select a workout level' : null,
          onSaved: (value) => _workoutLevel = value!,
        ),
        SizedBox(height: 20),
        DropdownButtonFormField<String>( // Changed SizedBox to const SizedBox
          style: TextStyle(color: AppColors.matteBlack),
          dropdownColor: AppColors.offWhite,
          decoration: InputDecoration(
            labelText: 'Equipment Available',
            labelStyle: TextStyle(color: AppColors.matteBlack),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.matteBlack)),
          ),
          value: _equipment,
          items: equipmentOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) { // Added onChanged callback
            setState(() {
              _equipment = newValue;
            });
          },
          validator: (value) => value == null ? 'Please select equipment availability' : null,
          onSaved: (value) => _equipment = value!,
        ),
      ],
    );
  }

  Widget _buildGoalDropdown() {
    return DropdownButtonFormField<String>(
      style: TextStyle(color: AppColors.matteBlack),
      dropdownColor: AppColors.offWhite,
      decoration: InputDecoration(
          labelText: 'Fitness Goal',
          labelStyle: TextStyle(color: AppColors.matteBlack),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.matteBlack)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.matteBlack)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: AppColors.offWhite,
      ),
      value: _goal,
      items: goals.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) { // Added onChanged callback
        setState(() {
          _goal = newValue;
        });
      },
      validator: (value) => value == null ? 'Please select a fitness goal' : null,
      onSaved: (value) => _goal = value!,
    );
  }

  Widget _buildDietTypeDropdown() {
    return DropdownButtonFormField<String>(
      style: TextStyle(color: AppColors.matteBlack),
      dropdownColor: AppColors.offWhite,
      decoration: InputDecoration(
          labelText: 'Dietary Preference',
          labelStyle: TextStyle(color: AppColors.matteBlack),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.matteBlack)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.matteBlack)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: AppColors.offWhite,
      ),
      value: _dietType,
      items: dietTypes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) { // Added onChanged callback
        setState(() {
          _dietType = newValue;
        });
      },
      validator: (value) => value == null ? 'Please select a dietary preference' : null,
      onSaved: (value) => _dietType = value!,
    );
  }










}