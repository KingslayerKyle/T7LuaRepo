require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.LoadingScreen_DoubleXPLabel = InheritFrom( LUI.UIElement )
CoD.LoadingScreen_DoubleXPLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreen_DoubleXPLabel )
	self.id = "LoadingScreen_DoubleXPLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 24 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( true, true, 0, 0 )
	FETitleNumBrdr0:setAlpha( 0.2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local XPLabel = LUI.UIText.new()
	XPLabel:setLeftRight( true, true, 5, -5 )
	XPLabel:setTopBottom( false, false, -9, 9 )
	XPLabel:setRGB( 0.39, 0.83, 0.94 )
	XPLabel:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
	XPLabel:setTTF( "fonts/escom.ttf" )
	XPLabel:setLetterSpacing( 4.3 )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	XPLabel:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( XPLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 10 )
	end )
	self:addElement( XPLabel )
	self.XPLabel = XPLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

