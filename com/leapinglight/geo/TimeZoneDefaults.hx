package com.leapinglight.geo;

/**
 * ...
 * @author Roy
 */
class TimeZoneDefaults
{

	public function new() 
	{
		
	}
	
	public static function getDefaultZonesForCountryCode(cc:String) {
		var l = new Array<String>();
		addDefaultZonesForCountry(cc, l);
		return l;
	}
	
	static inline function addToListIfEquals(cc1:String,cc2:String,zone:String,list:Array<String>) {
        if (cc1.toUpperCase() == cc2.toUpperCase()) {
			list.push(zone);
		}
    }
	
	public static function usa1(countryCode:String, list:Array<String>) : Void
    {
        // USA:
        addToListIfEquals(countryCode, "USAK", "America/Anchorage",list);
        addToListIfEquals(countryCode, "USNY", "America/New_York",list);
        addToListIfEquals(countryCode, "USVA", "America/Louisville",list);
        addToListIfEquals(countryCode, "USAL", "America/Chicago",list);
        addToListIfEquals(countryCode, "USND", "America/Chicago",list);
        addToListIfEquals(countryCode, "USHI", "Pacific/Honolulu",list);
        addToListIfEquals(countryCode, "USRI", "America/New_York",list);
        addToListIfEquals(countryCode, "USDE", "America/New_York",list);
        addToListIfEquals(countryCode, "USMD", "America/New_York",list);
        addToListIfEquals(countryCode, "USMN", "America/Chicago",list);
        addToListIfEquals(countryCode, "USNE", "America/Chicago",list);
        addToListIfEquals(countryCode, "USCO", "America/Denver",list);
        addToListIfEquals(countryCode, "USME", "America/New_York",list);
        addToListIfEquals(countryCode, "USMO", "America/Chicago",list);
        addToListIfEquals(countryCode, "USIA", "America/Chicago",list);
        addToListIfEquals(countryCode, "USWY", "America/Denver",list);
        addToListIfEquals(countryCode, "USKY", "America/Louisville",list);
        addToListIfEquals(countryCode, "USOH", "America/Detroit",list);
        addToListIfEquals(countryCode, "USIL", "America/Chicago",list);
        addToListIfEquals(countryCode, "USAZ", "America/Phoenix",list);
        addToListIfEquals(countryCode, "USOR", "America/Los_Angeles",list);
        addToListIfEquals(countryCode, "USNH", "America/New_York",list);
        addToListIfEquals(countryCode, "USGA", "America/Louisville",list);
        addToListIfEquals(countryCode, "USTN", "America/Chicago",list);
        addToListIfEquals(countryCode, "USTX", "America/Chicago",list);
        addToListIfEquals(countryCode, "USSC", "America/Louisville",list);
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Indianapolis",list);
        addToListIfEquals(countryCode, "USID", "America/Boise",list);
        addToListIfEquals(countryCode, "USCT", "America/New_York",list);
        addToListIfEquals(countryCode, "USNJ", "America/New_York",list);
        addToListIfEquals(countryCode, "USPA", "America/New_York",list);
        addToListIfEquals(countryCode, "USFL", "America/Louisville",list);
        addToListIfEquals(countryCode, "USMI", "America/Detroit",list);
        addToListIfEquals(countryCode, "USMS", "America/Chicago",list);
        addToListIfEquals(countryCode, "USAR", "America/Chicago",list);
        addToListIfEquals(countryCode, "USOK", "America/Chicago",list);
        addToListIfEquals(countryCode, "USSD", "America/Chicago",list);
        addToListIfEquals(countryCode, "USWI", "America/Chicago",list);
        addToListIfEquals(countryCode, "USMT", "America/Boise",list);
        addToListIfEquals(countryCode, "USVT", "America/New_York",list);
        addToListIfEquals(countryCode, "USKS", "America/Chicago",list);
        addToListIfEquals(countryCode, "USCA", "America/Los_Angeles",list);
        addToListIfEquals(countryCode, "USNV", "America/Los_Angeles",list);
        addToListIfEquals(countryCode, "USDC", "America/New_York",list);
        addToListIfEquals(countryCode, "USMA", "America/New_York",list);
        addToListIfEquals(countryCode, "USWV", "America/Louisville",list);
        addToListIfEquals(countryCode, "USNM", "America/Denver",list);
        addToListIfEquals(countryCode, "USUT", "America/Boise",list);
        addToListIfEquals(countryCode, "USNC", "America/Louisville",list);
        addToListIfEquals(countryCode, "USLA", "America/Chicago",list);
        addToListIfEquals(countryCode, "USWA", "America/Los_Angeles",list);
    }

