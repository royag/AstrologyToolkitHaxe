package com.leapinglight.astrology.gui.js;

import js.html.CanvasRenderingContext2D;

class ChartText implements IImage
{

	public var x(get, set) : Float;
	public var y(get, set) : Float;
	public var width(get, null) : Float;
	public var height(get, null) : Float;
	public var visible(get, set) : Bool;
	public var loaded(default, null) : Bool;
	
	var ctx:CanvasRenderingContext2D;
	var text:String;
	var font:String;
	var color:Int;
	var alpha:Float;
	
	public function new(text:String, font:String, color:Int, alpha:Float, ctx:CanvasRenderingContext2D) 
	{
		this.ctx = ctx;
		this.text = text;
		this.font = font;
		this.color = color;
		this.alpha = alpha;
		loaded = true;
	}
	
	var _x:Float = 0;
	var _y:Float = 0;
	var _visible:Bool = true;
	var xUpdated:Bool = false;
	var yUpdated:Bool = false;
	
	var maxWidth = 50;
	
	function drawIt() {
		if (xUpdated && yUpdated) {
			if (_visible) {
				var r:Int = (color & 0xFF0000) >> 16;
				var g:Int = (color & 0x00FF00) >> 8;
				var b:Int = (color & 0x0000FF);
				var a:Int = Math.floor(alpha * 255);
				ctx.font = font;
				ctx.strokeStyle = "rgba(" + r + "," + g + "," + b + "," + a + ")";
				ctx.strokeText(text, _x, _y, maxWidth);
				xUpdated = false;
				yUpdated = false;
			}
		}
	}
	
	function get_x() { 
		return _x;
	}
	function set_x(n:Float) {
		_x = n;
		xUpdated = true;
		drawIt();
		return _x;
	}
	function get_y() { 
		return _y;
	}
	function set_y(n:Float) { 
		_y = n;
		yUpdated = true;
		drawIt();
		return _y;
	}
	function get_width() { 
		return 20; 
	}
	function get_height() { 
		return 20; 
	}
	function get_visible() { 
		return _visible; 
	}
	function set_visible(n:Bool) { 
		_visible = n;
		drawIt();
		return _visible;
	}	
}