package com.leapinglight.astrology.gui.js;
import com.leapinglight.astrology.gui.IImage;
import js.html.CanvasRenderingContext2D;
import js.html.Image;

class ChartImage implements IImage
{

	public var x(get, set) : Float;
	public var y(get, set) : Float;
	public var width(get, null) : Float;
	public var height(get, null) : Float;
	public var visible(get, set) : Bool;
	public var loaded(default, null) : Bool;
	
	var im:Image;
	var ctx:CanvasRenderingContext2D;
	
	var defaultWidth = 0;
	var defaultHeight = 0;
	
	public function new(src:String, ctx:CanvasRenderingContext2D, defaultWidth:Int, defaultHeight:Int) 
	{
		this.ctx = ctx;
		this.im = new Image();
		this.loaded = false;
		this.defaultWidth = defaultWidth;
		this.defaultHeight = defaultHeight;
		im.src = src;
		im.onload = didLoad;
	}
	
	function didLoad(event:Dynamic) : Void {
		loaded = true;
		if (pendingDraw) {
			drawIt();
		}
	}
	
	var pendingDraw = false;
	
	var _x:Float = 0;
	var _y:Float = 0;
	var _visible:Bool = true;
	var xUpdated:Bool = false;
	var yUpdated:Bool = false;
	
	function drawIt() {
		if (xUpdated && yUpdated) {
			if (_visible) {
				if (!loaded) {
					pendingDraw = true;
					return;
				}
				ctx.drawImage(im, _x, _y);
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
		return im.width <= 0 ? defaultWidth : im.width; 
	}
	function get_height() { 
		return im.height <= 0 ? defaultHeight : im.height; 
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