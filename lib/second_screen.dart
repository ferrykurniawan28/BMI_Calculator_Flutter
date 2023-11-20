import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.finalScore, required this.gender, super.key});
  final double finalScore;
  final int gender;

  @override
  Widget build(BuildContext context) {
    String indicator = '';
    List<String> message = [];
    if (gender == 2) {
      switch (finalScore) {
        case < 17:
          indicator = 'Underweight';
          break;
        case > 17 && < 23:
          indicator = 'Normal';
          break;
        case > 23 && < 27:
          indicator = 'Overweight';
          break;
        case > 27:
          indicator = 'Obese';
          break;
        default:
          indicator = 'invalid';
          break;
      }
    } else {
      switch (finalScore) {
        case < 18:
          indicator = 'Underweight';
          break;
        case > 18 && < 25:
          indicator = 'Normal';
          break;
        case > 25 && < 27:
          indicator = 'Overweight';
          break;
        case > 27:
          indicator = 'Obese';
          break;
        default:
          indicator = 'invalid';
          break;
      }
    }

    switch (indicator) {
      case 'Underweight':
        message = [
          'Remember, you are not alone. There are many people who are underweight and working to gain weight.',
          "Your health is your wealth. If you're underweight, focus on nourishing your body with nutritious foods and consult a healthcare professional for a personalized plan.",
          'Being underweight can affect your energy and immune system. Prioritize healthy eating and consult a doctor or dietitian for guidance.',
          "You deserve to feel your best. If you're underweight, make self-care a priority and work on gaining a healthy weight through proper nutrition and support.",
          "Your body needs love and nourishment. If you're underweight, take small steps towards a balanced diet and consult a professional to ensure you're on the right path."
        ];
        break;
      case 'Normal':
        message = [
          'Congratulations! You are at a healthy weight.',
          'Maintaining a healthy weight is a great achievement! Continue to make wise food choices and stay active for a long, happy life.',
          'Your balanced lifestyle is paying off. Keep up the good work with your healthy habits for a brighter future.',
          "You're in the healthy zone! A balanced diet and regular exercise are your secret to a life filled with vitality",
          'Your body thanks you for taking good care of it. Keep up your healthy habits to enjoy all that life has to offer.'
        ];
        break;
      case 'Overweight':
        message = [
          'Remember, you are not alone. There are many people who are overweight and working to lose weight.',
          'Your health is worth the effort. Start making healthier choices today to manage your weight and improve your overall well-being.',
          'Embrace change and watch your health transform. Begin your journey to a healthier weight with positive choices and support.',
          'You have the power to make a difference. Prioritize your health by adopting a balanced diet and an active lifestyle.',
          "Your body is your temple. It's never too late to start working on a healthier you. Small steps can lead to significant improvements."
        ];
        break;
      case 'Obese':
        message = [
          'Talk to your doctor or a registered dietitian about how to lose weight safely and healthily.',
          'Your health is your most valuable asset. Take the first step toward a healthier future by seeking professional help to manage your weight.',
          "Don't lose hope. With determination and support, you can take control of your health and work towards a healthier weight.",
          'Your well-being is worth the effort. Consult healthcare professionals and begin your journey to a healthier weight for a brighter future.',
          'You have the strength to make a change. Reach out to healthcare experts, and together, you can work on improving your health and achieving a healthier weight.'
        ];
        break;
    }

    var pickMessage = (message..shuffle()).first;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'B.M.I. Calculator',
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.blue[100],
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SizedBox(
                  width: 370,
                  child: Text(
                    'Result',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.blue[100],
                child: SizedBox(
                  height: 350,
                  width: 370,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        indicator,
                        style: GoogleFonts.lato(
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            finalScore.toStringAsFixed(1),
                            style: GoogleFonts.lato(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'kg/m2',
                            style: GoogleFonts.lato(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        pickMessage,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: 340,
                child: Text(
                  'Recalculate',
                  style: GoogleFonts.lato(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
