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
  /// **'Internet connection is unavailable.'**
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

  /// No description provided for @search_country.
  ///
  /// In en, this message translates to:
  /// **'Search country...'**
  String get search_country;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @country_af.
  ///
  /// In en, this message translates to:
  /// **'Afghanistan'**
  String get country_af;

  /// No description provided for @country_al.
  ///
  /// In en, this message translates to:
  /// **'Albania'**
  String get country_al;

  /// No description provided for @country_dz.
  ///
  /// In en, this message translates to:
  /// **'Algeria'**
  String get country_dz;

  /// No description provided for @country_ad.
  ///
  /// In en, this message translates to:
  /// **'Andorra'**
  String get country_ad;

  /// No description provided for @country_ao.
  ///
  /// In en, this message translates to:
  /// **'Angola'**
  String get country_ao;

  /// No description provided for @country_ag.
  ///
  /// In en, this message translates to:
  /// **'Antigua and Barbuda'**
  String get country_ag;

  /// No description provided for @country_ar.
  ///
  /// In en, this message translates to:
  /// **'Argentina'**
  String get country_ar;

  /// No description provided for @country_am.
  ///
  /// In en, this message translates to:
  /// **'Armenia'**
  String get country_am;

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

  /// No description provided for @country_az.
  ///
  /// In en, this message translates to:
  /// **'Azerbaijan'**
  String get country_az;

  /// No description provided for @country_bs.
  ///
  /// In en, this message translates to:
  /// **'Bahamas'**
  String get country_bs;

  /// No description provided for @country_bh.
  ///
  /// In en, this message translates to:
  /// **'Bahrain'**
  String get country_bh;

  /// No description provided for @country_bd.
  ///
  /// In en, this message translates to:
  /// **'Bangladesh'**
  String get country_bd;

  /// No description provided for @country_bb.
  ///
  /// In en, this message translates to:
  /// **'Barbados'**
  String get country_bb;

  /// No description provided for @country_by.
  ///
  /// In en, this message translates to:
  /// **'Belarus'**
  String get country_by;

  /// No description provided for @country_be.
  ///
  /// In en, this message translates to:
  /// **'Belgium'**
  String get country_be;

  /// No description provided for @country_bz.
  ///
  /// In en, this message translates to:
  /// **'Belize'**
  String get country_bz;

  /// No description provided for @country_bj.
  ///
  /// In en, this message translates to:
  /// **'Benin'**
  String get country_bj;

  /// No description provided for @country_bt.
  ///
  /// In en, this message translates to:
  /// **'Bhutan'**
  String get country_bt;

  /// No description provided for @country_bo.
  ///
  /// In en, this message translates to:
  /// **'Bolivia'**
  String get country_bo;

  /// No description provided for @country_ba.
  ///
  /// In en, this message translates to:
  /// **'Bosnia and Herzegovina'**
  String get country_ba;

  /// No description provided for @country_bw.
  ///
  /// In en, this message translates to:
  /// **'Botswana'**
  String get country_bw;

  /// No description provided for @country_br.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get country_br;

  /// No description provided for @country_bn.
  ///
  /// In en, this message translates to:
  /// **'Brunei Darussalam'**
  String get country_bn;

  /// No description provided for @country_bg.
  ///
  /// In en, this message translates to:
  /// **'Bulgaria'**
  String get country_bg;

  /// No description provided for @country_bf.
  ///
  /// In en, this message translates to:
  /// **'Burkina Faso'**
  String get country_bf;

  /// No description provided for @country_bi.
  ///
  /// In en, this message translates to:
  /// **'Burundi'**
  String get country_bi;

  /// No description provided for @country_cv.
  ///
  /// In en, this message translates to:
  /// **'Cabo Verde'**
  String get country_cv;

  /// No description provided for @country_kh.
  ///
  /// In en, this message translates to:
  /// **'Cambodia'**
  String get country_kh;

  /// No description provided for @country_cm.
  ///
  /// In en, this message translates to:
  /// **'Cameroon'**
  String get country_cm;

  /// No description provided for @country_ca.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get country_ca;

  /// No description provided for @country_cf.
  ///
  /// In en, this message translates to:
  /// **'Central African Republic'**
  String get country_cf;

  /// No description provided for @country_td.
  ///
  /// In en, this message translates to:
  /// **'Chad'**
  String get country_td;

  /// No description provided for @country_cl.
  ///
  /// In en, this message translates to:
  /// **'Chile'**
  String get country_cl;

  /// No description provided for @country_cn.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get country_cn;

  /// No description provided for @country_co.
  ///
  /// In en, this message translates to:
  /// **'Colombia'**
  String get country_co;

  /// No description provided for @country_km.
  ///
  /// In en, this message translates to:
  /// **'Comoros'**
  String get country_km;

  /// No description provided for @country_cd.
  ///
  /// In en, this message translates to:
  /// **'DR Congo'**
  String get country_cd;

  /// No description provided for @country_cg.
  ///
  /// In en, this message translates to:
  /// **'Republic of the Congo'**
  String get country_cg;

  /// No description provided for @country_cr.
  ///
  /// In en, this message translates to:
  /// **'Costa Rica'**
  String get country_cr;

  /// No description provided for @country_ci.
  ///
  /// In en, this message translates to:
  /// **'Côte d\'Ivoire'**
  String get country_ci;

  /// No description provided for @country_hr.
  ///
  /// In en, this message translates to:
  /// **'Croatia'**
  String get country_hr;

  /// No description provided for @country_cu.
  ///
  /// In en, this message translates to:
  /// **'Cuba'**
  String get country_cu;

  /// No description provided for @country_cy.
  ///
  /// In en, this message translates to:
  /// **'Cyprus'**
  String get country_cy;

  /// No description provided for @country_cz.
  ///
  /// In en, this message translates to:
  /// **'Czechia'**
  String get country_cz;

  /// No description provided for @country_dk.
  ///
  /// In en, this message translates to:
  /// **'Denmark'**
  String get country_dk;

  /// No description provided for @country_dj.
  ///
  /// In en, this message translates to:
  /// **'Djibouti'**
  String get country_dj;

  /// No description provided for @country_dm.
  ///
  /// In en, this message translates to:
  /// **'Dominica'**
  String get country_dm;

  /// No description provided for @country_do.
  ///
  /// In en, this message translates to:
  /// **'Dominican Republic'**
  String get country_do;

  /// No description provided for @country_ec.
  ///
  /// In en, this message translates to:
  /// **'Ecuador'**
  String get country_ec;

  /// No description provided for @country_eg.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get country_eg;

  /// No description provided for @country_sv.
  ///
  /// In en, this message translates to:
  /// **'El Salvador'**
  String get country_sv;

  /// No description provided for @country_gq.
  ///
  /// In en, this message translates to:
  /// **'Equatorial Guinea'**
  String get country_gq;

  /// No description provided for @country_er.
  ///
  /// In en, this message translates to:
  /// **'Eritrea'**
  String get country_er;

  /// No description provided for @country_ee.
  ///
  /// In en, this message translates to:
  /// **'Estonia'**
  String get country_ee;

  /// No description provided for @country_sz.
  ///
  /// In en, this message translates to:
  /// **'Eswatini'**
  String get country_sz;

  /// No description provided for @country_et.
  ///
  /// In en, this message translates to:
  /// **'Ethiopia'**
  String get country_et;

  /// No description provided for @country_fj.
  ///
  /// In en, this message translates to:
  /// **'Fiji'**
  String get country_fj;

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

  /// No description provided for @country_ga.
  ///
  /// In en, this message translates to:
  /// **'Gabon'**
  String get country_ga;

  /// No description provided for @country_gm.
  ///
  /// In en, this message translates to:
  /// **'Gambia'**
  String get country_gm;

  /// No description provided for @country_ge.
  ///
  /// In en, this message translates to:
  /// **'Georgia'**
  String get country_ge;

  /// No description provided for @country_de.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get country_de;

  /// No description provided for @country_gh.
  ///
  /// In en, this message translates to:
  /// **'Ghana'**
  String get country_gh;

  /// No description provided for @country_gr.
  ///
  /// In en, this message translates to:
  /// **'Greece'**
  String get country_gr;

  /// No description provided for @country_gd.
  ///
  /// In en, this message translates to:
  /// **'Grenada'**
  String get country_gd;

  /// No description provided for @country_gt.
  ///
  /// In en, this message translates to:
  /// **'Guatemala'**
  String get country_gt;

  /// No description provided for @country_gn.
  ///
  /// In en, this message translates to:
  /// **'Guinea'**
  String get country_gn;

  /// No description provided for @country_gw.
  ///
  /// In en, this message translates to:
  /// **'Guinea-Bissau'**
  String get country_gw;

  /// No description provided for @country_gy.
  ///
  /// In en, this message translates to:
  /// **'Guyana'**
  String get country_gy;

  /// No description provided for @country_ht.
  ///
  /// In en, this message translates to:
  /// **'Haiti'**
  String get country_ht;

  /// No description provided for @country_hn.
  ///
  /// In en, this message translates to:
  /// **'Honduras'**
  String get country_hn;

  /// No description provided for @country_hu.
  ///
  /// In en, this message translates to:
  /// **'Hungary'**
  String get country_hu;

  /// No description provided for @country_is.
  ///
  /// In en, this message translates to:
  /// **'Iceland'**
  String get country_is;

  /// No description provided for @country_in.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get country_in;

  /// No description provided for @country_id.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get country_id;

  /// No description provided for @country_ir.
  ///
  /// In en, this message translates to:
  /// **'Iran'**
  String get country_ir;

  /// No description provided for @country_iq.
  ///
  /// In en, this message translates to:
  /// **'Iraq'**
  String get country_iq;

  /// No description provided for @country_ie.
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get country_ie;

  /// No description provided for @country_il.
  ///
  /// In en, this message translates to:
  /// **'Israel'**
  String get country_il;

  /// No description provided for @country_it.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get country_it;

  /// No description provided for @country_jm.
  ///
  /// In en, this message translates to:
  /// **'Jamaica'**
  String get country_jm;

  /// No description provided for @country_jp.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get country_jp;

  /// No description provided for @country_jo.
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get country_jo;

  /// No description provided for @country_kz.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan'**
  String get country_kz;

  /// No description provided for @country_ke.
  ///
  /// In en, this message translates to:
  /// **'Kenya'**
  String get country_ke;

  /// No description provided for @country_ki.
  ///
  /// In en, this message translates to:
  /// **'Kiribati'**
  String get country_ki;

  /// No description provided for @country_kp.
  ///
  /// In en, this message translates to:
  /// **'North Korea'**
  String get country_kp;

  /// No description provided for @country_kr.
  ///
  /// In en, this message translates to:
  /// **'South Korea'**
  String get country_kr;

  /// No description provided for @country_kw.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get country_kw;

  /// No description provided for @country_kg.
  ///
  /// In en, this message translates to:
  /// **'Kyrgyzstan'**
  String get country_kg;

  /// No description provided for @country_la.
  ///
  /// In en, this message translates to:
  /// **'Laos'**
  String get country_la;

  /// No description provided for @country_lv.
  ///
  /// In en, this message translates to:
  /// **'Latvia'**
  String get country_lv;

  /// No description provided for @country_lb.
  ///
  /// In en, this message translates to:
  /// **'Lebanon'**
  String get country_lb;

  /// No description provided for @country_ls.
  ///
  /// In en, this message translates to:
  /// **'Lesotho'**
  String get country_ls;

  /// No description provided for @country_lr.
  ///
  /// In en, this message translates to:
  /// **'Liberia'**
  String get country_lr;

  /// No description provided for @country_ly.
  ///
  /// In en, this message translates to:
  /// **'Libya'**
  String get country_ly;

  /// No description provided for @country_li.
  ///
  /// In en, this message translates to:
  /// **'Liechtenstein'**
  String get country_li;

  /// No description provided for @country_lt.
  ///
  /// In en, this message translates to:
  /// **'Lithuania'**
  String get country_lt;

  /// No description provided for @country_lu.
  ///
  /// In en, this message translates to:
  /// **'Luxembourg'**
  String get country_lu;

  /// No description provided for @country_mg.
  ///
  /// In en, this message translates to:
  /// **'Madagascar'**
  String get country_mg;

  /// No description provided for @country_mw.
  ///
  /// In en, this message translates to:
  /// **'Malawi'**
  String get country_mw;

  /// No description provided for @country_my.
  ///
  /// In en, this message translates to:
  /// **'Malaysia'**
  String get country_my;

  /// No description provided for @country_mv.
  ///
  /// In en, this message translates to:
  /// **'Maldives'**
  String get country_mv;

  /// No description provided for @country_ml.
  ///
  /// In en, this message translates to:
  /// **'Mali'**
  String get country_ml;

  /// No description provided for @country_mt.
  ///
  /// In en, this message translates to:
  /// **'Malta'**
  String get country_mt;

  /// No description provided for @country_mr.
  ///
  /// In en, this message translates to:
  /// **'Mauritania'**
  String get country_mr;

  /// No description provided for @country_mu.
  ///
  /// In en, this message translates to:
  /// **'Mauritius'**
  String get country_mu;

  /// No description provided for @country_mx.
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get country_mx;

  /// No description provided for @country_md.
  ///
  /// In en, this message translates to:
  /// **'Moldova'**
  String get country_md;

  /// No description provided for @country_mc.
  ///
  /// In en, this message translates to:
  /// **'Monaco'**
  String get country_mc;

  /// No description provided for @country_mn.
  ///
  /// In en, this message translates to:
  /// **'Mongolia'**
  String get country_mn;

  /// No description provided for @country_me.
  ///
  /// In en, this message translates to:
  /// **'Montenegro'**
  String get country_me;

  /// No description provided for @country_ma.
  ///
  /// In en, this message translates to:
  /// **'Morocco'**
  String get country_ma;

  /// No description provided for @country_mz.
  ///
  /// In en, this message translates to:
  /// **'Mozambique'**
  String get country_mz;

  /// No description provided for @country_mm.
  ///
  /// In en, this message translates to:
  /// **'Myanmar'**
  String get country_mm;

  /// No description provided for @country_na.
  ///
  /// In en, this message translates to:
  /// **'Namibia'**
  String get country_na;

  /// No description provided for @country_np.
  ///
  /// In en, this message translates to:
  /// **'Nepal'**
  String get country_np;

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

  /// No description provided for @country_ni.
  ///
  /// In en, this message translates to:
  /// **'Nicaragua'**
  String get country_ni;

  /// No description provided for @country_ne.
  ///
  /// In en, this message translates to:
  /// **'Niger'**
  String get country_ne;

  /// No description provided for @country_ng.
  ///
  /// In en, this message translates to:
  /// **'Nigeria'**
  String get country_ng;

  /// No description provided for @country_no.
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get country_no;

  /// No description provided for @country_om.
  ///
  /// In en, this message translates to:
  /// **'Oman'**
  String get country_om;

  /// No description provided for @country_pk.
  ///
  /// In en, this message translates to:
  /// **'Pakistan'**
  String get country_pk;

  /// No description provided for @country_pa.
  ///
  /// In en, this message translates to:
  /// **'Panama'**
  String get country_pa;

  /// No description provided for @country_pg.
  ///
  /// In en, this message translates to:
  /// **'Papua New Guinea'**
  String get country_pg;

  /// No description provided for @country_py.
  ///
  /// In en, this message translates to:
  /// **'Paraguay'**
  String get country_py;

  /// No description provided for @country_pe.
  ///
  /// In en, this message translates to:
  /// **'Peru'**
  String get country_pe;

  /// No description provided for @country_ph.
  ///
  /// In en, this message translates to:
  /// **'Philippines'**
  String get country_ph;

  /// No description provided for @country_pl.
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get country_pl;

  /// No description provided for @country_pt.
  ///
  /// In en, this message translates to:
  /// **'Portugal'**
  String get country_pt;

  /// No description provided for @country_qa.
  ///
  /// In en, this message translates to:
  /// **'Qatar'**
  String get country_qa;

  /// No description provided for @country_ro.
  ///
  /// In en, this message translates to:
  /// **'Romania'**
  String get country_ro;

  /// No description provided for @country_ru.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get country_ru;

  /// No description provided for @country_rw.
  ///
  /// In en, this message translates to:
  /// **'Rwanda'**
  String get country_rw;

  /// No description provided for @country_kn.
  ///
  /// In en, this message translates to:
  /// **'Saint Kitts and Nevis'**
  String get country_kn;

  /// No description provided for @country_lc.
  ///
  /// In en, this message translates to:
  /// **'Saint Lucia'**
  String get country_lc;

  /// No description provided for @country_vc.
  ///
  /// In en, this message translates to:
  /// **'Saint Vincent and the Grenadines'**
  String get country_vc;

  /// No description provided for @country_ws.
  ///
  /// In en, this message translates to:
  /// **'Samoa'**
  String get country_ws;

  /// No description provided for @country_sm.
  ///
  /// In en, this message translates to:
  /// **'San Marino'**
  String get country_sm;

  /// No description provided for @country_st.
  ///
  /// In en, this message translates to:
  /// **'Sao Tome and Principe'**
  String get country_st;

  /// No description provided for @country_sa.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get country_sa;

  /// No description provided for @country_sn.
  ///
  /// In en, this message translates to:
  /// **'Senegal'**
  String get country_sn;

  /// No description provided for @country_rs.
  ///
  /// In en, this message translates to:
  /// **'Serbia'**
  String get country_rs;

  /// No description provided for @country_sc.
  ///
  /// In en, this message translates to:
  /// **'Seychelles'**
  String get country_sc;

  /// No description provided for @country_sl.
  ///
  /// In en, this message translates to:
  /// **'Sierra Leone'**
  String get country_sl;

  /// No description provided for @country_sg.
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get country_sg;

  /// No description provided for @country_sk.
  ///
  /// In en, this message translates to:
  /// **'Slovakia'**
  String get country_sk;

  /// No description provided for @country_si.
  ///
  /// In en, this message translates to:
  /// **'Slovenia'**
  String get country_si;

  /// No description provided for @country_sb.
  ///
  /// In en, this message translates to:
  /// **'Solomon Islands'**
  String get country_sb;

  /// No description provided for @country_so.
  ///
  /// In en, this message translates to:
  /// **'Somalia'**
  String get country_so;

  /// No description provided for @country_za.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get country_za;

  /// No description provided for @country_es.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get country_es;

  /// No description provided for @country_lk.
  ///
  /// In en, this message translates to:
  /// **'Sri Lanka'**
  String get country_lk;

  /// No description provided for @country_sd.
  ///
  /// In en, this message translates to:
  /// **'Sudan'**
  String get country_sd;

  /// No description provided for @country_sr.
  ///
  /// In en, this message translates to:
  /// **'Suriname'**
  String get country_sr;

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

  /// No description provided for @country_sy.
  ///
  /// In en, this message translates to:
  /// **'Syria'**
  String get country_sy;

  /// No description provided for @country_tw.
  ///
  /// In en, this message translates to:
  /// **'Taiwan'**
  String get country_tw;

  /// No description provided for @country_tz.
  ///
  /// In en, this message translates to:
  /// **'Tanzania'**
  String get country_tz;

  /// No description provided for @country_th.
  ///
  /// In en, this message translates to:
  /// **'Thailand'**
  String get country_th;

  /// No description provided for @country_tl.
  ///
  /// In en, this message translates to:
  /// **'Timor-Leste'**
  String get country_tl;

  /// No description provided for @country_tg.
  ///
  /// In en, this message translates to:
  /// **'Togo'**
  String get country_tg;

  /// No description provided for @country_to.
  ///
  /// In en, this message translates to:
  /// **'Tonga'**
  String get country_to;

  /// No description provided for @country_tt.
  ///
  /// In en, this message translates to:
  /// **'Trinidad and Tobago'**
  String get country_tt;

  /// No description provided for @country_tn.
  ///
  /// In en, this message translates to:
  /// **'Tunisia'**
  String get country_tn;

  /// No description provided for @country_tr.
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get country_tr;

  /// No description provided for @country_tm.
  ///
  /// In en, this message translates to:
  /// **'Turkmenistan'**
  String get country_tm;

  /// No description provided for @country_ug.
  ///
  /// In en, this message translates to:
  /// **'Uganda'**
  String get country_ug;

  /// No description provided for @country_ua.
  ///
  /// In en, this message translates to:
  /// **'Ukraine'**
  String get country_ua;

  /// No description provided for @country_ae.
  ///
  /// In en, this message translates to:
  /// **'United Arab Emirates'**
  String get country_ae;

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

  /// No description provided for @country_uy.
  ///
  /// In en, this message translates to:
  /// **'Uruguay'**
  String get country_uy;

  /// No description provided for @country_uz.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan'**
  String get country_uz;

  /// No description provided for @country_vu.
  ///
  /// In en, this message translates to:
  /// **'Vanuatu'**
  String get country_vu;

  /// No description provided for @country_va.
  ///
  /// In en, this message translates to:
  /// **'Vatican City'**
  String get country_va;

  /// No description provided for @country_ve.
  ///
  /// In en, this message translates to:
  /// **'Venezuela'**
  String get country_ve;

  /// No description provided for @country_vn.
  ///
  /// In en, this message translates to:
  /// **'Vietnam'**
  String get country_vn;

  /// No description provided for @country_ye.
  ///
  /// In en, this message translates to:
  /// **'Yemen'**
  String get country_ye;

  /// No description provided for @country_zm.
  ///
  /// In en, this message translates to:
  /// **'Zambia'**
  String get country_zm;

  /// No description provided for @country_zw.
  ///
  /// In en, this message translates to:
  /// **'Zimbabwe'**
  String get country_zw;

  /// No description provided for @fact_af.
  ///
  /// In en, this message translates to:
  /// **'Afghanistan is a landlocked country known for its rugged mountains and rich historical Silk Road heritage.'**
  String get fact_af;

  /// No description provided for @fact_al.
  ///
  /// In en, this message translates to:
  /// **'Albania boasts stunning Adriatic and Ionian coastlines and a fascinating history with over 750,000 bunkers.'**
  String get fact_al;

  /// No description provided for @fact_dz.
  ///
  /// In en, this message translates to:
  /// **'Algeria is the largest country in Africa, with a vast Sahara Desert and ancient Roman ruins.'**
  String get fact_dz;

  /// No description provided for @fact_ad.
  ///
  /// In en, this message translates to:
  /// **'Andorra is a tiny, mountainous microstate nestled in the Pyrenees, known for its duty-free shopping and ski resorts.'**
  String get fact_ad;

  /// No description provided for @fact_ao.
  ///
  /// In en, this message translates to:
  /// **'Angola is rich in natural resources and boasts diverse landscapes, from tropical Atlantic beaches to the Namib Desert.'**
  String get fact_ao;

  /// No description provided for @fact_ag.
  ///
  /// In en, this message translates to:
  /// **'Antigua and Barbuda is famous for having 365 beaches, one for every day of the year.'**
  String get fact_ag;

  /// No description provided for @fact_ar.
  ///
  /// In en, this message translates to:
  /// **'Argentina is home to the tango and the world\'s widest avenue in Buenos Aires.'**
  String get fact_ar;

  /// No description provided for @fact_am.
  ///
  /// In en, this message translates to:
  /// **'Armenia is one of the world\'s oldest Christian nations, home to ancient monasteries and stunning mountain scenery.'**
  String get fact_am;

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

  /// No description provided for @fact_az.
  ///
  /// In en, this message translates to:
  /// **'Azerbaijan is known as the \'Land of Fire\' due to its natural gas reserves and has a unique blend of Eastern and Western cultures.'**
  String get fact_az;

  /// No description provided for @fact_bs.
  ///
  /// In en, this message translates to:
  /// **'The Bahamas is an archipelago of over 700 islands and cays, famous for its clear turquoise waters and vibrant coral reefs.'**
  String get fact_bs;

  /// No description provided for @fact_bh.
  ///
  /// In en, this message translates to:
  /// **'Bahrain is an island nation known for its ancient Dilmun civilization, pearl diving history, and modern skyline.'**
  String get fact_bh;

  /// No description provided for @fact_bd.
  ///
  /// In en, this message translates to:
  /// **'Bangladesh is a densely populated country characterized by its deltas, lush greenery, and rich literary tradition.'**
  String get fact_bd;

  /// No description provided for @fact_bb.
  ///
  /// In en, this message translates to:
  /// **'Barbados is the birthplace of rum and boasts beautiful beaches and a vibrant calypso music scene.'**
  String get fact_bb;

  /// No description provided for @fact_by.
  ///
  /// In en, this message translates to:
  /// **'Belarus is known for its vast forests, numerous lakes, and well-preserved medieval castles.'**
  String get fact_by;

  /// No description provided for @fact_be.
  ///
  /// In en, this message translates to:
  /// **'Belgium is known for its waffles, chocolates, and more castles per square mile than any other country.'**
  String get fact_be;

  /// No description provided for @fact_bz.
  ///
  /// In en, this message translates to:
  /// **'Belize is a Central American gem with the second-largest barrier reef in the world, perfect for diving and snorkeling.'**
  String get fact_bz;

  /// No description provided for @fact_bj.
  ///
  /// In en, this message translates to:
  /// **'Benin is the birthplace of Vodun (Voodoo) and has a rich history showcased in its royal palaces.'**
  String get fact_bj;

  /// No description provided for @fact_bt.
  ///
  /// In en, this message translates to:
  /// **'Bhutan is the only country in the world that measures its success by Gross National Happiness.'**
  String get fact_bt;

  /// No description provided for @fact_bo.
  ///
  /// In en, this message translates to:
  /// **'Bolivia is home to the world\'s largest salt flat, Salar de Uyuni, and the highest capital city, La Paz.'**
  String get fact_bo;

  /// No description provided for @fact_ba.
  ///
  /// In en, this message translates to:
  /// **'Bosnia and Herzegovina is known for its diverse cultural heritage, stunning natural beauty, and the iconic Stari Most bridge in Mostar.'**
  String get fact_ba;

  /// No description provided for @fact_bw.
  ///
  /// In en, this message translates to:
  /// **'Botswana is a land of vast wilderness, famous for its Okavango Delta, a unique inland delta supporting abundant wildlife.'**
  String get fact_bw;

  /// No description provided for @fact_br.
  ///
  /// In en, this message translates to:
  /// **'Brazil is home to the Amazon Rainforest and the famous Christ the Redeemer statue.'**
  String get fact_br;

  /// No description provided for @fact_bn.
  ///
  /// In en, this message translates to:
  /// **'Brunei Darussalam is a tiny, oil-rich sultanate on Borneo island, known for its opulent mosques and untouched rainforests.'**
  String get fact_bn;

  /// No description provided for @fact_bg.
  ///
  /// In en, this message translates to:
  /// **'Bulgaria is one of the oldest states in Europe, known for its rose oil production, ancient Thracian treasures, and Orthodox monasteries.'**
  String get fact_bg;

  /// No description provided for @fact_bf.
  ///
  /// In en, this message translates to:
  /// **'Burkina Faso is a landlocked West African nation known for its vibrant traditional music and art.'**
  String get fact_bf;

  /// No description provided for @fact_bi.
  ///
  /// In en, this message translates to:
  /// **'Burundi is a land of a thousand hills, offering stunning landscapes around Lake Tanganyika.'**
  String get fact_bi;

  /// No description provided for @fact_cv.
  ///
  /// In en, this message translates to:
  /// **'Cabo Verde is an archipelago of volcanic islands off the coast of West Africa, renowned for its Creole Portuguese-African culture and music.'**
  String get fact_cv;

  /// No description provided for @fact_kh.
  ///
  /// In en, this message translates to:
  /// **'Cambodia is home to the majestic Angkor Wat, one of the largest religious monuments in the world.'**
  String get fact_kh;

  /// No description provided for @fact_cm.
  ///
  /// In en, this message translates to:
  /// **'Cameroon is often called \'Africa in miniature\' due to its diverse landscapes, from beaches and deserts to mountains and rainforests.'**
  String get fact_cm;

  /// No description provided for @fact_ca.
  ///
  /// In en, this message translates to:
  /// **'Canada has the longest coastline in the world and is known for maple syrup and ice hockey.'**
  String get fact_ca;

  /// No description provided for @fact_cf.
  ///
  /// In en, this message translates to:
  /// **'The Central African Republic is a landlocked country with vast savannas and is home to diverse wildlife.'**
  String get fact_cf;

  /// No description provided for @fact_td.
  ///
  /// In en, this message translates to:
  /// **'Chad is a landlocked nation in Central Africa, dominated by the Sahara Desert and Lake Chad, a vital freshwater source.'**
  String get fact_td;

  /// No description provided for @fact_cl.
  ///
  /// In en, this message translates to:
  /// **'Chile is the world\'s longest country, stretching from the Atacama Desert to Patagonia\'s glaciers.'**
  String get fact_cl;

  /// No description provided for @fact_cn.
  ///
  /// In en, this message translates to:
  /// **'China is the world’s most populous country and home to the Great Wall, visible from space.'**
  String get fact_cn;

  /// No description provided for @fact_co.
  ///
  /// In en, this message translates to:
  /// **'Colombia is a country of vibrant biodiversity, from Amazon rainforests to Andean mountains, and is famous for its coffee.'**
  String get fact_co;

  /// No description provided for @fact_km.
  ///
  /// In en, this message translates to:
  /// **'Comoros is an archipelago nation in the Indian Ocean, known for its volcanic landscapes and fragrant spice islands.'**
  String get fact_km;

  /// No description provided for @fact_cd.
  ///
  /// In en, this message translates to:
  /// **'The Democratic Republic of the Congo is the second-largest country in Africa, known for its immense natural resources and diverse ecosystems.'**
  String get fact_cd;

  /// No description provided for @fact_cg.
  ///
  /// In en, this message translates to:
  /// **'The Republic of the Congo is a Central African nation with vast rainforests, home to gorillas and other wildlife.'**
  String get fact_cg;

  /// No description provided for @fact_cr.
  ///
  /// In en, this message translates to:
  /// **'Costa Rica is a pioneer in ecotourism, boasting incredible biodiversity and beautiful national parks.'**
  String get fact_cr;

  /// No description provided for @fact_ci.
  ///
  /// In en, this message translates to:
  /// **'Côte d\'Ivoire is West Africa\'s largest producer of cocoa and is known for its vibrant markets and diverse ethnic groups.'**
  String get fact_ci;

  /// No description provided for @fact_hr.
  ///
  /// In en, this message translates to:
  /// **'Croatia boasts stunning Adriatic coastlines with thousands of islands and historical cities like Dubrovnik.'**
  String get fact_hr;

  /// No description provided for @fact_cu.
  ///
  /// In en, this message translates to:
  /// **'Cuba is known for its classic cars, vibrant music, rich history, and famous cigars.'**
  String get fact_cu;

  /// No description provided for @fact_cy.
  ///
  /// In en, this message translates to:
  /// **'Cyprus is a Mediterranean island nation steeped in mythology and dotted with ancient ruins and beautiful beaches.'**
  String get fact_cy;

  /// No description provided for @fact_cz.
  ///
  /// In en, this message translates to:
  /// **'Czechia is famous for its charming capital Prague, rich history, and the invention of Pilsner beer.'**
  String get fact_cz;

  /// No description provided for @fact_dk.
  ///
  /// In en, this message translates to:
  /// **'Denmark is one of the happiest countries and the birthplace of LEGO.'**
  String get fact_dk;

  /// No description provided for @fact_dj.
  ///
  /// In en, this message translates to:
  /// **'Djibouti is a small nation strategically located on the Horn of Africa, known for its unique geological formations like Lake Assal.'**
  String get fact_dj;

  /// No description provided for @fact_dm.
  ///
  /// In en, this message translates to:
  /// **'Dominica is known as the \'Nature Isle of the Caribbean\' for its lush rainforests, volcanic landscapes, and natural hot springs.'**
  String get fact_dm;

  /// No description provided for @fact_do.
  ///
  /// In en, this message translates to:
  /// **'The Dominican Republic shares the island of Hispaniola and is renowned for its beautiful beaches, merengue music, and historical colonial architecture.'**
  String get fact_do;

  /// No description provided for @fact_ec.
  ///
  /// In en, this message translates to:
  /// **'Ecuador is named after the equator, through which it passes, and is home to diverse ecosystems, including the Galapagos Islands.'**
  String get fact_ec;

  /// No description provided for @fact_eg.
  ///
  /// In en, this message translates to:
  /// **'Egypt is home to the ancient pyramids and the Sphinx, and the mighty Nile River flows through its heart.'**
  String get fact_eg;

  /// No description provided for @fact_sv.
  ///
  /// In en, this message translates to:
  /// **'El Salvador is Central America\'s smallest country, known as the \'Land of Volcanoes\' and for its beautiful Pacific coastline.'**
  String get fact_sv;

  /// No description provided for @fact_gq.
  ///
  /// In en, this message translates to:
  /// **'Equatorial Guinea is the only sovereign African state where Spanish is an official language, and it\'s rich in oil.'**
  String get fact_gq;

  /// No description provided for @fact_er.
  ///
  /// In en, this message translates to:
  /// **'Eritrea is a country with a long Red Sea coastline and distinctive Italian colonial architecture in its capital, Asmara.'**
  String get fact_er;

  /// No description provided for @fact_ee.
  ///
  /// In en, this message translates to:
  /// **'Estonia is a digital pioneer, known for its medieval Old Town in Tallinn and dense forests.'**
  String get fact_ee;

  /// No description provided for @fact_sz.
  ///
  /// In en, this message translates to:
  /// **'Eswatini is one of Africa\'s last absolute monarchies, known for its vibrant traditional culture and wildlife reserves.'**
  String get fact_sz;

  /// No description provided for @fact_et.
  ///
  /// In en, this message translates to:
  /// **'Ethiopia is an ancient land with a rich history, the birthplace of coffee, and home to rock-hewn churches.'**
  String get fact_et;

  /// No description provided for @fact_fj.
  ///
  /// In en, this message translates to:
  /// **'Fiji is an island paradise in the South Pacific, famous for its pristine beaches, coral reefs, and friendly locals.'**
  String get fact_fj;

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

  /// No description provided for @fact_ga.
  ///
  /// In en, this message translates to:
  /// **'Gabon is a Central African nation with vast protected national parks, preserving its rich biodiversity and gorilla populations.'**
  String get fact_ga;

  /// No description provided for @fact_gm.
  ///
  /// In en, this message translates to:
  /// **'The Gambia is the smallest country in mainland Africa, known for its narrow strip of land along the Gambia River.'**
  String get fact_gm;

  /// No description provided for @fact_ge.
  ///
  /// In en, this message translates to:
  /// **'Georgia is a country at the crossroads of Europe and Asia, famous for its ancient wine-making traditions and stunning Caucasus mountains.'**
  String get fact_ge;

  /// No description provided for @fact_de.
  ///
  /// In en, this message translates to:
  /// **'Germany is known for its autobahns, beer culture, and as the birthplace of Beethoven.'**
  String get fact_de;

  /// No description provided for @fact_gh.
  ///
  /// In en, this message translates to:
  /// **'Ghana was the first sub-Saharan African country to gain independence and is known for its kente cloth and vibrant music.'**
  String get fact_gh;

  /// No description provided for @fact_gr.
  ///
  /// In en, this message translates to:
  /// **'Greece is the cradle of Western civilization and home to ancient ruins like the Parthenon.'**
  String get fact_gr;

  /// No description provided for @fact_gd.
  ///
  /// In en, this message translates to:
  /// **'Grenada is known as the \'Spice Isle\' for its production of nutmeg and other spices, surrounded by beautiful beaches.'**
  String get fact_gd;

  /// No description provided for @fact_gt.
  ///
  /// In en, this message translates to:
  /// **'Guatemala is home to ancient Mayan ruins, including the impressive Tikal, and stunning volcanic landscapes.'**
  String get fact_gt;

  /// No description provided for @fact_gn.
  ///
  /// In en, this message translates to:
  /// **'Guinea is a West African country rich in natural resources, known for its traditional music and diverse landscapes.'**
  String get fact_gn;

  /// No description provided for @fact_gw.
  ///
  /// In en, this message translates to:
  /// **'Guinea-Bissau is a small West African nation known for its Bijagos Archipelago, a UNESCO Biosphere Reserve.'**
  String get fact_gw;

  /// No description provided for @fact_gy.
  ///
  /// In en, this message translates to:
  /// **'Guyana is the only English-speaking country in South America, boasting vast rainforests and the majestic Kaieteur Falls.'**
  String get fact_gy;

  /// No description provided for @fact_ht.
  ///
  /// In en, this message translates to:
  /// **'Haiti shares the island of Hispaniola and is known for its vibrant art, rich history, and the Citadelle Laferrière fortress.'**
  String get fact_ht;

  /// No description provided for @fact_hn.
  ///
  /// In en, this message translates to:
  /// **'Honduras is home to the ancient Mayan city of Copán and rich biodiversity, including diverse marine life on its Caribbean coast.'**
  String get fact_hn;

  /// No description provided for @fact_hu.
  ///
  /// In en, this message translates to:
  /// **'Hungary is known for its thermal baths, vibrant capital Budapest, and rich folk traditions.'**
  String get fact_hu;

  /// No description provided for @fact_is.
  ///
  /// In en, this message translates to:
  /// **'Iceland is a land of fire and ice, with active volcanoes, glaciers, and the spectacular Northern Lights.'**
  String get fact_is;

  /// No description provided for @fact_in.
  ///
  /// In en, this message translates to:
  /// **'India is the land of spices, yoga, and the majestic Taj Mahal.'**
  String get fact_in;

  /// No description provided for @fact_id.
  ///
  /// In en, this message translates to:
  /// **'Indonesia is the world\'s largest archipelago, home to thousands of islands, diverse cultures, and stunning volcanic landscapes.'**
  String get fact_id;

  /// No description provided for @fact_ir.
  ///
  /// In en, this message translates to:
  /// **'Iran has one of the world\'s oldest continuous major civilizations, with a rich history of art, architecture, and Persian culture.'**
  String get fact_ir;

  /// No description provided for @fact_iq.
  ///
  /// In en, this message translates to:
  /// **'Iraq is an ancient land, considered the cradle of civilization, with historical sites from Mesopotamia.'**
  String get fact_iq;

  /// No description provided for @fact_ie.
  ///
  /// In en, this message translates to:
  /// **'Ireland is known for lush landscapes, Celtic traditions, and being the birthplace of Guinness.'**
  String get fact_ie;

  /// No description provided for @fact_il.
  ///
  /// In en, this message translates to:
  /// **'Israel is a land steeped in religious history for Jews, Christians, and Muslims, with diverse landscapes from desert to coastline.'**
  String get fact_il;

  /// No description provided for @fact_it.
  ///
  /// In en, this message translates to:
  /// **'Italy is famous for its food, fashion, and ancient landmarks like the Colosseum.'**
  String get fact_it;

  /// No description provided for @fact_jm.
  ///
  /// In en, this message translates to:
  /// **'Jamaica is the birthplace of reggae music and boasts beautiful beaches, lush mountains, and vibrant culture.'**
  String get fact_jm;

  /// No description provided for @fact_jp.
  ///
  /// In en, this message translates to:
  /// **'Japan blends ancient temples with futuristic tech and is known for cherry blossoms.'**
  String get fact_jp;

  /// No description provided for @fact_jo.
  ///
  /// In en, this message translates to:
  /// **'Jordan is home to the ancient city of Petra, one of the New7Wonders of the World, carved into rose-red cliffs.'**
  String get fact_jo;

  /// No description provided for @fact_kz.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan is the largest landlocked country in the world, with vast steppes and modern cities.'**
  String get fact_kz;

  /// No description provided for @fact_ke.
  ///
  /// In en, this message translates to:
  /// **'Kenya is famous for its diverse wildlife, the Great Migration, and stunning safari destinations.'**
  String get fact_ke;

  /// No description provided for @fact_ki.
  ///
  /// In en, this message translates to:
  /// **'Kiribati is a Pacific island nation comprised of 33 coral atolls and islands, known for its pristine marine environment.'**
  String get fact_ki;

  /// No description provided for @fact_kp.
  ///
  /// In en, this message translates to:
  /// **'North Korea is a reclusive country known for its unique political system and monumental architecture in Pyongyang.'**
  String get fact_kp;

  /// No description provided for @fact_kr.
  ///
  /// In en, this message translates to:
  /// **'South Korea is a global tech hub known for K-pop, kimchi, and high-speed internet.'**
  String get fact_kr;

  /// No description provided for @fact_kw.
  ///
  /// In en, this message translates to:
  /// **'Kuwait is an oil-rich nation known for its modern architecture, including the iconic Kuwait Towers.'**
  String get fact_kw;

  /// No description provided for @fact_kg.
  ///
  /// In en, this message translates to:
  /// **'Kyrgyzstan is a mountainous Central Asian country known for its nomadic traditions and stunning alpine lakes.'**
  String get fact_kg;

  /// No description provided for @fact_la.
  ///
  /// In en, this message translates to:
  /// **'Laos is a landlocked Southeast Asian country known for its Buddhist monasteries, French colonial architecture, and the Mekong River.'**
  String get fact_la;

  /// No description provided for @fact_lv.
  ///
  /// In en, this message translates to:
  /// **'Latvia is a Baltic country with vast forests, beautiful beaches, and a charming medieval Old Town in Riga.'**
  String get fact_lv;

  /// No description provided for @fact_lb.
  ///
  /// In en, this message translates to:
  /// **'Lebanon is a Middle Eastern country with ancient ruins, stunning mountain landscapes, and vibrant coastal cities.'**
  String get fact_lb;

  /// No description provided for @fact_ls.
  ///
  /// In en, this message translates to:
  /// **'Lesotho is a unique landlocked country entirely surrounded by South Africa, known as the \'Kingdom in the Sky\' for its high altitude.'**
  String get fact_ls;

  /// No description provided for @fact_lr.
  ///
  /// In en, this message translates to:
  /// **'Liberia is Africa\'s oldest republic, founded by freed American slaves, and is known for its beautiful coastline.'**
  String get fact_lr;

  /// No description provided for @fact_ly.
  ///
  /// In en, this message translates to:
  /// **'Libya is a North African country with a rich history dating back to ancient times, featuring Roman and Greek ruins.'**
  String get fact_ly;

  /// No description provided for @fact_li.
  ///
  /// In en, this message translates to:
  /// **'Liechtenstein is one of the smallest countries in the world, nestled in the Alps between Switzerland and Austria.'**
  String get fact_li;

  /// No description provided for @fact_lt.
  ///
  /// In en, this message translates to:
  /// **'Lithuania is a Baltic nation with beautiful coastal dunes, a rich pagan history, and a charming Baroque Old Town in Vilnius.'**
  String get fact_lt;

  /// No description provided for @fact_lu.
  ///
  /// In en, this message translates to:
  /// **'Luxembourg is one of the world\'s smallest and richest countries, known for its picturesque old town and financial services.'**
  String get fact_lu;

  /// No description provided for @fact_mg.
  ///
  /// In en, this message translates to:
  /// **'Madagascar is the world\'s fourth-largest island, famous for its unique wildlife, including lemurs, and diverse ecosystems.'**
  String get fact_mg;

  /// No description provided for @fact_mw.
  ///
  /// In en, this message translates to:
  /// **'Malawi is known as \'The Warm Heart of Africa\' for its friendly people and the stunning Lake Malawi, one of Africa\'s Great Lakes.'**
  String get fact_mw;

  /// No description provided for @fact_my.
  ///
  /// In en, this message translates to:
  /// **'Malaysia is a diverse country blending Malay, Chinese, and Indian cultures, known for its Petronas Towers and rainforests.'**
  String get fact_my;

  /// No description provided for @fact_mv.
  ///
  /// In en, this message translates to:
  /// **'Maldives is an island nation of thousands of coral islands, famous for its luxurious resorts and vibrant underwater world.'**
  String get fact_mv;

  /// No description provided for @fact_ml.
  ///
  /// In en, this message translates to:
  /// **'Mali is a West African nation with a rich history, home to the ancient city of Timbuktu and vibrant musical traditions.'**
  String get fact_ml;

  /// No description provided for @fact_mt.
  ///
  /// In en, this message translates to:
  /// **'Malta is a small archipelago in the Mediterranean, boasting ancient temples, medieval walled cities, and clear waters.'**
  String get fact_mt;

  /// No description provided for @fact_mr.
  ///
  /// In en, this message translates to:
  /// **'Mauritania is a West African nation largely covered by the Sahara Desert, known for its nomadic culture and ancient trading towns.'**
  String get fact_mr;

  /// No description provided for @fact_mu.
  ///
  /// In en, this message translates to:
  /// **'Mauritius is an Indian Ocean island nation known for its pristine beaches, lagoons, and vibrant multicultural society.'**
  String get fact_mu;

  /// No description provided for @fact_mx.
  ///
  /// In en, this message translates to:
  /// **'Mexico is the birthplace of chocolate and home to vibrant Day of the Dead celebrations.'**
  String get fact_mx;

  /// No description provided for @fact_md.
  ///
  /// In en, this message translates to:
  /// **'Moldova is a landlocked Eastern European country known for its vineyards and ancient monasteries.'**
  String get fact_md;

  /// No description provided for @fact_mc.
  ///
  /// In en, this message translates to:
  /// **'Monaco is a tiny, glamorous principality on the French Riviera, famous for its casinos, luxury yachts, and the Grand Prix.'**
  String get fact_mc;

  /// No description provided for @fact_mn.
  ///
  /// In en, this message translates to:
  /// **'Mongolia is the most sparsely populated country in the world, known for its vast steppes, nomadic culture, and the Gobi Desert.'**
  String get fact_mn;

  /// No description provided for @fact_me.
  ///
  /// In en, this message translates to:
  /// **'Montenegro is a Balkan country with dramatic mountains, medieval villages, and a stunning Adriatic coastline.'**
  String get fact_me;

  /// No description provided for @fact_ma.
  ///
  /// In en, this message translates to:
  /// **'Morocco is a North African country known for its vibrant souks, ancient medinas, and diverse landscapes from mountains to deserts.'**
  String get fact_ma;

  /// No description provided for @fact_mz.
  ///
  /// In en, this message translates to:
  /// **'Mozambique is an East African country with a long Indian Ocean coastline, rich in culture and pristine marine life.'**
  String get fact_mz;

  /// No description provided for @fact_mm.
  ///
  /// In en, this message translates to:
  /// **'Myanmar is a Southeast Asian nation known for its golden pagodas, ancient temples, and diverse ethnic groups.'**
  String get fact_mm;

  /// No description provided for @fact_na.
  ///
  /// In en, this message translates to:
  /// **'Namibia is famous for its towering red sand dunes of Sossusvlei, vast deserts, and abundant wildlife in Etosha National Park.'**
  String get fact_na;

  /// No description provided for @fact_np.
  ///
  /// In en, this message translates to:
  /// **'Nepal is home to Mount Everest, the world\'s highest peak, and a rich spiritual heritage with ancient temples and stupas.'**
  String get fact_np;

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

  /// No description provided for @fact_ni.
  ///
  /// In en, this message translates to:
  /// **'Nicaragua is the largest country in Central America, known for its dramatic volcanic landscapes and large freshwater lakes.'**
  String get fact_ni;

  /// No description provided for @fact_ne.
  ///
  /// In en, this message translates to:
  /// **'Niger is a landlocked West African nation largely covered by the Sahara Desert, known for its ancient trade routes.'**
  String get fact_ne;

  /// No description provided for @fact_ng.
  ///
  /// In en, this message translates to:
  /// **'Nigeria is Africa\'s most populous country, a vibrant cultural hub known for its music, film industry (Nollywood), and diverse ethnic groups.'**
  String get fact_ng;

  /// No description provided for @fact_no.
  ///
  /// In en, this message translates to:
  /// **'Norway is famous for its dramatic fjords, midnight sun, and Viking history.'**
  String get fact_no;

  /// No description provided for @fact_om.
  ///
  /// In en, this message translates to:
  /// **'Oman is an Arabian country with a rich maritime history, stunning desert landscapes, and dramatic mountain ranges.'**
  String get fact_om;

  /// No description provided for @fact_pk.
  ///
  /// In en, this message translates to:
  /// **'Pakistan is a diverse country with ancient civilizations, towering mountain ranges including K2, and vibrant cultural traditions.'**
  String get fact_pk;

  /// No description provided for @fact_pa.
  ///
  /// In en, this message translates to:
  /// **'Panama is most famous for the Panama Canal, a vital shipping route connecting the Atlantic and Pacific oceans.'**
  String get fact_pa;

  /// No description provided for @fact_pg.
  ///
  /// In en, this message translates to:
  /// **'Papua New Guinea is one of the world\'s most culturally diverse countries, with vast rainforests and unique wildlife.'**
  String get fact_pg;

  /// No description provided for @fact_py.
  ///
  /// In en, this message translates to:
  /// **'Paraguay is a landlocked South American country known for its vast Chaco wilderness and the Itaipu Dam, one of the world\'s largest.'**
  String get fact_py;

  /// No description provided for @fact_pe.
  ///
  /// In en, this message translates to:
  /// **'Peru is home to the ancient Inca city of Machu Picchu, the Amazon rainforest, and the majestic Andes mountains.'**
  String get fact_pe;

  /// No description provided for @fact_ph.
  ///
  /// In en, this message translates to:
  /// **'The Philippines is an archipelago of over 7,000 islands, famous for its stunning beaches, vibrant marine life, and warm hospitality.'**
  String get fact_ph;

  /// No description provided for @fact_pl.
  ///
  /// In en, this message translates to:
  /// **'Poland is home to Europe’s oldest restaurant and beautiful medieval cities like Kraków.'**
  String get fact_pl;

  /// No description provided for @fact_pt.
  ///
  /// In en, this message translates to:
  /// **'Portugal is known for its historic explorers, melancholic Fado music, and beautiful coastal landscapes.'**
  String get fact_pt;

  /// No description provided for @fact_qa.
  ///
  /// In en, this message translates to:
  /// **'Qatar is a desert peninsula known for its futuristic skyline in Doha, vast oil and gas reserves, and rapidly developing cultural scene.'**
  String get fact_qa;

  /// No description provided for @fact_ro.
  ///
  /// In en, this message translates to:
  /// **'Romania is known for its dramatic Carpathian Mountains, medieval castles like Bran Castle (Dracula\'s Castle), and rich folklore.'**
  String get fact_ro;

  /// No description provided for @fact_ru.
  ///
  /// In en, this message translates to:
  /// **'Russia spans 11 time zones and is home to the colorful Saint Basil\'s Cathedral.'**
  String get fact_ru;

  /// No description provided for @fact_rw.
  ///
  /// In en, this message translates to:
  /// **'Rwanda is known as the \'Land of a Thousand Hills\' and is a leading destination for gorilla trekking.'**
  String get fact_rw;

  /// No description provided for @fact_kn.
  ///
  /// In en, this message translates to:
  /// **'Saint Kitts and Nevis is a dual-island nation in the Caribbean, known for its volcanic landscapes and lush rainforests.'**
  String get fact_kn;

  /// No description provided for @fact_lc.
  ///
  /// In en, this message translates to:
  /// **'Saint Lucia is a Caribbean island known for its iconic twin volcanic peaks, the Pitons, and lush tropical scenery.'**
  String get fact_lc;

  /// No description provided for @fact_vc.
  ///
  /// In en, this message translates to:
  /// **'Saint Vincent and the Grenadines is a Caribbean nation of multiple islands, known for its volcanic landscapes and sailing destinations.'**
  String get fact_vc;

  /// No description provided for @fact_ws.
  ///
  /// In en, this message translates to:
  /// **'Samoa is a Polynesian island nation in the South Pacific, known for its beautiful beaches, pristine reefs, and lush interiors.'**
  String get fact_ws;

  /// No description provided for @fact_sm.
  ///
  /// In en, this message translates to:
  /// **'San Marino is an enclaved microstate surrounded by Italy, claiming to be the world\'s oldest republic.'**
  String get fact_sm;

  /// No description provided for @fact_st.
  ///
  /// In en, this message translates to:
  /// **'Sao Tome and Principe is an African island nation in the Gulf of Guinea, known for its volcanic landscapes and cocoa plantations.'**
  String get fact_st;

  /// No description provided for @fact_sa.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia is the birthplace of Islam, home to the holy cities of Mecca and Medina, and has vast desert landscapes.'**
  String get fact_sa;

  /// No description provided for @fact_sn.
  ///
  /// In en, this message translates to:
  /// **'Senegal is a West African nation known for its vibrant culture, diverse music, and the historic Gorée Island.'**
  String get fact_sn;

  /// No description provided for @fact_rs.
  ///
  /// In en, this message translates to:
  /// **'Serbia is a Balkan country with a rich history, ancient monasteries, and vibrant capital city of Belgrade.'**
  String get fact_rs;

  /// No description provided for @fact_sc.
  ///
  /// In en, this message translates to:
  /// **'Seychelles is an archipelago of 115 islands in the Indian Ocean, famous for its pristine beaches, unique granite boulders, and rare wildlife.'**
  String get fact_sc;

  /// No description provided for @fact_sl.
  ///
  /// In en, this message translates to:
  /// **'Sierra Leone is a West African country known for its beautiful white-sand beaches, especially the Freetown Peninsula.'**
  String get fact_sl;

  /// No description provided for @fact_sg.
  ///
  /// In en, this message translates to:
  /// **'Singapore is a futuristic island city-state known for its stunning architecture, lush gardens, and diverse culinary scene.'**
  String get fact_sg;

  /// No description provided for @fact_sk.
  ///
  /// In en, this message translates to:
  /// **'Slovakia is a Central European country with a dramatic mountain landscape, medieval castles, and charming old towns.'**
  String get fact_sk;

  /// No description provided for @fact_si.
  ///
  /// In en, this message translates to:
  /// **'Slovenia is a small but diverse European country, boasting Julian Alps, pristine lakes, and a picturesque Adriatic coastline.'**
  String get fact_si;

  /// No description provided for @fact_sb.
  ///
  /// In en, this message translates to:
  /// **'The Solomon Islands is a nation of hundreds of islands in the South Pacific, known for its World War II history and vibrant marine life.'**
  String get fact_sb;

  /// No description provided for @fact_so.
  ///
  /// In en, this message translates to:
  /// **'Somalia is a country on the Horn of Africa with a long coastline, known for its rich oral traditions and nomadic culture.'**
  String get fact_so;

  /// No description provided for @fact_za.
  ///
  /// In en, this message translates to:
  /// **'South Africa has three capital cities and is famous for safaris and Table Mountain.'**
  String get fact_za;

  /// No description provided for @fact_es.
  ///
  /// In en, this message translates to:
  /// **'Spain is known for flamenco dancing, siestas, and the running of the bulls.'**
  String get fact_es;

  /// No description provided for @fact_lk.
  ///
  /// In en, this message translates to:
  /// **'Sri Lanka is an island nation known for its ancient Buddhist ruins, stunning tea plantations, and beautiful beaches.'**
  String get fact_lk;

  /// No description provided for @fact_sd.
  ///
  /// In en, this message translates to:
  /// **'Sudan is an ancient land in Northeast Africa, home to more pyramids than Egypt and located at the confluence of the Blue and White Niles.'**
  String get fact_sd;

  /// No description provided for @fact_sr.
  ///
  /// In en, this message translates to:
  /// **'Suriname is a small South American country known for its vast untouched rainforests, Dutch colonial architecture, and diverse culture.'**
  String get fact_sr;

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

  /// No description provided for @fact_sy.
  ///
  /// In en, this message translates to:
  /// **'Syria is an ancient land with a rich history and numerous UNESCO World Heritage sites, showcasing millennia of civilizations.'**
  String get fact_sy;

  /// No description provided for @fact_tw.
  ///
  /// In en, this message translates to:
  /// **'Taiwan is a vibrant island democracy with towering skyscrapers, beautiful mountains, and rich culinary traditions.'**
  String get fact_tw;

  /// No description provided for @fact_tz.
  ///
  /// In en, this message translates to:
  /// **'Tanzania is home to Mount Kilimanjaro, Africa\'s highest peak, and the vast plains of the Serengeti, famed for its wildlife.'**
  String get fact_tz;

  /// No description provided for @fact_th.
  ///
  /// In en, this message translates to:
  /// **'Thailand is known as the \'Land of Smiles,\' famous for its ornate temples, bustling markets, and beautiful beaches.'**
  String get fact_th;

  /// No description provided for @fact_tl.
  ///
  /// In en, this message translates to:
  /// **'Timor-Leste is one of the world\'s newest countries, known for its rugged mountains, pristine coral reefs, and coffee production.'**
  String get fact_tl;

  /// No description provided for @fact_tg.
  ///
  /// In en, this message translates to:
  /// **'Togo is a West African nation known for its palm-lined beaches and hilly interior with traditional villages.'**
  String get fact_tg;

  /// No description provided for @fact_to.
  ///
  /// In en, this message translates to:
  /// **'Tonga is the only remaining Polynesian monarchy, known for its pristine beaches, coral reefs, and humpback whale migrations.'**
  String get fact_to;

  /// No description provided for @fact_tt.
  ///
  /// In en, this message translates to:
  /// **'Trinidad and Tobago is a dual-island nation known for its vibrant Carnival celebrations, calypso, and steelpan music.'**
  String get fact_tt;

  /// No description provided for @fact_tn.
  ///
  /// In en, this message translates to:
  /// **'Tunisia is a North African country with a rich history dating back to ancient Carthage and Roman times, and beautiful Mediterranean coastlines.'**
  String get fact_tn;

  /// No description provided for @fact_tr.
  ///
  /// In en, this message translates to:
  /// **'Turkey spans two continents and is home to ancient wonders like Hagia Sophia.'**
  String get fact_tr;

  /// No description provided for @fact_tm.
  ///
  /// In en, this message translates to:
  /// **'Turkmenistan is a Central Asian nation known for its vast Karakum Desert, ancient Silk Road cities, and the \'Door to Hell\' gas crater.'**
  String get fact_tm;

  /// No description provided for @fact_ug.
  ///
  /// In en, this message translates to:
  /// **'Uganda is known as the \'Pearl of Africa\' for its diverse landscapes, including Lake Victoria, and gorilla trekking opportunities.'**
  String get fact_ug;

  /// No description provided for @fact_ua.
  ///
  /// In en, this message translates to:
  /// **'Ukraine is the largest country entirely within Europe, known for its rich cultural heritage, vibrant capital Kyiv, and diverse landscapes.'**
  String get fact_ua;

  /// No description provided for @fact_ae.
  ///
  /// In en, this message translates to:
  /// **'The United Arab Emirates is a federation of emirates known for its futuristic skylines, luxury tourism, and vast desert landscapes.'**
  String get fact_ae;

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

  /// No description provided for @fact_uy.
  ///
  /// In en, this message translates to:
  /// **'Uruguay is a small South American country known for its relaxed lifestyle, beautiful beaches, and vibrant tango culture.'**
  String get fact_uy;

  /// No description provided for @fact_uz.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan is a Central Asian nation at the heart of the ancient Silk Road, home to stunning Islamic architecture in Samarkand and Bukhara.'**
  String get fact_uz;

  /// No description provided for @fact_vu.
  ///
  /// In en, this message translates to:
  /// **'Vanuatu is a South Pacific island nation known for its active volcanoes, vibrant tribal cultures, and underwater post office.'**
  String get fact_vu;

  /// No description provided for @fact_va.
  ///
  /// In en, this message translates to:
  /// **'Vatican City is the smallest independent state in the world, the spiritual home of the Roman Catholic Church, and home to St. Peter\'s Basilica.'**
  String get fact_va;

  /// No description provided for @fact_ve.
  ///
  /// In en, this message translates to:
  /// **'Venezuela is home to Angel Falls, the world\'s highest uninterrupted waterfall, and diverse ecosystems.'**
  String get fact_ve;

  /// No description provided for @fact_vn.
  ///
  /// In en, this message translates to:
  /// **'Vietnam is known for its stunning natural beauty, from the limestone karsts of Ha Long Bay to the Mekong Delta, and rich history.'**
  String get fact_vn;

  /// No description provided for @fact_ye.
  ///
  /// In en, this message translates to:
  /// **'Yemen is an ancient land on the Arabian Peninsula with a unique architectural heritage, including the mud-brick skyscrapers of Shibam.'**
  String get fact_ye;

  /// No description provided for @fact_zm.
  ///
  /// In en, this message translates to:
  /// **'Zambia is a landlocked Southern African country famous for Victoria Falls, one of the world\'s largest waterfalls, and abundant wildlife.'**
  String get fact_zm;

  /// No description provided for @fact_zw.
  ///
  /// In en, this message translates to:
  /// **'Zimbabwe is a Southern African nation known for the spectacular Victoria Falls, abundant wildlife in national parks, and ancient Great Zimbabwe ruins.'**
  String get fact_zw;

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
