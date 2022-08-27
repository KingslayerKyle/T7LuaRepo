-- 740ccf0571a57febc3164f7386720709
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.WeaponVariantIcon = InheritFrom( LUI.UIElement )
CoD.WeaponVariantIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponVariantIcon )
	self.id = "WeaponVariantIcon"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, true, 0, 0 )
	icon:setTopBottom( true, true, 0, 0 )
	icon:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			icon:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( true, true, 0, 0 )
	lockedIcon:setTopBottom( true, true, 0, 0 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setImage( RegisterImage( "uie_cac_icons_warning" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local showcaseWeaponLockIcon = CoD.cac_lock.new( menu, controller )
	showcaseWeaponLockIcon:setLeftRight( true, true, 0, 0 )
	showcaseWeaponLockIcon:setTopBottom( true, true, 0, 0 )
	showcaseWeaponLockIcon:setAlpha( 0 )
	self:addElement( showcaseWeaponLockIcon )
	self.showcaseWeaponLockIcon = showcaseWeaponLockIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				icon:completeAnimation()
				self.icon:setAlpha( 1 )
				self.clipFinished( icon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				showcaseWeaponLockIcon:completeAnimation()
				self.showcaseWeaponLockIcon:setAlpha( 0 )
				self.clipFinished( showcaseWeaponLockIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				icon:completeAnimation()
				self.icon:setAlpha( 0.5 )
				self.clipFinished( icon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				showcaseWeaponLockIcon:completeAnimation()
				self.showcaseWeaponLockIcon:setAlpha( 0 )
				self.clipFinished( showcaseWeaponLockIcon, {} )
			end
		},
		ShowcaseWeaponLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				icon:completeAnimation()
				self.icon:setAlpha( 0.5 )
				self.clipFinished( icon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				showcaseWeaponLockIcon:completeAnimation()
				self.showcaseWeaponLockIcon:setAlpha( 1 )
				self.clipFinished( showcaseWeaponLockIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsProgressionElementItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "ShowcaseWeaponLocked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.showcaseWeaponLockIcon:close()
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

