CoD.AnimationLoadingWidget = InheritFrom( LUI.UIElement )
CoD.AnimationLoadingWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.AnimationLoadingWidget )
	self.id = "AnimationLoadingWidget"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 144 )
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, false, 0, 144.88 )
	Black:setTopBottom( true, false, 0, 144 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0 )
	self:addElement( Black )
	self.Black = Black
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 0, 144 )
	Glow:setTopBottom( true, false, 0, 144 )
	Glow:setRGB( 1, 0.39, 0 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_loadingspinner_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local DotsHex2 = LUI.UIImage.new()
	DotsHex2:setLeftRight( true, false, 0, 144 )
	DotsHex2:setTopBottom( true, false, 0, 144 )
	DotsHex2:setAlpha( 0 )
	DotsHex2:setImage( RegisterImage( "uie_t7_menu_loadingspinner_dotshex2" ) )
	DotsHex2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotsHex2 )
	self.DotsHex2 = DotsHex2
	
	local Shape1 = LUI.UIImage.new()
	Shape1:setLeftRight( true, false, 0, 144 )
	Shape1:setTopBottom( true, false, 0, 144 )
	Shape1:setRGB( 1, 0.39, 0 )
	Shape1:setAlpha( 0 )
	Shape1:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape1" ) )
	Shape1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape1 )
	self.Shape1 = Shape1
	
	local Shape2 = LUI.UIImage.new()
	Shape2:setLeftRight( true, false, 0, 144 )
	Shape2:setTopBottom( true, false, 0, 144 )
	Shape2:setRGB( 1, 0.39, 0 )
	Shape2:setAlpha( 0 )
	Shape2:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape2" ) )
	Shape2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape2 )
	self.Shape2 = Shape2
	
	local Shape3 = LUI.UIImage.new()
	Shape3:setLeftRight( true, false, 0, 144 )
	Shape3:setTopBottom( true, false, 0, 144 )
	Shape3:setRGB( 1, 0.39, 0 )
	Shape3:setAlpha( 0 )
	Shape3:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape3" ) )
	Shape3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape3 )
	self.Shape3 = Shape3
	
	local Shape4 = LUI.UIImage.new()
	Shape4:setLeftRight( true, false, 0, 144 )
	Shape4:setTopBottom( true, false, 0, 144 )
	Shape4:setRGB( 1, 0.39, 0 )
	Shape4:setAlpha( 0 )
	Shape4:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape4" ) )
	Shape4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape4 )
	self.Shape4 = Shape4
	
	local Shape5 = LUI.UIImage.new()
	Shape5:setLeftRight( true, false, 0, 144 )
	Shape5:setTopBottom( true, false, 0, 144 )
	Shape5:setRGB( 1, 0.39, 0 )
	Shape5:setAlpha( 0 )
	Shape5:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape5" ) )
	Shape5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape5 )
	self.Shape5 = Shape5
	
	local Shape6 = LUI.UIImage.new()
	Shape6:setLeftRight( true, false, 0, 144 )
	Shape6:setTopBottom( true, false, 0, 144 )
	Shape6:setRGB( 1, 0.39, 0 )
	Shape6:setAlpha( 0 )
	Shape6:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape6" ) )
	Shape6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape6 )
	self.Shape6 = Shape6
	
	local Shape7 = LUI.UIImage.new()
	Shape7:setLeftRight( true, false, 0, 144 )
	Shape7:setTopBottom( true, false, 0, 144 )
	Shape7:setRGB( 1, 0.39, 0 )
	Shape7:setAlpha( 0 )
	Shape7:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape7" ) )
	Shape7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape7 )
	self.Shape7 = Shape7
	
	local Shape8 = LUI.UIImage.new()
	Shape8:setLeftRight( true, false, 0, 144 )
	Shape8:setTopBottom( true, false, 0, 144 )
	Shape8:setRGB( 1, 0.39, 0 )
	Shape8:setAlpha( 0 )
	Shape8:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape8" ) )
	Shape8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape8 )
	self.Shape8 = Shape8
	
	local Shape9 = LUI.UIImage.new()
	Shape9:setLeftRight( true, false, 0, 144 )
	Shape9:setTopBottom( true, false, 0, 144 )
	Shape9:setRGB( 1, 0.39, 0 )
	Shape9:setAlpha( 0 )
	Shape9:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape9" ) )
	Shape9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape9 )
	self.Shape9 = Shape9
	
	local Shape10 = LUI.UIImage.new()
	Shape10:setLeftRight( true, false, 0, 144 )
	Shape10:setTopBottom( true, false, 0, 144 )
	Shape10:setRGB( 1, 0.39, 0 )
	Shape10:setAlpha( 0 )
	Shape10:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape10" ) )
	Shape10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape10 )
	self.Shape10 = Shape10
	
	local Shape11 = LUI.UIImage.new()
	Shape11:setLeftRight( true, false, 0, 144 )
	Shape11:setTopBottom( true, false, 0, 144 )
	Shape11:setRGB( 1, 0.39, 0 )
	Shape11:setAlpha( 0 )
	Shape11:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape11" ) )
	Shape11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape11 )
	self.Shape11 = Shape11
	
	local Shape12 = LUI.UIImage.new()
	Shape12:setLeftRight( true, false, 0, 144 )
	Shape12:setTopBottom( true, false, 0, 144 )
	Shape12:setRGB( 1, 0.39, 0 )
	Shape12:setAlpha( 0 )
	Shape12:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape12" ) )
	Shape12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape12 )
	self.Shape12 = Shape12
	
	local Shape13 = LUI.UIImage.new()
	Shape13:setLeftRight( true, false, 0, 144 )
	Shape13:setTopBottom( true, false, 0, 144 )
	Shape13:setRGB( 1, 0.39, 0 )
	Shape13:setAlpha( 0 )
	Shape13:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape13" ) )
	Shape13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape13 )
	self.Shape13 = Shape13
	
	local Shape14 = LUI.UIImage.new()
	Shape14:setLeftRight( true, false, 0, 144 )
	Shape14:setTopBottom( true, false, 0, 144 )
	Shape14:setRGB( 1, 0.39, 0 )
	Shape14:setAlpha( 0 )
	Shape14:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape14" ) )
	Shape14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape14 )
	self.Shape14 = Shape14
	
	local Shape15 = LUI.UIImage.new()
	Shape15:setLeftRight( true, false, 0, 144 )
	Shape15:setTopBottom( true, false, 0, 144 )
	Shape15:setRGB( 1, 0.39, 0 )
	Shape15:setAlpha( 0 )
	Shape15:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape15" ) )
	Shape15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape15 )
	self.Shape15 = Shape15
	
	local Shape16 = LUI.UIImage.new()
	Shape16:setLeftRight( true, false, 0, 144 )
	Shape16:setTopBottom( true, false, 0, 144 )
	Shape16:setRGB( 1, 0.39, 0 )
	Shape16:setAlpha( 0 )
	Shape16:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape16" ) )
	Shape16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape16 )
	self.Shape16 = Shape16
	
	local Shape17 = LUI.UIImage.new()
	Shape17:setLeftRight( true, false, 0, 144 )
	Shape17:setTopBottom( true, false, 0, 144 )
	Shape17:setRGB( 1, 0.39, 0 )
	Shape17:setAlpha( 0 )
	Shape17:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape17" ) )
	Shape17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape17 )
	self.Shape17 = Shape17
	
	local Shape18 = LUI.UIImage.new()
	Shape18:setLeftRight( true, false, 0, 144 )
	Shape18:setTopBottom( true, false, 0, 144 )
	Shape18:setRGB( 1, 0.39, 0 )
	Shape18:setAlpha( 0 )
	Shape18:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape18" ) )
	Shape18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape18 )
	self.Shape18 = Shape18
	
	local Shape19 = LUI.UIImage.new()
	Shape19:setLeftRight( true, false, 0, 144 )
	Shape19:setTopBottom( true, false, 0, 144 )
	Shape19:setRGB( 1, 0.39, 0 )
	Shape19:setAlpha( 0 )
	Shape19:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape19" ) )
	Shape19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape19 )
	self.Shape19 = Shape19
	
	local Shape20 = LUI.UIImage.new()
	Shape20:setLeftRight( true, false, 0, 144 )
	Shape20:setTopBottom( true, false, 0, 144 )
	Shape20:setRGB( 1, 0.39, 0 )
	Shape20:setAlpha( 0 )
	Shape20:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape20" ) )
	Shape20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape20 )
	self.Shape20 = Shape20
	
	local Shape21 = LUI.UIImage.new()
	Shape21:setLeftRight( true, false, 0, 144 )
	Shape21:setTopBottom( true, false, 0, 144 )
	Shape21:setRGB( 1, 0.39, 0 )
	Shape21:setAlpha( 0 )
	Shape21:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape21" ) )
	Shape21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape21 )
	self.Shape21 = Shape21
	
	local Shape22 = LUI.UIImage.new()
	Shape22:setLeftRight( true, false, 0, 144 )
	Shape22:setTopBottom( true, false, 0, 144 )
	Shape22:setRGB( 1, 0.39, 0 )
	Shape22:setAlpha( 0 )
	Shape22:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape22" ) )
	Shape22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape22 )
	self.Shape22 = Shape22
	
	local Shape23 = LUI.UIImage.new()
	Shape23:setLeftRight( true, false, 0, 144 )
	Shape23:setTopBottom( true, false, 0, 144 )
	Shape23:setRGB( 1, 0.39, 0 )
	Shape23:setAlpha( 0 )
	Shape23:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape23" ) )
	Shape23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape23 )
	self.Shape23 = Shape23
	
	local Shape24 = LUI.UIImage.new()
	Shape24:setLeftRight( true, false, 0, 144 )
	Shape24:setTopBottom( true, false, 0, 144 )
	Shape24:setRGB( 1, 0.39, 0 )
	Shape24:setAlpha( 0 )
	Shape24:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape24" ) )
	Shape24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape24 )
	self.Shape24 = Shape24
	
	local Shape25 = LUI.UIImage.new()
	Shape25:setLeftRight( true, false, 0, 144 )
	Shape25:setTopBottom( true, false, 0, 144 )
	Shape25:setRGB( 1, 0.39, 0 )
	Shape25:setAlpha( 0 )
	Shape25:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape25" ) )
	Shape25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape25 )
	self.Shape25 = Shape25
	
	local Shape26 = LUI.UIImage.new()
	Shape26:setLeftRight( true, false, 0, 144 )
	Shape26:setTopBottom( true, false, 0, 144 )
	Shape26:setRGB( 1, 0.39, 0 )
	Shape26:setAlpha( 0 )
	Shape26:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape26" ) )
	Shape26:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape26 )
	self.Shape26 = Shape26
	
	local Shape27 = LUI.UIImage.new()
	Shape27:setLeftRight( true, false, 0, 144 )
	Shape27:setTopBottom( true, false, 0, 144 )
	Shape27:setRGB( 1, 0.39, 0 )
	Shape27:setAlpha( 0 )
	Shape27:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape27" ) )
	Shape27:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape27 )
	self.Shape27 = Shape27
	
	local Shape28 = LUI.UIImage.new()
	Shape28:setLeftRight( true, false, 0, 144 )
	Shape28:setTopBottom( true, false, 0, 144 )
	Shape28:setRGB( 1, 0.39, 0 )
	Shape28:setAlpha( 0 )
	Shape28:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape28" ) )
	Shape28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape28 )
	self.Shape28 = Shape28
	
	local Shape29 = LUI.UIImage.new()
	Shape29:setLeftRight( true, false, 0, 144 )
	Shape29:setTopBottom( true, false, 0, 144 )
	Shape29:setRGB( 1, 0.39, 0 )
	Shape29:setAlpha( 0 )
	Shape29:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape29" ) )
	Shape29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape29 )
	self.Shape29 = Shape29
	
	local Shape30 = LUI.UIImage.new()
	Shape30:setLeftRight( true, false, 0, 144 )
	Shape30:setTopBottom( true, false, 0, 144 )
	Shape30:setRGB( 1, 0.39, 0 )
	Shape30:setAlpha( 0 )
	Shape30:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape30" ) )
	Shape30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape30 )
	self.Shape30 = Shape30
	
	local Shape31 = LUI.UIImage.new()
	Shape31:setLeftRight( true, false, 0, 144 )
	Shape31:setTopBottom( true, false, 0, 144 )
	Shape31:setRGB( 1, 0.39, 0 )
	Shape31:setAlpha( 0 )
	Shape31:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape31" ) )
	Shape31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape31 )
	self.Shape31 = Shape31
	
	local LineMidLR = LUI.UIImage.new()
	LineMidLR:setLeftRight( true, false, 71, 133 )
	LineMidLR:setTopBottom( true, false, 101.85, 140 )
	LineMidLR:setAlpha( 0 )
	LineMidLR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidlr" ) )
	LineMidLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidLR )
	self.LineMidLR = LineMidLR
	
	local LineMidR = LUI.UIImage.new()
	LineMidR:setLeftRight( true, false, 122.3, 131.88 )
	LineMidR:setTopBottom( true, false, 41, 108 )
	LineMidR:setAlpha( 0 )
	LineMidR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidr" ) )
	LineMidR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidR )
	self.LineMidR = LineMidR
	
	local LineMidUR = LUI.UIImage.new()
	LineMidUR:setLeftRight( true, false, 70, 131.88 )
	LineMidUR:setTopBottom( true, false, 2.92, 41 )
	LineMidUR:setAlpha( 0 )
	LineMidUR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidur" ) )
	LineMidUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidUR )
	self.LineMidUR = LineMidUR
	
	local LineMidLL = LUI.UIImage.new()
	LineMidLL:setLeftRight( true, false, 10, 72 )
	LineMidLL:setTopBottom( true, false, 101.85, 140 )
	LineMidLL:setAlpha( 0 )
	LineMidLL:setYRot( 180 )
	LineMidLL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidlr" ) )
	LineMidLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidLL )
	self.LineMidLL = LineMidLL
	
	local LineMidL = LUI.UIImage.new()
	LineMidL:setLeftRight( true, false, 10.3, 19.88 )
	LineMidL:setTopBottom( true, false, 41, 108 )
	LineMidL:setAlpha( 0 )
	LineMidL:setYRot( 180 )
	LineMidL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidr" ) )
	LineMidL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidL )
	self.LineMidL = LineMidL
	
	local LineMidUL = LUI.UIImage.new()
	LineMidUL:setLeftRight( true, false, 11, 72.88 )
	LineMidUL:setTopBottom( true, false, 2.92, 41 )
	LineMidUL:setAlpha( 0 )
	LineMidUL:setYRot( 180 )
	LineMidUL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidur" ) )
	LineMidUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidUL )
	self.LineMidUL = LineMidUL
	
	local LineInsideBottom = LUI.UIImage.new()
	LineInsideBottom:setLeftRight( true, false, 66.38, 75.88 )
	LineInsideBottom:setTopBottom( true, false, 105, 143 )
	LineInsideBottom:setAlpha( 0 )
	LineInsideBottom:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesinsidebottom" ) )
	LineInsideBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineInsideBottom )
	self.LineInsideBottom = LineInsideBottom
	
	local LineInsideRight = LUI.UIImage.new()
	LineInsideRight:setLeftRight( true, false, 93, 136.07 )
	LineInsideRight:setTopBottom( true, false, 32, 65.5 )
	LineInsideRight:setAlpha( 0 )
	LineInsideRight:setYRot( 180 )
	LineInsideRight:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesinsideleft" ) )
	LineInsideRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineInsideRight )
	self.LineInsideRight = LineInsideRight
	
	local LineInsideLeft = LUI.UIImage.new()
	LineInsideLeft:setLeftRight( true, false, 8, 51.07 )
	LineInsideLeft:setTopBottom( true, false, 32, 65.5 )
	LineInsideLeft:setAlpha( 0 )
	LineInsideLeft:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesinsideleft" ) )
	LineInsideLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineInsideLeft )
	self.LineInsideLeft = LineInsideLeft
	
	local LineOutsideR = LUI.UIImage.new()
	LineOutsideR:setLeftRight( true, false, 129.88, 139.54 )
	LineOutsideR:setTopBottom( true, false, 42, 100 )
	LineOutsideR:setAlpha( 0 )
	LineOutsideR:setYRot( 180 )
	LineOutsideR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideright" ) )
	LineOutsideR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideR )
	self.LineOutsideR = LineOutsideR
	
	local LineOutsideUR = LUI.UIImage.new()
	LineOutsideUR:setLeftRight( true, false, 78, 129.14 )
	LineOutsideUR:setTopBottom( true, false, 0.45, 33 )
	LineOutsideUR:setAlpha( 0 )
	LineOutsideUR:setYRot( 180 )
	LineOutsideUR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideUR )
	self.LineOutsideUR = LineOutsideUR
	
	local LineOutsideUL = LUI.UIImage.new()
	LineOutsideUL:setLeftRight( true, false, 14, 65.14 )
	LineOutsideUL:setTopBottom( true, false, 0.45, 33 )
	LineOutsideUL:setAlpha( 0 )
	LineOutsideUL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideUL )
	self.LineOutsideUL = LineOutsideUL
	
	local LineOutsideL = LUI.UIImage.new()
	LineOutsideL:setLeftRight( true, false, 3.17, 12.83 )
	LineOutsideL:setTopBottom( true, false, 42, 100 )
	LineOutsideL:setAlpha( 0 )
	LineOutsideL:setYRot( 180 )
	LineOutsideL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideright" ) )
	LineOutsideL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideL )
	self.LineOutsideL = LineOutsideL
	
	local LineOutsideLR = LUI.UIImage.new()
	LineOutsideLR:setLeftRight( true, false, 78, 129.14 )
	LineOutsideLR:setTopBottom( true, false, 111.45, 144 )
	LineOutsideLR:setAlpha( 0 )
	LineOutsideLR:setXRot( 180 )
	LineOutsideLR:setYRot( 180 )
	LineOutsideLR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideLR )
	self.LineOutsideLR = LineOutsideLR
	
	local LineOutsideLL = LUI.UIImage.new()
	LineOutsideLL:setLeftRight( true, false, 14, 65.14 )
	LineOutsideLL:setTopBottom( true, false, 111.45, 144 )
	LineOutsideLL:setAlpha( 0 )
	LineOutsideLL:setXRot( 180 )
	LineOutsideLL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideLL )
	self.LineOutsideLL = LineOutsideLL
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 48 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 719, false, false, CoD.TweenType.Linear )
						end
						Glow:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.3 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				GlowFrame2( Glow, {} )
				local DotsHex2Frame2 = function ( DotsHex2, event )
					local DotsHex2Frame3 = function ( DotsHex2, event )
						local DotsHex2Frame4 = function ( DotsHex2, event )
							local DotsHex2Frame5 = function ( DotsHex2, event )
								local DotsHex2Frame6 = function ( DotsHex2, event )
									local DotsHex2Frame7 = function ( DotsHex2, event )
										local DotsHex2Frame8 = function ( DotsHex2, event )
											local DotsHex2Frame9 = function ( DotsHex2, event )
												local DotsHex2Frame10 = function ( DotsHex2, event )
													local DotsHex2Frame11 = function ( DotsHex2, event )
														if not event.interrupted then
															DotsHex2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
														end
														DotsHex2:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( DotsHex2, event )
														else
															DotsHex2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														DotsHex2Frame11( DotsHex2, event )
														return 
													else
														DotsHex2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														DotsHex2:setAlpha( 0 )
														DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame11 )
													end
												end
												
												if event.interrupted then
													DotsHex2Frame10( DotsHex2, event )
													return 
												else
													DotsHex2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													DotsHex2:setAlpha( 0.4 )
													DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame10 )
												end
											end
											
											if event.interrupted then
												DotsHex2Frame9( DotsHex2, event )
												return 
											else
												DotsHex2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame9 )
											end
										end
										
										if event.interrupted then
											DotsHex2Frame8( DotsHex2, event )
											return 
										else
											DotsHex2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											DotsHex2:setAlpha( 0 )
											DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame8 )
										end
									end
									
									if event.interrupted then
										DotsHex2Frame7( DotsHex2, event )
										return 
									else
										DotsHex2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										DotsHex2:setAlpha( 0.4 )
										DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame7 )
									end
								end
								
								if event.interrupted then
									DotsHex2Frame6( DotsHex2, event )
									return 
								else
									DotsHex2:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
									DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame6 )
								end
							end
							
							if event.interrupted then
								DotsHex2Frame5( DotsHex2, event )
								return 
							else
								DotsHex2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								DotsHex2:setAlpha( 0 )
								DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame5 )
							end
						end
						
						if event.interrupted then
							DotsHex2Frame4( DotsHex2, event )
							return 
						else
							DotsHex2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							DotsHex2:setAlpha( 0.4 )
							DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame4 )
						end
					end
					
					if event.interrupted then
						DotsHex2Frame3( DotsHex2, event )
						return 
					else
						DotsHex2:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						DotsHex2:registerEventHandler( "transition_complete_keyframe", DotsHex2Frame3 )
					end
				end
				
				DotsHex2:completeAnimation()
				self.DotsHex2:setAlpha( 0 )
				DotsHex2Frame2( DotsHex2, {} )
				local Shape1Frame2 = function ( Shape1, event )
					local Shape1Frame3 = function ( Shape1, event )
						if not event.interrupted then
							Shape1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape1, event )
						else
							Shape1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape1Frame3( Shape1, event )
						return 
					else
						Shape1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape1:setAlpha( 1 )
						Shape1:registerEventHandler( "transition_complete_keyframe", Shape1Frame3 )
					end
				end
				
				Shape1:completeAnimation()
				self.Shape1:setAlpha( 0 )
				Shape1Frame2( Shape1, {} )
				local f2_local3 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						if not f18_arg1.interrupted then
							f18_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f18_arg0:setAlpha( 0 )
						if f18_arg1.interrupted then
							self.clipFinished( f18_arg0, f18_arg1 )
						else
							f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f17_arg1.interrupted then
						f17_local0( f17_arg0, f17_arg1 )
						return 
					else
						f17_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f17_arg0:setAlpha( 1 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				Shape2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				Shape2:setAlpha( 0 )
				Shape2:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						if not f20_arg1.interrupted then
							f20_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f20_arg0:setAlpha( 0 )
						if f20_arg1.interrupted then
							self.clipFinished( f20_arg0, f20_arg1 )
						else
							f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f19_arg0:setAlpha( 1 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				Shape3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Shape3:setAlpha( 0 )
				Shape3:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f22_arg0, f22_arg1 )
						if not f22_arg1.interrupted then
							f22_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f22_arg0:setAlpha( 0 )
						if f22_arg1.interrupted then
							self.clipFinished( f22_arg0, f22_arg1 )
						else
							f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f21_arg0:setAlpha( 1 )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				Shape4:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				Shape4:setAlpha( 0 )
				Shape4:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f24_arg0, f24_arg1 )
						if not f24_arg1.interrupted then
							f24_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f24_arg0:setAlpha( 0 )
						if f24_arg1.interrupted then
							self.clipFinished( f24_arg0, f24_arg1 )
						else
							f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f23_arg0:setAlpha( 1 )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				Shape5:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				Shape5:setAlpha( 0 )
				Shape5:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local f2_local7 = function ( f25_arg0, f25_arg1 )
					local f25_local0 = function ( f26_arg0, f26_arg1 )
						if not f26_arg1.interrupted then
							f26_arg0:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
						end
						f26_arg0:setAlpha( 0 )
						if f26_arg1.interrupted then
							self.clipFinished( f26_arg0, f26_arg1 )
						else
							f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f25_arg1.interrupted then
						f25_local0( f25_arg0, f25_arg1 )
						return 
					else
						f25_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f25_arg0:setAlpha( 1 )
						f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
					end
				end
				
				Shape6:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				Shape6:setAlpha( 0 )
				Shape6:registerEventHandler( "transition_complete_keyframe", f2_local7 )
				local f2_local8 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						if not f28_arg1.interrupted then
							f28_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f28_arg0:setAlpha( 0 )
						if f28_arg1.interrupted then
							self.clipFinished( f28_arg0, f28_arg1 )
						else
							f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f27_arg0:setAlpha( 1 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				Shape7:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				Shape7:setAlpha( 0 )
				Shape7:registerEventHandler( "transition_complete_keyframe", f2_local8 )
				local f2_local9 = function ( f29_arg0, f29_arg1 )
					local f29_local0 = function ( f30_arg0, f30_arg1 )
						if not f30_arg1.interrupted then
							f30_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f30_arg0:setAlpha( 0 )
						if f30_arg1.interrupted then
							self.clipFinished( f30_arg0, f30_arg1 )
						else
							f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f29_arg1.interrupted then
						f29_local0( f29_arg0, f29_arg1 )
						return 
					else
						f29_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f29_arg0:setAlpha( 1 )
						f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
					end
				end
				
				Shape8:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Shape8:setAlpha( 0 )
				Shape8:registerEventHandler( "transition_complete_keyframe", f2_local9 )
				local f2_local10 = function ( f31_arg0, f31_arg1 )
					local f31_local0 = function ( f32_arg0, f32_arg1 )
						if not f32_arg1.interrupted then
							f32_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f32_arg0:setAlpha( 0 )
						if f32_arg1.interrupted then
							self.clipFinished( f32_arg0, f32_arg1 )
						else
							f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f31_arg1.interrupted then
						f31_local0( f31_arg0, f31_arg1 )
						return 
					else
						f31_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f31_arg0:setAlpha( 1 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
					end
				end
				
				Shape9:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				Shape9:setAlpha( 0 )
				Shape9:registerEventHandler( "transition_complete_keyframe", f2_local10 )
				local f2_local11 = function ( f33_arg0, f33_arg1 )
					local f33_local0 = function ( f34_arg0, f34_arg1 )
						if not f34_arg1.interrupted then
							f34_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f34_arg0:setAlpha( 0 )
						if f34_arg1.interrupted then
							self.clipFinished( f34_arg0, f34_arg1 )
						else
							f34_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f33_arg1.interrupted then
						f33_local0( f33_arg0, f33_arg1 )
						return 
					else
						f33_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f33_arg0:setAlpha( 1 )
						f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
					end
				end
				
				Shape10:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				Shape10:setAlpha( 0 )
				Shape10:registerEventHandler( "transition_complete_keyframe", f2_local11 )
				local f2_local12 = function ( f35_arg0, f35_arg1 )
					local f35_local0 = function ( f36_arg0, f36_arg1 )
						if not f36_arg1.interrupted then
							f36_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f36_arg0:setAlpha( 0 )
						if f36_arg1.interrupted then
							self.clipFinished( f36_arg0, f36_arg1 )
						else
							f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f35_arg1.interrupted then
						f35_local0( f35_arg0, f35_arg1 )
						return 
					else
						f35_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f35_arg0:setAlpha( 1 )
						f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
					end
				end
				
				Shape11:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				Shape11:setAlpha( 0 )
				Shape11:registerEventHandler( "transition_complete_keyframe", f2_local12 )
				local f2_local13 = function ( f37_arg0, f37_arg1 )
					local f37_local0 = function ( f38_arg0, f38_arg1 )
						if not f38_arg1.interrupted then
							f38_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f38_arg0:setAlpha( 0 )
						if f38_arg1.interrupted then
							self.clipFinished( f38_arg0, f38_arg1 )
						else
							f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f37_arg1.interrupted then
						f37_local0( f37_arg0, f37_arg1 )
						return 
					else
						f37_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f37_arg0:setAlpha( 1 )
						f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
					end
				end
				
				Shape12:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				Shape12:setAlpha( 0 )
				Shape12:registerEventHandler( "transition_complete_keyframe", f2_local13 )
				local f2_local14 = function ( f39_arg0, f39_arg1 )
					local f39_local0 = function ( f40_arg0, f40_arg1 )
						if not f40_arg1.interrupted then
							f40_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f40_arg0:setAlpha( 0 )
						if f40_arg1.interrupted then
							self.clipFinished( f40_arg0, f40_arg1 )
						else
							f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f39_arg1.interrupted then
						f39_local0( f39_arg0, f39_arg1 )
						return 
					else
						f39_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f39_arg0:setAlpha( 1 )
						f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
					end
				end
				
				Shape13:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
				Shape13:setAlpha( 0 )
				Shape13:registerEventHandler( "transition_complete_keyframe", f2_local14 )
				local f2_local15 = function ( f41_arg0, f41_arg1 )
					local f41_local0 = function ( f42_arg0, f42_arg1 )
						if not f42_arg1.interrupted then
							f42_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f42_arg0:setAlpha( 0 )
						if f42_arg1.interrupted then
							self.clipFinished( f42_arg0, f42_arg1 )
						else
							f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f41_arg1.interrupted then
						f41_local0( f41_arg0, f41_arg1 )
						return 
					else
						f41_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f41_arg0:setAlpha( 1 )
						f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
					end
				end
				
				Shape14:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
				Shape14:setAlpha( 0 )
				Shape14:registerEventHandler( "transition_complete_keyframe", f2_local15 )
				local f2_local16 = function ( f43_arg0, f43_arg1 )
					local f43_local0 = function ( f44_arg0, f44_arg1 )
						if not f44_arg1.interrupted then
							f44_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						f44_arg0:setAlpha( 0 )
						if f44_arg1.interrupted then
							self.clipFinished( f44_arg0, f44_arg1 )
						else
							f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f43_arg1.interrupted then
						f43_local0( f43_arg0, f43_arg1 )
						return 
					else
						f43_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f43_arg0:setAlpha( 1 )
						f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
					end
				end
				
				Shape15:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				Shape15:setAlpha( 0 )
				Shape15:registerEventHandler( "transition_complete_keyframe", f2_local16 )
				local f2_local17 = function ( f45_arg0, f45_arg1 )
					local f45_local0 = function ( f46_arg0, f46_arg1 )
						if not f46_arg1.interrupted then
							f46_arg0:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
						end
						f46_arg0:setAlpha( 0 )
						if f46_arg1.interrupted then
							self.clipFinished( f46_arg0, f46_arg1 )
						else
							f46_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f45_arg1.interrupted then
						f45_local0( f45_arg0, f45_arg1 )
						return 
					else
						f45_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f45_arg0:setAlpha( 1 )
						f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
					end
				end
				
				Shape16:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
				Shape16:setAlpha( 0 )
				Shape16:registerEventHandler( "transition_complete_keyframe", f2_local17 )
				local f2_local18 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f48_arg0, f48_arg1 )
						if not f48_arg1.interrupted then
							f48_arg0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						f48_arg0:setAlpha( 0 )
						if f48_arg1.interrupted then
							self.clipFinished( f48_arg0, f48_arg1 )
						else
							f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f47_arg0:setAlpha( 1 )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
					end
				end
				
				Shape17:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
				Shape17:setAlpha( 0 )
				Shape17:registerEventHandler( "transition_complete_keyframe", f2_local18 )
				local f2_local19 = function ( f49_arg0, f49_arg1 )
					local f49_local0 = function ( f50_arg0, f50_arg1 )
						local f50_local0 = function ( f51_arg0, f51_arg1 )
							if not f51_arg1.interrupted then
								f51_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							f51_arg0:setAlpha( 0 )
							if f51_arg1.interrupted then
								self.clipFinished( f51_arg0, f51_arg1 )
							else
								f51_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f50_arg1.interrupted then
							f50_local0( f50_arg0, f50_arg1 )
							return 
						else
							f50_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							f50_arg0:setAlpha( 0.4 )
							f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
						end
					end
					
					if f49_arg1.interrupted then
						f49_local0( f49_arg0, f49_arg1 )
						return 
					else
						f49_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f49_arg0:setAlpha( 1 )
						f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
					end
				end
				
				Shape18:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
				Shape18:setAlpha( 0 )
				Shape18:registerEventHandler( "transition_complete_keyframe", f2_local19 )
				local f2_local20 = function ( f52_arg0, f52_arg1 )
					local f52_local0 = function ( f53_arg0, f53_arg1 )
						if not f53_arg1.interrupted then
							f53_arg0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						end
						f53_arg0:setAlpha( 0 )
						if f53_arg1.interrupted then
							self.clipFinished( f53_arg0, f53_arg1 )
						else
							f53_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f52_arg1.interrupted then
						f52_local0( f52_arg0, f52_arg1 )
						return 
					else
						f52_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						f52_arg0:setAlpha( 1 )
						f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
					end
				end
				
				Shape19:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Shape19:setAlpha( 0 )
				Shape19:registerEventHandler( "transition_complete_keyframe", f2_local20 )
				local Shape20Frame2 = function ( Shape20, event )
					local Shape20Frame3 = function ( Shape20, event )
						local Shape20Frame4 = function ( Shape20, event )
							local Shape20Frame5 = function ( Shape20, event )
								if not event.interrupted then
									Shape20:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
								end
								Shape20:setAlpha( 0.02 )
								if event.interrupted then
									self.clipFinished( Shape20, event )
								else
									Shape20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape20Frame5( Shape20, event )
								return 
							else
								Shape20:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								Shape20:setAlpha( 1 )
								Shape20:registerEventHandler( "transition_complete_keyframe", Shape20Frame5 )
							end
						end
						
						if event.interrupted then
							Shape20Frame4( Shape20, event )
							return 
						else
							Shape20:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Shape20:registerEventHandler( "transition_complete_keyframe", Shape20Frame4 )
						end
					end
					
					if event.interrupted then
						Shape20Frame3( Shape20, event )
						return 
					else
						Shape20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Shape20:setAlpha( 0 )
						Shape20:registerEventHandler( "transition_complete_keyframe", Shape20Frame3 )
					end
				end
				
				Shape20:completeAnimation()
				self.Shape20:setAlpha( 0.02 )
				Shape20Frame2( Shape20, {} )
				local Shape21Frame2 = function ( Shape21, event )
					local Shape21Frame3 = function ( Shape21, event )
						local Shape21Frame4 = function ( Shape21, event )
							local Shape21Frame5 = function ( Shape21, event )
								if not event.interrupted then
									Shape21:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								end
								Shape21:setAlpha( 0.12 )
								if event.interrupted then
									self.clipFinished( Shape21, event )
								else
									Shape21:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape21Frame5( Shape21, event )
								return 
							else
								Shape21:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Shape21:setAlpha( 1 )
								Shape21:registerEventHandler( "transition_complete_keyframe", Shape21Frame5 )
							end
						end
						
						if event.interrupted then
							Shape21Frame4( Shape21, event )
							return 
						else
							Shape21:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Shape21:registerEventHandler( "transition_complete_keyframe", Shape21Frame4 )
						end
					end
					
					if event.interrupted then
						Shape21Frame3( Shape21, event )
						return 
					else
						Shape21:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						Shape21:setAlpha( 0 )
						Shape21:registerEventHandler( "transition_complete_keyframe", Shape21Frame3 )
					end
				end
				
				Shape21:completeAnimation()
				self.Shape21:setAlpha( 0.12 )
				Shape21Frame2( Shape21, {} )
				local Shape22Frame2 = function ( Shape22, event )
					local Shape22Frame3 = function ( Shape22, event )
						local Shape22Frame4 = function ( Shape22, event )
							local Shape22Frame5 = function ( Shape22, event )
								if not event.interrupted then
									Shape22:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
								end
								Shape22:setAlpha( 0.23 )
								if event.interrupted then
									self.clipFinished( Shape22, event )
								else
									Shape22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape22Frame5( Shape22, event )
								return 
							else
								Shape22:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								Shape22:setAlpha( 1 )
								Shape22:registerEventHandler( "transition_complete_keyframe", Shape22Frame5 )
							end
						end
						
						if event.interrupted then
							Shape22Frame4( Shape22, event )
							return 
						else
							Shape22:beginAnimation( "keyframe", 849, false, false, CoD.TweenType.Linear )
							Shape22:registerEventHandler( "transition_complete_keyframe", Shape22Frame4 )
						end
					end
					
					if event.interrupted then
						Shape22Frame3( Shape22, event )
						return 
					else
						Shape22:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Shape22:setAlpha( 0 )
						Shape22:registerEventHandler( "transition_complete_keyframe", Shape22Frame3 )
					end
				end
				
				Shape22:completeAnimation()
				self.Shape22:setAlpha( 0.23 )
				Shape22Frame2( Shape22, {} )
				local Shape23Frame2 = function ( Shape23, event )
					local Shape23Frame3 = function ( Shape23, event )
						local Shape23Frame4 = function ( Shape23, event )
							local Shape23Frame5 = function ( Shape23, event )
								if not event.interrupted then
									Shape23:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
								end
								Shape23:setAlpha( 0.33 )
								if event.interrupted then
									self.clipFinished( Shape23, event )
								else
									Shape23:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape23Frame5( Shape23, event )
								return 
							else
								Shape23:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Shape23:setAlpha( 1 )
								Shape23:registerEventHandler( "transition_complete_keyframe", Shape23Frame5 )
							end
						end
						
						if event.interrupted then
							Shape23Frame4( Shape23, event )
							return 
						else
							Shape23:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Shape23:registerEventHandler( "transition_complete_keyframe", Shape23Frame4 )
						end
					end
					
					if event.interrupted then
						Shape23Frame3( Shape23, event )
						return 
					else
						Shape23:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Shape23:setAlpha( 0 )
						Shape23:registerEventHandler( "transition_complete_keyframe", Shape23Frame3 )
					end
				end
				
				Shape23:completeAnimation()
				self.Shape23:setAlpha( 0.33 )
				Shape23Frame2( Shape23, {} )
				local Shape24Frame2 = function ( Shape24, event )
					local Shape24Frame3 = function ( Shape24, event )
						local Shape24Frame4 = function ( Shape24, event )
							local Shape24Frame5 = function ( Shape24, event )
								if not event.interrupted then
									Shape24:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								end
								Shape24:setAlpha( 0.44 )
								if event.interrupted then
									self.clipFinished( Shape24, event )
								else
									Shape24:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape24Frame5( Shape24, event )
								return 
							else
								Shape24:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Shape24:setAlpha( 1 )
								Shape24:registerEventHandler( "transition_complete_keyframe", Shape24Frame5 )
							end
						end
						
						if event.interrupted then
							Shape24Frame4( Shape24, event )
							return 
						else
							Shape24:beginAnimation( "keyframe", 849, false, false, CoD.TweenType.Linear )
							Shape24:registerEventHandler( "transition_complete_keyframe", Shape24Frame4 )
						end
					end
					
					if event.interrupted then
						Shape24Frame3( Shape24, event )
						return 
					else
						Shape24:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Shape24:setAlpha( 0 )
						Shape24:registerEventHandler( "transition_complete_keyframe", Shape24Frame3 )
					end
				end
				
				Shape24:completeAnimation()
				self.Shape24:setAlpha( 0.44 )
				Shape24Frame2( Shape24, {} )
				local Shape25Frame2 = function ( Shape25, event )
					local Shape25Frame3 = function ( Shape25, event )
						local Shape25Frame4 = function ( Shape25, event )
							local Shape25Frame5 = function ( Shape25, event )
								if not event.interrupted then
									Shape25:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								Shape25:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( Shape25, event )
								else
									Shape25:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape25Frame5( Shape25, event )
								return 
							else
								Shape25:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Shape25:setAlpha( 1 )
								Shape25:registerEventHandler( "transition_complete_keyframe", Shape25Frame5 )
							end
						end
						
						if event.interrupted then
							Shape25Frame4( Shape25, event )
							return 
						else
							Shape25:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
							Shape25:registerEventHandler( "transition_complete_keyframe", Shape25Frame4 )
						end
					end
					
					if event.interrupted then
						Shape25Frame3( Shape25, event )
						return 
					else
						Shape25:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						Shape25:setAlpha( 0 )
						Shape25:registerEventHandler( "transition_complete_keyframe", Shape25Frame3 )
					end
				end
				
				Shape25:completeAnimation()
				self.Shape25:setAlpha( 0.5 )
				Shape25Frame2( Shape25, {} )
				local Shape26Frame2 = function ( Shape26, event )
					local Shape26Frame3 = function ( Shape26, event )
						local Shape26Frame4 = function ( Shape26, event )
							local Shape26Frame5 = function ( Shape26, event )
								if not event.interrupted then
									Shape26:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								end
								Shape26:setAlpha( 0.62 )
								if event.interrupted then
									self.clipFinished( Shape26, event )
								else
									Shape26:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape26Frame5( Shape26, event )
								return 
							else
								Shape26:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Shape26:setAlpha( 1 )
								Shape26:registerEventHandler( "transition_complete_keyframe", Shape26Frame5 )
							end
						end
						
						if event.interrupted then
							Shape26Frame4( Shape26, event )
							return 
						else
							Shape26:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
							Shape26:registerEventHandler( "transition_complete_keyframe", Shape26Frame4 )
						end
					end
					
					if event.interrupted then
						Shape26Frame3( Shape26, event )
						return 
					else
						Shape26:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Shape26:setAlpha( 0 )
						Shape26:registerEventHandler( "transition_complete_keyframe", Shape26Frame3 )
					end
				end
				
				Shape26:completeAnimation()
				self.Shape26:setAlpha( 0.62 )
				Shape26Frame2( Shape26, {} )
				local Shape27Frame2 = function ( Shape27, event )
					local Shape27Frame3 = function ( Shape27, event )
						local Shape27Frame4 = function ( Shape27, event )
							local Shape27Frame5 = function ( Shape27, event )
								if not event.interrupted then
									Shape27:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								Shape27:setAlpha( 0.74 )
								if event.interrupted then
									self.clipFinished( Shape27, event )
								else
									Shape27:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape27Frame5( Shape27, event )
								return 
							else
								Shape27:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Shape27:setAlpha( 1 )
								Shape27:registerEventHandler( "transition_complete_keyframe", Shape27Frame5 )
							end
						end
						
						if event.interrupted then
							Shape27Frame4( Shape27, event )
							return 
						else
							Shape27:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Shape27:registerEventHandler( "transition_complete_keyframe", Shape27Frame4 )
						end
					end
					
					if event.interrupted then
						Shape27Frame3( Shape27, event )
						return 
					else
						Shape27:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						Shape27:setAlpha( 0 )
						Shape27:registerEventHandler( "transition_complete_keyframe", Shape27Frame3 )
					end
				end
				
				Shape27:completeAnimation()
				self.Shape27:setAlpha( 0.74 )
				Shape27Frame2( Shape27, {} )
				local Shape28Frame2 = function ( Shape28, event )
					local Shape28Frame3 = function ( Shape28, event )
						local Shape28Frame4 = function ( Shape28, event )
							local Shape28Frame5 = function ( Shape28, event )
								if not event.interrupted then
									Shape28:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								end
								Shape28:setAlpha( 0.82 )
								if event.interrupted then
									self.clipFinished( Shape28, event )
								else
									Shape28:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape28Frame5( Shape28, event )
								return 
							else
								Shape28:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Shape28:setAlpha( 1 )
								Shape28:registerEventHandler( "transition_complete_keyframe", Shape28Frame5 )
							end
						end
						
						if event.interrupted then
							Shape28Frame4( Shape28, event )
							return 
						else
							Shape28:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Shape28:registerEventHandler( "transition_complete_keyframe", Shape28Frame4 )
						end
					end
					
					if event.interrupted then
						Shape28Frame3( Shape28, event )
						return 
					else
						Shape28:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
						Shape28:setAlpha( 0 )
						Shape28:registerEventHandler( "transition_complete_keyframe", Shape28Frame3 )
					end
				end
				
				Shape28:completeAnimation()
				self.Shape28:setAlpha( 0.82 )
				Shape28Frame2( Shape28, {} )
				local Shape29Frame2 = function ( Shape29, event )
					local Shape29Frame3 = function ( Shape29, event )
						local Shape29Frame4 = function ( Shape29, event )
							local Shape29Frame5 = function ( Shape29, event )
								if not event.interrupted then
									Shape29:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								end
								Shape29:setAlpha( 0.93 )
								if event.interrupted then
									self.clipFinished( Shape29, event )
								else
									Shape29:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape29Frame5( Shape29, event )
								return 
							else
								Shape29:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								Shape29:setAlpha( 1 )
								Shape29:registerEventHandler( "transition_complete_keyframe", Shape29Frame5 )
							end
						end
						
						if event.interrupted then
							Shape29Frame4( Shape29, event )
							return 
						else
							Shape29:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Shape29:registerEventHandler( "transition_complete_keyframe", Shape29Frame4 )
						end
					end
					
					if event.interrupted then
						Shape29Frame3( Shape29, event )
						return 
					else
						Shape29:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						Shape29:setAlpha( 0 )
						Shape29:registerEventHandler( "transition_complete_keyframe", Shape29Frame3 )
					end
				end
				
				Shape29:completeAnimation()
				self.Shape29:setAlpha( 0.93 )
				Shape29Frame2( Shape29, {} )
				local Shape30Frame2 = function ( Shape30, event )
					local Shape30Frame3 = function ( Shape30, event )
						local Shape30Frame4 = function ( Shape30, event )
							local Shape30Frame5 = function ( Shape30, event )
								if not event.interrupted then
									Shape30:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								end
								Shape30:setAlpha( 0.9 )
								if event.interrupted then
									self.clipFinished( Shape30, event )
								else
									Shape30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape30Frame5( Shape30, event )
								return 
							else
								Shape30:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								Shape30:registerEventHandler( "transition_complete_keyframe", Shape30Frame5 )
							end
						end
						
						if event.interrupted then
							Shape30Frame4( Shape30, event )
							return 
						else
							Shape30:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							Shape30:setAlpha( 0 )
							Shape30:registerEventHandler( "transition_complete_keyframe", Shape30Frame4 )
						end
					end
					
					if event.interrupted then
						Shape30Frame3( Shape30, event )
						return 
					else
						Shape30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Shape30:setAlpha( 1 )
						Shape30:registerEventHandler( "transition_complete_keyframe", Shape30Frame3 )
					end
				end
				
				Shape30:completeAnimation()
				self.Shape30:setAlpha( 0.9 )
				Shape30Frame2( Shape30, {} )
				local Shape31Frame2 = function ( Shape31, event )
					local Shape31Frame3 = function ( Shape31, event )
						local Shape31Frame4 = function ( Shape31, event )
							local Shape31Frame5 = function ( Shape31, event )
								if not event.interrupted then
									Shape31:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								Shape31:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( Shape31, event )
								else
									Shape31:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Shape31Frame5( Shape31, event )
								return 
							else
								Shape31:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								Shape31:registerEventHandler( "transition_complete_keyframe", Shape31Frame5 )
							end
						end
						
						if event.interrupted then
							Shape31Frame4( Shape31, event )
							return 
						else
							Shape31:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							Shape31:setAlpha( 0 )
							Shape31:registerEventHandler( "transition_complete_keyframe", Shape31Frame4 )
						end
					end
					
					if event.interrupted then
						Shape31Frame3( Shape31, event )
						return 
					else
						Shape31:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						Shape31:setAlpha( 1 )
						Shape31:registerEventHandler( "transition_complete_keyframe", Shape31Frame3 )
					end
				end
				
				Shape31:completeAnimation()
				self.Shape31:setAlpha( 0.5 )
				Shape31Frame2( Shape31, {} )
				local f2_local33 = function ( f102_arg0, f102_arg1 )
					local f102_local0 = function ( f103_arg0, f103_arg1 )
						if not f103_arg1.interrupted then
							f103_arg0:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
						end
						f103_arg0:setAlpha( 0 )
						if f103_arg1.interrupted then
							self.clipFinished( f103_arg0, f103_arg1 )
						else
							f103_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f102_arg1.interrupted then
						f102_local0( f102_arg0, f102_arg1 )
						return 
					else
						f102_arg0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						f102_arg0:setAlpha( 0 )
						f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
					end
				end
				
				LineMidLR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				LineMidLR:setAlpha( 0.5 )
				LineMidLR:registerEventHandler( "transition_complete_keyframe", f2_local33 )
				local f2_local34 = function ( f104_arg0, f104_arg1 )
					local f104_local0 = function ( f105_arg0, f105_arg1 )
						if not f105_arg1.interrupted then
							f105_arg0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						f105_arg0:setAlpha( 0 )
						if f105_arg1.interrupted then
							self.clipFinished( f105_arg0, f105_arg1 )
						else
							f105_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f104_arg1.interrupted then
						f104_local0( f104_arg0, f104_arg1 )
						return 
					else
						f104_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f104_arg0:setAlpha( 0.5 )
						f104_arg0:registerEventHandler( "transition_complete_keyframe", f104_local0 )
					end
				end
				
				LineMidR:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				LineMidR:setAlpha( 0 )
				LineMidR:registerEventHandler( "transition_complete_keyframe", f2_local34 )
				local LineMidURFrame2 = function ( LineMidUR, event )
					local LineMidURFrame3 = function ( LineMidUR, event )
						local LineMidURFrame4 = function ( LineMidUR, event )
							local LineMidURFrame5 = function ( LineMidUR, event )
								if not event.interrupted then
									LineMidUR:beginAnimation( "keyframe", 520, false, false, CoD.TweenType.Linear )
								end
								LineMidUR:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( LineMidUR, event )
								else
									LineMidUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineMidURFrame5( LineMidUR, event )
								return 
							else
								LineMidUR:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								LineMidUR:setAlpha( 0 )
								LineMidUR:registerEventHandler( "transition_complete_keyframe", LineMidURFrame5 )
							end
						end
						
						if event.interrupted then
							LineMidURFrame4( LineMidUR, event )
							return 
						else
							LineMidUR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LineMidUR:setAlpha( 0.5 )
							LineMidUR:registerEventHandler( "transition_complete_keyframe", LineMidURFrame4 )
						end
					end
					
					if event.interrupted then
						LineMidURFrame3( LineMidUR, event )
						return 
					else
						LineMidUR:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						LineMidUR:registerEventHandler( "transition_complete_keyframe", LineMidURFrame3 )
					end
				end
				
				LineMidUR:completeAnimation()
				self.LineMidUR:setAlpha( 0 )
				LineMidURFrame2( LineMidUR, {} )
				local LineMidLLFrame2 = function ( LineMidLL, event )
					local LineMidLLFrame3 = function ( LineMidLL, event )
						local LineMidLLFrame4 = function ( LineMidLL, event )
							local LineMidLLFrame5 = function ( LineMidLL, event )
								if not event.interrupted then
									LineMidLL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								LineMidLL:setAlpha( 0.29 )
								if event.interrupted then
									self.clipFinished( LineMidLL, event )
								else
									LineMidLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineMidLLFrame5( LineMidLL, event )
								return 
							else
								LineMidLL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LineMidLL:setAlpha( 0.5 )
								LineMidLL:registerEventHandler( "transition_complete_keyframe", LineMidLLFrame5 )
							end
						end
						
						if event.interrupted then
							LineMidLLFrame4( LineMidLL, event )
							return 
						else
							LineMidLL:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
							LineMidLL:registerEventHandler( "transition_complete_keyframe", LineMidLLFrame4 )
						end
					end
					
					if event.interrupted then
						LineMidLLFrame3( LineMidLL, event )
						return 
					else
						LineMidLL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						LineMidLL:setAlpha( 0 )
						LineMidLL:registerEventHandler( "transition_complete_keyframe", LineMidLLFrame3 )
					end
				end
				
				LineMidLL:completeAnimation()
				self.LineMidLL:setAlpha( 0.29 )
				LineMidLLFrame2( LineMidLL, {} )
				local LineMidLFrame2 = function ( LineMidL, event )
					local LineMidLFrame3 = function ( LineMidL, event )
						local LineMidLFrame4 = function ( LineMidL, event )
							local LineMidLFrame5 = function ( LineMidL, event )
								if not event.interrupted then
									LineMidL:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								end
								LineMidL:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( LineMidL, event )
								else
									LineMidL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineMidLFrame5( LineMidL, event )
								return 
							else
								LineMidL:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								LineMidL:setAlpha( 0 )
								LineMidL:registerEventHandler( "transition_complete_keyframe", LineMidLFrame5 )
							end
						end
						
						if event.interrupted then
							LineMidLFrame4( LineMidL, event )
							return 
						else
							LineMidL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LineMidL:setAlpha( 0.5 )
							LineMidL:registerEventHandler( "transition_complete_keyframe", LineMidLFrame4 )
						end
					end
					
					if event.interrupted then
						LineMidLFrame3( LineMidL, event )
						return 
					else
						LineMidL:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						LineMidL:registerEventHandler( "transition_complete_keyframe", LineMidLFrame3 )
					end
				end
				
				LineMidL:completeAnimation()
				self.LineMidL:setAlpha( 0 )
				LineMidLFrame2( LineMidL, {} )
				local f2_local38 = function ( f118_arg0, f118_arg1 )
					local f118_local0 = function ( f119_arg0, f119_arg1 )
						if not f119_arg1.interrupted then
							f119_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						end
						f119_arg0:setAlpha( 0 )
						if f119_arg1.interrupted then
							self.clipFinished( f119_arg0, f119_arg1 )
						else
							f119_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f118_arg1.interrupted then
						f118_local0( f118_arg0, f118_arg1 )
						return 
					else
						f118_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f118_arg0:setAlpha( 0.5 )
						f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
					end
				end
				
				LineMidUL:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
				LineMidUL:setAlpha( 0 )
				LineMidUL:registerEventHandler( "transition_complete_keyframe", f2_local38 )
				local f2_local39 = function ( f120_arg0, f120_arg1 )
					local f120_local0 = function ( f121_arg0, f121_arg1 )
						if not f121_arg1.interrupted then
							f121_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						f121_arg0:setAlpha( 0.15 )
						if f121_arg1.interrupted then
							self.clipFinished( f121_arg0, f121_arg1 )
						else
							f121_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f120_arg1.interrupted then
						f120_local0( f120_arg0, f120_arg1 )
						return 
					else
						f120_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f120_arg0:setAlpha( 0.8 )
						f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
					end
				end
				
				LineInsideBottom:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
				LineInsideBottom:setAlpha( 0 )
				LineInsideBottom:registerEventHandler( "transition_complete_keyframe", f2_local39 )
				local f2_local40 = function ( f122_arg0, f122_arg1 )
					local f122_local0 = function ( f123_arg0, f123_arg1 )
						if not f123_arg1.interrupted then
							f123_arg0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						f123_arg0:setAlpha( 0 )
						if f123_arg1.interrupted then
							self.clipFinished( f123_arg0, f123_arg1 )
						else
							f123_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f122_arg1.interrupted then
						f122_local0( f122_arg0, f122_arg1 )
						return 
					else
						f122_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f122_arg0:setAlpha( 0.6 )
						f122_arg0:registerEventHandler( "transition_complete_keyframe", f122_local0 )
					end
				end
				
				LineInsideRight:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				LineInsideRight:setAlpha( 0 )
				LineInsideRight:registerEventHandler( "transition_complete_keyframe", f2_local40 )
				local f2_local41 = function ( f124_arg0, f124_arg1 )
					local f124_local0 = function ( f125_arg0, f125_arg1 )
						if not f125_arg1.interrupted then
							f125_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						f125_arg0:setAlpha( 0 )
						if f125_arg1.interrupted then
							self.clipFinished( f125_arg0, f125_arg1 )
						else
							f125_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f124_arg1.interrupted then
						f124_local0( f124_arg0, f124_arg1 )
						return 
					else
						f124_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						f124_arg0:setAlpha( 0.6 )
						f124_arg0:registerEventHandler( "transition_complete_keyframe", f124_local0 )
					end
				end
				
				LineInsideLeft:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
				LineInsideLeft:setAlpha( 0 )
				LineInsideLeft:registerEventHandler( "transition_complete_keyframe", f2_local41 )
				local LineOutsideRFrame2 = function ( LineOutsideR, event )
					local LineOutsideRFrame3 = function ( LineOutsideR, event )
						local LineOutsideRFrame4 = function ( LineOutsideR, event )
							local LineOutsideRFrame5 = function ( LineOutsideR, event )
								local LineOutsideRFrame6 = function ( LineOutsideR, event )
									if not event.interrupted then
										LineOutsideR:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
									end
									LineOutsideR:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LineOutsideR, event )
									else
										LineOutsideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineOutsideRFrame6( LineOutsideR, event )
									return 
								else
									LineOutsideR:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
									LineOutsideR:setAlpha( 0 )
									LineOutsideR:registerEventHandler( "transition_complete_keyframe", LineOutsideRFrame6 )
								end
							end
							
							if event.interrupted then
								LineOutsideRFrame5( LineOutsideR, event )
								return 
							else
								LineOutsideR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								LineOutsideR:setAlpha( 0.7 )
								LineOutsideR:registerEventHandler( "transition_complete_keyframe", LineOutsideRFrame5 )
							end
						end
						
						if event.interrupted then
							LineOutsideRFrame4( LineOutsideR, event )
							return 
						else
							LineOutsideR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							LineOutsideR:setAlpha( 0 )
							LineOutsideR:registerEventHandler( "transition_complete_keyframe", LineOutsideRFrame4 )
						end
					end
					
					if event.interrupted then
						LineOutsideRFrame3( LineOutsideR, event )
						return 
					else
						LineOutsideR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						LineOutsideR:setAlpha( 1 )
						LineOutsideR:registerEventHandler( "transition_complete_keyframe", LineOutsideRFrame3 )
					end
				end
				
				LineOutsideR:completeAnimation()
				self.LineOutsideR:setAlpha( 0 )
				LineOutsideRFrame2( LineOutsideR, {} )
				local f2_local43 = function ( f131_arg0, f131_arg1 )
					local f131_local0 = function ( f132_arg0, f132_arg1 )
						local f132_local0 = function ( f133_arg0, f133_arg1 )
							local f133_local0 = function ( f134_arg0, f134_arg1 )
								if not f134_arg1.interrupted then
									f134_arg0:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
								end
								f134_arg0:setAlpha( 0 )
								if f134_arg1.interrupted then
									self.clipFinished( f134_arg0, f134_arg1 )
								else
									f134_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f133_arg1.interrupted then
								f133_local0( f133_arg0, f133_arg1 )
								return 
							else
								f133_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								f133_arg0:setAlpha( 0.7 )
								f133_arg0:registerEventHandler( "transition_complete_keyframe", f133_local0 )
							end
						end
						
						if f132_arg1.interrupted then
							f132_local0( f132_arg0, f132_arg1 )
							return 
						else
							f132_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f132_arg0:setAlpha( 0 )
							f132_arg0:registerEventHandler( "transition_complete_keyframe", f132_local0 )
						end
					end
					
					if f131_arg1.interrupted then
						f131_local0( f131_arg0, f131_arg1 )
						return 
					else
						f131_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f131_arg0:setAlpha( 1 )
						f131_arg0:registerEventHandler( "transition_complete_keyframe", f131_local0 )
					end
				end
				
				LineOutsideUR:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				LineOutsideUR:setAlpha( 0 )
				LineOutsideUR:registerEventHandler( "transition_complete_keyframe", f2_local43 )
				local f2_local44 = function ( f135_arg0, f135_arg1 )
					local f135_local0 = function ( f136_arg0, f136_arg1 )
						local f136_local0 = function ( f137_arg0, f137_arg1 )
							local f137_local0 = function ( f138_arg0, f138_arg1 )
								if not f138_arg1.interrupted then
									f138_arg0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
								end
								f138_arg0:setAlpha( 0 )
								if f138_arg1.interrupted then
									self.clipFinished( f138_arg0, f138_arg1 )
								else
									f138_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f137_arg1.interrupted then
								f137_local0( f137_arg0, f137_arg1 )
								return 
							else
								f137_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								f137_arg0:setAlpha( 0.7 )
								f137_arg0:registerEventHandler( "transition_complete_keyframe", f137_local0 )
							end
						end
						
						if f136_arg1.interrupted then
							f136_local0( f136_arg0, f136_arg1 )
							return 
						else
							f136_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f136_arg0:setAlpha( 0 )
							f136_arg0:registerEventHandler( "transition_complete_keyframe", f136_local0 )
						end
					end
					
					if f135_arg1.interrupted then
						f135_local0( f135_arg0, f135_arg1 )
						return 
					else
						f135_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f135_arg0:setAlpha( 1 )
						f135_arg0:registerEventHandler( "transition_complete_keyframe", f135_local0 )
					end
				end
				
				LineOutsideUL:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				LineOutsideUL:setAlpha( 0 )
				LineOutsideUL:registerEventHandler( "transition_complete_keyframe", f2_local44 )
				local LineOutsideLFrame2 = function ( LineOutsideL, event )
					local LineOutsideLFrame3 = function ( LineOutsideL, event )
						local LineOutsideLFrame4 = function ( LineOutsideL, event )
							local LineOutsideLFrame5 = function ( LineOutsideL, event )
								local LineOutsideLFrame6 = function ( LineOutsideL, event )
									if not event.interrupted then
										LineOutsideL:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
									end
									LineOutsideL:setAlpha( 0.11 )
									if event.interrupted then
										self.clipFinished( LineOutsideL, event )
									else
										LineOutsideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineOutsideLFrame6( LineOutsideL, event )
									return 
								else
									LineOutsideL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									LineOutsideL:setAlpha( 0.7 )
									LineOutsideL:registerEventHandler( "transition_complete_keyframe", LineOutsideLFrame6 )
								end
							end
							
							if event.interrupted then
								LineOutsideLFrame5( LineOutsideL, event )
								return 
							else
								LineOutsideL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								LineOutsideL:setAlpha( 1 )
								LineOutsideL:registerEventHandler( "transition_complete_keyframe", LineOutsideLFrame5 )
							end
						end
						
						if event.interrupted then
							LineOutsideLFrame4( LineOutsideL, event )
							return 
						else
							LineOutsideL:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
							LineOutsideL:registerEventHandler( "transition_complete_keyframe", LineOutsideLFrame4 )
						end
					end
					
					if event.interrupted then
						LineOutsideLFrame3( LineOutsideL, event )
						return 
					else
						LineOutsideL:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						LineOutsideL:setAlpha( 0 )
						LineOutsideL:registerEventHandler( "transition_complete_keyframe", LineOutsideLFrame3 )
					end
				end
				
				LineOutsideL:completeAnimation()
				self.LineOutsideL:setAlpha( 0.11 )
				LineOutsideLFrame2( LineOutsideL, {} )
				local LineOutsideLRFrame2 = function ( LineOutsideLR, event )
					local LineOutsideLRFrame3 = function ( LineOutsideLR, event )
						local LineOutsideLRFrame4 = function ( LineOutsideLR, event )
							local LineOutsideLRFrame5 = function ( LineOutsideLR, event )
								local LineOutsideLRFrame6 = function ( LineOutsideLR, event )
									local LineOutsideLRFrame7 = function ( LineOutsideLR, event )
										if not event.interrupted then
											LineOutsideLR:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										end
										LineOutsideLR:setAlpha( 0.22 )
										if event.interrupted then
											self.clipFinished( LineOutsideLR, event )
										else
											LineOutsideLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										LineOutsideLRFrame7( LineOutsideLR, event )
										return 
									else
										LineOutsideLR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										LineOutsideLR:setAlpha( 0.7 )
										LineOutsideLR:registerEventHandler( "transition_complete_keyframe", LineOutsideLRFrame7 )
									end
								end
								
								if event.interrupted then
									LineOutsideLRFrame6( LineOutsideLR, event )
									return 
								else
									LineOutsideLR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LineOutsideLR:setAlpha( 0 )
									LineOutsideLR:registerEventHandler( "transition_complete_keyframe", LineOutsideLRFrame6 )
								end
							end
							
							if event.interrupted then
								LineOutsideLRFrame5( LineOutsideLR, event )
								return 
							else
								LineOutsideLR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LineOutsideLR:setAlpha( 1 )
								LineOutsideLR:registerEventHandler( "transition_complete_keyframe", LineOutsideLRFrame5 )
							end
						end
						
						if event.interrupted then
							LineOutsideLRFrame4( LineOutsideLR, event )
							return 
						else
							LineOutsideLR:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
							LineOutsideLR:registerEventHandler( "transition_complete_keyframe", LineOutsideLRFrame4 )
						end
					end
					
					if event.interrupted then
						LineOutsideLRFrame3( LineOutsideLR, event )
						return 
					else
						LineOutsideLR:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						LineOutsideLR:setAlpha( 0 )
						LineOutsideLR:registerEventHandler( "transition_complete_keyframe", LineOutsideLRFrame3 )
					end
				end
				
				LineOutsideLR:completeAnimation()
				self.LineOutsideLR:setAlpha( 0.22 )
				LineOutsideLRFrame2( LineOutsideLR, {} )
				local LineOutsideLLFrame2 = function ( LineOutsideLL, event )
					local LineOutsideLLFrame3 = function ( LineOutsideLL, event )
						local LineOutsideLLFrame4 = function ( LineOutsideLL, event )
							local LineOutsideLLFrame5 = function ( LineOutsideLL, event )
								local LineOutsideLLFrame6 = function ( LineOutsideLL, event )
									if not event.interrupted then
										LineOutsideLL:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
									end
									LineOutsideLL:setAlpha( 0.25 )
									if event.interrupted then
										self.clipFinished( LineOutsideLL, event )
									else
										LineOutsideLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineOutsideLLFrame6( LineOutsideLL, event )
									return 
								else
									LineOutsideLL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									LineOutsideLL:setAlpha( 0.7 )
									LineOutsideLL:registerEventHandler( "transition_complete_keyframe", LineOutsideLLFrame6 )
								end
							end
							
							if event.interrupted then
								LineOutsideLLFrame5( LineOutsideLL, event )
								return 
							else
								LineOutsideLL:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								LineOutsideLL:registerEventHandler( "transition_complete_keyframe", LineOutsideLLFrame5 )
							end
						end
						
						if event.interrupted then
							LineOutsideLLFrame4( LineOutsideLL, event )
							return 
						else
							LineOutsideLL:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
							LineOutsideLL:registerEventHandler( "transition_complete_keyframe", LineOutsideLLFrame4 )
						end
					end
					
					if event.interrupted then
						LineOutsideLLFrame3( LineOutsideLL, event )
						return 
					else
						LineOutsideLL:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						LineOutsideLL:setAlpha( 0 )
						LineOutsideLL:registerEventHandler( "transition_complete_keyframe", LineOutsideLLFrame3 )
					end
				end
				
				LineOutsideLL:completeAnimation()
				self.LineOutsideLL:setAlpha( 0.25 )
				LineOutsideLLFrame2( LineOutsideLL, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

