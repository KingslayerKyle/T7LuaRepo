require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
	end
end

CoD.PrimaryWeaponAttachmentsWidget = InheritFrom( LUI.UIElement )
CoD.PrimaryWeaponAttachmentsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrimaryWeaponAttachmentsWidget )
	self.id = "PrimaryWeaponAttachmentsWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 129 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachment5 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment5:setLeftRight( false, true, -62, 0 )
	attachment5:setTopBottom( false, true, -62, 0 )
	attachment5.plusIcon:setRGB( 1, 0.41, 0 )
	attachment5:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment5.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment5:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f7_local0 = IsCACPrimaryGunfighterCountEqualTo( menu, 2 )
					if f7_local0 then
						f7_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f8_local0 = IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( menu, 3 )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACAttachmentSlotVisible( menu, element, controller, 3 )
			end
		}
	} )
	attachment5:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( attachment5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	attachment5:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( attachment5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( attachment5 )
	self.attachment5 = attachment5
	
	local attachment4 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment4:setLeftRight( false, false, -31, 31 )
	attachment4:setTopBottom( false, true, -62, 0 )
	attachment4.plusIcon:setRGB( 1, 0.41, 0 )
	attachment4:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment4.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment4:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f15_local0 = IsCACPrimaryGunfighterCountEqualTo( menu, 1 )
					if f15_local0 then
						f15_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f15_local0 = false
				end
				return f15_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f16_local0 = IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( menu, 2 )
				else
					f16_local0 = false
				end
				return f16_local0
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return IsCACAttachmentSlotVisible( menu, element, controller, 2 )
			end
		}
	} )
	attachment4:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( attachment4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	attachment4:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( attachment4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( attachment4 )
	self.attachment4 = attachment4
	
	local attachment3 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment3:setLeftRight( true, false, 0, 62 )
	attachment3:setTopBottom( false, true, -62, 0 )
	attachment3.plusIcon:setRGB( 1, 0.41, 0 )
	attachment3:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment3.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment3:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "LockedByWildcard",
			condition = function ( menu, element, event )
				local f23_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f23_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f23_local0 then
						f23_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
						if f23_local0 then
							f23_local0 = IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter" )
						end
					end
				else
					f23_local0 = false
				end
				return f23_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f24_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f24_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f24_local0 then
						f24_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f24_local0 = false
				end
				return f24_local0
			end
		}
	} )
	attachment3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( attachment3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	attachment3:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( attachment3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( attachment3 )
	self.attachment3 = attachment3
	
	local attachment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment2:setLeftRight( false, true, -62, 0 )
	attachment2:setTopBottom( true, false, 0, 62 )
	attachment2.plusIcon:setRGB( 1, 0.41, 0 )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment2.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment2:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f30_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f30_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f30_local0 then
						f30_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f30_local0 = false
				end
				return f30_local0
			end
		}
	} )
	attachment2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( attachment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	attachment2:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( attachment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	attachment1:setLeftRight( false, false, -31, 31 )
	attachment1:setTopBottom( true, false, 0, 62 )
	attachment1.plusIcon:setRGB( 1, 0.41, 0 )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			attachment1.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	attachment1:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller ) and not IsLive()
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f36_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f36_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f36_local0 then
						f36_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f36_local0 = false
				end
				return f36_local0
			end
		}
	} )
	attachment1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( attachment1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	attachment1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( attachment1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:setLeftRight( true, false, 0, 62 )
	optic:setTopBottom( true, false, 0, 62 )
	optic.plusIcon:setRGB( 1, 0.41, 0 )
	optic.opticIndicator:setAlpha( 0.55 )
	optic:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			optic.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	optic:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				local f40_local0
				if not IsCACCustomizationReticleAttachmentItemEquipped( menu, element, controller, "primary" ) then
					f40_local0 = IsCACWeaponEquippedForSlot( menu, element, controller, "primary" )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		},
		{
			stateName = "WeaponEquipped",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f42_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f42_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f42_local0 then
						f42_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f42_local0 = false
				end
				return f42_local0
			end
		}
	} )
	self:addElement( optic )
	self.optic = optic
	
	local opticsHeader = CoD.CategoryHeader.new( menu, controller )
	opticsHeader:setLeftRight( true, false, 0, 70 )
	opticsHeader:setTopBottom( true, false, -21, -1 )
	opticsHeader.header:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	opticsHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyOpticsNew( element, controller, "primary" )
			end
		}
	} )
	self:addElement( opticsHeader )
	self.opticsHeader = opticsHeader
	
	local attachmentHeader = CoD.CategoryHeader.new( menu, controller )
	attachmentHeader:setLeftRight( true, false, 66, 136 )
	attachmentHeader:setTopBottom( true, false, -21, -1 )
	attachmentHeader.header:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
	attachmentHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyAttachmentsNew( element, controller, "primary" )
			end
		}
	} )
	self:addElement( attachmentHeader )
	self.attachmentHeader = attachmentHeader
	
	attachment5.navigation = {
		left = attachment4,
		up = attachment2
	}
	attachment4.navigation = {
		left = attachment3,
		up = attachment1,
		right = attachment5
	}
	attachment3.navigation = {
		up = optic,
		right = attachment4
	}
	attachment2.navigation = {
		left = attachment1,
		down = attachment5
	}
	attachment1.navigation = {
		left = optic,
		right = attachment2,
		down = attachment4
	}
	optic.navigation = {
		right = attachment1,
		down = attachment3
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	attachment5.id = "attachment5"
	attachment4.id = "attachment4"
	attachment3.id = "attachment3"
	attachment2.id = "attachment2"
	attachment1.id = "attachment1"
	optic.id = "optic"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.attachment5:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.attachment5:close()
		element.attachment4:close()
		element.attachment3:close()
		element.attachment2:close()
		element.attachment1:close()
		element.optic:close()
		element.opticsHeader:close()
		element.attachmentHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

