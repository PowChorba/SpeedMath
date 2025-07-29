import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:target_speed_737/main.dart';
import 'package:target_speed_737/src/presentation/pages/ads/ad_helper.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/error_dialog.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/number_input.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/options.dart';
import 'package:target_speed_737/src/presentation/pages/home/component/select_input.dart';
import 'package:target_speed_737/src/presentation/pages/results/component/max_flap.dart';
import 'package:target_speed_737/src/presentation/pages/results/component/vref.dart';

final _formKey = GlobalKey<FormState>();

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> with RouteAware {
  String selected = '-700';
  String flap = 'Flap 30';
  TextEditingController weight = TextEditingController();
  TextEditingController runwayHeading = TextEditingController();
  TextEditingController windDirection = TextEditingController();
  TextEditingController windIntesity = TextEditingController();
  TextEditingController gustIntesity = TextEditingController();
  bool _buttonDisabled = true;

  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();

    // Agregar listeners a los controladores para actualizar el estado del botón
    weight.addListener(changedButton);
    runwayHeading.addListener(changedButton);
    windDirection.addListener(changedButton);
    windIntesity.addListener(changedButton);
    gustIntesity.addListener(changedButton);

    InterstitialAd.load(
        // adUnitId: 'ca-app-pub-3940256099942544/4411468910',
        adUnitId: AdHelper.fullScreenAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {});
          setState(() {
            _interstitialAd = ad;
          });
        }, onAdFailedToLoad: (err) {
          print(err);
        }));
  }

  void changeFlap(String? value) {
    setState(() {
      flap = value!;
    });
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.fullScreenAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd = null;
        },
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _interstitialAd?.dispose();
    weight.dispose();
    runwayHeading.dispose();
    windDirection.dispose();
    windIntesity.dispose();
    gustIntesity.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when user navigates back to this screen
    _loadInterstitialAd(); // Re-load ad here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    _loadInterstitialAd(); // Initial load
  }

  void changedButton() {
    setState(() {
      if (weight.text.isNotEmpty &&
          runwayHeading.text.isNotEmpty &&
          windDirection.text.isNotEmpty &&
          windIntesity.text.isNotEmpty &&
          gustIntesity.text.isNotEmpty) {
        _buttonDisabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void _navigateToResults() {
      Navigator.pushNamed(context, 'results', arguments: {
        'selectedItem': selected,
        'flap': flap,
        'weight': weight.text,
        'runwayHeading': runwayHeading.text,
        'windDirection': windDirection.text,
        'windIntesity': windIntesity.text,
        'gustIntesity': gustIntesity.text,
        'maxFlapPlacard': maxFlapcard[selected]![flap],
      });
    }

    return Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = '-700';
                            });
                          },
                          child: Options(text: '-700', selectVal: selected)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = '-800';
                          });
                        },
                        child: Options(text: '-800', selectVal: selected),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'MAX 8';
                          });
                        },
                        child: Options(text: 'MAX 8', selectVal: selected),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'MAX 9';
                          });
                        },
                        child: Options(text: 'MAX 9', selectVal: selected),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectInput(changeFlap: changeFlap),
                  const SizedBox(
                    height: 30,
                  ),
                  NumberInput(
                    controller: weight,
                    labelText: 'K lbs',
                    title: 'Landing Weight',
                    validator: (context) {
                      if (int.parse(context!) > 180 && selected == '-700') {
                        return 'The value must be less than 180';
                      } else if (int.parse(context) > 200 &&
                          selected != '-700') {
                        return 'The value must be less than 200';
                      } else if (int.parse(context) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: runwayHeading,
                    labelText: 'Degrees(º)',
                    title: 'Runway Heading',
                    validator: (value) {
                      if (int.parse(value!) > 360) {
                        return 'The value must be less than 360';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: windDirection,
                    labelText: 'Knots (kt)',
                    title: 'Wind Direction',
                    validator: (value) {
                      if (int.parse(value!) > 360) {
                        return 'The value must be less than 360';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: windIntesity,
                    labelText: 'Knots (kt)',
                    title: 'Wind Intensity',
                    validator: (value) {
                      if (int.parse(value!) > 100) {
                        return 'The value must be less than 100';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  NumberInput(
                    controller: gustIntesity,
                    labelText: 'Knots (kt)',
                    title: 'Gust Intensity',
                    validator: (value) {
                      if (int.parse(value!) > 100) {
                        return 'The value must be less than 100';
                      } else if (int.parse(value) < 0) {
                        return 'The value must be greater than 0';
                      } else if ((int.parse(value) <
                              int.parse(windIntesity.text)) &&
                          int.parse(value) != 0) {
                        return "Gust intenstiy can't be smaller than Wind intesity";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _interstitialAd?.show();
                        final validate = _formKey.currentState!.validate();
                        changedButton();

                        if (validate && !_buttonDisabled) {
                          if (_interstitialAd != null) {
                            _interstitialAd!.fullScreenContentCallback =
                                FullScreenContentCallback(
                              onAdDismissedFullScreenContent: (ad) {
                                ad.dispose();
                                _navigateToResults();
                              },
                              onAdFailedToShowFullScreenContent: (ad, error) {
                                ad.dispose();
                                _navigateToResults();
                              },
                            );

                            _interstitialAd!.show();
                            _interstitialAd = null;
                          } else {
                            _navigateToResults();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: !_buttonDisabled
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary),
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  // @override
  // void dispose() {
  //   // Limpiar los controladores
  //   weight.dispose();
  //   runwayHeading.dispose();
  //   windDirection.dispose();
  //   windIntesity.dispose();
  //   gustIntesity.dispose();
  //   super.dispose();
  // }
}
