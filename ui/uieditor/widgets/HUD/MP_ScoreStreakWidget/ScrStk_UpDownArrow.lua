-- ee0b94093cae53bae526a35e3d46c3ab
-- This hash is used for caching, delete to decompile the file again

CoD.ScrStk_UpDownArrow = InheritFrom( LUI.UIElement )
CoD.ScrStk_UpDownArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_UpDownArrow )
	self.id = "ScrStk_UpDownArrow"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local ArrowSide = LUI.UIImage.new()
	ArrowSide:setLeftRight( false, false, -2, 2 )
	ArrowSide:setTopBottom( false, false, -4, 4 )
	ArrowSide:setZRot( 90 )
	ArrowSide:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	self:addElement( ArrowSide )
	self.ArrowSide = ArrowSide
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ArrowSide:completeAnimation()
				self.ArrowSide:setAlpha( 0 )
				self.clipFinished( ArrowSide, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 0 )

			end,
			ReadyMiddle = function ()
				self:setupElementClipCounter( 0 )

			end,
			Inactive = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ArrowSide:completeAnimation()
				self.ArrowSide:setAlpha( 1 )
				self.clipFinished( ArrowSide, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

