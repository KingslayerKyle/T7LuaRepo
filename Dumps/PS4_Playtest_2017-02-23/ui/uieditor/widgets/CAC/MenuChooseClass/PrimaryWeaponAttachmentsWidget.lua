require( "ui.uieditor.widgets.CAC.MenuChooseClass.CategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew" )

local SetupPC = function ( self, controller )
	self:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller )
	if CursorInputEnabledForBuild() then
		SetupPC( self, controller )
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
	self:setLeftRight( 0, 0, 0, 294 )
	self:setTopBottom( 0, 0, 0, 193 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachment5 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
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
				local f6_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f6_local0 = IsCACPrimaryGunfighterCountEqualTo( menu, 2 )
					if f6_local0 then
						f6_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f7_local0 = IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( menu, 3 )
				else
					f7_local0 = false
				end
				return f7_local0
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
	attachment5:setLeftRight( 1, 1, -93, 0 )
	attachment5:setTopBottom( 1, 1, -93, 0 )
	attachment5.plusIcon:setRGB( 1, 0.41, 0 )
	attachment5:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment5.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment5 )
	self.attachment5 = attachment5
	
	local attachment4 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
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
				local f14_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f14_local0 = IsCACPrimaryGunfighterCountEqualTo( menu, 1 )
					if f14_local0 then
						f14_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					end
				else
					f14_local0 = false
				end
				return f14_local0
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f15_local0 = IsCACPrimaryGunfighterCountGreaterThanOrEqualTo( menu, 2 )
				else
					f15_local0 = false
				end
				return f15_local0
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
	attachment4:setLeftRight( 0.5, 0.5, -46.5, 46.5 )
	attachment4:setTopBottom( 1, 1, -93, 0 )
	attachment4.plusIcon:setRGB( 1, 0.41, 0 )
	attachment4:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment4.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment4 )
	self.attachment4 = attachment4
	
	local attachment3 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
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
				local f22_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f22_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f22_local0 then
						f22_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
						if f22_local0 then
							f22_local0 = IsCACPrimaryAttachmentSlotLockedByWildcard( controller )
						end
					end
				else
					f22_local0 = false
				end
				return f22_local0
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				local f23_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f23_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f23_local0 then
						f23_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f23_local0 = false
				end
				return f23_local0
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
	attachment3:setLeftRight( 0, 0, 0, 93 )
	attachment3:setTopBottom( 1, 1, -93, 0 )
	attachment3.plusIcon:setRGB( 1, 0.41, 0 )
	attachment3:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment3.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment3 )
	self.attachment3 = attachment3
	
	local attachment2 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
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
				local f29_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f29_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f29_local0 then
						f29_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f29_local0 = false
				end
				return f29_local0
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
	attachment2:setLeftRight( 1, 1, -93, 0 )
	attachment2:setTopBottom( 0, 0, 0, 93 )
	attachment2.plusIcon:setRGB( 1, 0.41, 0 )
	attachment2:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment2.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment2 )
	self.attachment2 = attachment2
	
	local attachment1 = CoD.WeaponItemModelWidgetNew.new( menu, controller )
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
				local f35_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f35_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f35_local0 then
						f35_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f35_local0 = false
				end
				return f35_local0
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
	attachment1:setLeftRight( 0.5, 0.5, -46.5, 46.5 )
	attachment1:setTopBottom( 0, 0, 0, 93 )
	attachment1.plusIcon:setRGB( 1, 0.41, 0 )
	attachment1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachment1.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( attachment1 )
	self.attachment1 = attachment1
	
	local optic = CoD.WeaponItemModelWidgetNew.new( menu, controller )
	optic:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				local f39_local0
				if not IsCACCustomizationReticleAttachmentItemEquipped( menu, element, controller, "primary" ) then
					f39_local0 = IsCACWeaponEquippedForSlot( menu, element, controller, "primary" )
				else
					f39_local0 = false
				end
				return f39_local0
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
				local f41_local0
				if not IsCACSlotEquipped( menu, element, controller ) then
					f41_local0 = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
					if f41_local0 then
						f41_local0 = IsPrimaryWeaponAttachmentAvailable( controller )
					end
				else
					f41_local0 = false
				end
				return f41_local0
			end
		}
	} )
	optic:setLeftRight( 0, 0, 0, 93 )
	optic:setTopBottom( 0, 0, 0, 93 )
	optic.plusIcon:setRGB( 1, 0.41, 0 )
	optic.opticIndicator:setAlpha( 0.55 )
	optic:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			optic.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( optic )
	self.optic = optic
	
	local opticsHeader = CoD.CategoryHeader.new( menu, controller )
	opticsHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyOpticsNew( element, controller, "primary" )
			end
		}
	} )
	opticsHeader:setLeftRight( 0, 0, 0, 105 )
	opticsHeader:setTopBottom( 0, 0, -31, -1 )
	opticsHeader.header:setText( Engine.Localize( "MPUI_OPTICS_CAPS" ) )
	self:addElement( opticsHeader )
	self.opticsHeader = opticsHeader
	
	local attachmentHeader = CoD.CategoryHeader.new( menu, controller )
	attachmentHeader:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return IsCACAnyAttachmentsNew( element, controller, "primary" )
			end
		}
	} )
	attachmentHeader:setLeftRight( 0, 0, 99, 204 )
	attachmentHeader:setTopBottom( 0, 0, -31, -1 )
	attachmentHeader.header:setText( Engine.Localize( "MPUI_ATTACHMENTS_CAPS" ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.attachment5:close()
		self.attachment4:close()
		self.attachment3:close()
		self.attachment2:close()
		self.attachment1:close()
		self.optic:close()
		self.opticsHeader:close()
		self.attachmentHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

