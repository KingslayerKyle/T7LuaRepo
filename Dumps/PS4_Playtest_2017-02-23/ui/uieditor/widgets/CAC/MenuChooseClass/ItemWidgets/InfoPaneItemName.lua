require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameLabel" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemNameWithVariantName" )

CoD.InfoPaneItemName = InheritFrom( LUI.UIElement )
CoD.InfoPaneItemName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InfoPaneItemName )
	self.id = "InfoPaneItemName"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 51 )
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 0, -80, 378 )
	Glow2:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow2:setAlpha( 0.1 )
	Glow2:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local emptyOrUnavailableLabels = CoD.InfoPaneItemNameLabel.new( menu, controller )
	emptyOrUnavailableLabels:setLeftRight( 0, 0, 0, 412 )
	emptyOrUnavailableLabels:setTopBottom( 0, 0, 0, 51 )
	emptyOrUnavailableLabels:setAlpha( 0.74 )
	emptyOrUnavailableLabels.itemName:setText( Engine.Localize( "MENU_NOT_AVAILABLE_CAPS" ) )
	self:addElement( emptyOrUnavailableLabels )
	self.emptyOrUnavailableLabels = emptyOrUnavailableLabels
	
	local weaponNameWithVariant = CoD.InfoPaneItemNameWithVariantName.new( menu, controller )
	weaponNameWithVariant:setLeftRight( 0, 0, 0, 892 )
	weaponNameWithVariant:setTopBottom( 0, 0, 0.5, 51.5 )
	weaponNameWithVariant:setAlpha( 0 )
	weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	weaponNameWithVariant:linkToElementModel( self, nil, false, function ( model )
		weaponNameWithVariant:setModel( model, controller )
	end )
	self:addElement( weaponNameWithVariant )
	self.weaponNameWithVariant = weaponNameWithVariant
	
	local Guide = LUI.UIImage.new()
	Guide:setLeftRight( 0, 0, 0, 4 )
	Guide:setTopBottom( 0, 0, 1, 51 )
	Guide:setRGB( 1, 0.61, 0.15 )
	Guide:setAlpha( 0 )
	self:addElement( Guide )
	self.Guide = Guide
	
	self.resetProperties = function ()
		emptyOrUnavailableLabels:completeAnimation()
		Glow2:completeAnimation()
		weaponNameWithVariant:completeAnimation()
		emptyOrUnavailableLabels:setAlpha( 0.74 )
		emptyOrUnavailableLabels.itemName:setText( Engine.Localize( "MENU_NOT_AVAILABLE_CAPS" ) )
		Glow2:setAlpha( 0.1 )
		weaponNameWithVariant:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				emptyOrUnavailableLabels:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 0 )
				self.clipFinished( emptyOrUnavailableLabels, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				emptyOrUnavailableLabels:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 0 )
				self.clipFinished( emptyOrUnavailableLabels, {} )
				weaponNameWithVariant:completeAnimation()
				self.weaponNameWithVariant:setAlpha( 1 )
				self.clipFinished( weaponNameWithVariant, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.14 )
				self.clipFinished( Glow2, {} )
				emptyOrUnavailableLabels:completeAnimation()
				emptyOrUnavailableLabels.itemName:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 1 )
				self.emptyOrUnavailableLabels.itemName:setText( Engine.Localize( "MENU_EMPTY_CAPS" ) )
				self.clipFinished( emptyOrUnavailableLabels, {} )
			end
		},
		NeedsWildcard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				emptyOrUnavailableLabels:completeAnimation()
				emptyOrUnavailableLabels.itemName:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 0.5 )
				self.emptyOrUnavailableLabels.itemName:setText( Engine.Localize( "MENU_EMPTY_CAPS" ) )
				self.clipFinished( emptyOrUnavailableLabels, {} )
			end
		},
		NotEquippable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				emptyOrUnavailableLabels:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 0.5 )
				self.clipFinished( emptyOrUnavailableLabels, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				emptyOrUnavailableLabels:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 0.5 )
				self.clipFinished( emptyOrUnavailableLabels, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				emptyOrUnavailableLabels:completeAnimation()
				self.emptyOrUnavailableLabels:setAlpha( 0 )
				self.clipFinished( emptyOrUnavailableLabels, {} )
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
			stateName = "Available",
			condition = function ( menu, element, event )
				return IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "NeedsWildcard",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f13_local0 = IsCACSlotCanEquipWildcard( menu, element, controller )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f14_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f14_local0 = IsCACSlotNeedWildcard( menu, element, controller )
				else
					f14_local0 = false
				end
				return f14_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emptyOrUnavailableLabels:close()
		self.weaponNameWithVariant:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

