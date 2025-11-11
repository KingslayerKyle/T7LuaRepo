require( "ui.uieditor.widgets.emptyFocusable" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.Flyout_Btn_Career" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.Flyout_Btn_Multiplayer" )

CoD.Flyout_Start = InheritFrom( LUI.UIElement )
CoD.Flyout_Start.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Flyout_Start )
	self.id = "Flyout_Start"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 415 )
	self:setTopBottom( 0, 0, 0, 281 )
	
	local TriangleA = LUI.UIImage.new()
	TriangleA:setLeftRight( 0, 0, 11, 167 )
	TriangleA:setTopBottom( 0, 0, 38, 206 )
	TriangleA:setImage( RegisterImage( "uie_menu_button_flyout_start_triangle_a" ) )
	self:addElement( TriangleA )
	self.TriangleA = TriangleA
	
	local TriangleBBright = LUI.UIImage.new()
	TriangleBBright:setLeftRight( 0, 0, 11, 167 )
	TriangleBBright:setTopBottom( 0, 0, 38, 206 )
	TriangleBBright:setAlpha( 0 )
	TriangleBBright:setImage( RegisterImage( "uie_menu_button_flyout_start_triangle_b" ) )
	self:addElement( TriangleBBright )
	self.TriangleBBright = TriangleBBright
	
	local TriangleC = LUI.UIImage.new()
	TriangleC:setLeftRight( 0, 0, 11, 167 )
	TriangleC:setTopBottom( 0, 0, 38, 206 )
	TriangleC:setImage( RegisterImage( "uie_menu_button_flyout_start_triangle_c" ) )
	self:addElement( TriangleC )
	self.TriangleC = TriangleC
	
	local Line1A = LUI.UIImage.new()
	Line1A:setLeftRight( 0, 0, 0, 108 )
	Line1A:setTopBottom( 0, 0, 26, 218 )
	Line1A:setImage( RegisterImage( "uie_menu_button_flyout_start_line_1a" ) )
	self:addElement( Line1A )
	self.Line1A = Line1A
	
	local Line1B = LUI.UIImage.new()
	Line1B:setLeftRight( 0, 0, 15, 171 )
	Line1B:setTopBottom( 0, 0, 112, 208 )
	Line1B:setImage( RegisterImage( "uie_menu_button_flyout_start_line_1b" ) )
	self:addElement( Line1B )
	self.Line1B = Line1B
	
	local Line1C = LUI.UIImage.new()
	Line1C:setLeftRight( 0, 0, 15, 171 )
	Line1C:setTopBottom( 0, 0, 34, 130 )
	Line1C:setImage( RegisterImage( "uie_menu_button_flyout_start_line_1c" ) )
	self:addElement( Line1C )
	self.Line1C = Line1C
	
	local Line1D = LUI.UIImage.new()
	Line1D:setLeftRight( 0, 0, 86, 170 )
	Line1D:setTopBottom( 0, 0, 104, 140 )
	Line1D:setImage( RegisterImage( "uie_menu_button_flyout_start_line_1d" ) )
	self:addElement( Line1D )
	self.Line1D = Line1D
	
	local Dot = LUI.UIImage.new()
	Dot:setLeftRight( 0, 0, 9, 33 )
	Dot:setTopBottom( 0, 0, 31, 55 )
	Dot:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( Dot )
	self.Dot = Dot
	
	local DotCopy1 = LUI.UIImage.new()
	DotCopy1:setLeftRight( 0, 0, 9, 33 )
	DotCopy1:setTopBottom( 0, 0, 187, 211 )
	DotCopy1:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( DotCopy1 )
	self.DotCopy1 = DotCopy1
	
	local DotCopy2 = LUI.UIImage.new()
	DotCopy2:setLeftRight( 0, 0, 150, 174 )
	DotCopy2:setTopBottom( 0, 0, 109, 133 )
	DotCopy2:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( DotCopy2 )
	self.DotCopy2 = DotCopy2
	
	local GradientBottom = LUI.UIImage.new()
	GradientBottom:setLeftRight( 0, 0, 55, 367 )
	GradientBottom:setTopBottom( 0, 0, 134, 242 )
	GradientBottom:setXRot( 180 )
	GradientBottom:setImage( RegisterImage( "uie_menu_button_flyout_start_gradient_top" ) )
	self:addElement( GradientBottom )
	self.GradientBottom = GradientBottom
	
	local GradientTop = LUI.UIImage.new()
	GradientTop:setLeftRight( 0, 0, 57, 369 )
	GradientTop:setTopBottom( 0, 0, 0, 108 )
	GradientTop:setImage( RegisterImage( "uie_menu_button_flyout_start_gradient_top" ) )
	self:addElement( GradientTop )
	self.GradientTop = GradientTop
	
	local FlyoutLightTop = LUI.UIImage.new()
	FlyoutLightTop:setLeftRight( 0, 0, 44, 152 )
	FlyoutLightTop:setTopBottom( 0, 0, 40, 124 )
	FlyoutLightTop:setAlpha( 0 )
	FlyoutLightTop:setImage( RegisterImage( "uie_menu_button_flyout_start_light_top" ) )
	self:addElement( FlyoutLightTop )
	self.FlyoutLightTop = FlyoutLightTop
	
	local FlyoutLightTopHollow = LUI.UIImage.new()
	FlyoutLightTopHollow:setLeftRight( 0, 0, 51, 147 )
	FlyoutLightTopHollow:setTopBottom( 0, 0, 40, 124 )
	FlyoutLightTopHollow:setAlpha( 0 )
	FlyoutLightTopHollow:setImage( RegisterImage( "uie_menu_button_flyout_start_line_2a" ) )
	self:addElement( FlyoutLightTopHollow )
	self.FlyoutLightTopHollow = FlyoutLightTopHollow
	
	local FlyoutLightBottom = LUI.UIImage.new()
	FlyoutLightBottom:setLeftRight( 0, 0, 44, 152 )
	FlyoutLightBottom:setTopBottom( 0, 0, 120, 204 )
	FlyoutLightBottom:setAlpha( 0 )
	FlyoutLightBottom:setImage( RegisterImage( "uie_menu_button_flyout_start_light_bottom" ) )
	self:addElement( FlyoutLightBottom )
	self.FlyoutLightBottom = FlyoutLightBottom
	
	local FlyoutLightBottomHollow = LUI.UIImage.new()
	FlyoutLightBottomHollow:setLeftRight( 0, 0, 52, 148 )
	FlyoutLightBottomHollow:setTopBottom( 0, 0, 119, 203 )
	FlyoutLightBottomHollow:setAlpha( 0 )
	FlyoutLightBottomHollow:setImage( RegisterImage( "uie_menu_button_flyout_start_line_2b" ) )
	self:addElement( FlyoutLightBottomHollow )
	self.FlyoutLightBottomHollow = FlyoutLightBottomHollow
	
	local FlyoutLine2c = LUI.UIImage.new()
	FlyoutLine2c:setLeftRight( 0, 0, 166, 356 )
	FlyoutLine2c:setTopBottom( 0, 0, 100, 143 )
	FlyoutLine2c:setAlpha( 0 )
	FlyoutLine2c:setImage( RegisterImage( "uie_menu_button_flyout_start_line_2c" ) )
	self:addElement( FlyoutLine2c )
	self.FlyoutLine2c = FlyoutLine2c
	
	local FlyoutLine2cCopy = LUI.UIImage.new()
	FlyoutLine2cCopy:setLeftRight( 0, 0, 166, 356 )
	FlyoutLine2cCopy:setTopBottom( 0, 0, 176, 219 )
	FlyoutLine2cCopy:setAlpha( 0 )
	FlyoutLine2cCopy:setImage( RegisterImage( "uie_menu_button_flyout_start_line_2c" ) )
	self:addElement( FlyoutLine2cCopy )
	self.FlyoutLine2cCopy = FlyoutLine2cCopy
	
	local FlyoutLine3a = LUI.UIImage.new()
	FlyoutLine3a:setLeftRight( 0, 0, 350, 398 )
	FlyoutLine3a:setTopBottom( 0, 0, 32, 212 )
	FlyoutLine3a:setAlpha( 0 )
	FlyoutLine3a:setImage( RegisterImage( "uie_menu_button_flyout_start_line_3a" ) )
	self:addElement( FlyoutLine3a )
	self.FlyoutLine3a = FlyoutLine3a
	
	local FlyoutLine3b = LUI.UIImage.new()
	FlyoutLine3b:setLeftRight( 0, 0, 344, 404 )
	FlyoutLine3b:setTopBottom( 0, 0, 18, 78 )
	FlyoutLine3b:setAlpha( 0 )
	FlyoutLine3b:setImage( RegisterImage( "uie_menu_button_flyout_start_line_3b" ) )
	self:addElement( FlyoutLine3b )
	self.FlyoutLine3b = FlyoutLine3b
	
	local FlyoutLine3c = LUI.UIImage.new()
	FlyoutLine3c:setLeftRight( 0, 0, 344, 404 )
	FlyoutLine3c:setTopBottom( 0, 0, 163, 223 )
	FlyoutLine3c:setAlpha( 0 )
	FlyoutLine3c:setImage( RegisterImage( "uie_menu_button_flyout_start_line_3c" ) )
	self:addElement( FlyoutLine3c )
	self.FlyoutLine3c = FlyoutLine3c
	
	local DotCopy3 = LUI.UIImage.new()
	DotCopy3:setLeftRight( 0, 0, 160, 184 )
	DotCopy3:setTopBottom( 0, 0, 109, 133 )
	DotCopy3:setAlpha( 0 )
	DotCopy3:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( DotCopy3 )
	self.DotCopy3 = DotCopy3
	
	local DotCopy4 = LUI.UIImage.new()
	DotCopy4:setLeftRight( 0, 0, 336, 360 )
	DotCopy4:setTopBottom( 0, 0, 109, 133 )
	DotCopy4:setAlpha( 0 )
	DotCopy4:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( DotCopy4 )
	self.DotCopy4 = DotCopy4
	
	local DotCopy5 = LUI.UIImage.new()
	DotCopy5:setLeftRight( 0, 0, 20, 44 )
	DotCopy5:setTopBottom( 0, 0, 187, 211 )
	DotCopy5:setAlpha( 0 )
	DotCopy5:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( DotCopy5 )
	self.DotCopy5 = DotCopy5
	
	local DotCopy6 = LUI.UIImage.new()
	DotCopy6:setLeftRight( 0, 0, 20, 44 )
	DotCopy6:setTopBottom( 0, 0, 31, 55 )
	DotCopy6:setAlpha( 0 )
	DotCopy6:setImage( RegisterImage( "uie_menu_button_flyout_start_dot" ) )
	self:addElement( DotCopy6 )
	self.DotCopy6 = DotCopy6
	
	local emptyFocusable = CoD.emptyFocusable.new( menu, controller )
	emptyFocusable:setLeftRight( 0, 0, 32, 150 )
	emptyFocusable:setTopBottom( 0, 0, 48, 193 )
	self:addElement( emptyFocusable )
	self.emptyFocusable = emptyFocusable
	
	local FlyoutBtnCareer = CoD.Flyout_Btn_Career.new( menu, controller )
	FlyoutBtnCareer:setLeftRight( 0, 0, 42, 375 )
	FlyoutBtnCareer:setTopBottom( 0, 0, 36, 108 )
	FlyoutBtnCareer:setAlpha( 0 )
	FlyoutBtnCareer:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	FlyoutBtnCareer:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( FlyoutBtnCareer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		T8Prototype_StartCareer( self, menu, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( FlyoutBtnCareer )
	self.FlyoutBtnCareer = FlyoutBtnCareer
	
	local FlyoutBtnMultiplayer = CoD.Flyout_Btn_Multiplayer.new( menu, controller )
	FlyoutBtnMultiplayer:setLeftRight( 0, 0, 44, 367 )
	FlyoutBtnMultiplayer:setTopBottom( 0, 0, 146, 218 )
	FlyoutBtnMultiplayer:setAlpha( 0 )
	FlyoutBtnMultiplayer:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	FlyoutBtnMultiplayer:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( FlyoutBtnMultiplayer, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		T8Prototype_StartMP( self, menu, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( FlyoutBtnMultiplayer )
	self.FlyoutBtnMultiplayer = FlyoutBtnMultiplayer
	
	local START = LUI.UITightText.new()
	START:setLeftRight( 0, 0, 182, 248 )
	START:setTopBottom( 0, 0, 105, 142 )
	START:setRGB( 0.69, 0.89, 0.8 )
	START:setText( Engine.Localize( "START" ) )
	START:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( START )
	self.START = START
	
	emptyFocusable.navigation = {
		up = FlyoutBtnCareer,
		right = FlyoutBtnCareer,
		down = FlyoutBtnMultiplayer
	}
	FlyoutBtnCareer.navigation = {
		left = emptyFocusable,
		down = emptyFocusable
	}
	FlyoutBtnMultiplayer.navigation = {
		left = emptyFocusable,
		up = emptyFocusable
	}
	self.resetProperties = function ()
		TriangleC:completeAnimation()
		DotCopy4:completeAnimation()
		DotCopy6:completeAnimation()
		FlyoutBtnCareer:completeAnimation()
		FlyoutLine3c:completeAnimation()
		DotCopy3:completeAnimation()
		DotCopy5:completeAnimation()
		TriangleA:completeAnimation()
		Line1A:completeAnimation()
		Line1B:completeAnimation()
		Line1C:completeAnimation()
		FlyoutBtnMultiplayer:completeAnimation()
		Line1D:completeAnimation()
		DotCopy1:completeAnimation()
		DotCopy2:completeAnimation()
		GradientBottom:completeAnimation()
		GradientTop:completeAnimation()
		START:completeAnimation()
		FlyoutLine2c:completeAnimation()
		FlyoutLine2cCopy:completeAnimation()
		FlyoutLine3a:completeAnimation()
		Dot:completeAnimation()
		TriangleC:setAlpha( 1 )
		DotCopy4:setLeftRight( 0, 0, 336, 360 )
		DotCopy4:setTopBottom( 0, 0, 109, 133 )
		DotCopy4:setAlpha( 0 )
		DotCopy6:setAlpha( 0 )
		FlyoutBtnCareer:setLeftRight( 0, 0, 42, 375 )
		FlyoutBtnCareer:setTopBottom( 0, 0, 36, 108 )
		FlyoutBtnCareer:setAlpha( 0 )
		FlyoutLine3c:setLeftRight( 0, 0, 344, 404 )
		FlyoutLine3c:setTopBottom( 0, 0, 163, 223 )
		DotCopy3:setAlpha( 0 )
		DotCopy5:setAlpha( 0 )
		TriangleA:setAlpha( 1 )
		Line1A:setAlpha( 1 )
		Line1B:setLeftRight( 0, 0, 15, 171 )
		Line1B:setTopBottom( 0, 0, 112, 208 )
		Line1C:setLeftRight( 0, 0, 15, 171 )
		Line1C:setTopBottom( 0, 0, 34, 130 )
		FlyoutBtnMultiplayer:setLeftRight( 0, 0, 44, 367 )
		FlyoutBtnMultiplayer:setTopBottom( 0, 0, 146, 218 )
		FlyoutBtnMultiplayer:setAlpha( 0 )
		Line1D:setAlpha( 1 )
		DotCopy1:setLeftRight( 0, 0, 9, 33 )
		DotCopy1:setTopBottom( 0, 0, 187, 211 )
		DotCopy1:setAlpha( 1 )
		DotCopy2:setLeftRight( 0, 0, 150, 174 )
		DotCopy2:setTopBottom( 0, 0, 109, 133 )
		DotCopy2:setAlpha( 1 )
		GradientBottom:setAlpha( 1 )
		GradientTop:setAlpha( 1 )
		START:setAlpha( 1 )
		FlyoutLine2c:setLeftRight( 0, 0, 166, 356 )
		FlyoutLine2c:setTopBottom( 0, 0, 100, 143 )
		FlyoutLine2c:setAlpha( 0 )
		FlyoutLine2cCopy:setLeftRight( 0, 0, 166, 356 )
		FlyoutLine2cCopy:setTopBottom( 0, 0, 176, 219 )
		FlyoutLine3a:setLeftRight( 0, 0, 350, 398 )
		FlyoutLine3a:setTopBottom( 0, 0, 32, 212 )
		Dot:setLeftRight( 0, 0, 9, 33 )
		Dot:setTopBottom( 0, 0, 31, 55 )
		Dot:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				TriangleC:completeAnimation()
				self.TriangleC:setAlpha( 0 )
				self.clipFinished( TriangleC, {} )
				DotCopy4:completeAnimation()
				self.DotCopy4:setLeftRight( 0, 0, -108, -84 )
				self.DotCopy4:setTopBottom( 0, 0, 112, 136 )
				self.clipFinished( DotCopy4, {} )
			end,
			Flyout = function ()
				self.resetProperties()
				self:setupElementClipCounter( 21 )
				TriangleA:completeAnimation()
				self.TriangleA:setAlpha( 0 )
				self.clipFinished( TriangleA, {} )
				Line1A:completeAnimation()
				self.Line1A:setAlpha( 0 )
				self.clipFinished( Line1A, {} )
				Line1B:completeAnimation()
				self.Line1B:setLeftRight( 0, 0, 26, 182 )
				self.Line1B:setTopBottom( 0, 0, 112, 208 )
				self.clipFinished( Line1B, {} )
				Line1C:completeAnimation()
				self.Line1C:setLeftRight( 0, 0, 26, 182 )
				self.Line1C:setTopBottom( 0, 0, 34, 130 )
				self.clipFinished( Line1C, {} )
				Line1D:completeAnimation()
				self.Line1D:setAlpha( 0 )
				self.clipFinished( Line1D, {} )
				Dot:completeAnimation()
				self.Dot:setLeftRight( 0, 0, 336, 360 )
				self.Dot:setTopBottom( 0, 0, 109, 133 )
				self.Dot:setAlpha( 0 )
				self.clipFinished( Dot, {} )
				DotCopy1:completeAnimation()
				self.DotCopy1:setLeftRight( 0, 0, 160, 184 )
				self.DotCopy1:setTopBottom( 0, 0, 186, 210 )
				self.DotCopy1:setAlpha( 0 )
				self.clipFinished( DotCopy1, {} )
				DotCopy2:completeAnimation()
				self.DotCopy2:setLeftRight( 0, 0, 336, 360 )
				self.DotCopy2:setTopBottom( 0, 0, 186, 210 )
				self.DotCopy2:setAlpha( 0 )
				self.clipFinished( DotCopy2, {} )
				GradientBottom:completeAnimation()
				self.GradientBottom:setAlpha( 0 )
				self.clipFinished( GradientBottom, {} )
				GradientTop:completeAnimation()
				self.GradientTop:setAlpha( 0 )
				self.clipFinished( GradientTop, {} )
				FlyoutLine2c:completeAnimation()
				self.FlyoutLine2c:setLeftRight( 0, 0, 166, 356 )
				self.FlyoutLine2c:setTopBottom( 0, 0, 102, 145 )
				self.FlyoutLine2c:setAlpha( 1 )
				self.clipFinished( FlyoutLine2c, {} )
				FlyoutLine2cCopy:completeAnimation()
				self.FlyoutLine2cCopy:setLeftRight( 0, 0, 166, 356 )
				self.FlyoutLine2cCopy:setTopBottom( 0, 0, 178, 221 )
				self.clipFinished( FlyoutLine2cCopy, {} )
				FlyoutLine3a:completeAnimation()
				self.FlyoutLine3a:setLeftRight( 0, 0, 350, 398 )
				self.FlyoutLine3a:setTopBottom( 0, 0, 26, 295 )
				self.clipFinished( FlyoutLine3a, {} )
				FlyoutLine3c:completeAnimation()
				self.FlyoutLine3c:setLeftRight( 0, 0, 344, 404 )
				self.FlyoutLine3c:setTopBottom( 0, 0, 239, 299 )
				self.clipFinished( FlyoutLine3c, {} )
				DotCopy3:completeAnimation()
				self.DotCopy3:setAlpha( 1 )
				self.clipFinished( DotCopy3, {} )
				DotCopy4:completeAnimation()
				self.DotCopy4:setAlpha( 1 )
				self.clipFinished( DotCopy4, {} )
				DotCopy5:completeAnimation()
				self.DotCopy5:setAlpha( 1 )
				self.clipFinished( DotCopy5, {} )
				DotCopy6:completeAnimation()
				self.DotCopy6:setAlpha( 1 )
				self.clipFinished( DotCopy6, {} )
				FlyoutBtnCareer:completeAnimation()
				self.FlyoutBtnCareer:setLeftRight( 0, 0, 57, 381 )
				self.FlyoutBtnCareer:setTopBottom( 0, 0, 47, 119 )
				self.FlyoutBtnCareer:setAlpha( 1 )
				self.clipFinished( FlyoutBtnCareer, {} )
				FlyoutBtnMultiplayer:completeAnimation()
				self.FlyoutBtnMultiplayer:setLeftRight( 0, 0, 57, 381 )
				self.FlyoutBtnMultiplayer:setTopBottom( 0, 0, 122, 194 )
				self.FlyoutBtnMultiplayer:setAlpha( 1 )
				self.clipFinished( FlyoutBtnMultiplayer, {} )
				START:completeAnimation()
				self.START:setAlpha( 0 )
				self.clipFinished( START, {} )
			end
		},
		Flyout = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 21 )
				TriangleA:completeAnimation()
				self.TriangleA:setAlpha( 0 )
				self.clipFinished( TriangleA, {} )
				Line1A:completeAnimation()
				self.Line1A:setAlpha( 0 )
				self.clipFinished( Line1A, {} )
				Line1B:completeAnimation()
				self.Line1B:setLeftRight( 0, 0, 26, 182 )
				self.Line1B:setTopBottom( 0, 0, 112, 208 )
				self.clipFinished( Line1B, {} )
				Line1C:completeAnimation()
				self.Line1C:setLeftRight( 0, 0, 26, 182 )
				self.Line1C:setTopBottom( 0, 0, 34, 130 )
				self.clipFinished( Line1C, {} )
				Line1D:completeAnimation()
				self.Line1D:setAlpha( 0 )
				self.clipFinished( Line1D, {} )
				Dot:completeAnimation()
				self.Dot:setLeftRight( 0, 0, 336, 360 )
				self.Dot:setTopBottom( 0, 0, 109, 133 )
				self.Dot:setAlpha( 0 )
				self.clipFinished( Dot, {} )
				DotCopy1:completeAnimation()
				self.DotCopy1:setLeftRight( 0, 0, 160, 184 )
				self.DotCopy1:setTopBottom( 0, 0, 186, 210 )
				self.DotCopy1:setAlpha( 0 )
				self.clipFinished( DotCopy1, {} )
				DotCopy2:completeAnimation()
				self.DotCopy2:setLeftRight( 0, 0, 336, 360 )
				self.DotCopy2:setTopBottom( 0, 0, 186, 210 )
				self.DotCopy2:setAlpha( 0 )
				self.clipFinished( DotCopy2, {} )
				GradientBottom:completeAnimation()
				self.GradientBottom:setAlpha( 0 )
				self.clipFinished( GradientBottom, {} )
				GradientTop:completeAnimation()
				self.GradientTop:setAlpha( 0 )
				self.clipFinished( GradientTop, {} )
				FlyoutLine2c:completeAnimation()
				self.FlyoutLine2c:setLeftRight( 0, 0, 166, 356 )
				self.FlyoutLine2c:setTopBottom( 0, 0, 102, 145 )
				self.FlyoutLine2c:setAlpha( 1 )
				self.clipFinished( FlyoutLine2c, {} )
				FlyoutLine2cCopy:completeAnimation()
				self.FlyoutLine2cCopy:setLeftRight( 0, 0, 166, 356 )
				self.FlyoutLine2cCopy:setTopBottom( 0, 0, 211, 254 )
				self.clipFinished( FlyoutLine2cCopy, {} )
				FlyoutLine3a:completeAnimation()
				self.FlyoutLine3a:setLeftRight( 0, 0, 350, 398 )
				self.FlyoutLine3a:setTopBottom( 0, 0, 26, 295 )
				self.clipFinished( FlyoutLine3a, {} )
				FlyoutLine3c:completeAnimation()
				self.FlyoutLine3c:setLeftRight( 0, 0, 344, 404 )
				self.FlyoutLine3c:setTopBottom( 0, 0, 239, 299 )
				self.clipFinished( FlyoutLine3c, {} )
				DotCopy3:completeAnimation()
				self.DotCopy3:setAlpha( 1 )
				self.clipFinished( DotCopy3, {} )
				DotCopy4:completeAnimation()
				self.DotCopy4:setAlpha( 1 )
				self.clipFinished( DotCopy4, {} )
				DotCopy5:completeAnimation()
				self.DotCopy5:setAlpha( 1 )
				self.clipFinished( DotCopy5, {} )
				DotCopy6:completeAnimation()
				self.DotCopy6:setAlpha( 1 )
				self.clipFinished( DotCopy6, {} )
				FlyoutBtnCareer:completeAnimation()
				self.FlyoutBtnCareer:setLeftRight( 0, 0, 57, 381 )
				self.FlyoutBtnCareer:setTopBottom( 0, 0, 47, 119 )
				self.FlyoutBtnCareer:setAlpha( 1 )
				self.clipFinished( FlyoutBtnCareer, {} )
				FlyoutBtnMultiplayer:completeAnimation()
				self.FlyoutBtnMultiplayer:setLeftRight( 0, 0, 58, 382 )
				self.FlyoutBtnMultiplayer:setTopBottom( 0, 0, 123, 195 )
				self.FlyoutBtnMultiplayer:setAlpha( 1 )
				self.clipFinished( FlyoutBtnMultiplayer, {} )
				START:completeAnimation()
				self.START:setAlpha( 0 )
				self.clipFinished( START, {} )
			end,
			Default = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TriangleC:completeAnimation()
				self.TriangleC:setAlpha( 0 )
				self.clipFinished( TriangleC, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Flyout",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Flyout" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	emptyFocusable.id = "emptyFocusable"
	FlyoutBtnCareer.id = "FlyoutBtnCareer"
	FlyoutBtnMultiplayer.id = "FlyoutBtnMultiplayer"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emptyFocusable:close()
		self.FlyoutBtnCareer:close()
		self.FlyoutBtnMultiplayer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	CoD.FreeCursorUtility.RegisterButtonFlyout( menu, element, controller, "emptyFocusable", FlyoutBtnCareer, FlyoutBtnMultiplayer )
	return self
end

