package com.leapinglight.astrology.gui.openfl ;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import openfl.Assets;
import com.leapinglight.astrology.AstroDefs;
import com.leapinglight.astrology.ChartData;
import com.leapinglight.astrology.HouseCalc;



class OpenFlChart extends Sprite implements IDrawer {
	var debug = true;
	var planetFiles = "assets/gfx/planets20w/${NAME}.png";
	var comparePlanetFiles = "assets/gfx/planets20w/${NAME}.png";
	var signFiles = "assets/gfx/signs30/col_${NAME}.png";
	//var signFiles = "assets/gfx/signs30/wt_${NAME}.png";

	public var chartData : ChartData;
	public var chart2Data : ChartData;
	
	public var planetImages(default, null) : Array<IImage>;
	public var compPlanetImages(default, null) : Array<IImage>;
	public var signImages(default, null) : Array<IImage>;
	public var houseNumbers(default, null) : Array<IImage>;
	
	var drawer:ChartDrawer;
	
	public function new() 
	{
		super();
		drawer = new ChartDrawer(this);
		addEventListener(Event.ADDED_TO_STAGE, added);
	}
	
	public function recalcChart() {
		
	}
	
	public function recalcCompareChart() {
		
	}
	
	var inited:Bool;
	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		//#if ios
		//haxe.Timer.delay(init, 100); // iOS 6
		//#else
		init();
		//#end
	}	
	
	function init() {
		if (inited) return;
		inited = true;
		loadPlanetBitmaps();
		loadSignBitmaps();
		initHouseNumbers();
	}
	
	function resize(e) 
	{
		if (!inited) init();
		drawer.redraw();
		// else (resize or orientation change)
	}	
	
	private function initHouseNumbers() {
		houseNumbers = new Array<IImage>();
		var tf = new TextFormat(null, 20);
		for (h in 1...12 + 1) {
			var t:TextField = new TextField();
			#if !(neko||cpp)
			t.text = Std.string(h);
			#else
			trace("CPP/NEKO: skipping t.text= since bug causes crash");
			#end
			t.background = false;
			t.border = false;
			var element = AstroDefs.SIGN_AND_HOUSE_ELEMENTS[h-1];
			t.textColor = AstroDefs.ELEMENT_COLORS[element];
			t.width = 25;
			t.height = 25;
			t.alpha = 0.5;
			t.type = TextFieldType.DYNAMIC;
			t.setTextFormat(tf);
			houseNumbers.push(new DisplayObjectWrapper(t));
			addChild(t);
		}
	}
	
	inline function planetFile(p:Int) {
		return StringTools.replace(planetFiles, "${NAME}", AstroDefs.PLANET_FULL_NAMES[p].toLowerCase());
	}
	inline function comparePlanetFile(p:Int) {
		return StringTools.replace(comparePlanetFiles, "${NAME}", AstroDefs.PLANET_FULL_NAMES[p].toLowerCase());
	}
	inline function signFile(s:Int) {
		return StringTools.replace(signFiles, "${NAME}", AstroDefs.SIGN_NAMES[s].toLowerCase());
	}
	
	private function loadPlanetBitmaps() : Void {
		planetImages = new Array<IImage>();
		for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI + 1) {
			var bm = new Bitmap(Assets.getBitmapData(planetFile(p)));
			planetImages.push(new DisplayObjectWrapper(bm));
			addChild(bm);
		}
		compPlanetImages = new Array<IImage>();
		for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI + 1) {
			var bm = new Bitmap(Assets.getBitmapData(comparePlanetFile(p)));
			compPlanetImages.push(new DisplayObjectWrapper(bm));
			addChild(bm);
		}
	}

	private function loadSignBitmaps() : Void  {
		signImages = new Array<IImage>();
		for (s in 0...AstroDefs.NUM_SIGNS) {
			var bm = new Bitmap(Assets.getBitmapData(signFile(s)));
			signImages.push(new DisplayObjectWrapper(bm));
			addChild(bm);
		}
	}
	
	public function line(lineStart:{x:Float,y:Float}, lineEnd:{x:Float,y:Float}, color:Int = 0xFFFFFF, thickness:Float = 1) : Void {
		graphics.lineStyle(thickness, color);
		graphics.moveTo(lineStart.x, lineStart.y);
		graphics.lineTo(lineEnd.x, lineEnd.y);
	}
	
	
	public function drawCircle(x:Float, y:Float, radius:Float) {
		#if (neko || cpp)
		trace("CPP/NEKO: Skipping circleDraw since obscure crashes when combined with TextField.text = 'x'");
		#else
		graphics.drawCircle(x, y, radius);
		#end
	}
	
	public function updateChart() {
		var CurrentPositions:PlanetPositions = AstroDefs.NULLpositions();
		try {
			CurrentPositions = chartData.CalculatePositions();
			if (debug) {
				trace("ChartTime: " + chartData.getTimeString());
			}
		} catch (e:Dynamic) {
			trace("Invalid or Unsupported Chart Data");
			return;
		}
		CurrentPositions.houses = chartData.CalculateHouses(CurrentPositions);
		var CurrentComparisonPositions = CurrentPositions;
		if (chart2Data != null) {
			try {
				CurrentComparisonPositions = chart2Data.CalculatePositions();
				if (debug) {
					trace("ComparisonTime: " + chart2Data.getTimeString());
				}
			} catch (e:Dynamic) {
				trace("Invalid or Unsupported Chart Data");
				return;
			}			
		}
		drawer.updateChart(CurrentPositions, CurrentComparisonPositions);
	}
	
	public function beginFill(color:Int) {
		graphics.beginFill(color);
	}
	public function lineStyle(thickness:Float, color:Int) {
		graphics.lineStyle(thickness, color);
	}
	public function drawRect(x:Float, y:Float, width:Float, height:Float) {
		graphics.drawRect(x, y, width, height);
	}
	public function endFill() {
		graphics.endFill();
	}
	 
	public function redraw() {
		drawer.redraw();
	}
}