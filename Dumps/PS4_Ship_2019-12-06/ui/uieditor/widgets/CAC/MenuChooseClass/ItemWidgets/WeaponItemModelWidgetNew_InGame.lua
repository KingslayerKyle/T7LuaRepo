require( "ui.uieditor.widgets.CAC.RestrictedItemWarning" )
require( "ui.uieditor.widgets.CAC.GridItemUpgradeIconWidget" )

CoD.WeaponItemModelWidgetNew_InGame = InheritFrom( LUI.UIElement )
CoD.WeaponItemModelWidgetNew_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponItemModelWidgetNew_InGame )
	self.id = "WeaponItemModelWidgetNew_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveStroke = LUI.UIImage.new()
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	BoxButtonLrgInactiveStroke:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokefull" ) )
	BoxButtonLrgInactiveStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveStroke:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	BoxButtonLrgInactiveStroke:setupNineSliceShader( 16, 16 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactiveDiag = LUI.UIImage.new()
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -1, 1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	BoxButtonLrgInactiveDiag:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	BoxButtonLrgInactiveDiag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveDiag:setShaderVector( 0, 0.18, 0.18, 0, 0 )
	BoxButtonLrgInactiveDiag:setupNineSliceShader( 24, 24 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 0, 0 )
	itemImage:setTopBottom( true, true, 0, 0 )
	itemImage:setAlpha( 0.8 )
	itemImage:setupUIStreamedImage( 0 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local opticIndicator = LUI.UIImage.new()
	opticIndicator:setLeftRight( false, false, -8, 8 )
	opticIndicator:setTopBottom( false, true, -18.5, -6.5 )
	opticIndicator:setAlpha( 0 )
	opticIndicator:setImage( RegisterImage( "uie_t7_menu_cac_iconoptics" ) )
	self:addElement( opticIndicator )
	self.opticIndicator = opticIndicator
	
	local RestrictedItemWarning = CoD.RestrictedItemWarning.new( menu, controller )
	RestrictedItemWarning:setLeftRight( true, false, 0, 127.95 )
	RestrictedItemWarning:setTopBottom( true, false, 9.25, 119.75 )
	RestrictedItemWarning:linkToElementModel( self, nil, false, function ( model )
		RestrictedItemWarning:setModel( model, controller )
	end )
	RestrictedItemWarning:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	RestrictedItemWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( RestrictedItemWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( RestrictedItemWarning )
	self.RestrictedItemWarning = RestrictedItemWarning
	
	local GridItemUpgradeIconWidget0 = CoD.GridItemUpgradeIconWidget.new( menu, controller )
	GridItemUpgradeIconWidget0:setLeftRight( true, false, 3, 21 )
	GridItemUpgradeIconWidget0:setTopBottom( true, false, 3, 21 )
	GridItemUpgradeIconWidget0:linkToElementModel( self, nil, false, function ( model )
		GridItemUpgradeIconWidget0:setModel( model, controller )
	end )
	GridItemUpgradeIconWidget0:mergeStateConditions( {
		{
			stateName = "Upgradable",
			condition = function ( menu, element, event )
				return IsCampaign() and IsCACSlotUpgradable( menu, element, controller )
			end
		},
		{
			stateName = "Upgraded",
			condition = function ( menu, element, event )
				return IsCampaign() and IsCACSlotUpgraded( menu, element, controller )
			end
		}
	} )
	GridItemUpgradeIconWidget0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( GridItemUpgradeIconWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	GridItemUpgradeIconWidget0:linkToElementModel( GridItemUpgradeIconWidget0, nil, true, function ( model )
		menu:updateElementState( GridItemUpgradeIconWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:addElement( GridItemUpgradeIconWidget0 )
	self.GridItemUpgradeIconWidget0 = GridItemUpgradeIconWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
			end
		},
		CybercoreEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
			end
		},
		WeaponEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.8 )
				self.clipFinished( itemImage, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		NotEquippable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.4 )
				self.clipFinished( itemImage, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveStroke:completeAnimation()
				self.BoxButtonLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveStroke, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "CybercoreEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RestrictedItemWarning:close()
		element.GridItemUpgradeIconWidget0:close()
		element.itemImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

