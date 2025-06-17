import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  // API and icon URLs for OpenWeatherMap
  static const String apiUrl = "https://api.openweathermap.org/";
  static const String iconUrl = "https://openweathermap.org/img/w/<ICON_ID>.png";

  static String get openWeatherApiKey => dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  static String get timeZoneApiKey => dotenv.env['TIMEZONE_API_KEY'] ?? '';
  static String get mapsApiKey => dotenv.env['MAPS_API_KEY'] ?? '';


  static const List<Map<String, dynamic>> supportedCountries = [
    {'nameKey': 'country_af', 'code': 'AF', 'lat': 34.5289, 'lng': 69.1725}, // Afghanistan, Kabul
    {'nameKey': 'country_al', 'code': 'AL', 'lat': 41.3275, 'lng': 19.8189}, // Albania, Tiranë
    {'nameKey': 'country_dz', 'code': 'DZ', 'lat': 36.7525, 'lng': 3.0420}, // Algeria, Algiers
    {'nameKey': 'country_ad', 'code': 'AD', 'lat': 42.5078, 'lng': 1.5211}, // Andorra, Andorra la Vella
    {'nameKey': 'country_ao', 'code': 'AO', 'lat': -8.8368, 'lng': 13.2343}, // Angola, Luanda
    {'nameKey': 'country_ag', 'code': 'AG', 'lat': 17.1172, 'lng': -61.8457}, // Antigua and Barbuda, St. John's
    {'nameKey': 'country_ar', 'code': 'AR', 'lat': -34.6051, 'lng': -58.4004}, // Argentina, Buenos Aires
    {'nameKey': 'country_am', 'code': 'AM', 'lat': 40.1820, 'lng': 44.5146}, // Armenia, Yerevan
    {'nameKey': 'country_au', 'code': 'AU', 'lat': -35.2835, 'lng': 149.1281}, // Australia, Canberra
    {'nameKey': 'country_at', 'code': 'AT', 'lat': 48.2064, 'lng': 16.3707}, // Austria, Vienna
    {'nameKey': 'country_az', 'code': 'AZ', 'lat': 40.3777, 'lng': 49.8920}, // Azerbaijan, Baku
    {'nameKey': 'country_bs', 'code': 'BS', 'lat': 25.0582, 'lng': -77.3431}, // Bahamas, Nassau
    {'nameKey': 'country_bh', 'code': 'BH', 'lat': 26.2154, 'lng': 50.5832}, // Bahrain, Manama
    {'nameKey': 'country_bd', 'code': 'BD', 'lat': 23.7104, 'lng': 90.4074}, // Bangladesh, Dhaka
    {'nameKey': 'country_bb', 'code': 'BB', 'lat': 13.1000, 'lng': -59.6167}, // Barbados, Bridgetown
    {'nameKey': 'country_by', 'code': 'BY', 'lat': 53.9000, 'lng': 27.5667}, // Belarus, Minsk
    {'nameKey': 'country_be', 'code': 'BE', 'lat': 50.8467, 'lng': 4.3499}, // Belgium, Brussels
    {'nameKey': 'country_bz', 'code': 'BZ', 'lat': 17.2500, 'lng': -88.7667}, // Belize, Belmopan
    {'nameKey': 'country_bj', 'code': 'BJ', 'lat': 6.3654, 'lng': 2.4183}, // Benin, Cotonou (Economic Capital)
    {'nameKey': 'country_bt', 'code': 'BT', 'lat': 27.4661, 'lng': 89.6419}, // Bhutan, Thimphu
    {'nameKey': 'country_bo', 'code': 'BO', 'lat': -16.5000, 'lng': -68.1500}, // Bolivia, La Paz (Seat of Government)
    {'nameKey': 'country_ba', 'code': 'BA', 'lat': 43.8486, 'lng': 18.3564}, // Bosnia and Herzegovina, Sarajevo
    {'nameKey': 'country_bw', 'code': 'BW', 'lat': -24.6545, 'lng': 25.9086}, // Botswana, Gaborone
    {'nameKey': 'country_br', 'code': 'BR', 'lat': -15.7797, 'lng': -47.9297}, // Brazil, Brasília
    {'nameKey': 'country_bn', 'code': 'BN', 'lat': 4.9403, 'lng': 114.9481}, // Brunei Darussalam, Bandar Seri Begawan
    {'nameKey': 'country_bg', 'code': 'BG', 'lat': 42.6975, 'lng': 23.3241}, // Bulgaria, Sofia
    {'nameKey': 'country_bf', 'code': 'BF', 'lat': 12.3714, 'lng': -1.5197}, // Burkina Faso, Ouagadougou
    {'nameKey': 'country_bi', 'code': 'BI', 'lat': -3.3730, 'lng': 29.9189}, // Burundi, Gitega
    {'nameKey': 'country_cv', 'code': 'CV', 'lat': 14.9333, 'lng': -23.5167}, // Cabo Verde, Praia
    {'nameKey': 'country_kh', 'code': 'KH', 'lat': 11.5500, 'lng': 104.9167}, // Cambodia, Phnom Penh
    {'nameKey': 'country_cm', 'code': 'CM', 'lat': 3.8617, 'lng': 11.5206}, // Cameroon, Yaoundé
    {'nameKey': 'country_ca', 'code': 'CA', 'lat': 45.4215, 'lng': -75.6972}, // Canada, Ottawa
    {'nameKey': 'country_cf', 'code': 'CF', 'lat': 4.3612, 'lng': 18.5582}, // Central African Republic, Bangui
    {'nameKey': 'country_td', 'code': 'TD', 'lat': 12.1064, 'lng': 15.0444}, // Chad, N'Djamena
    {'nameKey': 'country_cl', 'code': 'CL', 'lat': -33.4378, 'lng': -70.6504}, // Chile, Santiago
    {'nameKey': 'country_cn', 'code': 'CN', 'lat': 39.9042, 'lng': 116.4074}, // China, Beijing
    {'nameKey': 'country_co', 'code': 'CO', 'lat': 4.7110, 'lng': -74.0721}, // Colombia, Bogotá
    {'nameKey': 'country_km', 'code': 'KM', 'lat': -11.6667, 'lng': 43.2500}, // Comoros, Moroni
    {'nameKey': 'country_cd', 'code': 'CD', 'lat': -4.3225, 'lng': 15.3228}, // DR Congo, Kinshasa
    {'nameKey': 'country_cg', 'code': 'CG', 'lat': -4.2644, 'lng': 15.2831}, // Republic of the Congo, Brazzaville
    {'nameKey': 'country_cr', 'code': 'CR', 'lat': 9.9281, 'lng': -84.0907}, // Costa Rica, San José
    {'nameKey': 'country_ci', 'code': 'CI', 'lat': 6.8208, 'lng': -5.2856}, // Côte d'Ivoire, Yamoussoukro
    {'nameKey': 'country_hr', 'code': 'HR', 'lat': 45.8150, 'lng': 15.9819}, // Croatia, Zagreb
    {'nameKey': 'country_cu', 'code': 'CU', 'lat': 23.1333, 'lng': -82.3833}, // Cuba, Havana
    {'nameKey': 'country_cy', 'code': 'CY', 'lat': 35.1856, 'lng': 33.3823}, // Cyprus, Nicosia
    {'nameKey': 'country_cz', 'code': 'CZ', 'lat': 50.0755, 'lng': 14.4378}, // Czechia, Prague
    {'nameKey': 'country_dk', 'code': 'DK', 'lat': 55.6761, 'lng': 12.5683}, // Denmark, Copenhagen
    {'nameKey': 'country_dj', 'code': 'DJ', 'lat': 11.5886, 'lng': 43.1408}, // Djibouti, Djibouti City
    {'nameKey': 'country_dm', 'code': 'DM', 'lat': 15.3000, 'lng': -61.3833}, // Dominica, Roseau
    {'nameKey': 'country_do', 'code': 'DO', 'lat': 18.4861, 'lng': -69.9320}, // Dominican Republic, Santo Domingo
    {'nameKey': 'country_ec', 'code': 'EC', 'lat': -0.2298, 'lng': -78.5249}, // Ecuador, Quito
    {'nameKey': 'country_eg', 'code': 'EG', 'lat': 30.0444, 'lng': 31.2357}, // Egypt, Cairo
    {'nameKey': 'country_sv', 'code': 'SV', 'lat': 13.6929, 'lng': -89.2182}, // El Salvador, San Salvador
    {'nameKey': 'country_gq', 'code': 'GQ', 'lat': 3.7500, 'lng': 8.7833}, // Equatorial Guinea, Malabo
    {'nameKey': 'country_er', 'code': 'ER', 'lat': 15.3228, 'lng': 38.9250}, // Eritrea, Asmara
    {'nameKey': 'country_ee', 'code': 'EE', 'lat': 59.4369, 'lng': 24.7535}, // Estonia, Tallinn
    {'nameKey': 'country_sz', 'code': 'SZ', 'lat': -26.3150, 'lng': 31.1396}, // Eswatini, Mbabane
    {'nameKey': 'country_et', 'code': 'ET', 'lat': 9.0146, 'lng': 38.7636}, // Ethiopia, Addis Ababa
    {'nameKey': 'country_fj', 'code': 'FJ', 'lat': -18.1250, 'lng': 178.4419}, // Fiji, Suva
    {'nameKey': 'country_fi', 'code': 'FI', 'lat': 60.1695, 'lng': 24.9354}, // Finland, Helsinki
    {'nameKey': 'country_fr', 'code': 'FR', 'lat': 48.8566, 'lng': 2.3522}, // France, Paris
    {'nameKey': 'country_ga', 'code': 'GA', 'lat': -0.3957, 'lng': 9.4542}, // Gabon, Libreville
    {'nameKey': 'country_gm', 'code': 'GM', 'lat': 13.4549, 'lng': -16.5772}, // Gambia, Banjul
    {'nameKey': 'country_ge', 'code': 'GE', 'lat': 41.7151, 'lng': 44.8271}, // Georgia, Tbilisi
    {'nameKey': 'country_de', 'code': 'DE', 'lat': 52.5200, 'lng': 13.4050}, // Germany, Berlin
    {'nameKey': 'country_gh', 'code': 'GH', 'lat': 5.5560, 'lng': -0.1969}, // Ghana, Accra
    {'nameKey': 'country_gr', 'code': 'GR', 'lat': 37.9838, 'lng': 23.7275}, // Greece, Athens
    {'nameKey': 'country_gd', 'code': 'GD', 'lat': 12.0500, 'lng': -61.7500}, // Grenada, St. George's
    {'nameKey': 'country_gt', 'code': 'GT', 'lat': 14.6284, 'lng': -90.5228}, // Guatemala, Guatemala City
    {'nameKey': 'country_gn', 'code': 'GN', 'lat': 9.5000, 'lng': -13.6833}, // Guinea, Conakry
    {'nameKey': 'country_gw', 'code': 'GW', 'lat': 11.8667, 'lng': -15.5833}, // Guinea-Bissau, Bissau
    {'nameKey': 'country_gy', 'code': 'GY', 'lat': 6.8042, 'lng': -58.1550}, // Guyana, Georgetown
    {'nameKey': 'country_ht', 'code': 'HT', 'lat': 18.5392, 'lng': -72.3364}, // Haiti, Port-au-Prince
    {'nameKey': 'country_hn', 'code': 'HN', 'lat': 14.0818, 'lng': -87.2068}, // Honduras, Tegucigalpa
    {'nameKey': 'country_hu', 'code': 'HU', 'lat': 47.4979, 'lng': 19.0402}, // Hungary, Budapest
    {'nameKey': 'country_is', 'code': 'IS', 'lat': 64.1265, 'lng': -21.8174}, // Iceland, Reykjavík
    {'nameKey': 'country_in', 'code': 'IN', 'lat': 28.6139, 'lng': 77.2090}, // India, New Delhi
    {'nameKey': 'country_id', 'code': 'ID', 'lat': -6.2088, 'lng': 106.8456}, // Indonesia, Jakarta
    {'nameKey': 'country_ir', 'code': 'IR', 'lat': 35.6892, 'lng': 51.3890}, // Iran, Tehran
    {'nameKey': 'country_iq', 'code': 'IQ', 'lat': 33.3152, 'lng': 44.3661}, // Iraq, Baghdad
    {'nameKey': 'country_ie', 'code': 'IE', 'lat': 53.3498, 'lng': -6.2603}, // Ireland, Dublin
    {'nameKey': 'country_il', 'code': 'IL', 'lat': 31.7683, 'lng': 35.2137}, // Israel, Jerusalem
    {'nameKey': 'country_it', 'code': 'IT', 'lat': 41.9028, 'lng': 12.4964}, // Italy, Rome
    {'nameKey': 'country_jm', 'code': 'JM', 'lat': 17.9970, 'lng': -76.7936}, // Jamaica, Kingston
    {'nameKey': 'country_jp', 'code': 'JP', 'lat': 35.6897, 'lng': 139.6922}, // Japan, Tokyo
    {'nameKey': 'country_jo', 'code': 'JO', 'lat': 31.9565, 'lng': 35.9450}, // Jordan, Amman
    {'nameKey': 'country_kz', 'code': 'KZ', 'lat': 51.1694, 'lng': 71.4491}, // Kazakhstan, Astana
    {'nameKey': 'country_ke', 'code': 'KE', 'lat': -1.2863, 'lng': 36.8172}, // Kenya, Nairobi
    {'nameKey': 'country_ki', 'code': 'KI', 'lat': 1.4333, 'lng': 173.0000}, // Kiribati, South Tarawa
    {'nameKey': 'country_kp', 'code': 'KP', 'lat': 39.0392, 'lng': 125.7625}, // North Korea, Pyongyang
    {'nameKey': 'country_kr', 'code': 'KR', 'lat': 37.5665, 'lng': 126.9780}, // South Korea, Seoul
    {'nameKey': 'country_kw', 'code': 'KW', 'lat': 29.3759, 'lng': 47.9774}, // Kuwait, Kuwait City
    {'nameKey': 'country_kg', 'code': 'KG', 'lat': 42.8746, 'lng': 74.5698}, // Kyrgyzstan, Bishkek
    {'nameKey': 'country_la', 'code': 'LA', 'lat': 17.9757, 'lng': 102.6331}, // Laos, Vientiane
    {'nameKey': 'country_lv', 'code': 'LV', 'lat': 56.9496, 'lng': 24.1052}, // Latvia, Riga
    {'nameKey': 'country_lb', 'code': 'LB', 'lat': 33.8889, 'lng': 35.4955}, // Lebanon, Beirut
    {'nameKey': 'country_ls', 'code': 'LS', 'lat': -29.3100, 'lng': 27.4800}, // Lesotho, Maseru
    {'nameKey': 'country_lr', 'code': 'LR', 'lat': 6.3000, 'lng': -10.8000}, // Liberia, Monrovia
    {'nameKey': 'country_ly', 'code': 'LY', 'lat': 32.8872, 'lng': 13.1913}, // Libya, Tripoli
    {'nameKey': 'country_li', 'code': 'LI', 'lat': 47.1400, 'lng': 9.5200}, // Liechtenstein, Vaduz
    {'nameKey': 'country_lt', 'code': 'LT', 'lat': 54.6872, 'lng': 25.2797}, // Lithuania, Vilnius
    {'nameKey': 'country_lu', 'code': 'LU', 'lat': 49.6116, 'lng': 6.1296}, // Luxembourg, Luxembourg City
    {'nameKey': 'country_mg', 'code': 'MG', 'lat': -18.8792, 'lng': 47.5079}, // Madagascar, Antananarivo
    {'nameKey': 'country_mw', 'code': 'MW', 'lat': -13.9883, 'lng': 33.7845}, // Malawi, Lilongwe
    {'nameKey': 'country_my', 'code': 'MY', 'lat': 3.1390, 'lng': 101.6869}, // Malaysia, Kuala Lumpur
    {'nameKey': 'country_mv', 'code': 'MV', 'lat': 4.1755, 'lng': 73.5093}, // Maldives, Malé
    {'nameKey': 'country_ml', 'code': 'ML', 'lat': 12.6392, 'lng': -7.9887}, // Mali, Bamako
    {'nameKey': 'country_mt', 'code': 'MT', 'lat': 35.8989, 'lng': 14.5146}, // Malta, Valletta
    {'nameKey': 'country_mr', 'code': 'MR', 'lat': 18.0730, 'lng': -15.9582}, // Mauritania, Nouakchott
    {'nameKey': 'country_mu', 'code': 'MU', 'lat': -20.1600, 'lng': 57.5000}, // Mauritius, Port Louis
    {'nameKey': 'country_mx', 'code': 'MX', 'lat': 19.4326, 'lng': -99.1332}, // Mexico, Mexico City
    {'nameKey': 'country_md', 'code': 'MD', 'lat': 47.0167, 'lng': 28.8500}, // Moldova, Chișinău
    {'nameKey': 'country_mc', 'code': 'MC', 'lat': 43.7333, 'lng': 7.4167}, // Monaco, Monaco
    {'nameKey': 'country_mn', 'code': 'MN', 'lat': 47.9190, 'lng': 106.8760}, // Mongolia, Ulaanbaatar
    {'nameKey': 'country_me', 'code': 'ME', 'lat': 42.4304, 'lng': 19.2591}, // Montenegro, Podgorica
    {'nameKey': 'country_ma', 'code': 'MA', 'lat': 34.0209, 'lng': -6.8416}, // Morocco, Rabat
    {'nameKey': 'country_mz', 'code': 'MZ', 'lat': -25.9653, 'lng': 32.5852}, // Mozambique, Maputo
    {'nameKey': 'country_mm', 'code': 'MM', 'lat': 19.7633, 'lng': 96.1309}, // Myanmar, Naypyidaw
    {'nameKey': 'country_na', 'code': 'NA', 'lat': -22.5594, 'lng': 17.0832}, // Namibia, Windhoek
    {'nameKey': 'country_np', 'code': 'NP', 'lat': 27.7172, 'lng': 85.3240}, // Nepal, Kathmandu
    {'nameKey': 'country_nl', 'code': 'NL', 'lat': 52.3676, 'lng': 4.9041}, // Netherlands, Amsterdam
    {'nameKey': 'country_nz', 'code': 'NZ', 'lat': -41.2865, 'lng': 174.7762}, // New Zealand, Wellington
    {'nameKey': 'country_ni', 'code': 'NI', 'lat': 12.1364, 'lng': -86.2514}, // Nicaragua, Managua
    {'nameKey': 'country_ne', 'code': 'NE', 'lat': 13.5115, 'lng': 2.1267}, // Niger, Niamey
    {'nameKey': 'country_ng', 'code': 'NG', 'lat': 9.0765, 'lng': 7.3986}, // Nigeria, Abuja
    {'nameKey': 'country_no', 'code': 'NO', 'lat': 59.9139, 'lng': 10.7522}, // Norway, Oslo
    {'nameKey': 'country_om', 'code': 'OM', 'lat': 23.5859, 'lng': 58.4613}, // Oman, Muscat
    {'nameKey': 'country_pk', 'code': 'PK', 'lat': 30.3753, 'lng': 69.3451}, // Pakistan, Islamabad
    {'nameKey': 'country_pa', 'code': 'PA', 'lat': 8.9824, 'lng': -79.5199}, // Panama, Panama City
    {'nameKey': 'country_pg', 'code': 'PG', 'lat': -9.4438, 'lng': 147.1797}, // Papua New Guinea, Port Moresby
    {'nameKey': 'country_py', 'code': 'PY', 'lat': -25.2637, 'lng': -57.5759}, // Paraguay, Asunción
    {'nameKey': 'country_pe', 'code': 'PE', 'lat': -12.0464, 'lng': -77.0428}, // Peru, Lima
    {'nameKey': 'country_ph', 'code': 'PH', 'lat': 14.5995, 'lng': 120.9842}, // Philippines, Manila
    {'nameKey': 'country_pl', 'code': 'PL', 'lat': 52.2297, 'lng': 21.0122}, // Poland, Warsaw
    {'nameKey': 'country_pt', 'code': 'PT', 'lat': 38.7223, 'lng': -9.1393}, // Portugal, Lisbon
    {'nameKey': 'country_qa', 'code': 'QA', 'lat': 25.2854, 'lng': 51.5310}, // Qatar, Doha
    {'nameKey': 'country_ro', 'code': 'RO', 'lat': 44.4268, 'lng': 26.1025}, // Romania, Bucharest
    {'nameKey': 'country_ru', 'code': 'RU', 'lat': 55.7558, 'lng': 37.6173}, // Russia, Moscow
    {'nameKey': 'country_rw', 'code': 'RW', 'lat': -1.9403, 'lng': 29.8739}, // Rwanda, Kigali
    {'nameKey': 'country_kn', 'code': 'KN', 'lat': 17.3000, 'lng': -62.7333}, // Saint Kitts and Nevis, Basseterre
    {'nameKey': 'country_lc', 'code': 'LC', 'lat': 14.0167, 'lng': -60.9833}, // Saint Lucia, Castries
    {'nameKey': 'country_vc', 'code': 'VC', 'lat': 13.1500, 'lng': -61.2000}, // Saint Vincent and the Grenadines, Kingstown
    {'nameKey': 'country_ws', 'code': 'WS', 'lat': -13.8333, 'lng': -171.7667}, // Samoa, Apia
    {'nameKey': 'country_sm', 'code': 'SM', 'lat': 43.9424, 'lng': 12.4578}, // San Marino, San Marino
    {'nameKey': 'country_st', 'code': 'ST', 'lat': 0.3366, 'lng': 6.7317}, // Sao Tome and Principe, São Tomé
    {'nameKey': 'country_sa', 'code': 'SA', 'lat': 24.7136, 'lng': 46.6753}, // Saudi Arabia, Riyadh
    {'nameKey': 'country_sn', 'code': 'SN', 'lat': 14.7167, 'lng': -17.4677}, // Senegal, Dakar
    {'nameKey': 'country_rs', 'code': 'RS', 'lat': 44.7872, 'lng': 20.4573}, // Serbia, Belgrade
    {'nameKey': 'country_sc', 'code': 'SC', 'lat': -4.6167, 'lng': 55.4500}, // Seychelles, Victoria
    {'nameKey': 'country_sl', 'code': 'SL', 'lat': 8.4844, 'lng': -13.2344}, // Sierra Leone, Freetown
    {'nameKey': 'country_sg', 'code': 'SG', 'lat': 1.3521, 'lng': 103.8198}, // Singapore, Singapore
    {'nameKey': 'country_sk', 'code': 'SK', 'lat': 48.1486, 'lng': 17.1077}, // Slovakia, Bratislava
    {'nameKey': 'country_si', 'code': 'SI', 'lat': 46.0569, 'lng': 14.5058}, // Slovenia, Ljubljana
    {'nameKey': 'country_sb', 'code': 'SB', 'lat': -9.4333, 'lng': 160.0333}, // Solomon Islands, Honiara
    {'nameKey': 'country_so', 'code': 'SO', 'lat': 2.0371, 'lng': 45.3438}, // Somalia, Mogadishu
    {'nameKey': 'country_za', 'code': 'ZA', 'lat': -25.7479, 'lng': 28.2293}, // South Africa, Pretoria (Executive), Cape Town (Legislative), Bloemfontein (Judicial) - using Pretoria
    {'nameKey': 'country_es', 'code': 'ES', 'lat': 40.4168, 'lng': -3.7038}, // Spain, Madrid
    {'nameKey': 'country_lk', 'code': 'LK', 'lat': 6.9271, 'lng': 79.8612}, // Sri Lanka, Sri Jayawardenepura Kotte (Legislative/Judicial), Colombo (Commercial/Executive) - using Kotte
    {'nameKey': 'country_sd', 'code': 'SD', 'lat': 15.5000, 'lng': 32.5500}, // Sudan, Khartoum
    {'nameKey': 'country_sr', 'code': 'SR', 'lat': 5.8239, 'lng': -55.1679}, // Suriname, Paramaribo
    {'nameKey': 'country_se', 'code': 'SE', 'lat': 59.3293, 'lng': 18.0686}, // Sweden, Stockholm
    {'nameKey': 'country_ch', 'code': 'CH', 'lat': 46.9481, 'lng': 7.4474}, // Switzerland, Bern
    {'nameKey': 'country_sy', 'code': 'SY', 'lat': 33.5130, 'lng': 36.2913}, // Syria, Damascus
    {'nameKey': 'country_tw', 'code': 'TW', 'lat': 25.0330, 'lng': 121.5654}, // Taiwan, Taipei (often listed as 'country_cn' in some contexts, using separate entry for clarity)
    {'nameKey': 'country_tz', 'code': 'TZ', 'lat': -6.1631, 'lng': 35.7512}, // Tanzania, Dodoma
    {'nameKey': 'country_th', 'code': 'TH', 'lat': 13.7563, 'lng': 100.5018}, // Thailand, Bangkok
    {'nameKey': 'country_tl', 'code': 'TL', 'lat': -8.5583, 'lng': 125.5603}, // Timor-Leste, Dili
    {'nameKey': 'country_tg', 'code': 'TG', 'lat': 6.1319, 'lng': 1.2228}, // Togo, Lomé
    {'nameKey': 'country_to', 'code': 'TO', 'lat': -21.1354, 'lng': -175.2163}, // Tonga, Nukuʻalofa
    {'nameKey': 'country_tt', 'code': 'TT', 'lat': 10.6918, 'lng': -61.2225}, // Trinidad and Tobago, Port of Spain
    {'nameKey': 'country_tn', 'code': 'TN', 'lat': 33.8869, 'lng': 9.5375}, // Tunisia, Tunis
    {'nameKey': 'country_tr', 'code': 'TR', 'lat': 39.9334, 'lng': 32.8597}, // Turkey, Ankara
    {'nameKey': 'country_tm', 'code': 'TM', 'lat': 37.9602, 'lng': 58.3260}, // Turkmenistan, Ashgabat
    {'nameKey': 'country_ug', 'code': 'UG', 'lat': 0.3476, 'lng': 32.5825}, // Uganda, Kampala
    {'nameKey': 'country_ua', 'code': 'UA', 'lat': 50.4501, 'lng': 30.5234}, // Ukraine, Kyiv
    {'nameKey': 'country_ae', 'code': 'AE', 'lat': 24.4539, 'lng': 54.3773}, // United Arab Emirates, Abu Dhabi
    {'nameKey': 'country_gb', 'code': 'GB', 'lat': 51.5074, 'lng': -0.1278}, // United Kingdom, London
    {'nameKey': 'country_us', 'code': 'US', 'lat': 38.9072, 'lng': -77.0369}, // United States, Washington D.C.
    {'nameKey': 'country_uy', 'code': 'UY', 'lat': -34.9011, 'lng': -56.1645}, // Uruguay, Montevideo
    {'nameKey': 'country_uz', 'code': 'UZ', 'lat': 41.2995, 'lng': 69.2401}, // Uzbekistan, Tashkent
    {'nameKey': 'country_vu', 'code': 'VU', 'lat': -17.7126, 'lng': 168.3377}, // Vanuatu, Port Vila
    {'nameKey': 'country_va', 'code': 'VA', 'lat': 41.9029, 'lng': 12.4534}, // Vatican City, Vatican City
    {'nameKey': 'country_ve', 'code': 'VE', 'lat': 10.4806, 'lng': -66.9036}, // Venezuela, Caracas
    {'nameKey': 'country_vn', 'code': 'VN', 'lat': 21.0285, 'lng': 105.8542}, // Vietnam, Hanoi
    {'nameKey': 'country_ye', 'code': 'YE', 'lat': 15.3694, 'lng': 44.1910}, // Yemen, Sana'a
    {'nameKey': 'country_zm', 'code': 'ZM', 'lat': -15.4167, 'lng': 28.2833}, // Zambia, Lusaka
    {'nameKey': 'country_zw', 'code': 'ZW', 'lat': -17.8252, 'lng': 31.0335}, // Zimbabwe, Harare
  ];
}
