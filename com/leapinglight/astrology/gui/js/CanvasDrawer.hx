package com.leapinglight.astrology.gui.js;
import com.leapinglight.astrology.gui.IDrawer;
import js.html.CanvasRenderingContext2D;

class CanvasDrawer implements IDrawer
{
	var planetFiles = "/gfx/planets20w/${NAME}.png";
	inline static var planetFilesLightTheme = "/gfx/planets25/${NAME}.png";
	var comparePlanetFiles = "/gfx/planets20w/${NAME}.png";
	var signFiles = "/gfx/signs30/col_${NAME}.png";
	
	public var planetImages(default, null) : Array<IImage>;
	public var compPlanetImages(default, null) : Array<IImage>;
	public var signImages(default, null) : Array<IImage>;
	public var houseNumbers(default, null) : Array<IImage>;
	
	var ctx:CanvasRenderingContext2D;
	var planetSize = 25;
	var signSize = 30;
	
	public function new(ctx:CanvasRenderingContext2D, lightTheme:Bool = false) 
	{
		this.ctx = ctx;
		if (lightTheme) {
			planetFiles = planetFilesLightTheme;
			comparePlanetFiles = planetFilesLightTheme;
		}
		loadPlanetBitmaps();
		loadSignBitmaps();
		initHouseNumbers();
	}
	
	var strokeStyle:String = null;
	var lineWidth:Float = 1;
	
	public function drawCircle(x:Float, y:Float, radius:Float) : Void {
		ctx.beginPath();
		var centerX = x;
		var centerY = y;
		ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
		//ctx.fillStyle = 'green';
		//ctx.fill();
		ctx.lineWidth = 1;
		ctx.strokeStyle = strokeStyle; // '#003300';
		ctx.stroke();
	}
	public function line(lineStart: { x:Float, y:Float }, lineEnd: { x:Float, y:Float }, color:Int = 0xFFFFFF, thickness:Float = 1) : Void {
		ctx.beginPath();
		ctx.moveTo(lineStart.x, lineStart.y);
		ctx.lineTo(lineEnd.x, lineEnd.y);
		ctx.strokeStyle = colorToFillStyle(color);
		ctx.lineWidth = thickness;
		ctx.stroke();
	}
	function colorToFillStyle(color:Int) {
		var r:Int = (color & 0xFF0000) >> 16;
		var g:Int = (color & 0x00FF00) >> 8;
		var b:Int = (color & 0x0000FF);
		var a:Int = 255;
		return "rgba(" + r + "," + g + "," + b + "," + a + ")";
	}
	public function beginFill(color:Int) : Void {
		ctx.fillStyle = colorToFillStyle(color);
	}
	public function lineStyle(thickness:Float, color:Int) : Void {
		lineWidth = thickness;
		var r:Int = (color & 0xFF0000) >> 16;
		var g:Int = (color & 0x00FF00) >> 8;
		var b:Int = (color & 0x0000FF);
		var a:Int = 255;
		strokeStyle = "rgba(" + r + "," + g + "," + b + "," + a + ")";
	}
	public function drawRect(x:Float, y:Float, width:Float, height:Float) : Void {
		ctx.fillRect(x, y, width , height);
	}
	public function endFill() : Void {
		
	}
	
	private function loadPlanetBitmaps() : Void {
		planetImages = new Array<IImage>();
		for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI + 1) {
			planetImages.push(new ChartImage(planetFile(p), this.ctx, planetSize, planetSize));
		}
		compPlanetImages = new Array<IImage>();
		for (p in AstroDefs.SUN...AstroDefs.MEDIUM_COELI + 1) {
			compPlanetImages.push(new ChartImage(comparePlanetFile(p), this.ctx, planetSize, planetSize));
		}
	}

	private function loadSignBitmaps() : Void  {
		signImages = new Array<IImage>();
		for (s in 0...AstroDefs.NUM_SIGNS) {
			signImages.push(new ChartImage(signFile(s), this.ctx, signSize, signSize));
		}
	}
	
	private function initHouseNumbers() {
		houseNumbers = new Array<IImage>();
		for (h in 1...12 + 1) {
			var fontSize = 20;
			var element = AstroDefs.SIGN_AND_HOUSE_ELEMENTS[h-1];
			var color = AstroDefs.ELEMENT_COLORS[element];
			houseNumbers.push(new ChartText(
				Std.string(h), 
				"normal " + Std.string(fontSize) + "px Verdana", 
				color, 0.5, ctx));
		}
	}
	
	public inline function planetFile(p:Int) {
		return StringTools.replace(planetFiles, "${NAME}", AstroDefs.PLANET_FULL_NAMES[p].toLowerCase());
	}
	public inline function comparePlanetFile(p:Int) {
		return StringTools.replace(comparePlanetFiles, "${NAME}", AstroDefs.PLANET_FULL_NAMES[p].toLowerCase());
	}
	public inline function signFile(s:Int) {
		return StringTools.replace(signFiles, "${NAME}", AstroDefs.SIGN_NAMES[s].toLowerCase());
	}	
}