require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeaderGlow" )

CoD.CraftActionHeader = InheritFrom( LUI.UIElement )
CoD.CraftActionHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CraftActionHeader )
	self.id = "CraftActionHeader"
	self.soundSet = "SelectColor"
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( 0, 1, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 1, 0, 0 )
	text:setTopBottom( 0, 0, 0, 30 )
	text:setRGB( 0, 0, 0 )
	text:setTTF( "fonts/escom.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.text:linkToElementModel( self, "actionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeaderGlow0:close()
		self.text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

