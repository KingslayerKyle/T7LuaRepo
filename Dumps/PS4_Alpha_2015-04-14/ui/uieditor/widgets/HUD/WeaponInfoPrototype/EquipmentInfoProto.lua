require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.EquipmentInfoProto_Tactical" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.EquipmentInfoProto_Lethal" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.EquipmentInfoEmptyProto" )

local PostLoadFunc = function ( self, controller, menu )
	local perControllerModel = Engine.GetModelForController( controller )
	self.LethalEmpty.previousPulseValue = 0
	self.LethalEmpty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.pulseNoLethal" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.LethalEmpty.previousPulseValue == modelValue then
			return 
		else
			self.LethalEmpty.previousPulseValue = modelValue
			if not PulseNoLethal( controller ) then
				return 
			else
				local LethalEmptyCopy = CoD.EquipmentInfoEmptyProto.new( menu, controller )
				LethalEmptyCopy:setLeftRight( false, true, -45, -11 )
				LethalEmptyCopy:setTopBottom( false, true, -39.55, -3 )
				LethalEmptyCopy:setRGB( 1, 1, 1 )
				LethalEmptyCopy:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				LethalEmptyCopy:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						LethalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						LethalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				LethalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				LethalEmptyCopy:setState( "Empty" )
				self:addElement( LethalEmptyCopy )
			end
		end
	end )
	self.TacticalEmpty.previousPulseValue = 0
	self.TacticalEmpty:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.pulseNoTactical" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.TacticalEmpty.previousPulseValue == modelValue then
			return 
		else
			self.TacticalEmpty.previousPulseValue = modelValue
			if not PulseNoTactical( controller ) then
				return 
			else
				local TacticalEmptyCopy = CoD.EquipmentInfoEmptyProto.new( menu, controller )
				TacticalEmptyCopy:setLeftRight( false, true, -80, -46 )
				TacticalEmptyCopy:setTopBottom( false, true, -39.55, -3 )
				TacticalEmptyCopy:setRGB( 1, 1, 1 )
				TacticalEmptyCopy:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				TacticalEmptyCopy:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						TacticalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						TacticalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				TacticalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				TacticalEmptyCopy:setState( "Empty" )
				self:addElement( TacticalEmptyCopy )
			end
		end
	end )
end

CoD.EquipmentInfoProto = InheritFrom( LUI.UIElement )
CoD.EquipmentInfoProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EquipmentInfoProto )
	self.id = "EquipmentInfoProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local EquipmentInfoProtoTactical = CoD.EquipmentInfoProto_Tactical.new( menu, controller )
	EquipmentInfoProtoTactical:setLeftRight( true, false, 70, 124 )
	EquipmentInfoProtoTactical:setTopBottom( true, false, 60.45, 97 )
	EquipmentInfoProtoTactical:setRGB( 1, 1, 1 )
	EquipmentInfoProtoTactical:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsModelValueGreaterThan( controller, "currentSecondaryOffhand.secondaryOffhandCount", 0 )
			end
		}
	} )
	EquipmentInfoProtoTactical:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( EquipmentInfoProtoTactical, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( EquipmentInfoProtoTactical )
	self.EquipmentInfoProtoTactical = EquipmentInfoProtoTactical
	
	local EquipmentInfoProtoLethal = CoD.EquipmentInfoProto_Lethal.new( menu, controller )
	EquipmentInfoProtoLethal:setLeftRight( true, false, 105, 159 )
	EquipmentInfoProtoLethal:setTopBottom( true, false, 60.45, 97 )
	EquipmentInfoProtoLethal:setRGB( 1, 1, 1 )
	EquipmentInfoProtoLethal:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsModelValueGreaterThan( controller, "currentPrimaryOffhand.primaryOffhandCount", 0 )
			end
		}
	} )
	EquipmentInfoProtoLethal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( EquipmentInfoProtoLethal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( EquipmentInfoProtoLethal )
	self.EquipmentInfoProtoLethal = EquipmentInfoProtoLethal
	
	local TacticalEmpty = CoD.EquipmentInfoEmptyProto.new( menu, controller )
	TacticalEmpty:setLeftRight( true, false, 70, 104 )
	TacticalEmpty:setTopBottom( true, false, 60.45, 97 )
	TacticalEmpty:setRGB( 1, 1, 1 )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalEmpty.ImgIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalEmpty.ImgIconGrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( TacticalEmpty )
	self.TacticalEmpty = TacticalEmpty
	
	local LethalEmpty = CoD.EquipmentInfoEmptyProto.new( menu, controller )
	LethalEmpty:setLeftRight( true, false, 105, 139 )
	LethalEmpty:setTopBottom( true, false, 60.45, 97 )
	LethalEmpty:setRGB( 1, 1, 1 )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalEmpty.ImgIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalEmpty.ImgIconGrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LethalEmpty )
	self.LethalEmpty = LethalEmpty
	
	self.close = function ( self )
		self.EquipmentInfoProtoTactical:close()
		self.EquipmentInfoProtoLethal:close()
		self.TacticalEmpty:close()
		self.LethalEmpty:close()
		CoD.EquipmentInfoProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