        public static inline var US_ALASKA = "US/Alaska";
        public static inline var US_HAWAII = "US/Hawaii";
        public static inline var US_ARIZONA = "US/Arizona";

        public static inline var US_PACIFIC = "US/Pacific";
        public static inline var US_PST8PDT = "PST8PDT";
        public static inline var US_MOUNTAIN = "US/Mountain";
        public static inline var US_MST7MDT = "MST7MDT";
        public static inline var US_CENTRAL = "US/Central";
        public static inline var US_CST6CDT = "CST6CDT";
        public static inline var US_EASTERN = "US/Eastern";
        public static inline var US_EST5EDT = "EST5EDT";

    public static function usa2(countryCode:String, list:Array<String>) : Void
    {
        addToListIfEquals(countryCode, "USAK", US_ALASKA,list);

        addToListIfEquals(countryCode, "USNY", "America/New_York",list);

        addToListIfEquals(countryCode, "USVA", US_EASTERN,list); // Virginia
        addToListIfEquals(countryCode, "USAL", US_CENTRAL,list); // Alabama

        addToListIfEquals(countryCode, "USND", US_CENTRAL,list); // North Dakota (2)
        addToListIfEquals(countryCode, "USND", US_MOUNTAIN,list); // North Dakota
        addToListIfEquals(countryCode, "USND", "America/North_Dakota/New_Salem",list); // North Dakota (2)
        addToListIfEquals(countryCode, "USND", "America/North_Dakota/Center",list); // North Dakota (2)

        addToListIfEquals(countryCode, "USHI", US_HAWAII,list);

        addToListIfEquals(countryCode, "USRI", US_EASTERN,list); // Rhode Island
        addToListIfEquals(countryCode, "USDE", US_EASTERN,list); // Delaware
        addToListIfEquals(countryCode, "USMD", US_EASTERN,list); // Maryland
        addToListIfEquals(countryCode, "USMN", US_CENTRAL,list); // Minnesota

        addToListIfEquals(countryCode, "USNE", US_CENTRAL,list); // Nebraska (2)
        addToListIfEquals(countryCode, "USNE", US_MOUNTAIN,list); // Nebraska (2)

        addToListIfEquals(countryCode, "USCO", US_MOUNTAIN,list); // Colorado
        addToListIfEquals(countryCode, "USME", US_EASTERN,list); // Maine
        addToListIfEquals(countryCode, "USMO", US_CENTRAL,list); // Missouri
        addToListIfEquals(countryCode, "USIA", US_CENTRAL,list); // Iowa
        addToListIfEquals(countryCode, "USWY", US_MOUNTAIN,list); // Wyoming

        addToListIfEquals(countryCode, "USKY", US_CENTRAL,list); // Kentucky (2)
        addToListIfEquals(countryCode, "USKY", US_EASTERN,list); // Kentucky (2)
        addToListIfEquals(countryCode, "USKY", "America/Kentucky/Louisville",list); // Kentucky (2)
        addToListIfEquals(countryCode, "USKY", "America/Kentucky/Monticello",list); // Kentucky (2)

        addToListIfEquals(countryCode, "USOH", US_EASTERN,list); // Ohio
        addToListIfEquals(countryCode, "USIL", US_CENTRAL,list); // Illinois

        addToListIfEquals(countryCode, "USAZ", US_ARIZONA,list); // Arizona (2?Navajo)
        addToListIfEquals(countryCode, "USAZ", US_MOUNTAIN,list); // Arizona (2?Navajo)

        addToListIfEquals(countryCode, "USOR", US_PACIFIC,list); // Oregon (2)
        addToListIfEquals(countryCode, "USOR", US_MOUNTAIN,list); // Oregon (2)

        addToListIfEquals(countryCode, "USNH", US_EASTERN,list); // New Hampshire
        addToListIfEquals(countryCode, "USGA", US_EASTERN,list); // Georgia

        addToListIfEquals(countryCode, "USTN", US_CENTRAL,list); // Tennessee (2)
        addToListIfEquals(countryCode, "USTN", US_EASTERN,list); // Tennessee (2)

        addToListIfEquals(countryCode, "USTX", US_CENTRAL,list); // Texas (2)
        addToListIfEquals(countryCode, "USTX", US_MOUNTAIN,list); // Texas (2)

        addToListIfEquals(countryCode, "USSC", US_EASTERN,list); // South Carolina

        addToListIfEquals(countryCode, "USIN", US_EASTERN,list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", US_CENTRAL,list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Indianapolis",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Knox",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Marengo",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Petersburg",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Tell_City",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Vevay",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Vincennes",list); // Indiana (2++)
        addToListIfEquals(countryCode, "USIN", "America/Indiana/Winamac",list); // Indiana (2++)

        addToListIfEquals(countryCode, "USID", US_MOUNTAIN,list); // Idaho (2)
        addToListIfEquals(countryCode, "USID", US_PACIFIC,list); // Idaho (2)

        addToListIfEquals(countryCode, "USCT", US_EASTERN,list); // Connecticut
        addToListIfEquals(countryCode, "USNJ", US_EASTERN,list); // New Jersey
        addToListIfEquals(countryCode, "USPA", US_EASTERN,list); // 	Pennsylvania

        addToListIfEquals(countryCode, "USFL", US_CENTRAL,list); // Florida (2)
        addToListIfEquals(countryCode, "USFL", US_EASTERN,list); // Florida (2)

        addToListIfEquals(countryCode, "USMI", US_CENTRAL,list); // 	Michigan (2)
        addToListIfEquals(countryCode, "USMI", US_EASTERN,list); // 	Michigan (2)

        addToListIfEquals(countryCode, "USMS", US_CENTRAL,list); // Mississippi
        addToListIfEquals(countryCode, "USAR", US_CENTRAL,list); // Arkansas
        addToListIfEquals(countryCode, "USOK", US_CENTRAL,list); // Oklahoma

        addToListIfEquals(countryCode, "USSD", US_CENTRAL,list); // South Dakota (2)
        addToListIfEquals(countryCode, "USSD", US_MOUNTAIN,list); // South Dakota (2)

        addToListIfEquals(countryCode, "USWI", US_CENTRAL,list); // Wisconsin
        addToListIfEquals(countryCode, "USMT", US_MOUNTAIN,list); // Montana
        addToListIfEquals(countryCode, "USVT", US_EASTERN,list); // Vermont

        addToListIfEquals(countryCode, "USKS", US_CENTRAL,list); // Kansas (2)
        addToListIfEquals(countryCode, "USKS", US_MOUNTAIN,list); // Kansas (2)

        addToListIfEquals(countryCode, "USCA", US_PACIFIC,list); // California
        addToListIfEquals(countryCode, "USNV", US_PACIFIC,list); // Nevada
        addToListIfEquals(countryCode, "USDC", US_EASTERN,list); // District of Columbia
        addToListIfEquals(countryCode, "USMA", US_EASTERN,list); // Massachusetts
        addToListIfEquals(countryCode, "USWV", US_EASTERN,list); // West Virginia
        addToListIfEquals(countryCode, "USNM", US_MOUNTAIN,list); // New Mexico
        addToListIfEquals(countryCode, "USUT", US_MOUNTAIN,list); // Utah
        addToListIfEquals(countryCode, "USNC", US_EASTERN,list); // North Carolina
        addToListIfEquals(countryCode, "USLA", US_CENTRAL,list); // Louisiana
        addToListIfEquals(countryCode, "USWA", US_PACIFIC,list); // Washington
    }



