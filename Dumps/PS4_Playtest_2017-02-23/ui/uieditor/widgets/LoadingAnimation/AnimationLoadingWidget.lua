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
	self:setLeftRight( 0, 0, 0, 216 )
	self:setTopBottom( 0, 0, 0, 216 )
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 0, 0, 217 )
	Black:setTopBottom( 0, 0, 0, 216 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0 )
	self:addElement( Black )
	self.Black = Black
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, 0, 216 )
	Glow:setTopBottom( 0, 0, 0, 216 )
	Glow:setRGB( 1, 0.39, 0 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_loadingspinner_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local DotsHex2 = LUI.UIImage.new()
	DotsHex2:setLeftRight( 0, 0, 0, 216 )
	DotsHex2:setTopBottom( 0, 0, 0, 216 )
	DotsHex2:setAlpha( 0 )
	DotsHex2:setImage( RegisterImage( "uie_t7_menu_loadingspinner_dotshex2" ) )
	DotsHex2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotsHex2 )
	self.DotsHex2 = DotsHex2
	
	local Shape1 = LUI.UIImage.new()
	Shape1:setLeftRight( 0, 0, 0, 216 )
	Shape1:setTopBottom( 0, 0, 0, 216 )
	Shape1:setRGB( 1, 0.39, 0 )
	Shape1:setAlpha( 0 )
	Shape1:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape1" ) )
	Shape1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape1 )
	self.Shape1 = Shape1
	
	local Shape2 = LUI.UIImage.new()
	Shape2:setLeftRight( 0, 0, 0, 216 )
	Shape2:setTopBottom( 0, 0, 0, 216 )
	Shape2:setRGB( 1, 0.39, 0 )
	Shape2:setAlpha( 0 )
	Shape2:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape2" ) )
	Shape2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape2 )
	self.Shape2 = Shape2
	
	local Shape3 = LUI.UIImage.new()
	Shape3:setLeftRight( 0, 0, 0, 216 )
	Shape3:setTopBottom( 0, 0, 0, 216 )
	Shape3:setRGB( 1, 0.39, 0 )
	Shape3:setAlpha( 0 )
	Shape3:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape3" ) )
	Shape3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape3 )
	self.Shape3 = Shape3
	
	local Shape4 = LUI.UIImage.new()
	Shape4:setLeftRight( 0, 0, 0, 216 )
	Shape4:setTopBottom( 0, 0, 0, 216 )
	Shape4:setRGB( 1, 0.39, 0 )
	Shape4:setAlpha( 0 )
	Shape4:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape4" ) )
	Shape4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape4 )
	self.Shape4 = Shape4
	
	local Shape5 = LUI.UIImage.new()
	Shape5:setLeftRight( 0, 0, 0, 216 )
	Shape5:setTopBottom( 0, 0, 0, 216 )
	Shape5:setRGB( 1, 0.39, 0 )
	Shape5:setAlpha( 0 )
	Shape5:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape5" ) )
	Shape5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape5 )
	self.Shape5 = Shape5
	
	local Shape6 = LUI.UIImage.new()
	Shape6:setLeftRight( 0, 0, 0, 216 )
	Shape6:setTopBottom( 0, 0, 0, 216 )
	Shape6:setRGB( 1, 0.39, 0 )
	Shape6:setAlpha( 0 )
	Shape6:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape6" ) )
	Shape6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape6 )
	self.Shape6 = Shape6
	
	local Shape7 = LUI.UIImage.new()
	Shape7:setLeftRight( 0, 0, 0, 216 )
	Shape7:setTopBottom( 0, 0, 0, 216 )
	Shape7:setRGB( 1, 0.39, 0 )
	Shape7:setAlpha( 0 )
	Shape7:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape7" ) )
	Shape7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape7 )
	self.Shape7 = Shape7
	
	local Shape8 = LUI.UIImage.new()
	Shape8:setLeftRight( 0, 0, 0, 216 )
	Shape8:setTopBottom( 0, 0, 0, 216 )
	Shape8:setRGB( 1, 0.39, 0 )
	Shape8:setAlpha( 0 )
	Shape8:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape8" ) )
	Shape8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape8 )
	self.Shape8 = Shape8
	
	local Shape9 = LUI.UIImage.new()
	Shape9:setLeftRight( 0, 0, 0, 216 )
	Shape9:setTopBottom( 0, 0, 0, 216 )
	Shape9:setRGB( 1, 0.39, 0 )
	Shape9:setAlpha( 0 )
	Shape9:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape9" ) )
	Shape9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape9 )
	self.Shape9 = Shape9
	
	local Shape10 = LUI.UIImage.new()
	Shape10:setLeftRight( 0, 0, 0, 216 )
	Shape10:setTopBottom( 0, 0, 0, 216 )
	Shape10:setRGB( 1, 0.39, 0 )
	Shape10:setAlpha( 0 )
	Shape10:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape10" ) )
	Shape10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape10 )
	self.Shape10 = Shape10
	
	local Shape11 = LUI.UIImage.new()
	Shape11:setLeftRight( 0, 0, 0, 216 )
	Shape11:setTopBottom( 0, 0, 0, 216 )
	Shape11:setRGB( 1, 0.39, 0 )
	Shape11:setAlpha( 0 )
	Shape11:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape11" ) )
	Shape11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape11 )
	self.Shape11 = Shape11
	
	local Shape12 = LUI.UIImage.new()
	Shape12:setLeftRight( 0, 0, 0, 216 )
	Shape12:setTopBottom( 0, 0, 0, 216 )
	Shape12:setRGB( 1, 0.39, 0 )
	Shape12:setAlpha( 0 )
	Shape12:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape12" ) )
	Shape12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape12 )
	self.Shape12 = Shape12
	
	local Shape13 = LUI.UIImage.new()
	Shape13:setLeftRight( 0, 0, 0, 216 )
	Shape13:setTopBottom( 0, 0, 0, 216 )
	Shape13:setRGB( 1, 0.39, 0 )
	Shape13:setAlpha( 0 )
	Shape13:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape13" ) )
	Shape13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape13 )
	self.Shape13 = Shape13
	
	local Shape14 = LUI.UIImage.new()
	Shape14:setLeftRight( 0, 0, 0, 216 )
	Shape14:setTopBottom( 0, 0, 0, 216 )
	Shape14:setRGB( 1, 0.39, 0 )
	Shape14:setAlpha( 0 )
	Shape14:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape14" ) )
	Shape14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape14 )
	self.Shape14 = Shape14
	
	local Shape15 = LUI.UIImage.new()
	Shape15:setLeftRight( 0, 0, 0, 216 )
	Shape15:setTopBottom( 0, 0, 0, 216 )
	Shape15:setRGB( 1, 0.39, 0 )
	Shape15:setAlpha( 0 )
	Shape15:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape15" ) )
	Shape15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape15 )
	self.Shape15 = Shape15
	
	local Shape16 = LUI.UIImage.new()
	Shape16:setLeftRight( 0, 0, 0, 216 )
	Shape16:setTopBottom( 0, 0, 0, 216 )
	Shape16:setRGB( 1, 0.39, 0 )
	Shape16:setAlpha( 0 )
	Shape16:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape16" ) )
	Shape16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape16 )
	self.Shape16 = Shape16
	
	local Shape17 = LUI.UIImage.new()
	Shape17:setLeftRight( 0, 0, 0, 216 )
	Shape17:setTopBottom( 0, 0, 0, 216 )
	Shape17:setRGB( 1, 0.39, 0 )
	Shape17:setAlpha( 0 )
	Shape17:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape17" ) )
	Shape17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape17 )
	self.Shape17 = Shape17
	
	local Shape18 = LUI.UIImage.new()
	Shape18:setLeftRight( 0, 0, 0, 216 )
	Shape18:setTopBottom( 0, 0, 0, 216 )
	Shape18:setRGB( 1, 0.39, 0 )
	Shape18:setAlpha( 0 )
	Shape18:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape18" ) )
	Shape18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape18 )
	self.Shape18 = Shape18
	
	local Shape19 = LUI.UIImage.new()
	Shape19:setLeftRight( 0, 0, 0, 216 )
	Shape19:setTopBottom( 0, 0, 0, 216 )
	Shape19:setRGB( 1, 0.39, 0 )
	Shape19:setAlpha( 0 )
	Shape19:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape19" ) )
	Shape19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape19 )
	self.Shape19 = Shape19
	
	local Shape20 = LUI.UIImage.new()
	Shape20:setLeftRight( 0, 0, 0, 216 )
	Shape20:setTopBottom( 0, 0, 0, 216 )
	Shape20:setRGB( 1, 0.39, 0 )
	Shape20:setAlpha( 0 )
	Shape20:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape20" ) )
	Shape20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape20 )
	self.Shape20 = Shape20
	
	local Shape21 = LUI.UIImage.new()
	Shape21:setLeftRight( 0, 0, 0, 216 )
	Shape21:setTopBottom( 0, 0, 0, 216 )
	Shape21:setRGB( 1, 0.39, 0 )
	Shape21:setAlpha( 0 )
	Shape21:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape21" ) )
	Shape21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape21 )
	self.Shape21 = Shape21
	
	local Shape22 = LUI.UIImage.new()
	Shape22:setLeftRight( 0, 0, 0, 216 )
	Shape22:setTopBottom( 0, 0, 0, 216 )
	Shape22:setRGB( 1, 0.39, 0 )
	Shape22:setAlpha( 0 )
	Shape22:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape22" ) )
	Shape22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape22 )
	self.Shape22 = Shape22
	
	local Shape23 = LUI.UIImage.new()
	Shape23:setLeftRight( 0, 0, 0, 216 )
	Shape23:setTopBottom( 0, 0, 0, 216 )
	Shape23:setRGB( 1, 0.39, 0 )
	Shape23:setAlpha( 0 )
	Shape23:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape23" ) )
	Shape23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape23 )
	self.Shape23 = Shape23
	
	local Shape24 = LUI.UIImage.new()
	Shape24:setLeftRight( 0, 0, 0, 216 )
	Shape24:setTopBottom( 0, 0, 0, 216 )
	Shape24:setRGB( 1, 0.39, 0 )
	Shape24:setAlpha( 0 )
	Shape24:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape24" ) )
	Shape24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape24 )
	self.Shape24 = Shape24
	
	local Shape25 = LUI.UIImage.new()
	Shape25:setLeftRight( 0, 0, 0, 216 )
	Shape25:setTopBottom( 0, 0, 0, 216 )
	Shape25:setRGB( 1, 0.39, 0 )
	Shape25:setAlpha( 0 )
	Shape25:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape25" ) )
	Shape25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape25 )
	self.Shape25 = Shape25
	
	local Shape26 = LUI.UIImage.new()
	Shape26:setLeftRight( 0, 0, 0, 216 )
	Shape26:setTopBottom( 0, 0, 0, 216 )
	Shape26:setRGB( 1, 0.39, 0 )
	Shape26:setAlpha( 0 )
	Shape26:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape26" ) )
	Shape26:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape26 )
	self.Shape26 = Shape26
	
	local Shape27 = LUI.UIImage.new()
	Shape27:setLeftRight( 0, 0, 0, 216 )
	Shape27:setTopBottom( 0, 0, 0, 216 )
	Shape27:setRGB( 1, 0.39, 0 )
	Shape27:setAlpha( 0 )
	Shape27:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape27" ) )
	Shape27:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape27 )
	self.Shape27 = Shape27
	
	local Shape28 = LUI.UIImage.new()
	Shape28:setLeftRight( 0, 0, 0, 216 )
	Shape28:setTopBottom( 0, 0, 0, 216 )
	Shape28:setRGB( 1, 0.39, 0 )
	Shape28:setAlpha( 0 )
	Shape28:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape28" ) )
	Shape28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape28 )
	self.Shape28 = Shape28
	
	local Shape29 = LUI.UIImage.new()
	Shape29:setLeftRight( 0, 0, 0, 216 )
	Shape29:setTopBottom( 0, 0, 0, 216 )
	Shape29:setRGB( 1, 0.39, 0 )
	Shape29:setAlpha( 0 )
	Shape29:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape29" ) )
	Shape29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape29 )
	self.Shape29 = Shape29
	
	local Shape30 = LUI.UIImage.new()
	Shape30:setLeftRight( 0, 0, 0, 216 )
	Shape30:setTopBottom( 0, 0, 0, 216 )
	Shape30:setRGB( 1, 0.39, 0 )
	Shape30:setAlpha( 0 )
	Shape30:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape30" ) )
	Shape30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape30 )
	self.Shape30 = Shape30
	
	local Shape31 = LUI.UIImage.new()
	Shape31:setLeftRight( 0, 0, 0, 216 )
	Shape31:setTopBottom( 0, 0, 0, 216 )
	Shape31:setRGB( 1, 0.39, 0 )
	Shape31:setAlpha( 0 )
	Shape31:setImage( RegisterImage( "uie_t7_menu_loadingspinner_shape31" ) )
	Shape31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Shape31 )
	self.Shape31 = Shape31
	
	local LineMidLR = LUI.UIImage.new()
	LineMidLR:setLeftRight( 0, 0, 107, 200 )
	LineMidLR:setTopBottom( 0, 0, 153, 210 )
	LineMidLR:setAlpha( 0 )
	LineMidLR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidlr" ) )
	LineMidLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidLR )
	self.LineMidLR = LineMidLR
	
	local LineMidR = LUI.UIImage.new()
	LineMidR:setLeftRight( 0, 0, 184, 198 )
	LineMidR:setTopBottom( 0, 0, 62, 162 )
	LineMidR:setAlpha( 0 )
	LineMidR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidr" ) )
	LineMidR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidR )
	self.LineMidR = LineMidR
	
	local LineMidUR = LUI.UIImage.new()
	LineMidUR:setLeftRight( 0, 0, 105, 198 )
	LineMidUR:setTopBottom( 0, 0, 4, 61 )
	LineMidUR:setAlpha( 0 )
	LineMidUR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidur" ) )
	LineMidUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidUR )
	self.LineMidUR = LineMidUR
	
	local LineMidLL = LUI.UIImage.new()
	LineMidLL:setLeftRight( 0, 0, 15, 108 )
	LineMidLL:setTopBottom( 0, 0, 153, 210 )
	LineMidLL:setAlpha( 0 )
	LineMidLL:setYRot( 180 )
	LineMidLL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidlr" ) )
	LineMidLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidLL )
	self.LineMidLL = LineMidLL
	
	local LineMidL = LUI.UIImage.new()
	LineMidL:setLeftRight( 0, 0, 16, 30 )
	LineMidL:setTopBottom( 0, 0, 62, 162 )
	LineMidL:setAlpha( 0 )
	LineMidL:setYRot( 180 )
	LineMidL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidr" ) )
	LineMidL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidL )
	self.LineMidL = LineMidL
	
	local LineMidUL = LUI.UIImage.new()
	LineMidUL:setLeftRight( 0, 0, 16, 109 )
	LineMidUL:setTopBottom( 0, 0, 4, 61 )
	LineMidUL:setAlpha( 0 )
	LineMidUL:setYRot( 180 )
	LineMidUL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linemidur" ) )
	LineMidUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineMidUL )
	self.LineMidUL = LineMidUL
	
	local LineInsideBottom = LUI.UIImage.new()
	LineInsideBottom:setLeftRight( 0, 0, 100, 114 )
	LineInsideBottom:setTopBottom( 0, 0, 157, 214 )
	LineInsideBottom:setAlpha( 0 )
	LineInsideBottom:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesinsidebottom" ) )
	LineInsideBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineInsideBottom )
	self.LineInsideBottom = LineInsideBottom
	
	local LineInsideRight = LUI.UIImage.new()
	LineInsideRight:setLeftRight( 0, 0, 139, 204 )
	LineInsideRight:setTopBottom( 0, 0, 48, 98 )
	LineInsideRight:setAlpha( 0 )
	LineInsideRight:setYRot( 180 )
	LineInsideRight:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesinsideleft" ) )
	LineInsideRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineInsideRight )
	self.LineInsideRight = LineInsideRight
	
	local LineInsideLeft = LUI.UIImage.new()
	LineInsideLeft:setLeftRight( 0, 0, 12, 77 )
	LineInsideLeft:setTopBottom( 0, 0, 48, 98 )
	LineInsideLeft:setAlpha( 0 )
	LineInsideLeft:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesinsideleft" ) )
	LineInsideLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineInsideLeft )
	self.LineInsideLeft = LineInsideLeft
	
	local LineOutsideR = LUI.UIImage.new()
	LineOutsideR:setLeftRight( 0, 0, 195, 210 )
	LineOutsideR:setTopBottom( 0, 0, 63, 150 )
	LineOutsideR:setAlpha( 0 )
	LineOutsideR:setYRot( 180 )
	LineOutsideR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideright" ) )
	LineOutsideR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideR )
	self.LineOutsideR = LineOutsideR
	
	local LineOutsideUR = LUI.UIImage.new()
	LineOutsideUR:setLeftRight( 0, 0, 117, 194 )
	LineOutsideUR:setTopBottom( 0, 0, 1, 50 )
	LineOutsideUR:setAlpha( 0 )
	LineOutsideUR:setYRot( 180 )
	LineOutsideUR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideUR )
	self.LineOutsideUR = LineOutsideUR
	
	local LineOutsideUL = LUI.UIImage.new()
	LineOutsideUL:setLeftRight( 0, 0, 21, 98 )
	LineOutsideUL:setTopBottom( 0, 0, 1, 50 )
	LineOutsideUL:setAlpha( 0 )
	LineOutsideUL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideUL )
	self.LineOutsideUL = LineOutsideUL
	
	local LineOutsideL = LUI.UIImage.new()
	LineOutsideL:setLeftRight( 0, 0, 4, 19 )
	LineOutsideL:setTopBottom( 0, 0, 63, 150 )
	LineOutsideL:setAlpha( 0 )
	LineOutsideL:setYRot( 180 )
	LineOutsideL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideright" ) )
	LineOutsideL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideL )
	self.LineOutsideL = LineOutsideL
	
	local LineOutsideLR = LUI.UIImage.new()
	LineOutsideLR:setLeftRight( 0, 0, 117, 194 )
	LineOutsideLR:setTopBottom( 0, 0, 167, 216 )
	LineOutsideLR:setAlpha( 0 )
	LineOutsideLR:setXRot( 180 )
	LineOutsideLR:setYRot( 180 )
	LineOutsideLR:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideLR )
	self.LineOutsideLR = LineOutsideLR
	
	local LineOutsideLL = LUI.UIImage.new()
	LineOutsideLL:setLeftRight( 0, 0, 21, 98 )
	LineOutsideLL:setTopBottom( 0, 0, 167, 216 )
	LineOutsideLL:setAlpha( 0 )
	LineOutsideLL:setXRot( 180 )
	LineOutsideLL:setImage( RegisterImage( "uie_t7_menu_loadingspinner_linesoutsideul" ) )
	LineOutsideLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineOutsideLL )
	self.LineOutsideLL = LineOutsideLL
	
	self.resetProperties = function ()
		Shape1:completeAnimation()
		Glow:completeAnimation()
		LineOutsideR:completeAnimation()
		LineMidLL:completeAnimation()
		DotsHex2:completeAnimation()
		LineMidUR:completeAnimation()
		LineMidL:completeAnimation()
		LineOutsideLL:completeAnimation()
		LineOutsideLR:completeAnimation()
		LineOutsideL:completeAnimation()
		Shape20:completeAnimation()
		Shape22:completeAnimation()
		Shape23:completeAnimation()
		Shape24:completeAnimation()
		Shape25:completeAnimation()
		Shape26:completeAnimation()
		Shape27:completeAnimation()
		Shape28:completeAnimation()
		Shape29:completeAnimation()
		Shape30:completeAnimation()
		Shape31:completeAnimation()
		Shape21:completeAnimation()
		LineMidLR:completeAnimation()
		Shape2:completeAnimation()
		Shape3:completeAnimation()
		LineInsideRight:completeAnimation()
		Shape4:completeAnimation()
		LineOutsideUR:completeAnimation()
		Shape5:completeAnimation()
		Shape6:completeAnimation()
		LineMidR:completeAnimation()
		Shape7:completeAnimation()
		Shape8:completeAnimation()
		Shape9:completeAnimation()
		LineOutsideUL:completeAnimation()
		Shape10:completeAnimation()
		Shape11:completeAnimation()
		Shape12:completeAnimation()
		Shape13:completeAnimation()
		Shape14:completeAnimation()
		LineInsideLeft:completeAnimation()
		Shape15:completeAnimation()
		Shape16:completeAnimation()
		Shape17:completeAnimation()
		Shape18:completeAnimation()
		LineMidUL:completeAnimation()
		Shape19:completeAnimation()
		LineInsideBottom:completeAnimation()
		Shape1:setAlpha( 0 )
		Glow:setAlpha( 0 )
		LineOutsideR:setAlpha( 0 )
		LineMidLL:setAlpha( 0 )
		DotsHex2:setAlpha( 0 )
		LineMidUR:setAlpha( 0 )
		LineMidL:setAlpha( 0 )
		LineOutsideLL:setAlpha( 0 )
		LineOutsideLR:setAlpha( 0 )
		LineOutsideL:setAlpha( 0 )
		Shape20:setAlpha( 0 )
		Shape22:setAlpha( 0 )
		Shape23:setAlpha( 0 )
		Shape24:setAlpha( 0 )
		Shape25:setAlpha( 0 )
		Shape26:setAlpha( 0 )
		Shape27:setAlpha( 0 )
		Shape28:setAlpha( 0 )
		Shape29:setAlpha( 0 )
		Shape30:setAlpha( 0 )
		Shape31:setAlpha( 0 )
		Shape21:setAlpha( 0 )
		LineMidLR:setAlpha( 0 )
		Shape2:setAlpha( 0 )
		Shape3:setAlpha( 0 )
		LineInsideRight:setAlpha( 0 )
		Shape4:setAlpha( 0 )
		LineOutsideUR:setAlpha( 0 )
		Shape5:setAlpha( 0 )
		Shape6:setAlpha( 0 )
		LineMidR:setAlpha( 0 )
		Shape7:setAlpha( 0 )
		Shape8:setAlpha( 0 )
		Shape9:setAlpha( 0 )
		LineOutsideUL:setAlpha( 0 )
		Shape10:setAlpha( 0 )
		Shape11:setAlpha( 0 )
		Shape12:setAlpha( 0 )
		Shape13:setAlpha( 0 )
		Shape14:setAlpha( 0 )
		LineInsideLeft:setAlpha( 0 )
		Shape15:setAlpha( 0 )
		Shape16:setAlpha( 0 )
		Shape17:setAlpha( 0 )
		Shape18:setAlpha( 0 )
		LineMidUL:setAlpha( 0 )
		Shape19:setAlpha( 0 )
		LineInsideBottom:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				local Shape2Frame2 = function ( Shape2, event )
					local Shape2Frame3 = function ( Shape2, event )
						if not event.interrupted then
							Shape2:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape2, event )
						else
							Shape2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape2Frame3( Shape2, event )
						return 
					else
						Shape2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape2:setAlpha( 1 )
						Shape2:registerEventHandler( "transition_complete_keyframe", Shape2Frame3 )
					end
				end
				
				Shape2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				Shape2:setAlpha( 0 )
				Shape2:registerEventHandler( "transition_complete_keyframe", Shape2Frame2 )
				local Shape3Frame2 = function ( Shape3, event )
					local Shape3Frame3 = function ( Shape3, event )
						if not event.interrupted then
							Shape3:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape3, event )
						else
							Shape3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape3Frame3( Shape3, event )
						return 
					else
						Shape3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape3:setAlpha( 1 )
						Shape3:registerEventHandler( "transition_complete_keyframe", Shape3Frame3 )
					end
				end
				
				Shape3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Shape3:setAlpha( 0 )
				Shape3:registerEventHandler( "transition_complete_keyframe", Shape3Frame2 )
				local Shape4Frame2 = function ( Shape4, event )
					local Shape4Frame3 = function ( Shape4, event )
						if not event.interrupted then
							Shape4:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape4, event )
						else
							Shape4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape4Frame3( Shape4, event )
						return 
					else
						Shape4:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape4:setAlpha( 1 )
						Shape4:registerEventHandler( "transition_complete_keyframe", Shape4Frame3 )
					end
				end
				
				Shape4:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				Shape4:setAlpha( 0 )
				Shape4:registerEventHandler( "transition_complete_keyframe", Shape4Frame2 )
				local Shape5Frame2 = function ( Shape5, event )
					local Shape5Frame3 = function ( Shape5, event )
						if not event.interrupted then
							Shape5:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape5, event )
						else
							Shape5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape5Frame3( Shape5, event )
						return 
					else
						Shape5:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape5:setAlpha( 1 )
						Shape5:registerEventHandler( "transition_complete_keyframe", Shape5Frame3 )
					end
				end
				
				Shape5:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				Shape5:setAlpha( 0 )
				Shape5:registerEventHandler( "transition_complete_keyframe", Shape5Frame2 )
				local Shape6Frame2 = function ( Shape6, event )
					local Shape6Frame3 = function ( Shape6, event )
						if not event.interrupted then
							Shape6:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
						end
						Shape6:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape6, event )
						else
							Shape6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape6Frame3( Shape6, event )
						return 
					else
						Shape6:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape6:setAlpha( 1 )
						Shape6:registerEventHandler( "transition_complete_keyframe", Shape6Frame3 )
					end
				end
				
				Shape6:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				Shape6:setAlpha( 0 )
				Shape6:registerEventHandler( "transition_complete_keyframe", Shape6Frame2 )
				local Shape7Frame2 = function ( Shape7, event )
					local Shape7Frame3 = function ( Shape7, event )
						if not event.interrupted then
							Shape7:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape7:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape7, event )
						else
							Shape7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape7Frame3( Shape7, event )
						return 
					else
						Shape7:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape7:setAlpha( 1 )
						Shape7:registerEventHandler( "transition_complete_keyframe", Shape7Frame3 )
					end
				end
				
				Shape7:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				Shape7:setAlpha( 0 )
				Shape7:registerEventHandler( "transition_complete_keyframe", Shape7Frame2 )
				local Shape8Frame2 = function ( Shape8, event )
					local Shape8Frame3 = function ( Shape8, event )
						if not event.interrupted then
							Shape8:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape8:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape8, event )
						else
							Shape8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape8Frame3( Shape8, event )
						return 
					else
						Shape8:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape8:setAlpha( 1 )
						Shape8:registerEventHandler( "transition_complete_keyframe", Shape8Frame3 )
					end
				end
				
				Shape8:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Shape8:setAlpha( 0 )
				Shape8:registerEventHandler( "transition_complete_keyframe", Shape8Frame2 )
				local Shape9Frame2 = function ( Shape9, event )
					local Shape9Frame3 = function ( Shape9, event )
						if not event.interrupted then
							Shape9:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape9:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape9, event )
						else
							Shape9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape9Frame3( Shape9, event )
						return 
					else
						Shape9:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape9:setAlpha( 1 )
						Shape9:registerEventHandler( "transition_complete_keyframe", Shape9Frame3 )
					end
				end
				
				Shape9:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				Shape9:setAlpha( 0 )
				Shape9:registerEventHandler( "transition_complete_keyframe", Shape9Frame2 )
				local Shape10Frame2 = function ( Shape10, event )
					local Shape10Frame3 = function ( Shape10, event )
						if not event.interrupted then
							Shape10:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape10:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape10, event )
						else
							Shape10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape10Frame3( Shape10, event )
						return 
					else
						Shape10:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape10:setAlpha( 1 )
						Shape10:registerEventHandler( "transition_complete_keyframe", Shape10Frame3 )
					end
				end
				
				Shape10:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				Shape10:setAlpha( 0 )
				Shape10:registerEventHandler( "transition_complete_keyframe", Shape10Frame2 )
				local Shape11Frame2 = function ( Shape11, event )
					local Shape11Frame3 = function ( Shape11, event )
						if not event.interrupted then
							Shape11:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape11:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape11, event )
						else
							Shape11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape11Frame3( Shape11, event )
						return 
					else
						Shape11:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape11:setAlpha( 1 )
						Shape11:registerEventHandler( "transition_complete_keyframe", Shape11Frame3 )
					end
				end
				
				Shape11:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				Shape11:setAlpha( 0 )
				Shape11:registerEventHandler( "transition_complete_keyframe", Shape11Frame2 )
				local Shape12Frame2 = function ( Shape12, event )
					local Shape12Frame3 = function ( Shape12, event )
						if not event.interrupted then
							Shape12:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape12:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape12, event )
						else
							Shape12:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape12Frame3( Shape12, event )
						return 
					else
						Shape12:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape12:setAlpha( 1 )
						Shape12:registerEventHandler( "transition_complete_keyframe", Shape12Frame3 )
					end
				end
				
				Shape12:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
				Shape12:setAlpha( 0 )
				Shape12:registerEventHandler( "transition_complete_keyframe", Shape12Frame2 )
				local Shape13Frame2 = function ( Shape13, event )
					local Shape13Frame3 = function ( Shape13, event )
						if not event.interrupted then
							Shape13:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape13:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape13, event )
						else
							Shape13:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape13Frame3( Shape13, event )
						return 
					else
						Shape13:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape13:setAlpha( 1 )
						Shape13:registerEventHandler( "transition_complete_keyframe", Shape13Frame3 )
					end
				end
				
				Shape13:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
				Shape13:setAlpha( 0 )
				Shape13:registerEventHandler( "transition_complete_keyframe", Shape13Frame2 )
				local Shape14Frame2 = function ( Shape14, event )
					local Shape14Frame3 = function ( Shape14, event )
						if not event.interrupted then
							Shape14:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape14:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape14, event )
						else
							Shape14:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape14Frame3( Shape14, event )
						return 
					else
						Shape14:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape14:setAlpha( 1 )
						Shape14:registerEventHandler( "transition_complete_keyframe", Shape14Frame3 )
					end
				end
				
				Shape14:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
				Shape14:setAlpha( 0 )
				Shape14:registerEventHandler( "transition_complete_keyframe", Shape14Frame2 )
				local Shape15Frame2 = function ( Shape15, event )
					local Shape15Frame3 = function ( Shape15, event )
						if not event.interrupted then
							Shape15:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						end
						Shape15:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape15, event )
						else
							Shape15:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape15Frame3( Shape15, event )
						return 
					else
						Shape15:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape15:setAlpha( 1 )
						Shape15:registerEventHandler( "transition_complete_keyframe", Shape15Frame3 )
					end
				end
				
				Shape15:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				Shape15:setAlpha( 0 )
				Shape15:registerEventHandler( "transition_complete_keyframe", Shape15Frame2 )
				local Shape16Frame2 = function ( Shape16, event )
					local Shape16Frame3 = function ( Shape16, event )
						if not event.interrupted then
							Shape16:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
						end
						Shape16:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape16, event )
						else
							Shape16:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape16Frame3( Shape16, event )
						return 
					else
						Shape16:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape16:setAlpha( 1 )
						Shape16:registerEventHandler( "transition_complete_keyframe", Shape16Frame3 )
					end
				end
				
				Shape16:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
				Shape16:setAlpha( 0 )
				Shape16:registerEventHandler( "transition_complete_keyframe", Shape16Frame2 )
				local Shape17Frame2 = function ( Shape17, event )
					local Shape17Frame3 = function ( Shape17, event )
						if not event.interrupted then
							Shape17:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						Shape17:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape17, event )
						else
							Shape17:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape17Frame3( Shape17, event )
						return 
					else
						Shape17:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						Shape17:setAlpha( 1 )
						Shape17:registerEventHandler( "transition_complete_keyframe", Shape17Frame3 )
					end
				end
				
				Shape17:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
				Shape17:setAlpha( 0 )
				Shape17:registerEventHandler( "transition_complete_keyframe", Shape17Frame2 )
				local Shape18Frame2 = function ( Shape18, event )
					local Shape18Frame3 = function ( Shape18, event )
						local Shape18Frame4 = function ( Shape18, event )
							if not event.interrupted then
								Shape18:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							Shape18:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Shape18, event )
							else
								Shape18:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Shape18Frame4( Shape18, event )
							return 
						else
							Shape18:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							Shape18:setAlpha( 0.4 )
							Shape18:registerEventHandler( "transition_complete_keyframe", Shape18Frame4 )
						end
					end
					
					if event.interrupted then
						Shape18Frame3( Shape18, event )
						return 
					else
						Shape18:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Shape18:setAlpha( 1 )
						Shape18:registerEventHandler( "transition_complete_keyframe", Shape18Frame3 )
					end
				end
				
				Shape18:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
				Shape18:setAlpha( 0 )
				Shape18:registerEventHandler( "transition_complete_keyframe", Shape18Frame2 )
				local Shape19Frame2 = function ( Shape19, event )
					local Shape19Frame3 = function ( Shape19, event )
						if not event.interrupted then
							Shape19:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						end
						Shape19:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Shape19, event )
						else
							Shape19:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Shape19Frame3( Shape19, event )
						return 
					else
						Shape19:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						Shape19:setAlpha( 1 )
						Shape19:registerEventHandler( "transition_complete_keyframe", Shape19Frame3 )
					end
				end
				
				Shape19:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Shape19:setAlpha( 0 )
				Shape19:registerEventHandler( "transition_complete_keyframe", Shape19Frame2 )
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
				local LineMidLRFrame2 = function ( LineMidLR, event )
					local LineMidLRFrame3 = function ( LineMidLR, event )
						if not event.interrupted then
							LineMidLR:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
						end
						LineMidLR:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LineMidLR, event )
						else
							LineMidLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineMidLRFrame3( LineMidLR, event )
						return 
					else
						LineMidLR:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						LineMidLR:setAlpha( 0 )
						LineMidLR:registerEventHandler( "transition_complete_keyframe", LineMidLRFrame3 )
					end
				end
				
				LineMidLR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				LineMidLR:setAlpha( 0.5 )
				LineMidLR:registerEventHandler( "transition_complete_keyframe", LineMidLRFrame2 )
				local LineMidRFrame2 = function ( LineMidR, event )
					local LineMidRFrame3 = function ( LineMidR, event )
						if not event.interrupted then
							LineMidR:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
						end
						LineMidR:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LineMidR, event )
						else
							LineMidR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineMidRFrame3( LineMidR, event )
						return 
					else
						LineMidR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						LineMidR:setAlpha( 0.5 )
						LineMidR:registerEventHandler( "transition_complete_keyframe", LineMidRFrame3 )
					end
				end
				
				LineMidR:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				LineMidR:setAlpha( 0 )
				LineMidR:registerEventHandler( "transition_complete_keyframe", LineMidRFrame2 )
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
				local LineMidULFrame2 = function ( LineMidUL, event )
					local LineMidULFrame3 = function ( LineMidUL, event )
						if not event.interrupted then
							LineMidUL:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						end
						LineMidUL:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LineMidUL, event )
						else
							LineMidUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineMidULFrame3( LineMidUL, event )
						return 
					else
						LineMidUL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						LineMidUL:setAlpha( 0.5 )
						LineMidUL:registerEventHandler( "transition_complete_keyframe", LineMidULFrame3 )
					end
				end
				
				LineMidUL:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
				LineMidUL:setAlpha( 0 )
				LineMidUL:registerEventHandler( "transition_complete_keyframe", LineMidULFrame2 )
				local LineInsideBottomFrame2 = function ( LineInsideBottom, event )
					local LineInsideBottomFrame3 = function ( LineInsideBottom, event )
						if not event.interrupted then
							LineInsideBottom:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						LineInsideBottom:setAlpha( 0.15 )
						if event.interrupted then
							self.clipFinished( LineInsideBottom, event )
						else
							LineInsideBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineInsideBottomFrame3( LineInsideBottom, event )
						return 
					else
						LineInsideBottom:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						LineInsideBottom:setAlpha( 0.8 )
						LineInsideBottom:registerEventHandler( "transition_complete_keyframe", LineInsideBottomFrame3 )
					end
				end
				
				LineInsideBottom:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
				LineInsideBottom:setAlpha( 0 )
				LineInsideBottom:registerEventHandler( "transition_complete_keyframe", LineInsideBottomFrame2 )
				local LineInsideRightFrame2 = function ( LineInsideRight, event )
					local LineInsideRightFrame3 = function ( LineInsideRight, event )
						if not event.interrupted then
							LineInsideRight:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						LineInsideRight:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LineInsideRight, event )
						else
							LineInsideRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineInsideRightFrame3( LineInsideRight, event )
						return 
					else
						LineInsideRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						LineInsideRight:setAlpha( 0.6 )
						LineInsideRight:registerEventHandler( "transition_complete_keyframe", LineInsideRightFrame3 )
					end
				end
				
				LineInsideRight:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				LineInsideRight:setAlpha( 0 )
				LineInsideRight:registerEventHandler( "transition_complete_keyframe", LineInsideRightFrame2 )
				local LineInsideLeftFrame2 = function ( LineInsideLeft, event )
					local LineInsideLeftFrame3 = function ( LineInsideLeft, event )
						if not event.interrupted then
							LineInsideLeft:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						end
						LineInsideLeft:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LineInsideLeft, event )
						else
							LineInsideLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineInsideLeftFrame3( LineInsideLeft, event )
						return 
					else
						LineInsideLeft:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						LineInsideLeft:setAlpha( 0.6 )
						LineInsideLeft:registerEventHandler( "transition_complete_keyframe", LineInsideLeftFrame3 )
					end
				end
				
				LineInsideLeft:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
				LineInsideLeft:setAlpha( 0 )
				LineInsideLeft:registerEventHandler( "transition_complete_keyframe", LineInsideLeftFrame2 )
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
				local LineOutsideURFrame2 = function ( LineOutsideUR, event )
					local LineOutsideURFrame3 = function ( LineOutsideUR, event )
						local LineOutsideURFrame4 = function ( LineOutsideUR, event )
							local LineOutsideURFrame5 = function ( LineOutsideUR, event )
								if not event.interrupted then
									LineOutsideUR:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
								end
								LineOutsideUR:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( LineOutsideUR, event )
								else
									LineOutsideUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineOutsideURFrame5( LineOutsideUR, event )
								return 
							else
								LineOutsideUR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								LineOutsideUR:setAlpha( 0.7 )
								LineOutsideUR:registerEventHandler( "transition_complete_keyframe", LineOutsideURFrame5 )
							end
						end
						
						if event.interrupted then
							LineOutsideURFrame4( LineOutsideUR, event )
							return 
						else
							LineOutsideUR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LineOutsideUR:setAlpha( 0 )
							LineOutsideUR:registerEventHandler( "transition_complete_keyframe", LineOutsideURFrame4 )
						end
					end
					
					if event.interrupted then
						LineOutsideURFrame3( LineOutsideUR, event )
						return 
					else
						LineOutsideUR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						LineOutsideUR:setAlpha( 1 )
						LineOutsideUR:registerEventHandler( "transition_complete_keyframe", LineOutsideURFrame3 )
					end
				end
				
				LineOutsideUR:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				LineOutsideUR:setAlpha( 0 )
				LineOutsideUR:registerEventHandler( "transition_complete_keyframe", LineOutsideURFrame2 )
				local LineOutsideULFrame2 = function ( LineOutsideUL, event )
					local LineOutsideULFrame3 = function ( LineOutsideUL, event )
						local LineOutsideULFrame4 = function ( LineOutsideUL, event )
							local LineOutsideULFrame5 = function ( LineOutsideUL, event )
								if not event.interrupted then
									LineOutsideUL:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
								end
								LineOutsideUL:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( LineOutsideUL, event )
								else
									LineOutsideUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineOutsideULFrame5( LineOutsideUL, event )
								return 
							else
								LineOutsideUL:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								LineOutsideUL:setAlpha( 0.7 )
								LineOutsideUL:registerEventHandler( "transition_complete_keyframe", LineOutsideULFrame5 )
							end
						end
						
						if event.interrupted then
							LineOutsideULFrame4( LineOutsideUL, event )
							return 
						else
							LineOutsideUL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LineOutsideUL:setAlpha( 0 )
							LineOutsideUL:registerEventHandler( "transition_complete_keyframe", LineOutsideULFrame4 )
						end
					end
					
					if event.interrupted then
						LineOutsideULFrame3( LineOutsideUL, event )
						return 
					else
						LineOutsideUL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						LineOutsideUL:setAlpha( 1 )
						LineOutsideUL:registerEventHandler( "transition_complete_keyframe", LineOutsideULFrame3 )
					end
				end
				
				LineOutsideUL:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				LineOutsideUL:setAlpha( 0 )
				LineOutsideUL:registerEventHandler( "transition_complete_keyframe", LineOutsideULFrame2 )
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

