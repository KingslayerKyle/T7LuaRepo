-- 444018366c972e0d6b980805f1b12bb1
-- This hash is used for caching, delete to decompile the file again

CoD.heroCustomizationOption_EquippedIcon = InheritFrom( LUI.UIElement )
CoD.heroCustomizationOption_EquippedIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.heroCustomizationOption_EquippedIcon )
	self.id = "heroCustomizationOption_EquippedIcon"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( false, true, -16, 0 )
	equippedIcon:setTopBottom( true, false, 0, 16 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 0 )
				self.clipFinished( equippedIcon, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCurrentSelectedHeroOption( self, controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

