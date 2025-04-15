import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < 3) {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            steps: [
              Step(
                title: Text('Personal Information'),
                content: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Step(
                title: Text('Physical Details'),
                content: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Weight (kg)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your weight';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Height (cm)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your height';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Step(
                title: Text('Dietary Preferences'),
                content: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Dietary Preferences'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your dietary preferences';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Step(
                title: Text('Fitness Goals'),
                content: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Fitness Goals'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your fitness goals';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
