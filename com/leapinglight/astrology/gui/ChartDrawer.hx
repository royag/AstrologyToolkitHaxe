package com.leapinglight.astrology.gui;

import com.leapinglight.astrology.AstroDefs;

class ChartDrawer
{
	var chartSize = 400;
	
	var backgroundColor = 0x000000;
	var zodiacInnerColor = 0xFFFFFF;
	var zodiacOuterColor = 0xFFFFFF;
	var zodiacInnerRatio = 0.83;
	var houseLineColor = 0x808080;
	var axisColor = 0xFFFFFF;	
	
	var lightTheme = false;
	
	public var CurrentPositions : PlanetPositions;
	public var CurrentComparisonPositions : PlanetPositions;
	public var Houses : Array<Float>;
	public var IsCompareChart:Bool = false;
	public var IsTransitChart:Bool = false;
	
	public var SelectedPlanetIsComparison = false;
	public var SelectedPlanetNo = -1;
	
	private var zodiacWidth = 40;
	
	var graphics:IDrawer;
	public function new(drawer:IDrawer, chartSize:Int = 400, lightTheme:Bool=false) 
	{
		this.graphics = drawer;
		this.chartSize = chartSize;
		this.lightTheme = lightTheme;
		if (lightTheme) {
			backgroundColor = 0xFFFFFF;
			zodiacInnerColor = 0x000000;
			zodiacOuterColor = 0x000000;
			axisColor = 0x000000;
		}
	}
	
	public function isLightTheme() {
		return lightTheme;
	}
	
	public function redraw() {
		redrawZodiacLines();
		if (Houses != null) {
			var aries0 = Math.floor(360 - Houses[AstroDefs.HOUSE_1]);
			var m_radius = Math.floor(chartSize / 2);
			var signRadius = m_radius - 20;
			var zodInnerRadius = Math.floor(chartSize * zodiacInnerRatio / 2);
			zodiacWidth = Math.floor((chartSize / 2) - zodInnerRadius);
			redrawZodiacSigns(aries0, m_radius, zodInnerRadius, signRadius);
			redrawHouses(Houses, aries0, m_radius, zodInnerRadius);
			if (CurrentPositions != null) {
				var planetRadius = signRadius - 40;
				redrawPlanets(aries0, m_radius, zodInnerRadius, planetRadius);
				if (CurrentComparisonPositions != null && IsCompareChart) {
					redrawComparisonPlanets(aries0, m_radius, zodInnerRadius, planetRadius);
				} else {
					setCompPlanetsVisible(false);
				}
				drawAspectLines(planetRadius, aries0, CurrentPositions, CurrentComparisonPositions);
			}
		}
		
	}
	
	private function redrawComparisonPlanets(aries0:Int, m_radius:Int, zodInnerRadius:Int, planetRadius:Int) {
		setCompPlanetsVisible(false);
		var minDistance = (IsTransitChart ? 10 : 15); // 5 : 10);
		var lastPlanet = (comparisonChartHasHouses() ? AstroDefs.MEDIUM_COELI : AstroDefs.NODE);
		var presPos2 = AstroDefs.calcPresentablePositionsWithMaxPlanet(CurrentComparisonPositions, minDistance, lastPlanet);
		var comparisonRadius = (IsTransitChart ? planetRadius + zodiacWidth : planetRadius - 30);		
		for (i in AstroDefs.SUN...lastPlanet+1)
		{
			var deg = Std.int(AstroDefs.positionOfPlanet(presPos2, i) + aries0);
			var degActual = Std.int(AstroDefs.positionOfPlanet(CurrentComparisonPositions, i) + aries0);
			centerAtDegRadius(deg, comparisonRadius, graphics.compPlanetImages[i]);
			graphics.compPlanetImages[i].visible = true;
			if (i < AstroDefs.ASCENDANT)
			{
				var lineOuter = m_radius - zodiacWidth + 2;
				var lineInner = lineOuter - 5;
				var lineStart = getXY(degActual, lineOuter);
				var lineEnd = getXY(degActual, lineInner);
				graphics.line(lineStart, lineEnd, axisColor);
			}
		}
	}
	
