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

  /// No description provided for @nearby_places_around.
  ///
  /// In en, this message translates to:
  /// **'Nearby places around'**
  String get nearby_places_around;

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
