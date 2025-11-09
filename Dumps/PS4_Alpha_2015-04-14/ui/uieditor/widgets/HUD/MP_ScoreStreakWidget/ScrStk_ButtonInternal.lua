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
	ArrowSide:setLeftRight( false, false, 24, 32 )
	ArrowSide:setTopBottom( false, false, -8, 8 )
	ArrowSide:setRGB( 1, 1, 1 )
	ArrowSide:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	ArrowSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ArrowSide )
	self.ArrowSide = ArrowSide
	
	local ArrowUp = LUI.UIImage.new()
	ArrowUp:setLeftRight( true, false, 18, 38 )
	ArrowUp:setTopBottom( true, false, 0, 12 )
	ArrowUp:setRGB( 1, 1, 1 )
	ArrowUp:setAlpha( 0 )
	ArrowUp:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowvert" ) )
	ArrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDwn = LUI.UIImage.new()
	ArrowDwn:setLeftRight( true, false, 18, 38 )
	ArrowDwn:setTopBottom( true, false, 40, 52 )
	ArrowDwn:setRGB( 1, 1, 1 )
	ArrowDwn:setAlpha( 0 )
	ArrowDwn:setXRot( -180 )
	ArrowDwn:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowvert" ) )
	ArrowDwn:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ArrowDwn )
	self.ArrowDwn = ArrowDwn
	
	local Box = LUI.UIImage.new()
	Box:setLeftRight( false, false, -32, 24 )
	Box:setTopBottom( false, false, -18, 18 )
	Box:setRGB( 1, 1, 1 )
	Box:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_box" ) )
	Box:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Box )
	self.Box = Box
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, false, -28, 20 )
	Icon:setTopBottom( false, false, -24, 24 )
	Icon:setRGB( 1, 1, 1 )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_hud_ks_auto_sentry_widget" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