	private inline function comparisonChartHasHouses() {
		return !IsTransitChart;
	}
	private inline function chartHasHouses() {
		return true;
	}
	
	private function setCompPlanetsVisible(isIt:Bool) : Void {
		for (i in AstroDefs.SUN...AstroDefs.MEDIUM_COELI + 1) {
			graphics.compPlanetImages[i].visible = isIt;
		}
	}
	
	public function planetCurrentlyAt(x:Int, y:Int) {
		for (i in AstroDefs.SUN...AstroDefs.MEDIUM_COELI + 1) {
			var im = graphics.planetImages[i];
			if ((x >= im.x) && (x <= im.x + im.width) &&
				(y >= im.y) && (y <= im.y + im.height)) {
					return i;
				}
		}
		return -1;
	}
	
	//private var currentPresentablePostions:PlanetPositions;
	
	private function redrawPlanets(aries0:Int, m_radius:Int, zodInnerRadius:Int, planetRadius:Int) {
		var minDistanceNatal = 7;
		
		var presPos = AstroDefs.calcPresentablePositions(CurrentPositions, minDistanceNatal);

		for (i in AstroDefs.SUN...AstroDefs.MEDIUM_COELI+1)
		{
			var radius = (i == AstroDefs.ASCENDANT || i == AstroDefs.MEDIUM_COELI ? planetRadius + 30 : planetRadius);
			var deg = Std.int(AstroDefs.positionOfPlanet(presPos, i) + aries0); // presPos
			var degActual = Std.int(AstroDefs.positionOfPlanet(CurrentPositions, i) + aries0);
			centerAtDegRadius(deg, radius, graphics.planetImages[i]);

			if (i < AstroDefs.ASCENDANT)
			{
				var lineOuter = m_radius - zodiacWidth;
				var lineInner = lineOuter - 5;
				var lineStart = getXY(degActual, lineOuter);
				var lineEnd = getXY(degActual, lineInner);
				graphics.line(lineStart, lineEnd, axisColor);
			}
		}
	}
	
	public inline function getPositionForNatal(p:Int) {
		return AstroDefs.positionOfPlanet(CurrentPositions, p);
	}
	
	public inline function getTextPositionForNatal(p:Int) {
		return AstroDefs.positionToChar6(getPositionForNatal(p));
	}
	
	public inline function getSignForNatal(p:Int) {
		return AstroDefs.signForPosition(getPositionForNatal(p));
	}
	
	public inline function getHouseForNatal(p:Int) {
		return AstroDefs.houseOfPosition(getPositionForNatal(p), Houses);
	}
	
	public function getNatalAspectsFor(p:Int) : Array<{planet:Int, aspect:Int, orb:Float, pos:String}> {
		var numBodies = AstroDefs.NUM_PLANETS + 2;
		var ret = new Array<{planet:Int, aspect:Int, orb:Float, pos:String}>();
		for (p2 in 0...numBodies) {
			if (p2 != p) {
				var pos1 = AstroDefs.positionOfPlanet(CurrentPositions, p);
				var pos2 = AstroDefs.positionOfPlanet(CurrentPositions, p2);
				var aspect = getNatalAspect(pos1, pos2);
				if (aspect >= 0) {
					var dist:Float = AstroDefs.calcDistance(pos1, pos2);
					var orb:Float = Math.abs(dist - aspect);
					ret.push( { planet:p2, aspect:aspect, orb:orb, pos:AstroDefs.positionToChar6(pos2) } );
				}
			}
		}
		return ret;
	}
	
