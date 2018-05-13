package com.leapinglight.astrology.gui;

interface IDrawer 
{
	public var planetImages(default, null) : Array<IImage>;
	public var compPlanetImages(default, null) : Array<IImage>;
	public var signImages(default, null) : Array<IImage>;
	public var houseNumbers(default, null) : Array<IImage>;
	public function drawCircle(x:Float, y:Float, radius:Float) : Void;
	public function line(lineStart: { x:Float, y:Float }, lineEnd: { x:Float, y:Float }, color:Int = 0xFFFFFF, thickness:Float = 1) : Void;
	public function beginFill(color:Int) : Void;
	public function lineStyle(thickness:Float, color:Int) : Void;
	public function drawRect(x:Float, y:Float, width:Float, height:Float) : Void;
	public function endFill() : Void;
  
}