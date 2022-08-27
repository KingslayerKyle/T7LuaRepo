-- 830fa2a1cefa7ef06f6b64f617b74f44
-- This hash is used for caching, delete to decompile the file again

CoD.HackWaypointInternal = InheritFrom( LUI.UIElement )
CoD.HackWaypointInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HackWaypointInternal )
	self.id = "HackWaypointInternal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 92 )
	self:setTopBottom( true, false, 0, 92 )
	
	local bkg = LUI.UIImage.new()
	bkg:setLeftRight( true, true, 14, -14 )
	bkg:setTopBottom( true, true, 14, -14 )
	bkg:setImage( RegisterImage( "uie_t7_cp_hud_obj_defend" ) )
	self:addElement( bkg )
	self.bkg = bkg
	
	local disableText = LUI.UITightText.new()
	disableText:setLeftRight( false, false, -25.5, 25.5 )
	disableText:setTopBottom( false, false, -76, -54 )
	disableText:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_DEFEND_TIMER" ) )
	disableText:setTTF( "fonts/escom.ttf" )
	self:addElement( disableText )
	self.disableText = disableText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