	private function drawAspectLines(planetRadius:Int, aries0:Int, pp:PlanetPositions, pp2:PlanetPositions)
	{
		var showComparisonAspects = IsCompareChart && !IsTransitChart;

		// aspects:
		var aspectRadius = planetRadius - 10;
		var numBodies = AstroDefs.NUM_PLANETS + 2;

		for (n1 in 0...numBodies) // NOT +1 ?
		{
			if (SelectedPlanetIsComparison && SelectedPlanetNo > -1 && IsTransitChart)
			{
				// Show any transit aspects for this planet
				var natPos = AstroDefs.positionOfPlanet(pp, n1);
				var transPos = AstroDefs.positionOfPlanet(pp2, SelectedPlanetNo);
				var aspect = getTransitAspect(natPos, transPos);
				if (aspect >= 0)
				{
					var natRadius = aspectRadius;
					var transRadius = natRadius + 30;
					var lineStart = getXY(aries0 + natPos, natRadius);
					var lineEnd = getXY(aries0 + transPos, transRadius);
					var thickness = 4;
					graphics.line(lineStart, lineEnd, AstroDefs.colorForAspect(aspect), thickness);
				}
			}
		}

		for (p1 in 0...numBodies)
		{
			for (p2 in 0...numBodies)
			{
				if (!showComparisonAspects && (p2 <= p1))
				{
					//m_aspectLines[p1][p2].Visibility = Visibility.Collapsed;
					continue;
				}
				if (!showComparisonAspects && (p1 >= AstroDefs.NUM_PLANETS || p2 >= AstroDefs.NUM_PLANETS) && !chartHasHouses())
				{
					//m_aspectLines[p1][p2].Visibility = Visibility.Collapsed;
					continue;
				}
				else if (showComparisonAspects)
				{
					if ((p1 >= AstroDefs.NUM_PLANETS && !chartHasHouses()) ||
						(p2 >= AstroDefs.NUM_PLANETS && !comparisonChartHasHouses()))
					{
						//m_aspectLines[p1][p2].Visibility = Visibility.Collapsed;
						continue;
					}
				}
				var pos1 = AstroDefs.positionOfPlanet(pp, p1);
				var pos2:Float;
				if (!showComparisonAspects)
				{
					pos2 = AstroDefs.positionOfPlanet(pp, p2);
				}
				else
				{
					pos2 = AstroDefs.positionOfPlanet(pp2, p2);
				}

				var aspect:Int;
				if (!showComparisonAspects)
				{
					aspect = getNatalAspect(pos1, pos2);
				}
				else
				{
					if (IsTransitChart)
					{
						aspect = getTransitAspect(pos1, pos2);
					}
					else
					{
						aspect = getSynastryAspect(pos1, pos2);
					}
				}

				if (aspect >= 0)
				{
					var radius = aspectRadius;
					if (showComparisonAspects)
					{
						radius = aspectRadius - 10;
					}
					var lineStart = getXY(aries0 + pos1, radius);
					var lineEnd = getXY(aries0 + pos2, radius);
					
					var thickLine = false;
					if (showComparisonAspects && SelectedPlanetIsComparison && p2 == SelectedPlanetNo && showComparisonAspects)
					{
						thickLine = true;
					}
					else if (!SelectedPlanetIsComparison && (p1 == SelectedPlanetNo) || (p2 == SelectedPlanetNo && !showComparisonAspects && !SelectedPlanetIsComparison))
					{
						thickLine = true;
					}
					
					graphics.line(lineStart, lineEnd, AstroDefs.colorForAspect(aspect), (thickLine ? 5 : 1));
				}
			}
		}
	}
	
