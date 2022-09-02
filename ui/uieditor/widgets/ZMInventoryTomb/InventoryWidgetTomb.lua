-- 4547a824913dd53c28e97c9b02ab6fb9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackInGame" )
require( "ui.uieditor.widgets.ZMInventoryTomb.ElementalStaffsWidget" )
require( "ui.uieditor.widgets.ZMInventoryTomb.RocketShieldWidget_Tomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.MaxisDroneBlueprintWidget_Tomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.CaptureGeneratorWheelWidget_Tomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.MusicalPartsWidget_Tomb" )
require( "ui.uieditor.widgets.ZMInventoryTomb.ChallengesCompletedWidgetTomb" )

CoD.InventoryWidgetTomb = InheritFrom( LUI.UIElement )
CoD.InventoryWidgetTomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.InventoryWidgetTomb )
	self.id = "InventoryWidgetTomb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( false, true, -181, 3 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_inventory_base" ) )
	self:addElement( bg )
	self.bg = bg
	
	local BubbleGumPackInGame = CoD.BubbleGumPackInGame.new( menu, controller )
	BubbleGumPackInGame:setLeftRight( false, false, -5, 363 )
	BubbleGumPackInGame:setTopBottom( true, false, 36, 185 )
	self:addElement( BubbleGumPackInGame )
	self.BubbleGumPackInGame = BubbleGumPackInGame
	
	local ElementalStaffsWidget = CoD.ElementalStaffsWidget.new( menu, controller )
	ElementalStaffsWidget:setLeftRight( true, false, 217, 623 )
	ElementalStaffsWidget:setTopBottom( false, false, 234, 366 )
	ElementalStaffsWidget:setScale( 0.68 )
	ElementalStaffsWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsAnyInventoryItemVisible4( controller, "air_staff.visible", "fire_staff.visible", "lightning_staff.visible", "water_staff.visible" ) and AlwaysFalse()
			end
		}
	} )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.air_staff.visible" ), function ( model )
		menu:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.air_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.fire_staff.visible" ), function ( model )
		menu:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.fire_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.lightning_staff.visible" ), function ( model )
		menu:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.lightning_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.water_staff.visible" ), function ( model )
		menu:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.water_staff.visible"
		} )
	end )
	ElementalStaffsWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( ElementalStaffsWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( ElementalStaffsWidget )
	self.ElementalStaffsWidget = ElementalStaffsWidget
	
	local RocketShieldWidgetTomb = CoD.RocketShieldWidget_Tomb.new( menu, controller )
	RocketShieldWidgetTomb:setLeftRight( true, false, 824, 1138 )
	RocketShieldWidgetTomb:setTopBottom( true, false, 592, 721 )
	RocketShieldWidgetTomb:setScale( 0.8 )
	self:addElement( RocketShieldWidgetTomb )
	self.RocketShieldWidgetTomb = RocketShieldWidgetTomb
	
	local MaxisDroneBlueprintWidgetTomb = CoD.MaxisDroneBlueprintWidget_Tomb.new( menu, controller )
	MaxisDroneBlueprintWidgetTomb:setLeftRight( true, false, 569.36, 883.36 )
	MaxisDroneBlueprintWidgetTomb:setTopBottom( true, false, 593.5, 722.5 )
	MaxisDroneBlueprintWidgetTomb:setScale( 0.85 )
	self:addElement( MaxisDroneBlueprintWidgetTomb )
	self.MaxisDroneBlueprintWidgetTomb = MaxisDroneBlueprintWidgetTomb
	
	local CaptureGeneratorWheelWidgetTomb = CoD.CaptureGeneratorWheelWidget_Tomb.new( menu, controller )
	CaptureGeneratorWheelWidgetTomb:setLeftRight( false, false, 430.36, 686.36 )
	CaptureGeneratorWheelWidgetTomb:setTopBottom( false, false, 168.5, 424.5 )
	CaptureGeneratorWheelWidgetTomb:setScale( 0.53 )
	CaptureGeneratorWheelWidgetTomb:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		SetElementProperty( element, "scoreboard_widget", true )
		SetElementStateWithNoTransitionClip( self, element, controller, "Visible" )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	CaptureGeneratorWheelWidgetTomb:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( CaptureGeneratorWheelWidgetTomb )
	self.CaptureGeneratorWheelWidgetTomb = CaptureGeneratorWheelWidgetTomb
	
	local MusicalPartsWidgetTomb = CoD.MusicalPartsWidget_Tomb.new( menu, controller )
	MusicalPartsWidgetTomb:setLeftRight( true, false, -16.5, 297.5 )
	MusicalPartsWidgetTomb:setTopBottom( true, false, 594.5, 723.5 )
	MusicalPartsWidgetTomb:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	MusicalPartsWidgetTomb:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( MusicalPartsWidgetTomb, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( MusicalPartsWidgetTomb )
	self.MusicalPartsWidgetTomb = MusicalPartsWidgetTomb
	
	local MusicalPartsText = LUI.UIText.new()
	MusicalPartsText:setLeftRight( true, false, 43.54, 243.54 )
	MusicalPartsText:setTopBottom( true, false, 574.5, 590.5 )
	MusicalPartsText:setRGB( 0.27, 0.25, 0.23 )
	MusicalPartsText:setText( Engine.Localize( "ZM_TOMB_EQUIPMENT" ) )
	MusicalPartsText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	MusicalPartsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MusicalPartsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MusicalPartsText )
	self.MusicalPartsText = MusicalPartsText
	
	local StaffPartsText = LUI.UIText.new()
	StaffPartsText:setLeftRight( true, false, 320, 520 )
	StaffPartsText:setTopBottom( true, false, 574.5, 590.5 )
	StaffPartsText:setRGB( 0.27, 0.25, 0.23 )
	StaffPartsText:setText( Engine.Localize( "ZM_TOMB_STAFF_PARTS" ) )
	StaffPartsText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	StaffPartsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StaffPartsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StaffPartsText )
	self.StaffPartsText = StaffPartsText
	
	local MaxisDroneText = LUI.UIText.new()
	MaxisDroneText:setLeftRight( true, false, 620, 820 )
	MaxisDroneText:setTopBottom( true, false, 574.5, 590.5 )
	MaxisDroneText:setRGB( 0.27, 0.25, 0.23 )
	MaxisDroneText:setText( Engine.Localize( "ZM_TOMB_QUADROTOR" ) )
	MaxisDroneText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	MaxisDroneText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MaxisDroneText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MaxisDroneText )
	self.MaxisDroneText = MaxisDroneText
	
	local ZombieShieldText = LUI.UIText.new()
	ZombieShieldText:setLeftRight( true, false, 882, 1082 )
	ZombieShieldText:setTopBottom( true, false, 574.5, 590.5 )
	ZombieShieldText:setRGB( 0.27, 0.25, 0.23 )
	ZombieShieldText:setText( Engine.Localize( "ZM_TOMB_ZOMBIE_SHIELD" ) )
	ZombieShieldText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ZombieShieldText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ZombieShieldText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ZombieShieldText )
	self.ZombieShieldText = ZombieShieldText
	
	local CapturesText = LUI.UIText.new()
	CapturesText:setLeftRight( true, false, 1098.36, 1298.36 )
	CapturesText:setTopBottom( true, false, 574.5, 590.5 )
	CapturesText:setRGB( 0.27, 0.25, 0.23 )
	CapturesText:setText( Engine.Localize( "MPUI_CAPTURES" ) )
	CapturesText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	CapturesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CapturesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CapturesText )
	self.CapturesText = CapturesText
	
	local ChallengesCompletedWidgetTomb = CoD.ChallengesCompletedWidgetTomb.new( menu, controller )
	ChallengesCompletedWidgetTomb:setLeftRight( false, false, -364, -19 )
	ChallengesCompletedWidgetTomb:setTopBottom( true, false, 41, 185 )
	ChallengesCompletedWidgetTomb.Title:setText( Engine.Localize( "ZM_TOMB_RITUALS_OF_THE_ANCIENTS" ) )
	ChallengesCompletedWidgetTomb:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ChallengesCompletedWidgetTomb )
	self.ChallengesCompletedWidgetTomb = ChallengesCompletedWidgetTomb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				BubbleGumPackInGame:completeAnimation()
				self.BubbleGumPackInGame:setAlpha( 0 )
				self.clipFinished( BubbleGumPackInGame, {} )

				ElementalStaffsWidget:completeAnimation()
				self.ElementalStaffsWidget:setAlpha( 0 )
				self.clipFinished( ElementalStaffsWidget, {} )

				RocketShieldWidgetTomb:completeAnimation()
				self.RocketShieldWidgetTomb:setAlpha( 0 )
				self.clipFinished( RocketShieldWidgetTomb, {} )

				MaxisDroneBlueprintWidgetTomb:completeAnimation()
				self.MaxisDroneBlueprintWidgetTomb:setAlpha( 0 )
				self.clipFinished( MaxisDroneBlueprintWidgetTomb, {} )

				CaptureGeneratorWheelWidgetTomb:completeAnimation()
				self.CaptureGeneratorWheelWidgetTomb:setAlpha( 0 )
				self.clipFinished( CaptureGeneratorWheelWidgetTomb, {} )

				MusicalPartsWidgetTomb:completeAnimation()
				self.MusicalPartsWidgetTomb:setAlpha( 0 )
				self.clipFinished( MusicalPartsWidgetTomb, {} )

				MusicalPartsText:completeAnimation()
				self.MusicalPartsText:setAlpha( 0 )
				self.clipFinished( MusicalPartsText, {} )

				StaffPartsText:completeAnimation()
				self.StaffPartsText:setAlpha( 0 )
				self.clipFinished( StaffPartsText, {} )

				MaxisDroneText:completeAnimation()
				self.MaxisDroneText:setAlpha( 0 )
				self.clipFinished( MaxisDroneText, {} )

				ZombieShieldText:completeAnimation()
				self.ZombieShieldText:setAlpha( 0 )
				self.clipFinished( ZombieShieldText, {} )

				CapturesText:completeAnimation()
				self.CapturesText:setAlpha( 0 )
				self.clipFinished( CapturesText, {} )

				ChallengesCompletedWidgetTomb:completeAnimation()
				self.ChallengesCompletedWidgetTomb:setAlpha( 0 )
				self.clipFinished( ChallengesCompletedWidgetTomb, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				BubbleGumPackInGame:completeAnimation()
				self.BubbleGumPackInGame:setAlpha( 1 )
				self.clipFinished( BubbleGumPackInGame, {} )

				ElementalStaffsWidget:completeAnimation()
				self.ElementalStaffsWidget:setAlpha( 1 )
				self.clipFinished( ElementalStaffsWidget, {} )

				RocketShieldWidgetTomb:completeAnimation()
				self.RocketShieldWidgetTomb:setAlpha( 1 )
				self.clipFinished( RocketShieldWidgetTomb, {} )

				MaxisDroneBlueprintWidgetTomb:completeAnimation()
				self.MaxisDroneBlueprintWidgetTomb:setAlpha( 1 )
				self.clipFinished( MaxisDroneBlueprintWidgetTomb, {} )

				CaptureGeneratorWheelWidgetTomb:completeAnimation()
				self.CaptureGeneratorWheelWidgetTomb:setAlpha( 1 )
				self.clipFinished( CaptureGeneratorWheelWidgetTomb, {} )

				MusicalPartsWidgetTomb:completeAnimation()
				self.MusicalPartsWidgetTomb:setAlpha( 1 )
				self.clipFinished( MusicalPartsWidgetTomb, {} )

				MusicalPartsText:completeAnimation()
				self.MusicalPartsText:setAlpha( 1 )
				self.clipFinished( MusicalPartsText, {} )

				StaffPartsText:completeAnimation()
				self.StaffPartsText:setAlpha( 1 )
				self.clipFinished( StaffPartsText, {} )

				MaxisDroneText:completeAnimation()
				self.MaxisDroneText:setAlpha( 1 )
				self.clipFinished( MaxisDroneText, {} )

				ZombieShieldText:completeAnimation()
				self.ZombieShieldText:setAlpha( 1 )
				self.clipFinished( ZombieShieldText, {} )

				CapturesText:completeAnimation()
				self.CapturesText:setAlpha( 1 )
				self.clipFinished( CapturesText, {} )

				ChallengesCompletedWidgetTomb:completeAnimation()
				self.ChallengesCompletedWidgetTomb:setAlpha( 1 )
				self.clipFinished( ChallengesCompletedWidgetTomb, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumPackInGame:close()
		element.ElementalStaffsWidget:close()
		element.RocketShieldWidgetTomb:close()
		element.MaxisDroneBlueprintWidgetTomb:close()
		element.CaptureGeneratorWheelWidgetTomb:close()
		element.MusicalPartsWidgetTomb:close()
		element.ChallengesCompletedWidgetTomb:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

