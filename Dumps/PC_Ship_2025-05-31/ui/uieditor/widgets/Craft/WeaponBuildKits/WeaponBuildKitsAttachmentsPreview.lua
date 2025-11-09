require( "ui.uieditor.widgets.Craft.WeaponBuildKits.WeaponBuildKitsAttachmentPreview" )

CoD.WeaponBuildKitsAttachmentsPreview = InheritFrom( LUI.UIElement )
CoD.WeaponBuildKitsAttachmentsPreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponBuildKitsAttachmentsPreview )
	self.id = "WeaponBuildKitsAttachmentsPreview"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 405 )
	self:setTopBottom( true, false, 0, 93 )
	self.anyChildUsesUpdateState = true
	
	local Optic = CoD.WeaponBuildKitsAttachmentPreview.new( menu, controller )
	Optic:setLeftRight( true, false, 0, 64 )
	Optic:setTopBottom( true, false, 24, 88 )
	Optic.opticIndicator:setAlpha( 0.41 )
	Optic:linkToElementModel( self, nil, false, function ( model )
		Optic:setModel( model, controller )
	end )
	Optic:linkToElementModel( self, "attachment1", true, function ( model )
		local attachment1 = Engine.GetModelValue( model )
		if attachment1 then
			Optic.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "1", attachment1 ) ) )
		end
	end )
	Optic:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment1", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 0 )
			end
		}
	} )
	Optic:linkToElementModel( Optic, "attachment1", true, function ( model )
		menu:updateElementState( Optic, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment1"
		} )
	end )
	self:addElement( Optic )
	self.Optic = Optic
	
	local Attachment1 = CoD.WeaponBuildKitsAttachmentPreview.new( menu, controller )
	Attachment1:setLeftRight( true, false, 67.67, 131.67 )
	Attachment1:setTopBottom( true, false, 24, 88 )
	Attachment1:linkToElementModel( self, nil, false, function ( model )
		Attachment1:setModel( model, controller )
	end )
	Attachment1:linkToElementModel( self, "attachment2", true, function ( model )
		local attachment2 = Engine.GetModelValue( model )
		if attachment2 then
			Attachment1.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "2", attachment2 ) ) )
		end
	end )
	Attachment1:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment2", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 1 )
			end
		}
	} )
	Attachment1:linkToElementModel( Attachment1, "attachment2", true, function ( model )
		menu:updateElementState( Attachment1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment2"
		} )
	end )
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = CoD.WeaponBuildKitsAttachmentPreview.new( menu, controller )
	Attachment2:setLeftRight( true, false, 135.67, 199.67 )
	Attachment2:setTopBottom( true, false, 24, 88 )
	Attachment2:linkToElementModel( self, nil, false, function ( model )
		Attachment2:setModel( model, controller )
	end )
	Attachment2:linkToElementModel( self, "attachment3", true, function ( model )
		local attachment3 = Engine.GetModelValue( model )
		if attachment3 then
			Attachment2.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "3", attachment3 ) ) )
		end
	end )
	Attachment2:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment3", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 2 )
			end
		}
	} )
	Attachment2:linkToElementModel( Attachment2, "attachment3", true, function ( model )
		menu:updateElementState( Attachment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment3"
		} )
	end )
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = CoD.WeaponBuildKitsAttachmentPreview.new( menu, controller )
	Attachment3:setLeftRight( true, false, 203.67, 267.67 )
	Attachment3:setTopBottom( true, false, 24, 88 )
	Attachment3:linkToElementModel( self, nil, false, function ( model )
		Attachment3:setModel( model, controller )
	end )
	Attachment3:linkToElementModel( self, "attachment4", true, function ( model )
		local attachment4 = Engine.GetModelValue( model )
		if attachment4 then
			Attachment3.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "4", attachment4 ) ) )
		end
	end )
	Attachment3:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment4", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 3 )
			end
		}
	} )
	Attachment3:linkToElementModel( Attachment3, "attachment4", true, function ( model )
		menu:updateElementState( Attachment3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment4"
		} )
	end )
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = CoD.WeaponBuildKitsAttachmentPreview.new( menu, controller )
	Attachment4:setLeftRight( true, false, 271.1, 335.1 )
	Attachment4:setTopBottom( true, false, 24, 88 )
	Attachment4:linkToElementModel( self, nil, false, function ( model )
		Attachment4:setModel( model, controller )
	end )
	Attachment4:linkToElementModel( self, "attachment5", true, function ( model )
		local attachment5 = Engine.GetModelValue( model )
		if attachment5 then
			Attachment4.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "5", attachment5 ) ) )
		end
	end )
	Attachment4:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment5", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 4 )
			end
		}
	} )
	Attachment4:linkToElementModel( Attachment4, "attachment5", true, function ( model )
		menu:updateElementState( Attachment4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment5"
		} )
	end )
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = CoD.WeaponBuildKitsAttachmentPreview.new( menu, controller )
	Attachment5:setLeftRight( true, false, 339.1, 403.1 )
	Attachment5:setTopBottom( true, false, 24, 88 )
	Attachment5:linkToElementModel( self, nil, false, function ( model )
		Attachment5:setModel( model, controller )
	end )
	Attachment5:linkToElementModel( self, "attachment6", true, function ( model )
		local attachment6 = Engine.GetModelValue( model )
		if attachment6 then
			Attachment5.attachmentImage:setImage( RegisterImage( GetAttachmentImageFromIndex( controller, "6", attachment6 ) ) )
		end
	end )
	Attachment5:mergeStateConditions( {
		{
			stateName = "IsEquipped",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "attachment6", 0 )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsAttachmentSlotLocked( element, controller, 5 )
			end
		}
	} )
	Attachment5:linkToElementModel( Attachment5, "attachment6", true, function ( model )
		menu:updateElementState( Attachment5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "attachment6"
		} )
	end )
	self:addElement( Attachment5 )
	self.Attachment5 = Attachment5
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Optic:completeAnimation()
				self.Optic:setAlpha( 1 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setAlpha( 1 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setAlpha( 1 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setAlpha( 1 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setAlpha( 1 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 1 )
				self.clipFinished( Attachment5, {} )
			end
		},
		SpecialWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Optic:completeAnimation()
				self.Optic:setAlpha( 0 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setAlpha( 0 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setAlpha( 0 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setAlpha( 0 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setAlpha( 0 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
			end
		},
		Handguns = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Optic:completeAnimation()
				self.Optic:setAlpha( 1 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setAlpha( 1 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setAlpha( 1 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setAlpha( 0 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setAlpha( 0 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
			end
		},
		Snipers = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Optic:completeAnimation()
				self.Optic:setAlpha( 1 )
				self.clipFinished( Optic, {} )
				Attachment1:completeAnimation()
				self.Attachment1:setAlpha( 1 )
				self.clipFinished( Attachment1, {} )
				Attachment2:completeAnimation()
				self.Attachment2:setAlpha( 1 )
				self.clipFinished( Attachment2, {} )
				Attachment3:completeAnimation()
				self.Attachment3:setAlpha( 1 )
				self.clipFinished( Attachment3, {} )
				Attachment4:completeAnimation()
				self.Attachment4:setAlpha( 1 )
				self.clipFinished( Attachment4, {} )
				Attachment5:completeAnimation()
				self.Attachment5:setAlpha( 0 )
				self.clipFinished( Attachment5, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SpecialWeapon",
			condition = function ( menu, element, event )
				return Gunsmith_IsSpecialWeapon( menu, element, controller )
			end
		},
		{
			stateName = "Handguns",
			condition = function ( menu, element, event )
				return Gunsmith_IsHandguns( menu, element, controller )
			end
		},
		{
			stateName = "Snipers",
			condition = function ( menu, element, event )
				return Gunsmith_IsSnipers( menu, element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "SpecialWeapon" ) then
			MakeElementNotFocusable( self, "Attachment1", controller )
			MakeElementNotFocusable( self, "Attachment2", controller )
			MakeElementNotFocusable( self, "Attachment3", controller )
			MakeElementNotFocusable( self, "Attachment4", controller )
			MakeElementNotFocusable( self, "Attachment5", controller )
			MakeElementNotFocusable( self, "Optic", controller )
		elseif IsElementInState( element, "DefaultState" ) then
			
		elseif IsElementInState( element, "Handguns" ) then
			MakeElementNotFocusable( self, "Attachment3", controller )
			MakeElementNotFocusable( self, "Attachment4", controller )
			MakeElementNotFocusable( self, "Attachment5", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Optic:close()
		element.Attachment1:close()
		element.Attachment2:close()
		element.Attachment3:close()
		element.Attachment4:close()
		element.Attachment5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

