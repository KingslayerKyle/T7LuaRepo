-- c63e234585a296c60e6306939eabe09a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentLethalItem" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentTacticalItem" )

CoD.AmmoWidget_EquipmentInfo = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_EquipmentInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_EquipmentInfo )
	self.id = "AmmoWidget_EquipmentInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 42 )
	self.anyChildUsesUpdateState = true
	
	local LethalItem = CoD.AmmoWidget_EquipmentLethalItem.new( menu, controller )
	LethalItem:setLeftRight( true, false, 46, 83 )
	LethalItem:setTopBottom( true, false, 4, 36 )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Lethal1:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Lethal2:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Lethal3:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:mergeStateConditions( {
		{
			stateName = "Single",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 1 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 2 )
			end
		},
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 3 )
			end
		}
	} )
	LethalItem:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( LethalItem, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( LethalItem )
	self.LethalItem = LethalItem
	
	local TacticalItem = CoD.AmmoWidget_EquipmentTacticalItem.new( menu, controller )
	TacticalItem:setLeftRight( true, false, 5.5, 42.5 )
	TacticalItem:setTopBottom( true, false, 4, 36 )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical1:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical2:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical3:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:mergeStateConditions( {
		{
			stateName = "Single",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 1 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 2 )
			end
		},
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 3 )
			end
		}
	} )
	TacticalItem:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( TacticalItem, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( TacticalItem )
	self.TacticalItem = TacticalItem
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LethalItem:close()
		element.TacticalItem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

