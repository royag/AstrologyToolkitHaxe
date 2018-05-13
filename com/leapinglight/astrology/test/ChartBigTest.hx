package com.leapinglight.astrology.test;
import com.leapinglight.astrology.ChartData;
import haxe.unit.TestCase;
import com.leapinglight.io.Assets;
import com.leapinglight.astrology.AstroDefs;
import com.leapinglight.astrology.HouseCalc;


/**
 * ...
 * @author Roy
 */
class ChartBigTest extends TestCase
{
	// This is do detect any platform-differences, mainly...
	
	function assertPositions(fn:String, planetPos:Array<String>) {
		var data = Assets.getText("assets/vip/" + fn);
		var chart:ChartData = ChartData.fromSerialized(data);
		var pp = chart.CalculatePositions();
		for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI) {
			assertEquals(planetPos[p], AstroDefs.positionToChar6(AstroDefs.positionOfPlanet(pp, p)));
		}
	}	
	
	function assertHouses(fn:String, housePos:Array<Float>) {
		var data = Assets.getText("assets/vip/" + fn);
		var chart:ChartData = ChartData.fromSerialized(data);
		var pp = chart.CalculatePositions();
		var houses = chart.CalculateHouses(pp);
		for (p in AstroDefs.HOUSE_1...AstroDefs.HOUSE_12+1) {
			assertEquals(Math.round(housePos[p]), Math.round(houses[p]));
		}
	}		
	
	public function testAllVipChartPositions() {
		assertPositions("elvis_presley.chr",["16Cp91","01Pi83","22Cp13","29Cp17","12Li67","17Sc81","25Aq44","27Ar30","14Vi27","25Cn08","01Aq51","12Sg36","26Vi83"]);
		assertPositions("marilyn_monroe.chr",["10Gm15","18Aq74","06Gm65","28Ar63","20Pi43","26Aq49","21Sc26","28Pi88","22Le13","13Cn23","18Cn15","13Le08","06Ta01"]);
		assertPositions("barack_obama.chr",["12Le41","03Gm17","01Le98","01Cn56","22Vi43","00Aq51","25Cp20","25Le15","08Sc36","06Vi67","27Le53","18Aq06","28Sc90"]);
		assertPositions("edward_ted_kennedy.chr",["02Pi47","06Vi10","28Aq63","11Ar48","27Aq65","15Le44","29Cp49","16Ar50","06Vi43","20Cn16","27Pi30","10Cp78","06Sc84"]);
		assertPositions("bill_clinton.chr",["25Le84","20Ta05","07Le37","10Li91","06Li06","23Li13","02Le08","21Gm08","06Li51","11Le51","17Gm15","05Li50","05Cn98"]);
		assertPositions("hillary_clinton.chr",["02Sc51","29Pi15","21Sc18","16Sc54","14Le15","00Sg37","21Le20","25Gm54","11Li22","14Le51","24Ta18","29Gm81","05Pi11"]);
		assertPositions("dalai_lama_14th.chr",["13Cn16","13Vi69","25Gm36","28Le44","18Li26","13Sc27","10Pi02","04Ta69","12Vi17","25Cn16","22Cp23","26Li28","29Cn75"]);
		assertPositions("bob_dylan.chr",["03Gm35","21Ta12","22Gm72","12Gm69","05Pi64","29Ta39","20Ta04","26Ta37","24Vi56","02Le22","28Vi32","20Sg32","17Li85"]);
		assertPositions("david_bowie.chr",["16Cp90","03Le88","08Cp03","01Sg84","16Cp59","21Sc37","06Le51","18Gm40","10Li47","12Le44","09Gm45","09Aq26","07Sg52"]);
		assertPositions("edith_piaf.chr",["26Sg21","00Gm77","27Sg76","20Cp37","28Le49","20Pi34","14Cn21","13Aq04","02Le10","02Cn23","10Aq25","23Sc64","12Vi69"]);
		assertPositions("gene_simmons.chr",["02Vi00","23Vi84","25Vi93","06Li04","21Cn93","23Cp15","08Vi36","04Cn06","13Li23","16Le41","18Ar54","11Ar11","06Cp80"]);
		assertPositions("jim_morrison.chr",["15Sg67","08Ta96","00Cp65","00Sc09","11Gm39","27Le00","23Gm44","06Gm27","04Li00","08Le34","09Le25","12Aq85","26Sc98"]);
		assertPositions("jimmy_page.chr",["17Cp48","02Cn90","17Cp00","06Sg74","04Gm51","25Le57","21Gm15","05Gm19","04Li15","08Le01","07Le45","13Sc78","00Vi35"]);
		assertPositions("madonna.chr",["22Le86","11Vi34","05Vi38","00Le32","15Ta23","26Li23","19Sg08","12Le42","02Sc18","01Vi43","25Li20","08Vi25","03Gm75"]);
		assertPositions("ozzy_osbourne.chr",["10Sg69","11Cp13","05Sg51","08Sc62","04Cp59","03Cp48","06Vi01","29Gm16","14Li38","16Le30","02Ta57","18Sc53","08Vi43"]);
		assertPositions("saddam_hussein.chr",["07Ta33","04Sg56","24Ta12","21Ar53","04Sg23","26Cp50","00Ar19","09Ta27","16Vi24","26Cn34","17Sg20","07Gm82","17Aq88"]);
		assertPositions("anton_lavey.chr",["20Ar60","26Vi10","01Ta11","06Ta44","19Pi53","13Gm30","11Cp47","11Ar52","01Vi02","17Cn28","03Ta37","23Aq93","10Sg33"]);
		assertPositions("britney_spears.chr",["09Sg74","12Aq14","05Sg10","24Cp79","23Vi16","00Sc73","19Li16","00Sg70","24Sg02","25Li57","24Cn45","02Li64","02Cn80"]);
		assertPositions("diana_princess_of_wales.chr",["09Cn30","24Aq89","03Cn12","24Ta14","01Vi38","05Aq05","27Cp48","23Le20","08Sc38","06Vi02","29Le42","18Sg60","22Li85"]);
		assertPositions("georges_bataille.chr",["18Vi04","13Pi90","08Li19","10Le92","10Li13","19Vi98","25Sc39","25Sc37","22Gm29","14Gm43","03Aq45","12Pi24","21Sg59"]);
		assertPositions("janis_joplin.chr",["28Cp64","08Cn63","09Aq27","13Aq86","24Sg73","19Cn05","05Gm52","00Gm44","01Li59","06Le16","26Le31","25Aq55","07Sg26"]);
		assertPositions("jean_paul_sartre.chr",["29Gm31","25Aq41","26Gm06","14Ta88","08Sc27","24Ta16","02Pi50","02Cp21","07Cn33","21Gm24","03Vi21","13Sg54","11Li27"]);
		assertPositions("jimi_hendrix.chr",["04Sg78","27Cn89","02Sg74","07Sg24","17Sc31","24Cn51","09Gm22","02Gm28","01Li40","07Le10","29Le19","24Sg68","24Li20"]);
		assertPositions("michael_jackson.chr",["05Vi70","09Pi81","25Le36","16Le45","21Ta76","28Li28","19Sg07","13Le28","02Sc34","02Vi09","24Li38","19Li60","23Cn13"]);
		assertPositions("michel_foucault.chr",["20Li83","29Cp92","07Sc92","11Li58","17Ta32","17Aq18","24Sc22","26Pi31","26Le25","15Cn56","11Cn05","04Sc15","13Le44"]);
		assertPositions("nicole_kidman.chr",["28Gm62","13Sg33","20Cn58","14Le25","18Li51","05Le10","11Ar29","20Vi31","22Sc03","18Vi06","04Ta15","06Sc35","07Le05"]);
		assertPositions("freddie_mercury.chr",["11Vi58","27Sg57","02Vi47","28Li09","16Li62","26Li02","04Le03","21Gm34","07Li23","12Le19","16Gm23","21Le29","27Ta54"]);
		assertPositions("kurt_cobain.chr",["01Pi53","13Cn12","18Pi26","26Pi37","01Sc48","25Cn41","28Pi43","23Vi14","24Sc21","19Vi47","10Ta36","20Vi00","17Gm63"]);
		assertPositions("charles_manson.chr",["19Sc46","03Aq86","02Sc59","18Sc14","14Vi49","07Sc02","21Aq44","28Ar38","14Vi14","26Cn01","04Aq51","05Ta24","20Cp21"]);
		assertPositions("fred_west.chr",["05Li57","24Cp31","00Sc75","16Sc51","20Ar14","21Gm14","28Ta14","00Gm07","27Vi44","05Le28","21Vi48","19Li20","25Cn49"]);
		assertPositions("lady_gaga.chr",["08Ar09","19Sc35","17Pi93","24Ar56","00Cp30","08Pi34","09Sg37","22Sg22","05Cp47","06Sc43","01Ta12","03Sg78","20Vi34"]);
		assertPositions("marilyn_manson.chr",["15Cp34","10Le64","02Aq19","01Pi22","04Sc02","05Li43","18Ar55","04Li00","27Sc55","25Vi05","04Ar20","20Le86","12Ta77"]);
		assertPositions("richard_ramirez.chr",["08Pi62","29Pi04","25Pi26","09Aq17","03Aq73","29Sg42","15Cp42","18Le11","09Sc02","04Vi48","25Vi37","22Sg70","08Li13"]);
		assertPositions("ted_bundy.chr",["02Sg22","17Sg32","24Sc22","20Sc37","13Sg21","13Sc03","08Le52","20Gm28","10Li09","13Le20","12Gm05","25Le03","16Ta49"]);
		assertPositions("mikhail_gorbachev.chr",["10Pi95","15Le85","29Aq70","26Cp08","27Cn38","10Cn29","20Cp20","13Ar26","04Vi13","18Cn52","16Ar23","29Vi21","29Gm05"]);
		assertPositions("vladimir_putin.chr",["13Li66","02Gm72","22Li91","11Sc52","26Sg42","19Ta44","17Li27","18Cn23","21Li09","22Le43","18Aq37","03Sc19","21Le22"]);
		assertPositions("miles_davis.chr",["04Gm04","21Sc27","23Ta28","21Ar60","15Pi96","26Aq28","21Sc53","28Pi48","22Le08","13Cn15","18Cn35","08Gm57","15Aq61"]);
		assertPositions("tony_blair.chr",["15Ta31","11Aq30","26Ar32","15Ar01","03Gm35","29Ta12","22Li21","15Cn16","21Li54","20Le47","07Aq27","04Gm86","26Cp06"]);
		assertPositions("johnny_cash.chr",["06Pi69","08Sc12","06Pi38","16Ar41","00Pi93","15Le13","00Aq15","17Ar01","06Vi36","20Cn12","27Pi17","08Ar44","05Cp02"]);
		assertPositions("david_cameron.chr",["15Li35","06Le54","04Sc55","07Li41","27Le58","01Le36","24Pi48","21Vi37","20Sc36","19Vi13","17Ta45","01Li59","02Cn07"]);
		assertPositions("queen_elizabeth_ii.chr",["00Ta14","12Le00","04Ar42","13Pi59","20Aq54","22Aq30","24Sc26","27Pi21","22Le02","12Cn42","20Cn28","21Cp45","25Sc60"]);
		assertPositions("charles_prince_of_wales.chr",["22Sc20","00Ta11","06Sc88","16Li18","20Sg92","29Sg53","05Vi15","29Gm56","14Li07","16Le34","03Ta56","05Le42","13Ar33"]);
		assertPositions("camillla_duchess_of_cornwall.chr",["23Cn55","09Cn61","19Cn87","10Cn42","11Gm16","17Sc41","09Le65","23Gm50","08Li13","12Le23","29Ta42","03Le14","09Ar87"]);
		assertPositions("julia_gillard.chr",["05Li80","11Gm04","01Sc70","06Vi81","28Li23","27Cp22","23Cp13","28Le34","09Sc47","08Vi48","24Le57","24Sc61","16Vi63"]);
		assertPositions("john_howard.chr",["01Le76","28Sc23","23Le88","20Cn04","28Cp68","08Ar45","00Ta56","21Ta29","21Vi17","01Le05","03Sc72","27Ta39","07Pi22"]);
		assertPositions("aki_kaurismaki.chr",["13Ar87","29Ta59","28Ar69","11Ar48","10Gm68","24Vi40","14Sg11","02Le53","01Sc42","28Le12","21Sc46","11Cn77","22Aq92"]);
		assertPositions("al_pacino.chr",["05Ta03","21Sg51","11Ar09","20Gm38","15Gm44","24Ar95","04Ta29","20Ta86","23Vi06","00Le39","19Li25","04Le93","21Ar65"]);
		assertPositions("robert_de_niro.chr",["23Le42","13Pi92","17Vi92","20Vi29","25Ta79","10Le23","24Gm09","08Gm30","00Li24","07Le20","15Le25","15Cn41","25Pi41"]);
		assertPositions("johnny_depp.chr",["17Gm87","13Cp64","25Ta02","25Ta90","02Vi97","13Ar83","23Aq05","01Vi34","13Sc25","09Vi37","22Cn14","12Le44","03Ta36"]);
		assertPositions("bjork.chr",["28Sc64","06Sc55","18Sg49","15Cp66","05Cp20","29Gm35","10Pi31","19Vi05","20Sc04","18Vi13","04Gm47","15Sc50","19Vi87"]);
	}
	
	public function testAllVipChartHouses() {
		assertHouses("elvis_presley.chr",[252.36979749219,284.839750558791,321.361505846897,356.83645182682,26.6601252235179,51.0030254840601,72.3697974921901,104.839750558791,141.361505846897,176.83645182682,206.660125223518,231.00302548406]);
		assertHouses("marilyn_monroe.chr",[133.081155346958,156.147534704261,183.6772600473,216.019128457183,250.597081114674,283.518404724615,313.081155346958,336.147534704261,3.67726004729968,36.0191284571828,70.5970811146743,103.518404724615]);
		assertHouses("barack_obama.chr",[318.065238079954,355.922972651829,30.3133013231612,58.9063037352176,83.9924653285856,109.0340955716,138.065238079954,175.922972651829,210.313301323161,238.906303735218,263.992465328586,289.0340955716]);
		assertHouses("edward_ted_kennedy.chr",[280.789048887846,323.666890108508,5.6561374935019,36.8470504002933,60.1563817606499,80.1376647960432,100.789048887846,143.666890108508,185.656137493502,216.847050400293,240.15638176065,260.137664796043]);
		assertHouses("bill_clinton.chr",[185.509466001489,213.055800471075,243.625219873631,275.981827435773,308.306790028093,338.626715645051,5.50946600148893,33.0558004710749,63.6252198736312,95.9818274357727,128.306790028093,158.626715645051]);
		assertHouses("hillary_clinton.chr",[89.8168912507811,109.502878278261,130.047727073801,155.116623894007,188.686512839244,230.600075546839,269.816891250781,289.502878278261,310.047727073801,335.116623894007,8.6865128392443,50.6000755468389]);
		assertHouses("dalai_lama_14th.chr",[206.280832923538,234.567524423678,266.102426000857,299.75980985312,332.589899617214,1.73743342450757,26.2808329235385,54.567524423678,86.1024260008567,119.75980985312,152.589899617214,181.737433424508]);
		assertHouses("bob_dylan.chr",[260.328676225297,298.78126510018,342.678158555377,17.8555360844596,43.0869910170701,62.7105631814766,80.3286762252974,118.78126510018,162.678158555377,197.85553608446,223.08699101707,242.710563181477]);
		assertHouses("david_bowie.chr",[309.261899745017,9.77075730423754,45.4689808451826,67.5218523764923,85.1918919306398,103.327811259381,129.261899745017,189.770757304238,225.468980845183,247.521852376492,265.19189193064,283.327811259381]);
		assertHouses("edith_piaf.chr",[233.644705870922,264.773220350955,303.847569179955,342.690046546726,13.1085188695386,35.7615252128583,53.6447058709225,84.7732203509553,123.847569179955,162.690046546726,193.108518869539,215.761525212858]);
		assertHouses("gene_simmons.chr",[11.1193121529959,47.3683443648679,73.8671370120503,96.8087940194227,120.740612040036,150.473281523932,191.119312152996,227.368344364868,253.86713701205,276.808794019423,300.740612040036,330.473281523932]);
		assertHouses("jim_morrison.chr",[312.856631625963,353.160102056841,28.7057848548847,56.9809643672447,81.0805514252622,104.854351338256,132.856631625963,173.160102056841,208.705784854885,236.980964367245,261.080551425262,284.854351338256]);
		assertHouses("jimmy_page.chr",[223.787849711415,253.079537861434,290.6548751965,330.359287398927,2.24496052884695,25.8018575504491,43.7878497114151,73.0795378614343,110.6548751965,150.359287398927,182.244960528847,205.801857550449]);
		assertHouses("madonna.chr",[158.255887282816,181.491856435958,210.113711009674,243.754807593486,278.958100297076,310.930323899196,338.255887282816,1.49185643595848,30.113711009674,63.7548075934859,98.958100297076,130.930323899196]);
		assertHouses("ozzy_osbourne.chr",[228.537652736451,258.733273509903,298.242690555311,338.430199547343,9.22531525287275,31.5122936600616,48.5376527364508,78.7332735099029,118.242690555311,158.430199547343,189.225315252873,211.512293660062]);
		assertHouses("saddam_hussein.chr",[67.8263019065758,91.6687681832425,113.635647001565,137.886398752112,168.335404786572,207.106974660759,247.826301906576,271.668768183242,293.635647001565,317.886398752112,348.335404786572,27.1069746607589]);
		assertHouses("anton_lavey.chr",[323.939835871281,12.7568177486933,46.3917790023714,70.3316430708456,91.0075935916817,113.13536339341,143.939835871281,192.756817748693,226.391779002371,250.331643070846,271.007593591682,293.13536339341]);
		assertHouses("britney_spears.chr",[182.649187866232,210.448914214921,240.92540932036,272.809788549954,304.708301882216,335.123177305376,2.6491878662323,30.448914214921,60.9254093203596,92.8097885499541,124.708301882216,155.123177305376]);
		assertHouses("diana_princess_of_wales.chr",[258.608812066934,299.86802351951,348.135538229324,22.8526242454936,45.970750449603,63.3428178930965,78.6088120669343,119.86802351951,168.135538229324,202.852624245494,225.970750449603,243.342817893097]);
		assertHouses("georges_bataille.chr",[342.245809540631,31.3763151188635,60.4372693490371,81.5911438603446,101.255442335044,124.59112741592,162.245809540631,211.376315118863,240.437269349037,261.591143860345,281.255442335044,304.59112741592]);
		assertHouses("janis_joplin.chr",[325.557615600601,7.11937056524793,40.8487727993322,67.2657736451835,90.5877764136067,114.947117713386,145.557615600601,187.119370565248,220.848772799332,247.265773645184,270.587776413607,294.947117713386]);
		assertHouses("jean_paul_sartre.chr",[253.549830022026,290.437418119916,334.713906260127,11.2741193986773,37.216254217073,56.7755293581632,73.5498300220262,110.437418119916,154.713906260127,191.274119398677,217.216254217073,236.775529358163]);
		assertHouses("jimi_hendrix.chr",[264.681884938934,305.327541405947,350.188595016789,24.2011742472334,48.2366204619648,67.1746679885794,84.6818849389336,125.327541405947,170.188595016789,204.201174247233,228.236620461965,247.174667988579]);
		assertHouses("michael_jackson.chr",[199.60875965424,226.994588039423,258.601696867245,293.13088660261,326.571756212297,355.635754513972,19.6087596542396,46.9945880394228,78.6016968672449,113.13088660261,146.571756212297,175.635754513972]);
		assertHouses("michel_foucault.chr",[214.150061402022,242.351328386188,276.322679532744,313.440720699028,346.703117610005,13.2636128731612,34.1500614020218,62.3513283861878,96.3226795327442,133.440720699028,166.703117610005,193.263612873161]);
		assertHouses("nicole_kidman.chr",[216.350637549042,245.557661165615,275.718717296319,307.055299410488,338.928390320171,9.25304053614593,36.3506375490421,65.5576611656145,95.7187172963187,127.055299410488,158.928390320171,189.253040536146]);
		assertHouses("freddie_mercury.chr",[141.295727438564,174.67966119817,207.634724515112,237.544149950743,264.840490880435,291.870040728227,321.295727438564,354.67966119817,27.6347245151117,57.544149950743,84.8404908804345,111.870040728227]);
		assertHouses("kurt_cobain.chr",[170.000093261451,193.757503336293,223.133526163223,257.630634244429,293.035769480178,324.160322176823,350.000093261451,13.7575033362926,43.1335261632235,77.6306342444291,113.035769480178,144.160322176823]);
		assertHouses("charles_manson.chr",[35.242239932139,66.1207673685742,88.868672879329,110.21900593516,134.781893741226,168.455680433442,215.242239932139,246.120767368574,268.868672879329,290.21900593516,314.781893741226,348.455680433442]);
		assertHouses("fred_west.chr",[199.201485594419,225.162107969537,257.625015906178,295.49074935739,330.355749227192,357.979914149549,19.2014855944191,45.1621079695372,77.6250159061775,115.49074935739,150.355749227192,177.979914149549]);
		assertHouses("lady_gaga.chr",[243.780411857686,275.96354842829,313.61620865523,350.340648969683,20.3626424195373,43.9641661117884,63.7804118576857,95.9635484282903,133.61620865523,170.340648969683,200.362642419537,223.964166111788]);
		assertHouses("marilyn_manson.chr",[140.864035855921,162.87490086666,189.989670618885,222.770743376747,258.469391725746,291.919479043502,320.864035855921,342.87490086666,9.9896706188855,42.7707433767471,78.4693917257461,111.919479043502]);
		assertHouses("richard_ramirez.chr",[262.706004031892,296.351643983434,333.404284374892,8.13771473977249,36.8948247229063,60.7902044376691,82.7060040318915,116.351643983434,153.404284374893,188.137714739772,216.894824722906,240.790204437669]);
		assertHouses("ted_bundy.chr",[145.034182865527,166.456946460665,193.359435513826,226.492934947341,262.970296910788,296.623256781193,325.034182865527,346.456946460665,13.3594355138263,46.492934947341,82.970296910788,116.623256781193]);
		assertHouses("mikhail_gorbachev.chr",[179.216197076343,204.37416412111,234.632931199847,269.053750380407,303.530494591809,333.906005637349,359.216197076343,24.3741641211098,54.6329311998475,89.0537503804067,123.530494591809,153.906005637349]);
		assertHouses("vladimir_putin.chr",[213.191512643458,239.719369352713,277.034091749104,321.220046844778,354.423584077935,17.1189705621914,33.1915126434578,59.7193693527129,97.0340917491038,141.220046844778,174.423584077935,197.118970562191]);
		assertHouses("miles_davis.chr",[68.5763242167663,91.583506932149,112.48126870192,135.61696936212,165.357866625089,205.259077018704,248.576324216766,271.583506932149,292.48126870192,315.61696936212,345.357866625089,25.2590770187044]);
		assertHouses("tony_blair.chr",[64.8625848284365,84.984825721801,100.181149309154,116.062357663146,137.479517749755,176.307613863404,244.862584828436,264.984825721801,280.181149309154,296.062357663146,317.479517749755,356.307613863404]);
		assertHouses("johnny_cash.chr",[8.44206675875084,45.7142595246666,72.3448353203042,95.0233707651767,118.452244232729,147.588829059437,188.442066758751,225.714259524667,252.344835320304,275.023370765177,298.452244232729,327.588829059437]);
		assertHouses("david_cameron.chr",[181.595586594242,205.665929040141,235.912719330573,272.075423208647,308.017410447959,337.906837422951,1.59558659424152,25.6659290401414,55.9127193305727,92.0754232086472,128.017410447959,157.906837422951]);
		assertHouses("queen_elizabeth_ii.chr",[291.455840827765,348.525735342137,30.365061130144,55.6064650908185,74.1520722295113,91.1447385859499,111.455840827765,168.525735342137,210.365061130144,235.606465090819,254.152072229511,271.14473858595]);
		assertHouses("charles_prince_of_wales.chr",[125.428161942933,142.191883782917,163.691870024848,193.332583886071,232.968862905778,273.879867063094,305.428161942933,322.191883782917,343.691870024848,13.3325838860706,52.9688629057776,93.8798670630943]);
		assertHouses("camillla_duchess_of_cornwall.chr",[123.149333200717,139.700002125989,160.778299509012,189.875923960874,229.348180223053,271.008341968413,303.149333200717,319.700002125989,340.778299509012,9.87592396087416,49.3481802230534,91.0083419684131]);
		assertHouses("julia_gillard.chr",[234.619695617778,266.171578085746,307.032346262237,346.634329653251,16.2890443393264,37.819516705461,54.6196956177778,86.1715780857456,127.032346262237,166.634329653251,196.289044339326,217.819516705461]);
		assertHouses("john_howard.chr",[57.3943575229977,87.8507113423104,122.034451467411,157.226418163977,188.869433820514,215.161386743435,237.394357522998,267.85071134231,302.034451467411,337.226418163977,8.8694338205139,35.1613867434351]);
		assertHouses("aki_kaurismaki.chr",[101.771499887696,112.517638700787,125.193193622093,142.922493228548,173.109513359751,230.552039534951,281.771499887696,292.517638700787,305.193193622093,322.922493228548,353.109513359751,50.5520395349512]);
		assertHouses("al_pacino.chr",[124.935515621155,145.414419463104,170.32901295951,201.65340521324,238.271674581953,274.196469397676,304.935515621155,325.414419463104,350.32901295951,21.6534052132401,58.2716745819534,94.1964693976765]);
		assertHouses("robert_de_niro.chr",[105.419064979122,124.95337026904,147.2324153279,175.414456131798,211.452979706876,250.997650474327,285.419064979122,304.95337026904,327.2324153279,355.414456131798,31.4529797068762,70.9976504743273]);
		assertHouses("johnny_depp.chr",[132.444578064468,154.444374060898,181.118421622698,213.368976113452,248.868643866728,282.734199887628,312.444578064468,334.444374060898,1.11842162269807,33.3689761134516,68.8686438667282,102.734199887628]);
		assertHouses("bjork.chr",[225.506727469925,253.25696686237,302.688244796393,349.879875658173,17.3057049691358,34.1704327158483,45.506727469925,73.2569668623702,122.688244796393,169.879875658173,197.305704969136,214.170432715848]);
	}
	
}