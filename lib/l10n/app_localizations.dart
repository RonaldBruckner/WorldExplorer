import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @location_permission_required.
  ///
  /// In en, this message translates to:
  /// **'Location Permission Required'**
  String get location_permission_required;

  /// No description provided for @location_permission_text.
  ///
  /// In en, this message translates to:
  /// **'To determine your country, the app needs access to your location.'**
  String get location_permission_text;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @internet_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Internet connection is unavailable.\\n'**
  String get internet_unavailable;

  /// No description provided for @gps_error.
  ///
  /// In en, this message translates to:
  /// **'GPS is not enabled or permission is missing.'**
  String get gps_error;

  /// No description provided for @missing_requirements.
  ///
  /// In en, this message translates to:
  /// **'Can\'t Start the Adventure Yet!'**
  String get missing_requirements;

  /// No description provided for @getting_gps_location.
  ///
  /// In en, this message translates to:
  /// **'Getting GPS location...'**
  String get getting_gps_location;

  /// No description provided for @loading_country_info.
  ///
  /// In en, this message translates to:
  /// **'Loading country info...'**
  String get loading_country_info;

  /// No description provided for @current_location.
  ///
  /// In en, this message translates to:
  /// **'Your Current Location'**
  String get current_location;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @country_ar.
  ///
  /// In en, this message translates to:
  /// **'Argentina'**
  String get country_ar;

  /// No description provided for @country_au.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get country_au;

  /// No description provided for @country_at.
  ///
  /// In en, this message translates to:
  /// **'Austria'**
  String get country_at;

  /// No description provided for @country_be.
  ///
  /// In en, this message translates to:
  /// **'Belgium'**
  String get country_be;

  /// No description provided for @country_br.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get country_br;

  /// No description provided for @country_ca.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get country_ca;

  /// No description provided for @country_cn.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get country_cn;

  /// No description provided for @country_dk.
  ///
  /// In en, this message translates to:
  /// **'Denmark'**
  String get country_dk;

  /// No description provided for @country_fi.
  ///
  /// In en, this message translates to:
  /// **'Finland'**
  String get country_fi;

  /// No description provided for @country_fr.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get country_fr;

  /// No description provided for @country_de.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get country_de;

  /// No description provided for @country_gr.
  ///
  /// In en, this message translates to:
  /// **'Greece'**
  String get country_gr;

  /// No description provided for @country_in.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get country_in;

  /// No description provided for @country_ie.
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get country_ie;

  /// No description provided for @country_it.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get country_it;

  /// No description provided for @country_jp.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get country_jp;

  /// No description provided for @country_mx.
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get country_mx;

  /// No description provided for @country_nl.
  ///
  /// In en, this message translates to:
  /// **'Netherlands'**
  String get country_nl;

  /// No description provided for @country_nz.
  ///
  /// In en, this message translates to:
  /// **'New Zealand'**
  String get country_nz;

  /// No description provided for @country_no.
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get country_no;

  /// No description provided for @country_pl.
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get country_pl;

  /// No description provided for @country_ru.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get country_ru;

  /// No description provided for @country_za.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get country_za;

  /// No description provided for @country_kr.
  ///
  /// In en, this message translates to:
  /// **'South Korea'**
  String get country_kr;

  /// No description provided for @country_es.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get country_es;

  /// No description provided for @country_se.
  ///
  /// In en, this message translates to:
  /// **'Sweden'**
  String get country_se;

  /// No description provided for @country_ch.
  ///
  /// In en, this message translates to:
  /// **'Switzerland'**
  String get country_ch;

  /// No description provided for @country_tr.
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get country_tr;

  /// No description provided for @country_gb.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get country_gb;

  /// No description provided for @country_us.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get country_us;

  /// No description provided for @fact_ar.
  ///
  /// In en, this message translates to:
  /// **'Argentina is home to the tango and the world\'s widest avenue in Buenos Aires.'**
  String get fact_ar;

  /// No description provided for @fact_au.
  ///
  /// In en, this message translates to:
  /// **'Australia has more kangaroos than people and is home to the Great Barrier Reef.'**
  String get fact_au;

  /// No description provided for @fact_at.
  ///
  /// In en, this message translates to:
  /// **'Austria gave the world Mozart and has over 60% of its land covered by the Alps.'**
  String get fact_at;

  /// No description provided for @fact_be.
  ///
  /// In en, this message translates to:
  /// **'Belgium is known for its waffles, chocolates, and more castles per square mile than any other country.'**
  String get fact_be;

  /// No description provided for @fact_br.
  ///
  /// In en, this message translates to:
  /// **'Brazil is home to the Amazon Rainforest and the famous Christ the Redeemer statue.'**
  String get fact_br;

  /// No description provided for @fact_ca.
  ///
  /// In en, this message translates to:
  /// **'Canada has the longest coastline in the world and is known for maple syrup and ice hockey.'**
  String get fact_ca;

  /// No description provided for @fact_cn.
  ///
  /// In en, this message translates to:
  /// **'China is the world’s most populous country and home to the Great Wall, visible from space.'**
  String get fact_cn;

  /// No description provided for @fact_dk.
  ///
  /// In en, this message translates to:
  /// **'Denmark is one of the happiest countries and the birthplace of LEGO.'**
  String get fact_dk;

  /// No description provided for @fact_fi.
  ///
  /// In en, this message translates to:
  /// **'Finland has thousands of lakes and is famous for saunas and Northern Lights viewing.'**
  String get fact_fi;

  /// No description provided for @fact_fr.
  ///
  /// In en, this message translates to:
  /// **'France is the world’s most visited country and the Eiffel Tower sparkles every evening.'**
  String get fact_fr;

  /// No description provided for @fact_de.
  ///
  /// In en, this message translates to:
  /// **'Germany is known for its autobahns, beer culture, and as the birthplace of Beethoven.'**
  String get fact_de;

  /// No description provided for @fact_gr.
  ///
  /// In en, this message translates to:
  /// **'Greece is the cradle of Western civilization and home to ancient ruins like the Parthenon.'**
  String get fact_gr;

  /// No description provided for @fact_in.
  ///
  /// In en, this message translates to:
  /// **'India is the land of spices, yoga, and the majestic Taj Mahal.'**
  String get fact_in;

  /// No description provided for @fact_ie.
  ///
  /// In en, this message translates to:
  /// **'Ireland is known for lush landscapes, Celtic traditions, and being the birthplace of Guinness.'**
  String get fact_ie;

  /// No description provided for @fact_it.
  ///
  /// In en, this message translates to:
  /// **'Italy is famous for its food, fashion, and ancient landmarks like the Colosseum.'**
  String get fact_it;

  /// No description provided for @fact_jp.
  ///
  /// In en, this message translates to:
  /// **'Japan blends ancient temples with futuristic tech and is known for cherry blossoms.'**
  String get fact_jp;

  /// No description provided for @fact_mx.
  ///
  /// In en, this message translates to:
  /// **'Mexico is the birthplace of chocolate and home to vibrant Day of the Dead celebrations.'**
  String get fact_mx;

  /// No description provided for @fact_nl.
  ///
  /// In en, this message translates to:
  /// **'The Netherlands is known for windmills, tulips, and having more bikes than people.'**
  String get fact_nl;

  /// No description provided for @fact_nz.
  ///
  /// In en, this message translates to:
  /// **'New Zealand is the filming location of The Lord of the Rings and home to stunning fjords.'**
  String get fact_nz;

  /// No description provided for @fact_no.
  ///
  /// In en, this message translates to:
  /// **'Norway is famous for its dramatic fjords, midnight sun, and Viking history.'**
  String get fact_no;

  /// No description provided for @fact_pl.
  ///
  /// In en, this message translates to:
  /// **'Poland is home to Europe’s oldest restaurant and beautiful medieval cities like Kraków.'**
  String get fact_pl;

  /// No description provided for @fact_ru.
  ///
  /// In en, this message translates to:
  /// **'Russia spans 11 time zones and is home to the colorful Saint Basil\'s Cathedral.'**
  String get fact_ru;

  /// No description provided for @fact_za.
  ///
  /// In en, this message translates to:
  /// **'South Africa has three capital cities and is famous for safaris and Table Mountain.'**
  String get fact_za;

  /// No description provided for @fact_kr.
  ///
  /// In en, this message translates to:
  /// **'South Korea is a global tech hub known for K-pop, kimchi, and high-speed internet.'**
  String get fact_kr;

  /// No description provided for @fact_es.
  ///
  /// In en, this message translates to:
  /// **'Spain is known for flamenco dancing, siestas, and the running of the bulls.'**
  String get fact_es;

  /// No description provided for @fact_se.
  ///
  /// In en, this message translates to:
  /// **'Sweden is home to IKEA, ABBA, and some of the world’s most progressive social policies.'**
  String get fact_se;

  /// No description provided for @fact_ch.
  ///
  /// In en, this message translates to:
  /// **'Switzerland is famous for chocolate, watches, and having four official languages.'**
  String get fact_ch;

  /// No description provided for @fact_tr.
  ///
  /// In en, this message translates to:
  /// **'Turkey spans two continents and is home to ancient wonders like Hagia Sophia.'**
  String get fact_tr;

  /// No description provided for @fact_gb.
  ///
  /// In en, this message translates to:
  /// **'The UK gave the world Shakespeare, The Beatles, and the iconic red telephone box.'**
  String get fact_gb;

  /// No description provided for @fact_us.
  ///
  /// In en, this message translates to:
  /// **'The USA is incredibly diverse, home to Hollywood, Silicon Valley, and 63 national parks.'**
  String get fact_us;

  /// No description provided for @failed_to_load_forecast.
  ///
  /// In en, this message translates to:
  /// **'Failed to load forecast'**
  String get failed_to_load_forecast;

  /// No description provided for @failed_to_load_weather.
  ///
  /// In en, this message translates to:
  /// **'Failed to load weather'**
  String get failed_to_load_weather;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @detailed_forecast.
  ///
  /// In en, this message translates to:
  /// **'Forecast'**
  String get detailed_forecast;

  /// No description provided for @weather_clear_sky.
  ///
  /// In en, this message translates to:
  /// **'Clear sky'**
  String get weather_clear_sky;

  /// No description provided for @weather_few_clouds.
  ///
  /// In en, this message translates to:
  /// **'Few clouds'**
  String get weather_few_clouds;

  /// No description provided for @weather_scattered_clouds.
  ///
  /// In en, this message translates to:
  /// **'Scattered clouds'**
  String get weather_scattered_clouds;

  /// No description provided for @weather_broken_clouds.
  ///
  /// In en, this message translates to:
  /// **'Broken clouds'**
  String get weather_broken_clouds;

  /// No description provided for @weather_overcast_clouds.
  ///
  /// In en, this message translates to:
  /// **'Overcast clouds'**
  String get weather_overcast_clouds;

  /// No description provided for @weather_thunderstorm_with_light_rain.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm with light rain'**
  String get weather_thunderstorm_with_light_rain;

  /// No description provided for @weather_thunderstorm_with_rain.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm with rain'**
  String get weather_thunderstorm_with_rain;

  /// No description provided for @weather_thunderstorm_with_heavy_rain.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm with heavy rain'**
  String get weather_thunderstorm_with_heavy_rain;

  /// No description provided for @weather_light_thunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Light thunderstorm'**
  String get weather_light_thunderstorm;

  /// No description provided for @weather_thunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm'**
  String get weather_thunderstorm;

  /// No description provided for @weather_heavy_thunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Heavy thunderstorm'**
  String get weather_heavy_thunderstorm;

  /// No description provided for @weather_ragged_thunderstorm.
  ///
  /// In en, this message translates to:
  /// **'Ragged thunderstorm'**
  String get weather_ragged_thunderstorm;

  /// No description provided for @weather_thunderstorm_with_light_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm with light drizzle'**
  String get weather_thunderstorm_with_light_drizzle;

  /// No description provided for @weather_thunderstorm_with_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm with drizzle'**
  String get weather_thunderstorm_with_drizzle;

  /// No description provided for @weather_thunderstorm_with_heavy_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorm with heavy drizzle'**
  String get weather_thunderstorm_with_heavy_drizzle;

  /// No description provided for @weather_light_intensity_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Light intensity drizzle'**
  String get weather_light_intensity_drizzle;

  /// No description provided for @weather_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Drizzle'**
  String get weather_drizzle;

  /// No description provided for @weather_heavy_intensity_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Heavy intensity drizzle'**
  String get weather_heavy_intensity_drizzle;

  /// No description provided for @weather_light_intensity_drizzle_rain.
  ///
  /// In en, this message translates to:
  /// **'Light intensity drizzle rain'**
  String get weather_light_intensity_drizzle_rain;

  /// No description provided for @weather_drizzle_rain.
  ///
  /// In en, this message translates to:
  /// **'Drizzle rain'**
  String get weather_drizzle_rain;

  /// No description provided for @weather_heavy_intensity_drizzle_rain.
  ///
  /// In en, this message translates to:
  /// **'Heavy intensity drizzle rain'**
  String get weather_heavy_intensity_drizzle_rain;

  /// No description provided for @weather_shower_rain_and_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Shower rain and drizzle'**
  String get weather_shower_rain_and_drizzle;

  /// No description provided for @weather_heavy_shower_rain_and_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Heavy shower rain and drizzle'**
  String get weather_heavy_shower_rain_and_drizzle;

  /// No description provided for @weather_shower_drizzle.
  ///
  /// In en, this message translates to:
  /// **'Shower drizzle'**
  String get weather_shower_drizzle;

  /// No description provided for @weather_light_rain.
  ///
  /// In en, this message translates to:
  /// **'Light rain'**
  String get weather_light_rain;

  /// No description provided for @weather_moderate_rain.
  ///
  /// In en, this message translates to:
  /// **'Moderate rain'**
  String get weather_moderate_rain;

  /// No description provided for @weather_heavy_intensity_rain.
  ///
  /// In en, this message translates to:
  /// **'Heavy intensity rain'**
  String get weather_heavy_intensity_rain;

  /// No description provided for @weather_very_heavy_rain.
  ///
  /// In en, this message translates to:
  /// **'Very heavy rain'**
  String get weather_very_heavy_rain;

  /// No description provided for @weather_extreme_rain.
  ///
  /// In en, this message translates to:
  /// **'Extreme rain'**
  String get weather_extreme_rain;

  /// No description provided for @weather_freezing_rain.
  ///
  /// In en, this message translates to:
  /// **'Freezing rain'**
  String get weather_freezing_rain;

  /// No description provided for @weather_light_intensity_shower_rain.
  ///
  /// In en, this message translates to:
  /// **'Light intensity shower rain'**
  String get weather_light_intensity_shower_rain;

  /// No description provided for @weather_shower_rain.
  ///
  /// In en, this message translates to:
  /// **'Shower rain'**
  String get weather_shower_rain;

  /// No description provided for @weather_heavy_intensity_shower_rain.
  ///
  /// In en, this message translates to:
  /// **'Heavy intensity shower rain'**
  String get weather_heavy_intensity_shower_rain;

  /// No description provided for @weather_ragged_shower_rain.
  ///
  /// In en, this message translates to:
  /// **'Ragged shower rain'**
  String get weather_ragged_shower_rain;

  /// No description provided for @weather_light_snow.
  ///
  /// In en, this message translates to:
  /// **'Light snow'**
  String get weather_light_snow;

  /// No description provided for @weather_snow.
  ///
  /// In en, this message translates to:
  /// **'Snow'**
  String get weather_snow;

  /// No description provided for @weather_heavy_snow.
  ///
  /// In en, this message translates to:
  /// **'Heavy snow'**
  String get weather_heavy_snow;

  /// No description provided for @weather_sleet.
  ///
  /// In en, this message translates to:
  /// **'Sleet'**
  String get weather_sleet;

  /// No description provided for @weather_light_shower_sleet.
  ///
  /// In en, this message translates to:
  /// **'Light shower sleet'**
  String get weather_light_shower_sleet;

  /// No description provided for @weather_shower_sleet.
  ///
  /// In en, this message translates to:
  /// **'Shower sleet'**
  String get weather_shower_sleet;

  /// No description provided for @weather_light_rain_and_snow.
  ///
  /// In en, this message translates to:
  /// **'Light rain and snow'**
  String get weather_light_rain_and_snow;

  /// No description provided for @weather_rain_and_snow.
  ///
  /// In en, this message translates to:
  /// **'Rain and snow'**
  String get weather_rain_and_snow;

  /// No description provided for @weather_light_shower_snow.
  ///
  /// In en, this message translates to:
  /// **'Light shower snow'**
  String get weather_light_shower_snow;

  /// No description provided for @weather_shower_snow.
  ///
  /// In en, this message translates to:
  /// **'Shower snow'**
  String get weather_shower_snow;

  /// No description provided for @weather_heavy_shower_snow.
  ///
  /// In en, this message translates to:
  /// **'Heavy shower snow'**
  String get weather_heavy_shower_snow;

  /// No description provided for @weather_mist.
  ///
  /// In en, this message translates to:
  /// **'Mist'**
  String get weather_mist;

  /// No description provided for @weather_smoke.
  ///
  /// In en, this message translates to:
  /// **'Smoke'**
  String get weather_smoke;

  /// No description provided for @weather_haze.
  ///
  /// In en, this message translates to:
  /// **'Haze'**
  String get weather_haze;

  /// No description provided for @weather_sand_dust_whirls.
  ///
  /// In en, this message translates to:
  /// **'Sand/dust whirls'**
  String get weather_sand_dust_whirls;

  /// No description provided for @weather_fog.
  ///
  /// In en, this message translates to:
  /// **'Fog'**
  String get weather_fog;

  /// No description provided for @weather_sand.
  ///
  /// In en, this message translates to:
  /// **'Sand'**
  String get weather_sand;

  /// No description provided for @weather_dust.
  ///
  /// In en, this message translates to:
  /// **'Dust'**
  String get weather_dust;

  /// No description provided for @weather_volcanic_ash.
  ///
  /// In en, this message translates to:
  /// **'Volcanic ash'**
  String get weather_volcanic_ash;

  /// No description provided for @weather_squalls.
  ///
  /// In en, this message translates to:
  /// **'Squalls'**
  String get weather_squalls;

  /// No description provided for @weather_tornado.
  ///
  /// In en, this message translates to:
  /// **'Tornado'**
  String get weather_tornado;

  /// No description provided for @sunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get sunrise;

  /// No description provided for @sunset.
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get sunset;

  /// No description provided for @from_amount.
  ///
  /// In en, this message translates to:
  /// **'From amount'**
  String get from_amount;

  /// No description provided for @to_amount.
  ///
  /// In en, this message translates to:
  /// **'To amount'**
  String get to_amount;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @exchange_rate.
  ///
  /// In en, this message translates to:
  /// **'Exchange Rate'**
  String get exchange_rate;

  /// No description provided for @loading_exchange_rate.
  ///
  /// In en, this message translates to:
  /// **'Loading Exchange Rate...'**
  String get loading_exchange_rate;

  /// No description provided for @currency_aud.
  ///
  /// In en, this message translates to:
  /// **'Australian Dollar'**
  String get currency_aud;

  /// No description provided for @currency_bgn.
  ///
  /// In en, this message translates to:
  /// **'Bulgarian Lev'**
  String get currency_bgn;

  /// No description provided for @currency_brl.
  ///
  /// In en, this message translates to:
  /// **'Brazilian Real'**
  String get currency_brl;

  /// No description provided for @currency_cad.
  ///
  /// In en, this message translates to:
  /// **'Canadian Dollar'**
  String get currency_cad;

  /// No description provided for @currency_chf.
  ///
  /// In en, this message translates to:
  /// **'Swiss Franc'**
  String get currency_chf;

  /// No description provided for @currency_cny.
  ///
  /// In en, this message translates to:
  /// **'Chinese Renminbi Yuan'**
  String get currency_cny;

  /// No description provided for @currency_czk.
  ///
  /// In en, this message translates to:
  /// **'Czech Koruna'**
  String get currency_czk;

  /// No description provided for @currency_dkk.
  ///
  /// In en, this message translates to:
  /// **'Danish Krone'**
  String get currency_dkk;

  /// No description provided for @currency_eur.
  ///
  /// In en, this message translates to:
  /// **'Euro'**
  String get currency_eur;

  /// No description provided for @currency_gbp.
  ///
  /// In en, this message translates to:
  /// **'British Pound'**
  String get currency_gbp;

  /// No description provided for @currency_hkd.
  ///
  /// In en, this message translates to:
  /// **'Hong Kong Dollar'**
  String get currency_hkd;

  /// No description provided for @currency_huf.
  ///
  /// In en, this message translates to:
  /// **'Hungarian Forint'**
  String get currency_huf;

  /// No description provided for @currency_idr.
  ///
  /// In en, this message translates to:
  /// **'Indonesian Rupiah'**
  String get currency_idr;

  /// No description provided for @currency_ils.
  ///
  /// In en, this message translates to:
  /// **'Israeli New Sheqel'**
  String get currency_ils;

  /// No description provided for @currency_inr.
  ///
  /// In en, this message translates to:
  /// **'Indian Rupee'**
  String get currency_inr;

  /// No description provided for @currency_isk.
  ///
  /// In en, this message translates to:
  /// **'Icelandic Króna'**
  String get currency_isk;

  /// No description provided for @currency_jpy.
  ///
  /// In en, this message translates to:
  /// **'Japanese Yen'**
  String get currency_jpy;

  /// No description provided for @currency_krw.
  ///
  /// In en, this message translates to:
  /// **'South Korean Won'**
  String get currency_krw;

  /// No description provided for @currency_mxn.
  ///
  /// In en, this message translates to:
  /// **'Mexican Peso'**
  String get currency_mxn;

  /// No description provided for @currency_myr.
  ///
  /// In en, this message translates to:
  /// **'Malaysian Ringgit'**
  String get currency_myr;

  /// No description provided for @currency_nok.
  ///
  /// In en, this message translates to:
  /// **'Norwegian Krone'**
  String get currency_nok;

  /// No description provided for @currency_nzd.
  ///
  /// In en, this message translates to:
  /// **'New Zealand Dollar'**
  String get currency_nzd;

  /// No description provided for @currency_php.
  ///
  /// In en, this message translates to:
  /// **'Philippine Peso'**
  String get currency_php;

  /// No description provided for @currency_pln.
  ///
  /// In en, this message translates to:
  /// **'Polish Złoty'**
  String get currency_pln;

  /// No description provided for @currency_ron.
  ///
  /// In en, this message translates to:
  /// **'Romanian Leu'**
  String get currency_ron;

  /// No description provided for @currency_sek.
  ///
  /// In en, this message translates to:
  /// **'Swedish Krona'**
  String get currency_sek;

  /// No description provided for @currency_sgd.
  ///
  /// In en, this message translates to:
  /// **'Singapore Dollar'**
  String get currency_sgd;

  /// No description provided for @currency_thb.
  ///
  /// In en, this message translates to:
  /// **'Thai Baht'**
  String get currency_thb;

  /// No description provided for @currency_try.
  ///
  /// In en, this message translates to:
  /// **'Turkish Lira'**
  String get currency_try;

  /// No description provided for @currency_usd.
  ///
  /// In en, this message translates to:
  /// **'United States Dollar'**
  String get currency_usd;

  /// No description provided for @currency_zar.
  ///
  /// In en, this message translates to:
  /// **'South African Rand'**
  String get currency_zar;

  /// No description provided for @currency_data_not_available.
  ///
  /// In en, this message translates to:
  /// **'Currency data not available'**
  String get currency_data_not_available;

  /// No description provided for @police.
  ///
  /// In en, this message translates to:
  /// **'Police'**
  String get police;

  /// No description provided for @fire.
  ///
  /// In en, this message translates to:
  /// **'Fire'**
  String get fire;

  /// No description provided for @ambulance.
  ///
  /// In en, this message translates to:
  /// **'Ambulance'**
  String get ambulance;

  /// No description provided for @no_emergency_numbers_found_for.
  ///
  /// In en, this message translates to:
  /// **'No emergency numbers found for'**
  String get no_emergency_numbers_found_for;

  /// No description provided for @failed_to_load_local_emergency_numbers.
  ///
  /// In en, this message translates to:
  /// **'Failed to load local emergency numbers'**
  String get failed_to_load_local_emergency_numbers;

  /// No description provided for @confirm_call_title.
  ///
  /// In en, this message translates to:
  /// **'Call Emergency Number?'**
  String get confirm_call_title;

  /// No description provided for @confirm_call_text.
  ///
  /// In en, this message translates to:
  /// **'Do you want to call {number}?'**
  String confirm_call_text(Object number);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
