package com.leapinglight.astrology.gui.js;

import js.html.CanvasElement;
import js.html.Element;

class CanvasUtil
{
	public function new() {	}
	
	public static function getCanvasPosFromMouseEvent(canvas:CanvasElement, event:Dynamic) {
		var elem:Element = canvas;
		var posX = 0;
		var posY = 0;
		while (elem.offsetParent != null) {
			posX += (elem.offsetLeft - elem.scrollLeft - elem.clientLeft);
			posY += (elem.offsetTop - elem.scrollTop - elem.clientTop);
			elem = elem.offsetParent;
			
		}
		var modelX = Math.round( (event.pageX - posX) * (canvas.width / canvas.offsetWidth) );
		var modelY = Math.round( (event.pageY - posY)* (canvas.height / canvas.offsetHeight) ); 
		return {
			x: modelX,
			y: modelY
		};
	}		
	
}