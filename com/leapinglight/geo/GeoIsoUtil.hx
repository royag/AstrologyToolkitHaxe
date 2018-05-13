package com.leapinglight.geo;

class GeoIsoUtil
{

	public function new() {	}
	
	public static function countryCodeForIsoCode(iso:String) : String {
		if (iso != null) {
			iso = iso.toUpperCase();
			if (Reflect.hasField(ISO_TO_CODE, iso)) {
				return Reflect.field(ISO_TO_CODE, iso);
			} else if (iso == "US") {
				return "USDC";
			}
		}
		return "UK";
	}
	
	private static var ISO_TO_CODE = {
		"AE":"AE",
		"AL":"AL",
		"AM":"AM",
		"AR":"AR",
		"AT":"AU",
		"AU":"AS",
		"BE":"BE",
		"BG":"BU",
		"BH":"BA",
		"BN":"BX",
		"BO":"BL",
		"BR":"BR",
		"BY":"BO",
		"BZ":"BH",
		"CA":"CA",
		// missing: CB=Caribbean
		"CH":"SZ",
		"CL":"CI",
		"CN":"CH",
		"CO":"CO",
		"CR":"CS",
		"CZ":"EZ",
		"DE":"GM",
		"DK":"DA",
		"DO":"DR",
		"DZ":"AG",
		"EC":"EC",
		"EE":"EN",
		"EG":"EG",
		"ES":"SP",
		"FI":"FI",
		"FO":"FO",
		"FR":"FR",
		"GB":"UK",
		"GE":"GG",
		"GR":"GR",
		"GT":"GT",
		"HK":"HK",
		"HN":"HO",
		"HR":"HR",
		"HU":"HU",
		"ID":"ID",
		"IE":"EI",
		"IL":"IS",
		"IN":"IN",
		"IQ":"IZ",
		"IR":"IR",
		"IS":"IC",
		"IT":"IT",
		"JM":"JM",
		"JO":"JO",
		"JP":"JA",
		"KE":"KE",
		"KR":"KS", // South-Korea // missing: KR=Korea
		"KW":"KU",
		"KZ":"KZ",
		"LB":"LE",
		"LI":"LS",
		"LT":"LH",
		"LU":"LU",
		"LV":"LG",
		"LY":"LY",
		"MA":"MO",
		"MC":"MN",
		"MN":"MG",
		// missing: MO=Macau SAR
		"MV":"MV",
		"MX":"MX",
		"MY":"MY",
		"NI":"NU",
		"NL":"NL",
		"NO":"NO",
		"NZ":"NZ",
		"OM":"MU",
		"PA":"PM",
		"PE":"PE",
		"PH":"RP",
		"PK":"PK",
		"PL":"PL",
		"PR":"USPR",// missing: PR=Puerto Rico
		"PT":"PO",
		"PY":"PA",
		"QA":"QA",
		"RO":"RO",
		"RU":"RS",
		"SA":"SA",
		"SE":"SW",
		"SG":"SN",
		"SI":"SI",
		"SK":"LO",
		"SV":"ES",
		"SY":"SY",
		"TH":"TH",
		"TN":"TS",
		"TR":"TU",
		"TT":"TD",
		"TW":"TW",
		"UA":"UP",
		// missing: US=United States
		"UY":"UY",
		"VE":"VE",
		"VN":"VM",
		"YE":"YM",
		"ZA":"SF",
		"ZW":"ZI",
		"AZ":"AJ",
		"SR":"YI", //YI=SERIBIA AND MONTENEGRO // missing: sr=Serbia
		"UZ":"UZ",		
	}
	
}