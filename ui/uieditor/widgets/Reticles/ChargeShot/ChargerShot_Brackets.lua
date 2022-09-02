-- c3e56241a43654b91430bfb6a8995b45
-- This hash is used for caching, delete to decompile the file again

CoD.ChargerShot_Brackets = InheritFrom( LUI.UIElement )
CoD.ChargerShot_Brackets.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_Brackets )
	self.id = "ChargerShot_Brackets"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 807 )
	self:setTopBottom( true, false, 0, 582 )
	
	local CornerBraquets = LUI.UIImage.new()
	CornerBraquets:setLeftRight( false, false, -403.5, -331.5 )
	CornerBraquets:setTopBottom( false, false, -291, -219 )
	CornerBraquets:setRGB( 1, 0.85, 0.07 )
	CornerBraquets:setAlpha( 0.5 )
	CornerBraquets:setScale( 0.7 )
	CornerBraquets:setImage( RegisterImage( "uie_t7_hud_chargeshot_braquets" ) )
	self:addElement( CornerBraquets )
	self.CornerBraquets = CornerBraquets
	
	local CornerBraquets0 = LUI.UIImage.new()
	CornerBraquets0:setLeftRight( false, false, 331.88, 403.88 )
	CornerBraquets0:setTopBottom( false, false, -291, -219 )
	CornerBraquets0:setRGB( 1, 0.85, 0.07 )
	CornerBraquets0:setAlpha( 0.5 )
	CornerBraquets0:setZRot( -90 )
	CornerBraquets0:setScale( 0.7 )
	CornerBraquets0:setImage( RegisterImage( "uie_t7_hud_chargeshot_braquets" ) )
	self:addElement( CornerBraquets0 )
	self.CornerBraquets0 = CornerBraquets0
	
	local CornerBraquets1 = LUI.UIImage.new()
	CornerBraquets1:setLeftRight( false, false, -403.5, -331.5 )
	CornerBraquets1:setTopBottom( false, false, 218.83, 290.83 )
	CornerBraquets1:setRGB( 1, 0.85, 0.07 )
	CornerBraquets1:setAlpha( 0.5 )
	CornerBraquets1:setZRot( 90 )
	CornerBraquets1:setScale( 0.7 )
	CornerBraquets1:setImage( RegisterImage( "uie_t7_hud_chargeshot_braquets" ) )
	self:addElement( CornerBraquets1 )
	self.CornerBraquets1 = CornerBraquets1
	
	local CornerBraquets10 = LUI.UIImage.new()
	CornerBraquets10:setLeftRight( false, false, 331.88, 403.88 )
	CornerBraquets10:setTopBottom( false, false, 218.83, 290.83 )
	CornerBraquets10:setRGB( 1, 0.85, 0.07 )
	CornerBraquets10:setAlpha( 0.5 )
	CornerBraquets10:setZRot( 180 )
	CornerBraquets10:setScale( 0.7 )
	CornerBraquets10:setImage( RegisterImage( "uie_t7_hud_chargeshot_braquets" ) )
	self:addElement( CornerBraquets10 )
	self.CornerBraquets10 = CornerBraquets10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Fire = function ()
				self:setupElementClipCounter( 0 )

				self.nextClip = "Fire"
			end,
			Cancel = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