    public static function addDefaultZonesForCountry(countryCode:String, list:Array<String>) : Void
	{
        //usa1(countryCode,list);
        usa2(countryCode,list);
        

        // REST OF WORLD:
        addToListIfEquals(countryCode,"UK","Europe/London",list);
        addToListIfEquals(countryCode,"SI","Europe/Ljubljana",list);
        addToListIfEquals(countryCode,"IT","Europe/Rome",list);
        addToListIfEquals(countryCode,"GR","Europe/Athens",list);
        addToListIfEquals(countryCode,"CY","Europe/Nicosia",list);
        addToListIfEquals(countryCode,"AL","Europe/Tirane",list);
        addToListIfEquals(countryCode,"JA","Asia/Tokyo",list);

        //multiple:
        // Russia (today?)
        addToListIfEquals(countryCode,"RS","Europe/Moscow",list);
        addToListIfEquals(countryCode,"RS","Europe/Kaliningrad",list);
        addToListIfEquals(countryCode,"RS","Asia/Yekaterinburg",list);
        addToListIfEquals(countryCode,"RS","Asia/Omsk",list);
        addToListIfEquals(countryCode,"RS","Asia/Krasnoyarsk",list);
        addToListIfEquals(countryCode,"RS","Asia/Irkutsk",list);
        addToListIfEquals(countryCode,"RS","Asia/Yakutsk",list);
        addToListIfEquals(countryCode,"RS","Asia/Vladivostok",list);
        addToListIfEquals(countryCode,"RS","Asia/Magadan",list);
        // Russia (additional/historic?)
        addToListIfEquals(countryCode,"RS","Europe/Samara",list);
        addToListIfEquals(countryCode,"RS","Europe/Volgograd",list);
        addToListIfEquals(countryCode,"RS","Asia/Anadyr",list);
        addToListIfEquals(countryCode,"RS","Asia/Kamchatka",list);
        addToListIfEquals(countryCode,"RS","Asia/Novosibirsk",list);
        addToListIfEquals(countryCode,"RS","Asia/Novokuznetsk",list);
        addToListIfEquals(countryCode,"RS","Asia/Sakhalin",list);


        addToListIfEquals(countryCode,"TU","Europe/Istanbul",list);
        addToListIfEquals(countryCode,"NO","Europe/Oslo",list);
        addToListIfEquals(countryCode,"MN","Europe/Monaco",list);
        addToListIfEquals(countryCode,"MD","Europe/Chisinau",list);
        addToListIfEquals(countryCode,"FR","Europe/Paris",list);
        addToListIfEquals(countryCode,"EG","Africa/Cairo",list);
        addToListIfEquals(countryCode,"HU","Europe/Budapest",list);
        addToListIfEquals(countryCode,"GI","Europe/Gibraltar",list);
        addToListIfEquals(countryCode,"BO","Europe/Minsk",list);
        addToListIfEquals(countryCode,"AN","Europe/Andorra",list);
        addToListIfEquals(countryCode,"LO","Europe/Bratislava",list);
        addToListIfEquals(countryCode,"FI","Europe/Helsinki",list);
        addToListIfEquals(countryCode,"BE","Europe/Brussels",list);
        addToListIfEquals(countryCode,"SW","Europe/Stockholm",list);
        addToListIfEquals(countryCode,"IC","Atlantic/Reykjavik",list);
        addToListIfEquals(countryCode,"EI","Europe/Dublin",list);
        addToListIfEquals(countryCode,"PK","Asia/Karachi",list);
        addToListIfEquals(countryCode,"YI","Europe/Belgrade",list);

        //multiple:
        // UKRAINE:
        addToListIfEquals(countryCode,"UP","Europe/Kiev",list);
        // UKRAINE - for historic purposes ? :
        addToListIfEquals(countryCode,"UP","Europe/Simferopol",list);
        addToListIfEquals(countryCode,"UP","Europe/Uzhgorod",list);
        addToListIfEquals(countryCode,"UP","Europe/Zaporozhy",list);

        addToListIfEquals(countryCode,"LG","Europe/Riga",list);
        addToListIfEquals(countryCode,"IZ","Asia/Baghdad",list);
        addToListIfEquals(countryCode,"PL","Europe/Warsaw",list);
        addToListIfEquals(countryCode,"LH","Europe/Vilnius",list);
        addToListIfEquals(countryCode,"GM","Europe/Berlin",list);
        addToListIfEquals(countryCode,"SZ","Europe/Zurich",list);
        addToListIfEquals(countryCode,"SP","Europe/Madrid",list);
        addToListIfEquals(countryCode,"RO","Europe/Bucharest",list);
        addToListIfEquals(countryCode,"MT","Europe/Malta",list);
        addToListIfEquals(countryCode,"LS","Europe/Vaduz",list);
        addToListIfEquals(countryCode,"DA","Europe/Copenhagen",list);
        addToListIfEquals(countryCode,"KS","Asia/Seoul",list);


        //multiple:
        // CHINA:
        addToListIfEquals(countryCode,"CH","Asia/Shanghai",list);
        addToListIfEquals(countryCode,"CH","Asia/Harbin",list);
        addToListIfEquals(countryCode,"CH","Asia/Chongqing",list);
        addToListIfEquals(countryCode,"CH","Asia/Urumqi",list);
        addToListIfEquals(countryCode,"CH","Asia/Kashgar",list);
        addToListIfEquals(countryCode,"CH","Asia/Hong_Kong",list);
        addToListIfEquals(countryCode,"CH","Asia/Ulaanbaatar",list);
        addToListIfEquals(countryCode,"CH","Asia/Hovd",list);
        addToListIfEquals(countryCode,"CH","Asia/Choibalsan",list);
        addToListIfEquals(countryCode,"CH","Asia/Macau",list);
        addToListIfEquals(countryCode,"CH","Asia/Taipei",list);


        //multiple:
        addToListIfEquals(countryCode,"CA","America/Whitehorse",list);
        addToListIfEquals(countryCode,"CA","America/Vancouver",list);
        addToListIfEquals(countryCode,"CA","America/Yellowknife",list);
        addToListIfEquals(countryCode,"CA","America/Edmonton",list);
        addToListIfEquals(countryCode,"CA","America/Regine",list);
        addToListIfEquals(countryCode,"CA","America/Winnipeg",list);
        addToListIfEquals(countryCode,"CA","America/Thunder_Bay",list);
        addToListIfEquals(countryCode,"CA","America/Montreal",list);
        addToListIfEquals(countryCode,"CA","America/Halifax",list);
        addToListIfEquals(countryCode,"CA","America/St_Johns",list);

        addToListIfEquals(countryCode,"VT","Europe/Vatican",list);
        addToListIfEquals(countryCode,"NL","Europe/Amsterdam",list);
        addToListIfEquals(countryCode,"MK","Europe/Skopje",list);
        addToListIfEquals(countryCode,"BU","Europe/Sofia",list);
        addToListIfEquals(countryCode,"PO","Europe/Lisbon",list);
        addToListIfEquals(countryCode,"LU","Europe/Luxembourg",list);
        addToListIfEquals(countryCode,"EN","Europe/Tallinn",list);
        addToListIfEquals(countryCode,"BK","Europe/Sarajevo",list);
        addToListIfEquals(countryCode,"AU","Europe/Vienna",list);
        addToListIfEquals(countryCode,"HR","Europe/Zagreb",list);
        addToListIfEquals(countryCode,"EZ","Europe/Prague",list);


        //// Multiple:
        // Brazil:
        addToListIfEquals(countryCode,"BR","America/Sao_Paulo",list);
        addToListIfEquals(countryCode,"BR","America/Noronha",list);
        addToListIfEquals(countryCode,"BR","America/Belem",list);
        addToListIfEquals(countryCode,"BR","America/Fortaleza",list);
        addToListIfEquals(countryCode,"BR","America/Recife",list);
        addToListIfEquals(countryCode,"BR","America/Araguaina",list);
        addToListIfEquals(countryCode,"BR","America/Maceio",list);
        addToListIfEquals(countryCode,"BR","America/Bahia",list);
        addToListIfEquals(countryCode,"BR","America/Campo_Grande",list);
        addToListIfEquals(countryCode,"BR","America/Cuiaba",list);
        addToListIfEquals(countryCode,"BR","America/Santarem",list);
        addToListIfEquals(countryCode,"BR","America/Porto_Velho",list);
        addToListIfEquals(countryCode,"BR","America/Boa_Vista",list);
        addToListIfEquals(countryCode,"BR","America/Manaus",list);
        addToListIfEquals(countryCode,"BR","America/Eirunepe",list);
        addToListIfEquals(countryCode,"BR","America/Rio_Branco",list);

/*
The tz database contains 16 zones for Brazil.coordinates	TZ	comments	UTC offset	DST	Notes
-0351-03225	America/Noronha	Atlantic islands	-02:00	-
-0127-04829	America/Belem	Amapa, E Para	-03:00	-
-0343-03830	America/Fortaleza	NE Brazil (MA, PI, CE, RN, PB)	-03:00	-
-0803-03454	America/Recife	Pernambuco	-03:00	-
-0712-04812	America/Araguaina	Tocantins	-03:00	-
-0940-03543	America/Maceio	Alagoas, Sergipe	-03:00	-
-1259-03831	America/Bahia	Bahia	-03:00	-
-2332-04637	America/Sao_Paulo	S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)	-03:00	-02:00
-2027-05437	America/Campo_Grande	Mato Grosso do Sul	-04:00	-03:00
-1535-05605	America/Cuiaba	Mato Grosso	-04:00	-03:00
-0226-05452	America/Santarem	W Para	-03:00	-
-0846-06354	America/Porto_Velho	Rondonia	-04:00	-
+0249-06040	America/Boa_Vista	Roraima	-04:00	-
-0308-06001	America/Manaus	E Amazonas	-04:00	-
-0640-06952	America/Eirunepe	W Amazonas	-04:00	-
-0958-06748	America/Rio_Branco	Acre	-04:00

 */


        //// Multiple:
        // ARGENTINA:
        addToListIfEquals(countryCode,"AR","America/Argentina/Buenos_Aires",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Cordoba",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Salta",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Jujuy",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Tucuman",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Catamarca",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/La_Rioja",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/San_Juan",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Mendoza",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/San_Luis",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Rio_Gallegos",list);
        addToListIfEquals(countryCode,"AR","America/Argentina/Ushuaia",list);

        //// Multiple:
        // AUSTRALIA:
        addToListIfEquals(countryCode,"AS","Australia/Adelaide",list);
        addToListIfEquals(countryCode,"AS","Australia/Brisbane",list);
        addToListIfEquals(countryCode,"AS","Australia/Broken_Hill",list);
        addToListIfEquals(countryCode,"AS","Australia/Darwin",list);
        addToListIfEquals(countryCode,"AS","Australia/Hobart",list);
        addToListIfEquals(countryCode,"AS","Australia/Lindeman",list);
        addToListIfEquals(countryCode,"AS","Australia/Lord_Howe",list);
        addToListIfEquals(countryCode,"AS","Australia/Melbourne",list);
        addToListIfEquals(countryCode,"AS","Australia/Perth",list);
        addToListIfEquals(countryCode,"AS","Australia/Sydney",list);



        // Asia/Calcutta is same as IST (Indian Standard Time)
        addToListIfEquals(countryCode,"IN","Asia/Calcutta",list);
        // Sri LAnka:
        addToListIfEquals(countryCode,"CE","Asia/Calcutta",list);
        // Bangladesh:
        addToListIfEquals(countryCode,"BG","Asia/Dhaka",list);


        // MISC:
        addToListIfEquals(countryCode,"MO","Africa/Casablanca",list);
        addToListIfEquals(countryCode,"TS","Africa/Tunis",list);
        addToListIfEquals(countryCode,"LY","Africa/Tripoli",list);
        addToListIfEquals(countryCode,"SF","Africa/Johannesburg",list);
        addToListIfEquals(countryCode,"NI","Africa/Lagos",list);
        addToListIfEquals(countryCode,"TZ","Africa/Dar_es_Salaam",list);


        addToListIfEquals(countryCode,"SY","Asia/Damascus",list);
        addToListIfEquals(countryCode,"YM","Asia/Aden",list);
        addToListIfEquals(countryCode,"KU","Asia/Kuwait",list);
        addToListIfEquals(countryCode,"IR","Asia/Tehran",list);
        addToListIfEquals(countryCode,"ID","Asia/Jakarta",list);
        addToListIfEquals(countryCode,"HK","Asia/Hong_Kong",list);
        addToListIfEquals(countryCode,"CB","Asia/Phnom_Penh",list);
        addToListIfEquals(countryCode,"BA","Asia/Bahrain",list);
        addToListIfEquals(countryCode,"VM","Asia/Ho_Chi_Minh",list);

        addToListIfEquals(countryCode,"VE","America/Caracas",list);
        addToListIfEquals(countryCode,"BL","America/La_Paz",list);
        addToListIfEquals(countryCode,"CU","America/Havana",list);
        addToListIfEquals(countryCode,"CI","America/Santiago",list);

        addToListIfEquals(countryCode,"IS","Asia/Jerusalem",list);

        addToListIfEquals(countryCode,"MX","America/Mexico_City",list);
        addToListIfEquals(countryCode,"MU","Asia/Muscat",list);
        addToListIfEquals(countryCode,"PM","America/Panama",list);
        addToListIfEquals(countryCode,"PA","America/Asuncion",list);
        addToListIfEquals(countryCode,"RP","Asia/Manila",list);
        addToListIfEquals(countryCode,"PE","America/Lima",list);
        addToListIfEquals(countryCode,"SN","Asia/Singapore",list);
        addToListIfEquals(countryCode,"SO","Africa/Mogadishu",list);
        addToListIfEquals(countryCode,"SU","Africa/Khartoum",list);
        addToListIfEquals(countryCode,"SV","Arctic/Longyearbyen",list);
        addToListIfEquals(countryCode,"AE","Asia/Dubai",list);
        addToListIfEquals(countryCode,"SA","Asia/Riyadh",list);


        /*

MX - MEXICO		America/Mexico_City
MU - OMAN		Asia/Muscat

PM - PANAMA		America/Panama
PA - PARAGUAY	America/Asuncion
RP - PHILIPPINES	Asia/Manila
??QATAR
PE - PERU		America/Lima
SN - SINGAPORE	Asia/Singapore
SO - SOMALIA		Africa/Mogadishu
SU - SUDAN		Africa/Khartoum
SV - SVALBARD	Arctic/Longyearbyen
AE - UNITED ARAB EMIRATES	Asia/Dubai
SA - SAUDI ARABIA	Asia/Riyadh
         */

    }
}





