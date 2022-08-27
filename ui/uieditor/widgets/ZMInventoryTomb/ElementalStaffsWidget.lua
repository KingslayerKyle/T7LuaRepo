-- dbaca52af14f34159a4ea6e42feba0c5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryTomb.ElementalStaffContainer" )

CoD.ElementalStaffsWidget = InheritFrom( LUI.UIElement )
CoD.ElementalStaffsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ElementalStaffsWidget )
	self.id = "ElementalStaffsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 420 )
	self:setTopBottom( true, false, 0, 132 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -27, 439 )
	bg:setTopBottom( false, false, -123.73, 123.73 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_inventory_background" ) )
	self:addElement( bg )
	self.bg = bg
	
	local WaterStaffContainer = CoD.ElementalStaffContainer.new( menu, controller )
	WaterStaffContainer:setLeftRight( true, false, 320, 420 )
	WaterStaffContainer:setTopBottom( true, false, 0, 132 )
	WaterStaffContainer.ElementalStaffItem.StaffPartL:setRGB( 0.22, 0.45, 0.58 )
	WaterStaffContainer.ElementalStaffItem.StaffPartU:setRGB( 0.22, 0.45, 0.58 )
	WaterStaffContainer.ElementalStaffItem.StaffPartM:setRGB( 0.22, 0.45, 0.58 )
	WaterStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 0.04, 0.56, 0.86 )
	WaterStaffContainer.ElementalStaffItem.Record:setRGB( 0, 0.89, 1 )
	WaterStaffContainer.ElementalStaffItem.Staff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_water" ) )
	WaterStaffContainer.ElementalStaffItem.UpgradedStaff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_water_outline" ) )
	WaterStaffContainer.ElementalStaffItem.Gem:setImage( RegisterImage( "uie_t7_zm_hd_craftable_crystal_water" ) )
	WaterStaffContainer:subscribeToGlobalModel( controller, "ZMTombInventory", "water_staff", function ( model )
		WaterStaffContainer:setModel( model, controller )
	end )
	WaterStaffContainer:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsAnyInventoryItemVisible3( controller, "fire_staff.visible", "air_staff.visible", "lightning_staff.visible" )
			end
		}
	} )
	WaterStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( WaterStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	WaterStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.fire_staff.visible" ), function ( model )
		menu:updateElementState( WaterStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.fire_staff.visible"
		} )
	end )
	WaterStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.air_staff.visible" ), function ( model )
		menu:updateElementState( WaterStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.air_staff.visible"
		} )
	end )
	WaterStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.lightning_staff.visible" ), function ( model )
		menu:updateElementState( WaterStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.lightning_staff.visible"
		} )
	end )
	WaterStaffContainer:linkToElementModel( WaterStaffContainer, "visible", true, function ( model )
		menu:updateElementState( WaterStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )
	self:addElement( WaterStaffContainer )
	self.WaterStaffContainer = WaterStaffContainer
	
	local LightningStaffContainer = CoD.ElementalStaffContainer.new( menu, controller )
	LightningStaffContainer:setLeftRight( true, false, 212, 312 )
	LightningStaffContainer:setTopBottom( true, false, 0, 132 )
	LightningStaffContainer.ElementalStaffItem.StaffPartL:setRGB( 0.34, 0.22, 0.59 )
	LightningStaffContainer.ElementalStaffItem.StaffPartU:setRGB( 0.34, 0.22, 0.59 )
	LightningStaffContainer.ElementalStaffItem.StaffPartM:setRGB( 0.34, 0.22, 0.59 )
	LightningStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 0.67, 0.24, 0.93 )
	LightningStaffContainer.ElementalStaffItem.Record:setRGB( 0.64, 0, 1 )
	LightningStaffContainer.ElementalStaffItem.Staff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_lightning" ) )
	LightningStaffContainer.ElementalStaffItem.UpgradedStaff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_lightning_outline" ) )
	LightningStaffContainer.ElementalStaffItem.Gem:setImage( RegisterImage( "uie_t7_zm_hd_craftable_crystal_lightning" ) )
	LightningStaffContainer:subscribeToGlobalModel( controller, "ZMTombInventory", "lightning_staff", function ( model )
		LightningStaffContainer:setModel( model, controller )
	end )
	LightningStaffContainer:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsAnyInventoryItemVisible3( controller, "fire_staff.visible", "air_staff.visible", "water_staff.visible" )
			end
		}
	} )
	LightningStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( LightningStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LightningStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.fire_staff.visible" ), function ( model )
		menu:updateElementState( LightningStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.fire_staff.visible"
		} )
	end )
	LightningStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.air_staff.visible" ), function ( model )
		menu:updateElementState( LightningStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.air_staff.visible"
		} )
	end )
	LightningStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.water_staff.visible" ), function ( model )
		menu:updateElementState( LightningStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.water_staff.visible"
		} )
	end )
	LightningStaffContainer:linkToElementModel( LightningStaffContainer, "visible", true, function ( model )
		menu:updateElementState( LightningStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )
	self:addElement( LightningStaffContainer )
	self.LightningStaffContainer = LightningStaffContainer
	
	local AirStaffContainer = CoD.ElementalStaffContainer.new( menu, controller )
	AirStaffContainer:setLeftRight( true, false, 106, 206 )
	AirStaffContainer:setTopBottom( true, false, 0, 132 )
	AirStaffContainer.ElementalStaffItem.StaffPartL:setRGB( 0.81, 0.8, 0.03 )
	AirStaffContainer.ElementalStaffItem.StaffPartU:setRGB( 0.81, 0.8, 0.03 )
	AirStaffContainer.ElementalStaffItem.StaffPartM:setRGB( 0.81, 0.8, 0.03 )
	AirStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 1, 0.85, 0.25 )
	AirStaffContainer.ElementalStaffItem.Record:setRGB( 1, 0.98, 0 )
	AirStaffContainer.ElementalStaffItem.Staff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_wind" ) )
	AirStaffContainer.ElementalStaffItem.UpgradedStaff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_wind_outline" ) )
	AirStaffContainer.ElementalStaffItem.Gem:setImage( RegisterImage( "uie_t7_zm_hd_craftable_crystal_wind" ) )
	AirStaffContainer:subscribeToGlobalModel( controller, "ZMTombInventory", "air_staff", function ( model )
		AirStaffContainer:setModel( model, controller )
	end )
	AirStaffContainer:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsAnyInventoryItemVisible3( controller, "fire_staff.visible", "lightning_staff.visible", "water_staff.visible" )
			end
		}
	} )
	AirStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( AirStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	AirStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.fire_staff.visible" ), function ( model )
		menu:updateElementState( AirStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.fire_staff.visible"
		} )
	end )
	AirStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.lightning_staff.visible" ), function ( model )
		menu:updateElementState( AirStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.lightning_staff.visible"
		} )
	end )
	AirStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.water_staff.visible" ), function ( model )
		menu:updateElementState( AirStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.water_staff.visible"
		} )
	end )
	AirStaffContainer:linkToElementModel( AirStaffContainer, "visible", true, function ( model )
		menu:updateElementState( AirStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )
	self:addElement( AirStaffContainer )
	self.AirStaffContainer = AirStaffContainer
	
	local FireStaffContainer = CoD.ElementalStaffContainer.new( menu, controller )
	FireStaffContainer:setLeftRight( true, false, 0, 100 )
	FireStaffContainer:setTopBottom( true, false, 0, 132 )
	FireStaffContainer.ElementalStaffItem.StaffPartL:setRGB( 0.73, 0.31, 0.23 )
	FireStaffContainer.ElementalStaffItem.StaffPartU:setRGB( 0.73, 0.31, 0.23 )
	FireStaffContainer.ElementalStaffItem.StaffPartM:setRGB( 0.73, 0.31, 0.23 )
	FireStaffContainer.ElementalStaffItem.staffPartFg:setRGB( 0.9, 0.38, 0.41 )
	FireStaffContainer.ElementalStaffItem.Record:setRGB( 0.73, 0.31, 0.23 )
	FireStaffContainer.ElementalStaffItem.UpgradedStaff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_fire_outline" ) )
	FireStaffContainer:subscribeToGlobalModel( controller, "ZMTombInventory", "fire_staff", function ( model )
		FireStaffContainer:setModel( model, controller )
	end )
	FireStaffContainer:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return IsAnyInventoryItemVisible3( controller, "air_staff.visible", "lightning_staff.visible", "water_staff.visible" )
			end
		}
	} )
	FireStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( FireStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	FireStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.air_staff.visible" ), function ( model )
		menu:updateElementState( FireStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.air_staff.visible"
		} )
	end )
	FireStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.lightning_staff.visible" ), function ( model )
		menu:updateElementState( FireStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.lightning_staff.visible"
		} )
	end )
	FireStaffContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.water_staff.visible" ), function ( model )
		menu:updateElementState( FireStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.water_staff.visible"
		} )
	end )
	FireStaffContainer:linkToElementModel( FireStaffContainer, "visible", true, function ( model )
		menu:updateElementState( FireStaffContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )
	self:addElement( FireStaffContainer )
	self.FireStaffContainer = FireStaffContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				WaterStaffContainer:completeAnimation()
				self.WaterStaffContainer:setAlpha( 0 )
				self.clipFinished( WaterStaffContainer, {} )
				LightningStaffContainer:completeAnimation()
				self.LightningStaffContainer:setAlpha( 0 )
				self.clipFinished( LightningStaffContainer, {} )
				AirStaffContainer:completeAnimation()
				self.AirStaffContainer:setAlpha( 0 )
				self.clipFinished( AirStaffContainer, {} )
				FireStaffContainer:completeAnimation()
				self.FireStaffContainer:setAlpha( 0 )
				self.clipFinished( FireStaffContainer, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							end
							bg:setLeftRight( true, false, -26, 440 )
							bg:setTopBottom( false, false, -125.73, 126.73 )
							bg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( bg, event )
							else
								bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setLeftRight( true, false, -26, 440 )
				self.bg:setTopBottom( false, false, -125.73, 126.73 )
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )
				WaterStaffContainer:completeAnimation()
				WaterStaffContainer.ElementalStaffItem:completeAnimation()
				self.WaterStaffContainer:setLeftRight( true, false, 298, 398 )
				self.WaterStaffContainer:setTopBottom( true, false, -2, 130 )
				self.WaterStaffContainer:setAlpha( 1 )
				self.WaterStaffContainer.ElementalStaffItem:setScale( 0.75 )
				self.clipFinished( WaterStaffContainer, {} )
				LightningStaffContainer:completeAnimation()
				LightningStaffContainer.ElementalStaffItem:completeAnimation()
				self.LightningStaffContainer:setLeftRight( true, false, 219, 319 )
				self.LightningStaffContainer:setTopBottom( true, false, -2, 130 )
				self.LightningStaffContainer:setAlpha( 1 )
				self.LightningStaffContainer.ElementalStaffItem:setScale( 0.75 )
				self.clipFinished( LightningStaffContainer, {} )
				AirStaffContainer:completeAnimation()
				AirStaffContainer.ElementalStaffItem:completeAnimation()
				self.AirStaffContainer:setLeftRight( true, false, 137, 237 )
				self.AirStaffContainer:setTopBottom( true, false, -2, 130 )
				self.AirStaffContainer:setAlpha( 1 )
				self.AirStaffContainer.ElementalStaffItem:setScale( 0.75 )
				self.clipFinished( AirStaffContainer, {} )
				FireStaffContainer:completeAnimation()
				FireStaffContainer.ElementalStaffItem:completeAnimation()
				self.FireStaffContainer:setLeftRight( true, false, 55, 155 )
				self.FireStaffContainer:setTopBottom( true, false, -2, 130 )
				self.FireStaffContainer:setAlpha( 1 )
				self.FireStaffContainer.ElementalStaffItem:setScale( 0.75 )
				self.clipFinished( FireStaffContainer, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				WaterStaffContainer:completeAnimation()
				WaterStaffContainer.ElementalStaffItem:completeAnimation()
				self.WaterStaffContainer:setLeftRight( true, false, 320, 420 )
				self.WaterStaffContainer:setTopBottom( true, false, 0, 132 )
				self.WaterStaffContainer:setAlpha( 1 )
				self.WaterStaffContainer.ElementalStaffItem:setScale( 1 )
				self.clipFinished( WaterStaffContainer, {} )
				LightningStaffContainer:completeAnimation()
				LightningStaffContainer.ElementalStaffItem:completeAnimation()
				self.LightningStaffContainer:setLeftRight( true, false, 212, 312 )
				self.LightningStaffContainer:setTopBottom( true, false, 0, 132 )
				self.LightningStaffContainer:setAlpha( 1 )
				self.LightningStaffContainer.ElementalStaffItem:setScale( 1 )
				self.clipFinished( LightningStaffContainer, {} )
				AirStaffContainer:completeAnimation()
				AirStaffContainer.ElementalStaffItem:completeAnimation()
				self.AirStaffContainer:setLeftRight( true, false, 106, 206 )
				self.AirStaffContainer:setTopBottom( true, false, 0, 132 )
				self.AirStaffContainer:setAlpha( 1 )
				self.AirStaffContainer.ElementalStaffItem:setScale( 1 )
				self.clipFinished( AirStaffContainer, {} )
				FireStaffContainer:completeAnimation()
				FireStaffContainer.ElementalStaffItem:completeAnimation()
				self.FireStaffContainer:setLeftRight( true, false, 0, 100 )
				self.FireStaffContainer:setTopBottom( true, false, 0, 132 )
				self.FireStaffContainer:setAlpha( 1 )
				self.FireStaffContainer.ElementalStaffItem:setScale( 1 )
				self.clipFinished( FireStaffContainer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsAnyInventoryItemVisible4( controller, "air_staff.visible", "fire_staff.visible", "lightning_staff.visible", "water_staff.visible" )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.air_staff.visible" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.air_staff.visible"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.fire_staff.visible" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.fire_staff.visible"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.lightning_staff.visible" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.lightning_staff.visible"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.water_staff.visible" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.water_staff.visible"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaterStaffContainer:close()
		element.LightningStaffContainer:close()
		element.AirStaffContainer:close()
		element.FireStaffContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

