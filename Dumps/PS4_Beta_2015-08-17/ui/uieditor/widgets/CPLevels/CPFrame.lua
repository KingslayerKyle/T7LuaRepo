require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )

CoD.CPFrame = InheritFrom( LUI.UIElement )
CoD.CPFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPFrame )
	self.id = "CPFrame"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 505 )
	self:setTopBottom( true, false, 0, 262 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.04, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveStroke:close()
		self.BoxButtonLrgInactiveDiag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

