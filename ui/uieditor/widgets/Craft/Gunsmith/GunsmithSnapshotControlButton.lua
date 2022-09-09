-- 152afa73cb3b33e0bac6aa70d13aaf7f
-- This hash is used for caching, delete to decompile the file again

CoD.GunsmithSnapshotControlButton = InheritFrom( LUI.UIElement )
CoD.GunsmithSnapshotControlButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GunsmithSnapshotControlButton )
	self.id = "GunsmithSnapshotControlButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( border )
	self.border = border
	
	local imagebg = LUI.UIImage.new()
	imagebg:setLeftRight( true, true, 2, -2 )
	imagebg:setTopBottom( true, true, 2, -2 )
	imagebg:setRGB( 0.18, 0.18, 0.18 )
	self:addElement( imagebg )
	self.imagebg = imagebg
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, true, 2, -2 )
	icon:setTopBottom( true, true, 2, -2 )
	icon:linkToElementModel( self, "icon", true, function ( model )
		local _icon = Engine.GetModelValue( model )
		if _icon then
			icon:setImage( RegisterImage( _icon ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )

				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )

				border:completeAnimation()
				self.border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( border, {} )

				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.clipFinished( icon, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )

				icon:completeAnimation()
				self.icon:setRGB( 0.59, 0.59, 0.59 )
				self.clipFinished( icon, {} )
			end
		},
		OnState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )

				icon:completeAnimation()
				self.icon:setRGB( 0, 1, 0 )
				self.icon:setYRot( 0 )
				self.clipFinished( icon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )

				border:completeAnimation()
				self.border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( border, {} )

				icon:completeAnimation()
				self.icon:setRGB( 0, 1, 0 )
				self.clipFinished( icon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "OnState",
			condition = function ( menu, element, event )
				return Gunsmith_OnState( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.Stats" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.Stats"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.WeaponLevel" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.WeaponLevel"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.PlayerID" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.PlayerID"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.WeaponName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.WeaponName"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.AttachmentIcons" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.AttachmentIcons"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.BO3Logo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.BO3Logo"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.icon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
