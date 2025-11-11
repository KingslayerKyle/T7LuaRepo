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
	self:setLeftRight( 0, 0, 0, 72 )
	self:setTopBottom( 0, 0, 0, 72 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( 0, 1, 0, 0 )
	border:setTopBottom( 0, 1, 0, 0 )
	border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( border )
	self.border = border
	
	local imagebg = LUI.UIImage.new()
	imagebg:setLeftRight( 0, 1, 3, -3 )
	imagebg:setTopBottom( 0, 1, 3, -3 )
	imagebg:setRGB( 0.18, 0.18, 0.18 )
	self:addElement( imagebg )
	self.imagebg = imagebg
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( 0, 1, 3, -3 )
	icon:setTopBottom( 0, 1, 3, -3 )
	icon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	self.resetProperties = function ()
		border:completeAnimation()
		icon:completeAnimation()
		border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
		border:setAlpha( 1 )
		icon:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				border:completeAnimation()
				self.border:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
				self.clipFinished( border, {} )
				icon:completeAnimation()
				self.icon:setRGB( 0, 1, 0 )
				self.clipFinished( icon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