/*


  #Russia:
  #Europe/Moscow
  #Europe/Kaliningrad
  #Europe/Samara
  #Am/Dawson_Creek: Canada
  #Am/Thunder_Bay: Canada/Ontario

  #Am/Los_Angeles: California (CA) (Western)

  #Am/Boise: Idaho (ID) (mountain (left))
  #Am/Phoenix: Arizona (AZ) (Mountain (left))
  #Am/Denver: Colorado (CO) (Mountain (right))

  #Am/Chicago: ILlinois (IL)(Central)

  #Am/Louisville: Kentucky (KY) (Eastern (very left))
  #Am/New_York: New York   (NY) (Eastern (very east))
  #Am/Detroit: Michigan (MI)(Eastern (very left))

  #USA:
  #WA,OR,NV,CA - Pacific time:  "America/Los_Angeles (CA)" ??
  #AZ,CO,ID,MT,NM,UT,WY(Wyoming?MISSING!) - Montain time
  #ND,SD,NE,KS,OK,TX,,MN,IA,MO,AR,LA,,WI,IL,IN,TN,MS,AL - Central time
  #MI,OH,KY,GA,,PA,MD,WV,VA,NC,SC,FL,,NY,NJ,DE,,ME,MA,NH,VT,RI,CT - Eastern
  # Alaska: Alaska-time# Hawaii: Hawaii-time

DefaultZonesUsa = {
    'WA' => 'America/Los_Angeles',
    'OR' => 'America/Los_Angeles',
    'NV' => 'America/Los_Angeles',
    'CA' => 'America/Los_Angeles', #CA - Western
    'AZ' => 'America/Phoenix', #AZ - Mountain
    'ID' => 'America/Boise',
    'UT' => 'America/Boise',
    'MT' => 'America/Boise', #ID - Mountain
    'WY' => 'America/Denver',
    'CO' => 'America/Denver',
    'NM' => 'America/Denver', #CO - Mountain
    'ND' => 'America/Chicago',
    'SD' => 'America/Chicago',
    'NE' => 'America/Chicago',
    'KS' => 'America/Chicago',
    'OK' => 'America/Chicago',
    'TX' => 'America/Chicago',
    'MN' => 'America/Chicago',
    'IA' => 'America/Chicago',
    'MO' => 'America/Chicago',
    'AR' => 'America/Chicago',
    'LA' => 'America/Chicago',
    'WI' => 'America/Chicago',
    'IL' => 'America/Chicago',
    'TN' => 'America/Chicago',
    'MS' => 'America/Chicago',
    'AL' => 'America/Chicago', #IL - Central
    'IN' => 'America/Indiana/Indianapolis', #IN - central(summer)/eastern(winter)
    'MI' => 'America/Detroit',
    'OH' => 'America/Detroit', #MI - Eastern
    'KY' => 'America/Louisville',
    'GA' => 'America/Louisville',
    'FL' => 'America/Louisville',
    'WV' => 'America/Louisville',
    'VA' => 'America/Louisville',
    'NC' => 'America/Louisville',
    'SC' => 'America/Louisville', #KY - Eastern
    'NY' => 'America/New_York',
    'PA' => 'America/New_York',
    'MD' => 'America/New_York',
    'DE' => 'America/New_York',
    'NJ' => 'America/New_York',
    'CT' => 'America/New_York',
    'RI' => 'America/New_York',
    'VT' => 'America/New_York',
    'MA' => 'America/New_York',
    'NH' => 'America/New_York',
    'ME' => 'America/New_York',
    'DC' => 'America/New_York', #NY
    'HI' => 'Pacific/Honolulu'   #HI - Hawaii
  }


  DefaultZones = {
    'AL' => 'Europe/Tirane',      #Albania
    'AN' => 'Europe/Andorra',     #Andorra
    'AU' => 'Europe/Vienna',      #Austria
    'BE' => 'Europe/Brussels',    #Belgium
    'BK' => 'Europe/Sarajevo',    #Bosnia and Herzegovina
    'BO' => 'Europe/Minsk',       #Belarus
    'BU' => 'Europe/Sofia',       #Bulgaria
    'CY' => 'Europe/Nicosia',     #Cyprus
    'DA' => 'Europe/Copenhagen',  #Denmark
    'EI' => 'Europe/Dublin',      #Ireland
    'EN' => 'Europe/Tallinn',     #Estonia
    'EZ' => 'Europe/Prague',      #Check Rebublic
    'FI' => 'Europe/Helsinki',    #Finland
    'FR' => 'Europe/Paris',       #France
    'GI' => 'Europe/Gibraltar',   #Gibraltar
    'GR' => 'Europe/Athens',      #Greece
    'GM' => 'Europe/Berlin',      #Germany
    'HR' => 'Europe/Zagreb',      #Croatia
    'HU' => 'Europe/Budapest',    #Hungary
    'IC' => 'Atlantic/Reykjavik', #Iceland
    'IT' => 'Europe/Rome',        #Italy
    'LG' => 'Europe/Riga',        #Latvia
    'LH' => 'Europe/Vilnius',     #Lithuania
    'LO' => 'Europe/Bratislava',  #Slovakia
    'LS' => 'Europe/Vaduz',       #Liechtenstein
    'LU' => 'Europe/Luxembourg',  #Luxembourg
    'MD' => 'Europe/Chisinau',    #Moldova
    'MK' => 'Europe/Skopje',      #Macedonia
    'MN' => 'Europe/Monaco',      #Monaco
    'MT' => 'Europe/Malta',       #Malta
    'NL' => 'Europe/Amsterdam',   #Netherlands
    'NO' => 'Europe/Oslo',        #Norway
    'PO' => 'Europe/Lisbon',      #Portugal
    'PL' => 'Europe/Warsaw',      #Poland
    'RO' => 'Europe/Bucharest',   #Romania
    'SI' => 'Europe/Ljubljana',   #Slovenia
    'SP' => 'Europe/Madrid',      #Spain
    'SW' => 'Europe/Stockholm',   #Sweden
    'SZ' => 'Europe/Zurich',      #Switzerland
    'TU' => 'Europe/Istanbul',      #Turkey
    'UK' => 'Europe/London',      #United Kingdom

    'UP' => ['Europe/Simferopol', #Ukraine
      'Europe/Uzhgorod',
      'Europe/Zaporozhy'],
    'RS' => ['Europe/Moscow',      #Russia
      'Europe/Kaliningrad',
      'Asia/Irkutsk',
      'Asia/Krasnoyarsk',
      'Asia/Sakhalin',
      'Asia/Vladivostok',
      'Asia/Yakutsk'],

    'VT' => 'Europe/Vatican',     #Vatican City
    'YI' => 'Europe/Belgrade',    #Serbia and Montenegro

    'CA' => ['America/Whitehorse', #Canada
      'America/Vancouver',
      'America/Yellowknife',
      'America/Edmonton',
      'America/Regine',
      'America/Winnipeg',
      'America/Thunder_Bay',
      'America/Montreal',
      'America/Halifax',
      'America/St_Johns'],

    'IZ' => 'Asia/Baghdad',       #Iraq
    'JA' => 'Asia/Tokyo',         #Japan
    'KS' => 'Asia/Seoul',         #South Korea
    'PK' => 'Asia/Karachi',       #Pakistan

    'EG' => 'Africa/Cairo'       #Egypt
  }


    }
}
*/	
	
