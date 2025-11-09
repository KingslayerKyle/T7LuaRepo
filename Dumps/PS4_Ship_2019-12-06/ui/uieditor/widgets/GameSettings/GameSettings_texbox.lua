require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.GameSettings_texbox = InheritFrom( LUI.UIElement )
CoD.GameSettings_texbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_texbox )
	self.id = "GameSettings_texbox"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 489 )
	self:setTopBottom( true, false, 0, 22 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( true, true, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 5, 491 )
	TextBox:setTopBottom( true, false, 0, 22 )
	TextBox:setRGB( 0.74, 0.74, 0.74 )
	TextBox:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	TextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( TextBox, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACvarientTitlePanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

