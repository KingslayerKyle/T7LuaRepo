require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.MPHintTextContainer = InheritFrom( LUI.UIElement )
CoD.MPHintTextContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPHintTextContainer )
	self.id = "MPHintTextContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 859 )
	self:setTopBottom( true, false, 0, 28 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local txtHintText0 = LUI.UIText.new()
	txtHintText0:setLeftRight( false, false, -400, 400 )
	txtHintText0:setTopBottom( true, false, 0, 24 )
	txtHintText0:setText( Engine.Localize( "HintTextLine" ) )
	txtHintText0:setTTF( "fonts/default.ttf" )
	txtHintText0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtHintText0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( txtHintText0, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 5, 0 )
	end )
	self:addElement( txtHintText0 )
	self.txtHintText0 = txtHintText0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

