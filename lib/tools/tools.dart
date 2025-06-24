import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      'country_af': localizations.country_af,
      'country_al': localizations.country_al,
      'country_dz': localizations.country_dz,
      'country_ad': localizations.country_ad,
      'country_ao': localizations.country_ao,
      'country_ag': localizations.country_ag,
      'country_ar': localizations.country_ar,
      'country_am': localizations.country_am,
      'country_au': localizations.country_au,
      'country_at': localizations.country_at,
      'country_az': localizations.country_az,
      'country_bs': localizations.country_bs,
      'country_bh': localizations.country_bh,
      'country_bd': localizations.country_bd,
      'country_bb': localizations.country_bb,
      'country_by': localizations.country_by,
      'country_be': localizations.country_be,
      'country_bz': localizations.country_bz,
      'country_bj': localizations.country_bj,
      'country_bt': localizations.country_bt,
      'country_bo': localizations.country_bo,
      'country_ba': localizations.country_ba,
      'country_bw': localizations.country_bw,
      'country_br': localizations.country_br,
      'country_bn': localizations.country_bn,
      'country_bg': localizations.country_bg,
      'country_bf': localizations.country_bf,
      'country_bi': localizations.country_bi,
      'country_cv': localizations.country_cv,
      'country_kh': localizations.country_kh,
      'country_cm': localizations.country_cm,
      'country_ca': localizations.country_ca,
      'country_cf': localizations.country_cf,
      'country_td': localizations.country_td,
      'country_cl': localizations.country_cl,
      'country_cn': localizations.country_cn,
      'country_co': localizations.country_co,
      'country_km': localizations.country_km,
      'country_cd': localizations.country_cd,
      'country_cg': localizations.country_cg,
      'country_cr': localizations.country_cr,
      'country_ci': localizations.country_ci,
      'country_hr': localizations.country_hr,
      'country_cu': localizations.country_cu,
      'country_cy': localizations.country_cy,
      'country_cz': localizations.country_cz,
      'country_dk': localizations.country_dk,
      'country_dj': localizations.country_dj,
      'country_dm': localizations.country_dm,
      'country_do': localizations.country_do,
      'country_ec': localizations.country_ec,
      'country_eg': localizations.country_eg,
      'country_sv': localizations.country_sv,
      'country_gq': localizations.country_gq,
      'country_er': localizations.country_er,
      'country_ee': localizations.country_ee,
      'country_sz': localizations.country_sz,
      'country_et': localizations.country_et,
      'country_fj': localizations.country_fj,
      'country_fi': localizations.country_fi,
      'country_fr': localizations.country_fr,
      'country_ga': localizations.country_ga,
      'country_gm': localizations.country_gm,
      'country_ge': localizations.country_ge,
      'country_de': localizations.country_de,
      'country_gh': localizations.country_gh,
      'country_gr': localizations.country_gr,
      'country_gd': localizations.country_gd,
      'country_gt': localizations.country_gt,
      'country_gn': localizations.country_gn,
      'country_gw': localizations.country_gw,
      'country_gy': localizations.country_gy,
      'country_ht': localizations.country_ht,
      'country_hn': localizations.country_hn,
      'country_hu': localizations.country_hu,
      'country_is': localizations.country_is,
      'country_in': localizations.country_in,
      'country_id': localizations.country_id,
      'country_ir': localizations.country_ir,
      'country_iq': localizations.country_iq,
      'country_ie': localizations.country_ie,
      'country_il': localizations.country_il,
      'country_it': localizations.country_it,
      'country_jm': localizations.country_jm,
      'country_jp': localizations.country_jp,
      'country_jo': localizations.country_jo,
      'country_kz': localizations.country_kz,
      'country_ke': localizations.country_ke,
      'country_ki': localizations.country_ki,
      'country_kp': localizations.country_kp,
      'country_kr': localizations.country_kr,
      'country_kw': localizations.country_kw,
      'country_kg': localizations.country_kg,
      'country_la': localizations.country_la,
      'country_lv': localizations.country_lv,
      'country_lb': localizations.country_lb,
      'country_ls': localizations.country_ls,
      'country_lr': localizations.country_lr,
      'country_ly': localizations.country_ly,
      'country_li': localizations.country_li,
      'country_lt': localizations.country_lt,
      'country_lu': localizations.country_lu,
      'country_mg': localizations.country_mg,
      'country_mw': localizations.country_mw,
      'country_my': localizations.country_my,
      'country_mv': localizations.country_mv,
      'country_ml': localizations.country_ml,
      'country_mt': localizations.country_mt,
      'country_mr': localizations.country_mr,
      'country_mu': localizations.country_mu,
      'country_mx': localizations.country_mx,
      'country_md': localizations.country_md,
      'country_mc': localizations.country_mc,
      'country_mn': localizations.country_mn,
      'country_me': localizations.country_me,
      'country_ma': localizations.country_ma,
      'country_mz': localizations.country_mz,
      'country_mm': localizations.country_mm,
      'country_na': localizations.country_na,
      'country_np': localizations.country_np,
      'country_nl': localizations.country_nl,
      'country_nz': localizations.country_nz,
      'country_ni': localizations.country_ni,
      'country_ne': localizations.country_ne,
      'country_ng': localizations.country_ng,
      'country_no': localizations.country_no,
      'country_om': localizations.country_om,
      'country_pk': localizations.country_pk,
      'country_pa': localizations.country_pa,
      'country_pg': localizations.country_pg,
      'country_py': localizations.country_py,
      'country_pe': localizations.country_pe,
      'country_ph': localizations.country_ph,
      'country_pl': localizations.country_pl,
      'country_pt': localizations.country_pt,
      'country_qa': localizations.country_qa,
      'country_ro': localizations.country_ro,
      'country_ru': localizations.country_ru,
      'country_rw': localizations.country_rw,
      'country_kn': localizations.country_kn,
      'country_lc': localizations.country_lc,
      'country_vc': localizations.country_vc,
      'country_ws': localizations.country_ws,
      'country_sm': localizations.country_sm,
      'country_st': localizations.country_st,
      'country_sa': localizations.country_sa,
      'country_sn': localizations.country_sn,
      'country_rs': localizations.country_rs,
      'country_sc': localizations.country_sc,
      'country_sl': localizations.country_sl,
      'country_sg': localizations.country_sg,
      'country_sk': localizations.country_sk,
      'country_si': localizations.country_si,
      'country_sb': localizations.country_sb,
      'country_so': localizations.country_so,
      'country_za': localizations.country_za,
      'country_es': localizations.country_es,
      'country_lk': localizations.country_lk,
      'country_sd': localizations.country_sd,
      'country_sr': localizations.country_sr,
      'country_se': localizations.country_se,
      'country_ch': localizations.country_ch,
      'country_sy': localizations.country_sy,
      'country_tw': localizations.country_tw,
      'country_tz': localizations.country_tz,
      'country_th': localizations.country_th,
      'country_tl': localizations.country_tl,
      'country_tg': localizations.country_tg,
      'country_to': localizations.country_to,
      'country_tt': localizations.country_tt,
      'country_tn': localizations.country_tn,
      'country_tr': localizations.country_tr,
      'country_tm': localizations.country_tm,
      'country_ug': localizations.country_ug,
      'country_ua': localizations.country_ua,
      'country_ae': localizations.country_ae,
      'country_gb': localizations.country_gb,
      'country_us': localizations.country_us,
      'country_uy': localizations.country_uy,
      'country_uz': localizations.country_uz,
      'country_vu': localizations.country_vu,
      'country_va': localizations.country_va,
      'country_ve': localizations.country_ve,
      'country_vn': localizations.country_vn,
      'country_ye': localizations.country_ye,
      'country_zm': localizations.country_zm,
      'country_zw': localizations.country_zw,
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

  static void logDebug(String tag, String message) {
    if (kDebugMode) {
      debugPrint('[$tag] $message');
    }
  }

  static Future<bool> showLocationPermissionDialog(BuildContext context) async {
    bool result = false;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.location_permission_required),
        content: Text(AppLocalizations.of(context)!.location_permission_text),
        actions: [
          TextButton(
            onPressed: () {
              result = true;
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.ok),
          ),
          TextButton(
            onPressed: () {
              result = false;
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
        ],
      ),
    );
    return result;
  }

  static void showMissingRequirementsDialog(BuildContext context, bool hasInternet, bool hasGPS) {
    String message = '';
    if (!hasInternet) message += AppLocalizations.of(context)!.internet_unavailable;
    if (!hasGPS) message += AppLocalizations.of(context)!.gps_error;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (!didPop) {
            SystemNavigator.pop();
          }
        },
        child: AlertDialog(
          title: Text(AppLocalizations.of(context)!.missing_requirements),
          content: Text(message.trim()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }


}

