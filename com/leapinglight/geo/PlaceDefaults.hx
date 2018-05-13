package com.leapinglight.geo;

class PlaceDefaults
{

	public function new() {}
	
	public static function defaultPlaceForCountryCode(cc:String) : String {
		if (cc != null) {
			cc = cc.toUpperCase();
			if (Reflect.hasField(COUNTRY_TO_PLACE_DEFAULTS, cc)) {
				return Reflect.field(COUNTRY_TO_PLACE_DEFAULTS, cc);
			} 
		}
		return null;
	}	
	
	static var COUNTRY_TO_PLACE_DEFAULTS = {
		"AL":"Tirana", //ALBANIA
		"AG":"Algiers", //ALGERIA
		"AR":"Buenos Aires", //ARGENTINA
		"AM":"Yerevan", //ARMENIA
		"AS":"Sydney", //AUSTRALIA
		"AU":"Wien", //AUSTRIA
		"AJ":"Baku", //AZERBAIJAN
		"BA":"Manama", //BAHRAIN
		"BO":"Minsk", //BELARUS
		"BE":"Brussels", //BELGIUM
		"BH":"Belmopan", //BELIZE
		"BL":"La Paz", //BOLIVIA
		"BR":"Brasilia", //BRAZIL
		"BX":"Bandar Seri Begawan", //BRUNEI
		"BU":"Sofia", //BULGARIA
		"CA":"Toronto", //CANADA
		"CI":"Santiago", //CHILE
		"CH":"Beijing", //CHINA
		"CO":"Bogota", //COLOMBIA
		"CS":"San Jose", //COSTA RICA
		"HR":"Zagreb", //CROATIA
		"EZ":"Prague", //CZECH REPUBLIC
		"DA":"Copenhagen", //DENMARK
		"DR":"Santo Domingo", //DOMINICAN REPUBLIC
		"EC":"Quito", //ECUADOR
		"EG":"Cairo", //EGYPT
		"ES":"San Salvador", //EL SALVADOR
		"EN":"Tallinn", //ESTONIA
		"FO":"Torshavn", //FAROE ISLANDS
		"FI":"Helsinki", //FINLAND
		"FR":"Paris", //FRANCE
		"GG":"Tbilisi", //GEORGIA
		"GM":"Berlin", //GERMANY
		"GR":"Athens", //GREECE
		"GT":"Guatemala", //GUATEMALA
		"HO":"Tegucigalpa", //HONDURAS
		"HU":"Budapest", //HUNGARY
		"IC":"Reykjavik", //ICELAND
		"IN":"New Delhi", //INDIA
		"ID":"Jakarta", //INDONESIA
		"IR":"Tehran", //IRAN
		"IZ":"Baghdad", //IRAQ
		"EI":"Dublin", //IRELAND
		"IS":"Jerusalem", //ISRAEL
		"IT":"Rome", //ITALY
		"JM":"Kingston", //JAMAICA
		"JA":"Tokyo", //JAPAN
		"JO":"Amman", //JORDAN
		"KZ":"Astana", //KAZAKHSTAN
		"KE":"Nairobi", //KENYA
		"KU":"Al Kuwayt", //KUWAIT
		"LG":"Riga", //LATVIA
		"LE":"Beirut", //LEBANON
		"LY":"Tripoli", //LIBYA
		"LS":"Vaduz", //LIECHTENSTEIN
		"LH":"Vilnius", //LITHUANIA
		"LU":"Luxembourg", //LUXEMBOURG
		"MY":"Kuala Lumpur", //MALAYSIA
		"MV":"Male", //MALDIVES
		"MX":"Ciudad de Mexico", //MEXICO
		"MN":"Monaco", //MONACO
		"MG":"Ulaanbaatar", //MONGOLIA
		"MO":"Rabat", //MOROCCO            ---- Missing: Casablanca, Marrakech
		"NZ":"Wellington", //NEW ZEALAND
		"NU":"Managua", //NICARAGUA
		"NO":"Oslo", //NORWAY
		"MU":"Muscat", //OMAN
		"PK":"Islamabad", //PAKISTAN
		"PM":"Panama", //PANAMA
		"PA":"Asuncion", //PARAGUAY
		"PE":"Lima", //PERU
		"RP":"Manila", //PHILIPPINES
		"PL":"Warsaw", //POLAND
		"PO":"Lisbon", //PORTUGAL
		"QA":"Doha", //QATAR
		"RO":"Bucharest", //ROMANIA
		"RS":"Moscow", //RUSSIA
		"SA":"Riyadh", //SAUDI ARABIA
		"SN":"Singapore", //SINGAPORE
		"LO":"Bratislava", //SLOVAKIA
		"SI":"Ljubljana", //SLOVENIA
		"SF":"Cape Town", //SOUTH AFRICA
		"SP":"Madrid", //SPAIN
		"SW":"Stockholm", //SWEDEN
		"SZ":"Bern", //SWITZERLAND
		"SY":"Damascus", //SYRIA
		"TW":"Taipei", //TAIWAN
		"TH":"Bangkok", //THAILAND
		"TD":"Port-of-Spain", //TRINIDAD AND TOBAGO
		"TS":"Tunis", //TUNISIA
		"TU":"Ankara", //TURKEY                     ----missing:Istanbul
		"UP":"Kiev", //UKRAINE
		"AE":"Abu Dhabi", //UNITED ARAB EMIRATES
		"UK":"London", //UNITED KINGDOM
		"UY":"Montevideo", //URUGUAY
		"USAL":"Montgomery", //USA/ALABAMA
		"USAK":"Juneau", //USA/ALASKA
		"USAR":"Little Rock", //USA/ARKANSAS
		"USAZ":"Phoenix", //USA/ARIZONA
		"USCA":"Los Angeles", //USA/CALIFORNIA
		"USCO":"Denver", //USA/COLORADO
		"USCT":"Bridgeport", //USA/CONNECTICUT
		"USDC":"Washington", //USA/DISTRICT OF COLUMBIA
		"USDE":"Dover", //USA/DELAWARE
		"USFL":"Jacksonville", //USA/FLORIDA
		"USGA":"Atlanta", //USA/GEORGIA
		"USHI":"Honolulu", //USA/HAWAII
		"USIA":"Des Moines", //USA/IOWA
		"USID":"Boise", //USA/IDAHO
		"USIL":"Chicago", //USA/ILLINOIS
		"USIN":"Indianapolis", //USA/INDIANA
		"USKS":"Wichita", //USA/KANSAS
		"USKY":"Lexington", //USA/KENTUCKY
		"USLA":"New Orleans", //USA/LOUISIANA
		"USMA":"Boston", //USA/MASSACHUSETTS
		"USMD":"Baltimore", //USA/MARYLAND
		"USME":"Portland", //USA/MAINE
		"USMI":"Detroit", //USA/MICHIGAN
		"USMN":"Minneapolis", //USA/MINNESOTA
		"USMO":"Kansas City", //USA/MISSOURI
		"USMS":"Jackson", //USA/MISSISSIPPI
		"USMT":"Billings", //USA/MONTANA
		"USNC":"Charlotte", //USA/NORTH CAROLINA
		"USND":"Fargo", //USA/NORTH DAKOTA
		"USNE":"Omaha", //USA/NEBRASKA
		"USNH":"Manchester", //USA/NEW HAMPSHIRE
		"USNJ":"Jersey City", //USA/NEW JERSEY
		"USNM":"Albuquerque", //USA/NEW MEXICO
		"USNV":"Las Vegas", //USA/NEVADA
		"USNY":"New York", //USA/NEW YORK
		"USOH":"Columbus", //USA/OHIO
		"USOK":"Oklahoma City", //USA/OKLAHOMA
		"USOR":"Portland", //USA/OREGON
		"USPA":"Philadelphia", //USA/PENNSYLVANIA
		"USPR":"San Juan", //USA/PUERTO RICO
		"USRI":"Providence", //USA/RHODE ISLAND
		"USSC":"Columbia", //USA/SOUTH CAROLINA
		"USSD":"Sioux Falls", //USA/SOUTH DAKOTA
		"USTN":"Memphis", //USA/TENNESSEE
		"USTX":"Houston", //USA/TEXAS
		"USUT":"Salt Lake City", //USA/UTAH
		"USVA":"Virginia Beach", //USA/VIRGINIA
		"USVT":"Burlington", //USA/VERMONT
		"USWA":"Seattle", //USA/WASHINGTON
		"USWI":"Milwaukee", //USA/WISCONSIN
		"USWV":"Charleston", //USA/WEST VIRGINIA
		"UZ":"Tashkent", //UZBEKISTAN
		"VE":"Caracas", //VENEZUELA
		"VM":"Hanoi", //VIETNAM
		"YM":"Sanaa", //YEMEN
		"ZI":"Harare", //ZIMBABWE
	}
	
}