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
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( 0, 1, 0, 0 )
	icon:setTopBottom( 0, 1, 0, 0 )
	icon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( 0, 1, 0, 0 )
	lockedIcon:setTopBottom( 0, 1, 0, 0 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setImage( RegisterImage( "cac_mods_warning_wv_icon" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local showcaseWeaponLockIcon = CoD.cac_lock.new( menu, controller )
	showcaseWeaponLockIcon:setLeftRight( 0, 1, 0, 0 )
	showcaseWeaponLockIcon:setTopBottom( 0, 1, 0, 0 )
	showcaseWeaponLockIcon:setAlpha( 0 )
	self:addElement( showcaseWeaponLockIcon )
	self.showcaseWeaponLockIcon = showcaseWeaponLockIcon
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		icon:completeAnimation()
		showcaseWeaponLockIcon:completeAnimation()
		lockedIcon:setAlpha( 0 )
		icon:setAlpha( 1 )
		showcaseWeaponLockIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setAlpha( 0.5 )
				self.clipFinished( icon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		ShowcaseWeaponLocked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setAlpha( 0.5 )
				self.clipFinished( icon, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.showcaseWeaponLockIcon:close()
		self.icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

