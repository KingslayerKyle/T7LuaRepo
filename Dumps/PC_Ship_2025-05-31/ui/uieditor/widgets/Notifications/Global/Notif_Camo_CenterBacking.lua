CoD.Notif_Camo_CenterBacking = InheritFrom( LUI.UIElement )
CoD.Notif_Camo_CenterBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notif_Camo_CenterBacking )
	self.id = "Notif_Camo_CenterBacking"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 215 )
	self:setTopBottom( true, false, 0, 155 )
	
	local CenterFillL = LUI.UIImage.new()
	CenterFillL:setLeftRight( true, false, 0, 77.5 )
	CenterFillL:setTopBottom( false, false, -77.5, 77.5 )
	CenterFillL:setRGB( 0.16, 0.16, 0.16 )
	CenterFillL:setAlpha( 0.4 )
	CenterFillL:setImage( RegisterImage( "uie_t7_hud_notif_camo_center_fill_stretch" ) )
	self:addElement( CenterFillL )
	self.CenterFillL = CenterFillL
	
	local CenterStretch = LUI.UIImage.new()
	CenterStretch:setLeftRight( true, true, 77.5, -77.5 )
	CenterStretch:setTopBottom( false, false, -77.5, 77.5 )
	CenterStretch:setRGB( 0.16, 0.16, 0.16 )
	CenterStretch:setAlpha( 0.4 )
	CenterStretch:setImage( RegisterImage( "uie_t7_hud_notif_camo_center_fill" ) )
	self:addElement( CenterStretch )
	self.CenterStretch = CenterStretch
	
	local CenterFillL0 = LUI.UIImage.new()
	CenterFillL0:setLeftRight( false, true, -77.5, 0 )
	CenterFillL0:setTopBottom( false, false, -77.5, 77.5 )
	CenterFillL0:setRGB( 0.16, 0.16, 0.16 )
	CenterFillL0:setAlpha( 0.4 )
	CenterFillL0:setZRot( 180 )
	CenterFillL0:setImage( RegisterImage( "uie_t7_hud_notif_camo_center_fill_stretch" ) )
	self:addElement( CenterFillL0 )
	self.CenterFillL0 = CenterFillL0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

