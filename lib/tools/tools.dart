import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';


class Tools {
  static String localizedWeekday(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).toString(); // e.g. "de", "en_US"
    return DateFormat.E(locale).format(date);
  }

  static String localizedMonthAbbreviation(BuildContext context, int month) {
    final locale = Localizations.localeOf(context).toString();
    final date = DateTime(2000, month);
    return DateFormat.MMM(locale).format(date);
  }

  static String translateWeatherDescription(BuildContext context, String description) {
    final key = 'weather_' + description.toLowerCase().replaceAll(' ', '_');
    final localizations = AppLocalizations.of(context)!;

    final translations = {
      "weather_clear_sky": localizations.weather_clear_sky,
      "weather_few_clouds": localizations.weather_few_clouds,
      "weather_scattered_clouds": localizations.weather_scattered_clouds,
      "weather_broken_clouds": localizations.weather_broken_clouds,
      "weather_overcast_clouds": localizations.weather_overcast_clouds,

      "weather_thunderstorm_with_light_rain": localizations.weather_thunderstorm_with_light_rain,
      "weather_thunderstorm_with_rain": localizations.weather_thunderstorm_with_rain,
      "weather_thunderstorm_with_heavy_rain": localizations.weather_thunderstorm_with_heavy_rain,
      "weather_light_thunderstorm": localizations.weather_light_thunderstorm,
      "weather_thunderstorm": localizations.weather_thunderstorm,
      "weather_heavy_thunderstorm": localizations.weather_heavy_thunderstorm,
      "weather_ragged_thunderstorm": localizations.weather_ragged_thunderstorm,
      "weather_thunderstorm_with_light_drizzle": localizations.weather_thunderstorm_with_light_drizzle,
      "weather_thunderstorm_with_drizzle": localizations.weather_thunderstorm_with_drizzle,
      "weather_thunderstorm_with_heavy_drizzle": localizations.weather_thunderstorm_with_heavy_drizzle,

      "weather_light_intensity_drizzle": localizations.weather_light_intensity_drizzle,
      "weather_drizzle": localizations.weather_drizzle,
      "weather_heavy_intensity_drizzle": localizations.weather_heavy_intensity_drizzle,
      "weather_light_intensity_drizzle_rain": localizations.weather_light_intensity_drizzle_rain,
      "weather_drizzle_rain": localizations.weather_drizzle_rain,
      "weather_heavy_intensity_drizzle_rain": localizations.weather_heavy_intensity_drizzle_rain,
      "weather_shower_rain_and_drizzle": localizations.weather_shower_rain_and_drizzle,
      "weather_heavy_shower_rain_and_drizzle": localizations.weather_heavy_shower_rain_and_drizzle,
      "weather_shower_drizzle": localizations.weather_shower_drizzle,

      "weather_light_rain": localizations.weather_light_rain,
      "weather_moderate_rain": localizations.weather_moderate_rain,
      "weather_heavy_intensity_rain": localizations.weather_heavy_intensity_rain,
      "weather_very_heavy_rain": localizations.weather_very_heavy_rain,
      "weather_extreme_rain": localizations.weather_extreme_rain,
      "weather_freezing_rain": localizations.weather_freezing_rain,
      "weather_light_intensity_shower_rain": localizations.weather_light_intensity_shower_rain,
      "weather_shower_rain": localizations.weather_shower_rain,
      "weather_heavy_intensity_shower_rain": localizations.weather_heavy_intensity_shower_rain,
      "weather_ragged_shower_rain": localizations.weather_ragged_shower_rain,

      "weather_light_snow": localizations.weather_light_snow,
      "weather_snow": localizations.weather_snow,
      "weather_heavy_snow": localizations.weather_heavy_snow,
      "weather_sleet": localizations.weather_sleet,
      "weather_light_shower_sleet": localizations.weather_light_shower_sleet,
      "weather_shower_sleet": localizations.weather_shower_sleet,
      "weather_light_rain_and_snow": localizations.weather_light_rain_and_snow,
      "weather_rain_and_snow": localizations.weather_rain_and_snow,
      "weather_light_shower_snow": localizations.weather_light_shower_snow,
      "weather_shower_snow": localizations.weather_shower_snow,
      "weather_heavy_shower_snow": localizations.weather_heavy_shower_snow,

      "weather_mist": localizations.weather_mist,
      "weather_smoke": localizations.weather_smoke,
      "weather_haze": localizations.weather_haze,
      "weather_sand_dust_whirls": localizations.weather_sand_dust_whirls,
      "weather_fog": localizations.weather_fog,
      "weather_sand": localizations.weather_sand,
      "weather_dust": localizations.weather_dust,
      "weather_volcanic_ash": localizations.weather_volcanic_ash,
      "weather_squalls": localizations.weather_squalls,
      "weather_tornado": localizations.weather_tornado,
    };

    return translations[key] ?? description; // fallback to raw if not found
  }

  static String translateByKey(BuildContext context, String key, String fallback) {
    final localizations = AppLocalizations.of(context)!;

    final translations = {
      'country_ar': localizations.country_ar,
      'country_au': localizations.country_au,
      'country_at': localizations.country_at,
      'country_be': localizations.country_be,
      'country_br': localizations.country_br,
      'country_ca': localizations.country_ca,
      'country_cn': localizations.country_cn,
      'country_dk': localizations.country_dk,
      'country_fi': localizations.country_fi,
      'country_fr': localizations.country_fr,
      'country_de': localizations.country_de,
      'country_gr': localizations.country_gr,
      'country_in': localizations.country_in,
      'country_ie': localizations.country_ie,
      'country_it': localizations.country_it,
      'country_jp': localizations.country_jp,
      'country_mx': localizations.country_mx,
      'country_nl': localizations.country_nl,
      'country_nz': localizations.country_nz,
      'country_no': localizations.country_no,
      'country_pl': localizations.country_pl,
      'country_ru': localizations.country_ru,
      'country_za': localizations.country_za,
      'country_kr': localizations.country_kr,
      'country_es': localizations.country_es,
      'country_se': localizations.country_se,
      'country_ch': localizations.country_ch,
      'country_tr': localizations.country_tr,
      'country_gb': localizations.country_gb,
      'country_us': localizations.country_us,
    };

    return translations[key] ?? fallback;
  }

  static String translateCurrency(BuildContext context, String code) {
    final key = 'currency_${code.toLowerCase()}';
    final loc = AppLocalizations.of(context)!;

    final translations = {
      'currency_aud': loc.currency_aud,
      'currency_bgn': loc.currency_bgn,
      'currency_brl': loc.currency_brl,
      'currency_cad': loc.currency_cad,
      'currency_chf': loc.currency_chf,
      'currency_cny': loc.currency_cny,
      'currency_czk': loc.currency_czk,
      'currency_dkk': loc.currency_dkk,
      'currency_eur': loc.currency_eur,
      'currency_gbp': loc.currency_gbp,
      'currency_hkd': loc.currency_hkd,
      'currency_huf': loc.currency_huf,
      'currency_idr': loc.currency_idr,
      'currency_ils': loc.currency_ils,
      'currency_inr': loc.currency_inr,
      'currency_isk': loc.currency_isk,
      'currency_jpy': loc.currency_jpy,
      'currency_krw': loc.currency_krw,
      'currency_mxn': loc.currency_mxn,
      'currency_myr': loc.currency_myr,
      'currency_nok': loc.currency_nok,
      'currency_nzd': loc.currency_nzd,
      'currency_php': loc.currency_php,
      'currency_pln': loc.currency_pln,
      'currency_ron': loc.currency_ron,
      'currency_sek': loc.currency_sek,
      'currency_sgd': loc.currency_sgd,
      'currency_thb': loc.currency_thb,
      'currency_try': loc.currency_try,
      'currency_usd': loc.currency_usd,
      'currency_zar': loc.currency_zar,
    };

    return translations[key] ?? code;
  }

  static String? getFact(AppLocalizations loc, String countryCode) {
    final facts = <String, String>{
      'ar': loc.fact_ar,
      'au': loc.fact_au,
      'at': loc.fact_at,
      'be': loc.fact_be,
      'br': loc.fact_br,
      'ca': loc.fact_ca,
      'cn': loc.fact_cn,
      'dk': loc.fact_dk,
      'fi': loc.fact_fi,
      'fr': loc.fact_fr,
      'de': loc.fact_de,
      'gr': loc.fact_gr,
      'in': loc.fact_in,
      'ie': loc.fact_ie,
      'it': loc.fact_it,
      'jp': loc.fact_jp,
      'mx': loc.fact_mx,
      'nl': loc.fact_nl,
      'nz': loc.fact_nz,
      'no': loc.fact_no,
      'pl': loc.fact_pl,
      'ru': loc.fact_ru,
      'za': loc.fact_za,
      'kr': loc.fact_kr,
      'es': loc.fact_es,
      'se': loc.fact_se,
      'ch': loc.fact_ch,
      'tr': loc.fact_tr,
      'gb': loc.fact_gb,
      'us': loc.fact_us,
    };

    return facts[countryCode.toLowerCase()];
  }

  static Future<bool> checkInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<bool> checkGPS() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }

  static logDebug(String message) {
    if (kDebugMode) {
      // Only prints in debug mode
      debugPrint(message);
    }
  }


}

