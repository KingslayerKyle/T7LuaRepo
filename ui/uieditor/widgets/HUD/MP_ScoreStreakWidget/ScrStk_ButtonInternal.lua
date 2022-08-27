-- 8c62fdcd96597744ad7715ec2ef96a43
-- This hash is used for caching, delete to decompile the file again

CoD.ScrStk_ButtonInternal = InheritFrom( LUI.UIElement )
CoD.ScrStk_ButtonInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_ButtonInternal )
	self.id = "ScrStk_ButtonInternal"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 52 )
	
	local ArrowSide = LUI.UIImage.new()
	ArrowSide:setLeftRight( false, false, 22, 28.5 )
	ArrowSide:setTopBottom( false, false, -6.5, 6.5 )
	ArrowSide:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	self:addElement( ArrowSide )
	self.ArrowSide = ArrowSide
	
	local Box = LUI.UIImage.new()
	Box:setLeftRight( false, false, -32, 24 )
	Box:setTopBottom( false, false, -18, 18 )
	Box:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_box" ) )
	Box:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Box )
	self.Box = Box
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, false, -28, 20 )
	Icon:setTopBottom( false, false, -24, 24 )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_hud_ks_auto_sentry_widget" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

