package ;

import com.leapinglight.astrology.ChartData;
import com.leapinglight.astrology.gui.openfl.OpenFlChart;
import com.leapinglight.astrology.HouseCalc;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import com.leapinglight.astrology.test.AllAstroTests;
import haxe.Timer;
//import leapinglight.astrology.TZInfo;

import com.leapinglight.geo.GeoData;
import com.leapinglight.astrology.AstroDefs;
import com.leapinglight.astrology.AstroLoader;
//import com.leapinglight.astrology.gui.ChartFileUtil;

/**
 * ...
 * @author test
 */

class Main extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	
	var b:OpenFlChart;
	var c:ChartData;
	var c2:ChartData;
	
	function init() 
	{
		if (inited) return;
		inited = true;

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		graphics.lineStyle(2, 0xAA0000);
		graphics.moveTo(10, 10);
		graphics.lineTo(1000, 1000);
		b = new OpenFlChart();
		b.x  = 0;
		b.y = 100;
		b.redraw();
		addChild(b);
		
		c = new ChartData();
		c.CountryCode = "NO";
		c.CountryName = "Norway";
		c.PlaceName = "Drammen";
		c.Latitude = 59.74;
		c.Longitude = 10.21;
		c.Year = 1978;
		c.Month = 4;
		c.Day = 12;
		c.Hour = 19;
		c.Minute = 20;
		c.TimeZone = "Europe/Oslo";
		b.chartData = c;
		b.updateChart();
		
		/*c2 = ChartData.fromFile("assets/vip/georges_bataille.chr");
		b.chart2Data = c2;
		b.IsCompareChart = true;
		//b.IsTransitChart = true;
		b.SelectedPlanetNo = AstroDefs.NODE;
		b.SelectedPlanetIsComparison = true;*/

		//haxe.Timer.delay(animateSome, 1000); // iOS 6
		//ChartFileUtil.loadVipsNotLoaded(err, loaded, err);
		
	}
	
	function animateSome() {
		//for (i in 0...5000) {
			c.adjustTime(0, 0, 1, 0, 0);
			b.updateChart();
		//}
	}
	//var startTimer:Timer;
	var started = false;
	function startAnimation(d:Dynamic) {
		if (started) return;
		started = true;
		//startTimer.stop();
		var timer = new Timer(10);
		timer.run = animateSome;
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
		//startTimer = new Timer(5000);
		//startTimer.run = startAnimation;
		
		addEventListener(MouseEvent.MOUSE_DOWN, startAnimation);
		
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
		
		var rec = AstroLoader.calculateRecForGmt(1978, 4, 12, 18, 20, 0, null);
		/*ascendant = 202.30492530389716
		gmt0sideralTime = 13.322777777777777
		gmtTime = 18.333333333333332
		gmtTime = 18.333333333333332*/
		
		HouseCalc.calcAscAndMc(rec, 59.74, 10.21);
		var houses = HouseCalc.emptyHouseArray();
		var localSideral = HouseCalc.calculateLocalSideral(rec.gmt0sideralTime, AstroDefs.hmsToHours(18, 20, 0), 10.21);
		HouseCalc.calcHousesPlacidus(houses, rec.ascendant, rec.mediumCoeli, localSideral, 59.74);
		HouseCalc.calcHousesKoch(houses, rec.ascendant, rec.mediumCoeli, localSideral, 59.74);
		HouseCalc.calcHousesPorphyry(houses, rec.ascendant, rec.mediumCoeli);
		
		
		var i = 0;
		
		var g = GeoData.loadCountryInfo();
		
		/*trace(rec.sun);
		trace(g[1].countryName);
		trace(p[1].placeName);
		*/
		
		trace(new AllAstroTests().runTests());
		
		/*
		trace(DateTools.makeUtc(1970, 0, 1, 0, 0, 10));
		
		//var tz:TZInfo = new TZInfo("Europe/Oslo");
		//var st:SimpleTime = tz.toUTC(1978, 4, 12, 19, 20);
		//trace(st);
		
		trace("1980");
		trace(DateTools.makeUtc(1980, 0, 1, 0, 0, 0));
		trace("1970");
		trace(DateTools.makeUtc(1970, 0, 1, 0, 0, 0));
		trace("1950");
		trace(DateTools.makeUtc(1950, 0, 1, 0, 0, 0));
		
		
		var j = 0;
		*/
		
	}
	function err(d:Dynamic) {
		trace("err" + Std.string(d));
	}
	
	var vips:Array<String>;
	var vipI:Int = 0;
	
	
	
	function animateSome2() {
		//for (i in 0...5000) {
		/*var data = ChartFileUtil.readVip(vips[vipI]);
		vipI++;
		c.updateFromSerialized(data);
			trace("updated from serialized");
			b.updateChart();
		//}*/
	}
	//var startTimer:Timer;
	var viptimer:Timer;
	function startAnimation2() {
		if (vipI >= vips.length) {
			viptimer.stop();
			return;
		}
		
		//startTimer.stop();
		viptimer = new Timer(500);
		viptimer.run = animateSome2;
	}	
	function loaded(d:Dynamic) {
		trace("loaded");
		vipI = 0;
		//vips = ChartFileUtil.getVipFiles();
		//haxe.Timer.delay(startAnimation2, 100);
		/*for (fn in ChartFileUtil.getVipFiles()) {
			trace("trying: " + fn);
			var data = ChartFileUtil.readVip(fn);
			//trace("DATA=" + data);
			c.updateFromSerialized(data);
			trace("updated from serialized");
			b.updateChart();
			
			Sys.sleep(0.1);
		}*/
		//trace(l.data);
		trace(d);
		//l.spl
		//isLoaded = true;
	}	
}