	private function redrawHouses(houses:Array<Float>, aries0:Int, radius:Int, zodInnerRadius:Int) {
		var lineStart = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_4] + aries0), radius);
		var lineEnd = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_10] + aries0), radius);
		graphics.line(lineStart, lineEnd, axisColor);
		
		lineStart = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_2] + aries0), zodInnerRadius);
		lineEnd = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_8] + aries0), zodInnerRadius);
		graphics.line(lineStart, lineEnd, houseLineColor);

		lineStart = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_3] + aries0), zodInnerRadius);
		lineEnd = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_9] + aries0), zodInnerRadius);
		graphics.line(lineStart, lineEnd, houseLineColor);

		lineStart = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_5] + aries0), zodInnerRadius);
		lineEnd = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_11] + aries0), zodInnerRadius);
		graphics.line(lineStart, lineEnd, houseLineColor);

		lineStart = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_6] + aries0), zodInnerRadius);
		lineEnd = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_12] + aries0), zodInnerRadius);
		graphics.line(lineStart, lineEnd, houseLineColor);

		//setLine(ref m_axisAscDesc, -m_radius, 0, m_radius, 0);
		lineStart = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_1] + aries0), radius);
		lineEnd = getXY(AstroDefs.filter360(houses[AstroDefs.HOUSE_7] + aries0), radius);
		graphics.line(lineStart, lineEnd, axisColor);
		
		for (h in AstroDefs.HOUSE_1...AstroDefs.HOUSE_12+1)
		{
			var nextHouse = (h == AstroDefs.HOUSE_12 ? AstroDefs.HOUSE_1 : h + 1);
			var dist = AstroDefs.calcDistance(houses[h], houses[nextHouse]);
			var center = aries0 + Math.floor(AstroDefs.filter360(houses[h] + (dist * 0.5)));
			var rad = Math.floor(radius / 2);
			centerAtDegRadius(center, rad, graphics.houseNumbers[h]);
		}		
	}
	
	private function redrawZodiacSigns(aries0:Int, radius:Int, zodInnerRadius:Int, signRadius:Int) {
		for (i in AstroDefs.ARIES...AstroDefs.PISCES + 1) {
			centerAtDegRadius(aries0 + 15 + (i * 30), signRadius, graphics.signImages[i]);
			var lineStart = getXY(aries0 + i * 30, radius);
			var lineEnd = getXY(aries0 + i * 30, zodInnerRadius);
			graphics.line(lineStart, lineEnd, axisColor);
		}
	}
	
	private function redrawZodiacLines() {
		// Clear background:
		graphics.beginFill(backgroundColor);
		graphics.lineStyle(0, backgroundColor);
		graphics.drawRect(0, 0, chartSize, chartSize);
		graphics.endFill();
		graphics.lineStyle(1, zodiacOuterColor);
		graphics.drawCircle(chartSize / 2.0, chartSize / 2.0, chartSize / 2.0);
		graphics.lineStyle(1, zodiacInnerColor);
		graphics.drawCircle(chartSize / 2.0, chartSize / 2.0, (chartSize * zodiacInnerRatio) / 2.0);
	}
	
	public function updateChart(curPosWithHouses : PlanetPositions, compPos : PlanetPositions) {
		CurrentPositions = curPosWithHouses;
		Houses = curPosWithHouses.houses;
		CurrentComparisonPositions = compPos;
		redraw();		
	}
	private function DegreeToRadian(angle:Float):Float
	{
		return Math.PI * angle / 180.0;
	}
	function getXY(degree:Float, radius:Int)
	{
		var centerX = chartSize / 2;
		var centerY = chartSize / 2;
		degree -= 180;
		if (degree < 0) { degree += 360; }
		if (degree > 360) { degree -= 360; }
		var sinPos = Math.sin(DegreeToRadian(degree));
		var cosPos = Math.cos(DegreeToRadian(degree));
		var x = centerX + (0 + (cosPos * radius));
		var y = centerY - (0 + (sinPos * radius));
		return { x : x, y : y };
	}
	function centerAtDegRadius(deg:Int, radius:Int, im:IImage)
	{
		//Ellipse;
		var x = 0; var y = 0;
		var point = getXY(deg, radius);
		//var w = chartSize;
		//var h = chartSize;
		im.x = point.x - im.width / 2; // - (w / 2);
		im.y = point.y - im.height / 2; // - (h / 2);
	}	
	
	
	inline function aspectOrNotEnabled(asp:Int)
	{
		return asp; // return -1 if aspect disabled
	}

	inline function getNatalAspect(p1:Float, p2:Float)
	{
		var a = AstroDefs.getAspect(p1, p2, AstroDefs.DEFAULT_ORBS);
		return aspectOrNotEnabled(a);
	}

	inline function getSynastryAspect(p1:Float, p2:Float)
	{
		var a = AstroDefs.getAspect(p1, p2, AstroDefs.DEFAULT_TRANSIT_ORBS);
		return aspectOrNotEnabled(a);
	}

	inline function getTransitAspect(p1:Float, p2:Float)
	{
		var a = AstroDefs.getAspect(p1, p2, AstroDefs.DEFAULT_TRANSIT_ORBS);
		return aspectOrNotEnabled(a);
	}	
}