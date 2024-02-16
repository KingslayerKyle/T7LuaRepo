-- 1ec265cc976fc3aa056e34fe3fa9a3b8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_ammo_item" )

CoD.vhud_dart_NotificationAmmoBoxWidget = InheritFrom( LUI.UIElement )
CoD.vhud_dart_NotificationAmmoBoxWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_NotificationAmmoBoxWidget )
	self.id = "vhud_dart_NotificationAmmoBoxWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local ammoItem3 = CoD.vhud_dart_ammo_item.new( menu, controller )
	ammoItem3:setLeftRight( true, false, 0, 48 )
	ammoItem3:setTopBottom( true, false, 0, 16 )
	ammoItem3:linkToElementModel( self, nil, false, function ( model )
		ammoItem3:setModel( model, controller )
	end )
	ammoItem3:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 3 )
			end
		}
	} )
	ammoItem3:linkToElementModel( ammoItem3, "ammo", true, function ( model )
		menu:updateElementState( ammoItem3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( ammoItem3 )
	self.ammoItem3 = ammoItem3
	
	local ammoItem2 = CoD.vhud_dart_ammo_item.new( menu, controller )
	ammoItem2:setLeftRight( true, false, 0, 48 )
	ammoItem2:setTopBottom( true, false, 16, 32 )
	ammoItem2:linkToElementModel( self, nil, false, function ( model )
		ammoItem2:setModel( model, controller )
	end )
	ammoItem2:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 2 )
			end
		}
	} )
	ammoItem2:linkToElementModel( ammoItem2, "ammo", true, function ( model )
		menu:updateElementState( ammoItem2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( ammoItem2 )
	self.ammoItem2 = ammoItem2
	
	local ammoItem1 = CoD.vhud_dart_ammo_item.new( menu, controller )
	ammoItem1:setLeftRight( true, false, 0, 48 )
	ammoItem1:setTopBottom( true, false, 32, 48 )
	ammoItem1:linkToElementModel( self, nil, false, function ( model )
		ammoItem1:setModel( model, controller )
	end )
	ammoItem1:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 1 )
			end
		}
	} )
	ammoItem1:linkToElementModel( ammoItem1, "ammo", true, function ( model )
		menu:updateElementState( ammoItem1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:addElement( ammoItem1 )
	self.ammoItem1 = ammoItem1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ammoItem3:close()
		element.ammoItem2:close()
		element.ammoItem1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
