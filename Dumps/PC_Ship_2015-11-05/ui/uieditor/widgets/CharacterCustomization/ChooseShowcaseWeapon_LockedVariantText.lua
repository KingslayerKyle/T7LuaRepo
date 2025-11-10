CoD.ChooseShowcaseWeapon_LockedVariantText = InheritFrom( LUI.UIElement )
CoD.ChooseShowcaseWeapon_LockedVariantText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseShowcaseWeapon_LockedVariantText )
	self.id = "ChooseShowcaseWeapon_LockedVariantText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 329 )
	self:setTopBottom( true, false, 0, 25 )
	
	local lockedVariantText = LUI.UIText.new()
	lockedVariantText:setLeftRight( true, true, 0, 0 )
	lockedVariantText:setTopBottom( true, false, 0, 25 )
	lockedVariantText:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_VARIANT_LOCKED" ) )
	lockedVariantText:setTTF( "fonts/default.ttf" )
	lockedVariantText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lockedVariantText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lockedVariantText )
	self.lockedVariantText = lockedVariantText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 0 )
				self.clipFinished( lockedVariantText, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				lockedVariantText:completeAnimation()
				self.lockedVariantText:setAlpha( 1 )
				self.clipFinished( lockedVariantText, {} )
			end,
			ShowVariants = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

