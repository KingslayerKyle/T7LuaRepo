require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.LoadingScreen_DoubleWeaponXPLabel = InheritFrom( LUI.UIElement )
CoD.LoadingScreen_DoubleWeaponXPLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreen_DoubleWeaponXPLabel )
	self.id = "LoadingScreen_DoubleWeaponXPLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 465 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr0:setTopBottom( 0, 1, 0, 0 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local XPLabel = LUI.UIText.new()
	XPLabel:setLeftRight( 0, 1, 8, -8 )
	XPLabel:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	XPLabel:setRGB( 0.39, 0.83, 0.94 )
	XPLabel:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
	XPLabel:setTTF( "fonts/escom.ttf" )
	XPLabel:setLetterSpacing( 4.3 )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	XPLabel:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( XPLabel, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 10 )
	end )
	self:addElement( XPLabel )
	self.XPLabel = XPLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

