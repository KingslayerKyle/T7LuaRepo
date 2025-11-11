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
	self:setLeftRight( 0, 0, 0, 24 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local equippedIcon = LUI.UIImage.new()
	equippedIcon:setLeftRight( 1, 1, -24, 0 )
	equippedIcon:setTopBottom( 0, 0, 0, 24 )
	equippedIcon:setRGB( 0.55, 0.77, 0.25 )
	equippedIcon:setAlpha( 0 )
	equippedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( equippedIcon )
	self.equippedIcon = equippedIcon
	
	self.resetProperties = function ()
		equippedIcon:completeAnimation()
		equippedIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				equippedIcon:completeAnimation()
				self.equippedIcon:setAlpha( 1 )
				self.clipFinished( equippedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
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

