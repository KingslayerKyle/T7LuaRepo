-- 7472311c5242f245b0458d9dadc19b5e
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 20 )
	
	local FEListSubHeaderGlow0 = CoD.FE_ListSubHeaderGlow.new( menu, controller )
	FEListSubHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListSubHeaderGlow0:setTopBottom( true, true, 0, 0 )
	self:addElement( FEListSubHeaderGlow0 )
	self.FEListSubHeaderGlow0 = FEListSubHeaderGlow0
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( true, false, 0, 20 )
	text:setRGB( 0, 0, 0 )
	text:setTTF( "fonts/escom.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.text:linkToElementModel( self, "actionName", true, function ( model )
		local actionName = Engine.GetModelValue( model )
		if actionName then
			text:setText( Engine.Localize( actionName ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListSubHeaderGlow0:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

