require( "ui.uieditor.widgets.ZMInventoryCastle.RocketShieldBlueprintWidget_Castle" )
require( "ui.uieditor.widgets.ZMInventoryCastle.FuseBoxWidget_Castle" )
require( "ui.uieditor.widgets.ZMInventoryCastle.RagnarokBlueprintWidget_Castle" )
require( "ui.uieditor.widgets.ZMInventoryCastle.ElementalArrowsWidget" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackInGame" )

CoD.InventoryWidgetFactory = InheritFrom( LUI.UIElement )
CoD.InventoryWidgetFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InventoryWidgetFactory )
	self.id = "InventoryWidgetFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, -1, -1 )
	Image0:setTopBottom( false, true, -181, 3 )
	Image0:setImage( RegisterImage( "uie_t7_base_dlc" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local RocketShield = CoD.RocketShieldBlueprintWidget_Castle.new( menu, controller )
	RocketShield:setLeftRight( true, false, 145.37, 459.37 )
	RocketShield:setTopBottom( true, false, 592, 721 )
	RocketShield:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	RocketShield:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RocketShield, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( RocketShield )
	self.RocketShield = RocketShield
	
	local FuseBoxWidget = CoD.FuseBoxWidget_Castle.new( menu, controller )
	FuseBoxWidget:setLeftRight( true, false, 39.62, 105.62 )
	FuseBoxWidget:setTopBottom( true, false, 577.98, 706.98 )
	FuseBoxWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	FuseBoxWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( FuseBoxWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( FuseBoxWidget )
	self.FuseBoxWidget = FuseBoxWidget
	
	local TramFuse = LUI.UIText.new()
	TramFuse:setLeftRight( false, false, -614.13, -516.63 )
	TramFuse:setTopBottom( false, true, -144.02, -130 )
	TramFuse:setRGB( 0.27, 0.25, 0.23 )
	TramFuse:setText( Engine.Localize( "ZM_CASTLE_TRAM_TOKEN_POWERUP" ) )
	TramFuse:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TramFuse:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TramFuse:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TramFuse )
	self.TramFuse = TramFuse
	
	local RocketSHield = LUI.UIText.new()
	RocketSHield:setLeftRight( false, false, -414.13, -241.63 )
	RocketSHield:setTopBottom( false, true, -144.02, -130 )
	RocketSHield:setRGB( 0.27, 0.25, 0.23 )
	RocketSHield:setText( Engine.Localize( "ZMWEAPON_ROCKETSHIELD" ) )
	RocketSHield:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	RocketSHield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RocketSHield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RocketSHield )
	self.RocketSHield = RocketSHield
	
	local Ragnarok = LUI.UIText.new()
	Ragnarok:setLeftRight( false, false, -71.13, 101.37 )
	Ragnarok:setTopBottom( false, true, -144.02, -130 )
	Ragnarok:setRGB( 0.27, 0.25, 0.23 )
	Ragnarok:setText( Engine.Localize( "WEAPON_ZM_GRAVITY_SPIKES" ) )
	Ragnarok:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Ragnarok:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Ragnarok:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Ragnarok )
	self.Ragnarok = Ragnarok
	
	local WrathOfTheAncients = LUI.UIText.new()
	WrathOfTheAncients:setLeftRight( false, false, 325.87, 498.37 )
	WrathOfTheAncients:setTopBottom( false, true, -144.02, -130 )
	WrathOfTheAncients:setRGB( 0.27, 0.25, 0.23 )
	WrathOfTheAncients:setText( Engine.Localize( "ZM_CASTLE_BOW_BASE" ) )
	WrathOfTheAncients:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	WrathOfTheAncients:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WrathOfTheAncients:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WrathOfTheAncients )
	self.WrathOfTheAncients = WrathOfTheAncients
	
	local RagnarokBlueprintWidgetCastle = CoD.RagnarokBlueprintWidget_Castle.new( menu, controller )
	RagnarokBlueprintWidgetCastle:setLeftRight( true, false, 479.37, 793.37 )
	RagnarokBlueprintWidgetCastle:setTopBottom( true, false, 592, 721 )
	RagnarokBlueprintWidgetCastle:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowGravitySpikePartsWidget( controller ) and AlwaysFalse()
			end
		}
	} )
	RagnarokBlueprintWidgetCastle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gravityspike_parts" ), function ( model )
		menu:updateElementState( RagnarokBlueprintWidgetCastle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gravityspike_parts"
		} )
	end )
	RagnarokBlueprintWidgetCastle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RagnarokBlueprintWidgetCastle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( RagnarokBlueprintWidgetCastle )
	self.RagnarokBlueprintWidgetCastle = RagnarokBlueprintWidgetCastle
	
	local ElementalArrowsWidget = CoD.ElementalArrowsWidget.new( menu, controller )
	ElementalArrowsWidget:setLeftRight( true, false, 846, 1162 )
	ElementalArrowsWidget:setTopBottom( true, false, 596, 715 )
	self:addElement( ElementalArrowsWidget )
	self.ElementalArrowsWidget = ElementalArrowsWidget
	
	local BubbleGumPackInGame = CoD.BubbleGumPackInGame.new( menu, controller )
	BubbleGumPackInGame:setLeftRight( false, false, -184, 184 )
	BubbleGumPackInGame:setTopBottom( true, false, 36, 185 )
	self:addElement( BubbleGumPackInGame )
	self.BubbleGumPackInGame = BubbleGumPackInGame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				RocketShield:completeAnimation()
				self.RocketShield:setLeftRight( true, false, 163.37, 477.37 )
				self.RocketShield:setTopBottom( true, false, 591, 720 )
				self.RocketShield:setAlpha( 0 )
				self.clipFinished( RocketShield, {} )
				FuseBoxWidget:completeAnimation()
				self.FuseBoxWidget:setAlpha( 0 )
				self.clipFinished( FuseBoxWidget, {} )
				TramFuse:completeAnimation()
				self.TramFuse:setAlpha( 0 )
				self.clipFinished( TramFuse, {} )
				RocketSHield:completeAnimation()
				self.RocketSHield:setAlpha( 0 )
				self.clipFinished( RocketSHield, {} )
				Ragnarok:completeAnimation()
				self.Ragnarok:setAlpha( 0 )
				self.clipFinished( Ragnarok, {} )
				WrathOfTheAncients:completeAnimation()
				self.WrathOfTheAncients:setAlpha( 0 )
				self.clipFinished( WrathOfTheAncients, {} )
				RagnarokBlueprintWidgetCastle:completeAnimation()
				self.RagnarokBlueprintWidgetCastle:setAlpha( 0 )
				self.clipFinished( RagnarokBlueprintWidgetCastle, {} )
				ElementalArrowsWidget:completeAnimation()
				self.ElementalArrowsWidget:setAlpha( 0 )
				self.clipFinished( ElementalArrowsWidget, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				RocketShield:completeAnimation()
				self.RocketShield:setAlpha( 1 )
				self.clipFinished( RocketShield, {} )
				FuseBoxWidget:completeAnimation()
				self.FuseBoxWidget:setAlpha( 1 )
				self.clipFinished( FuseBoxWidget, {} )
				TramFuse:completeAnimation()
				self.TramFuse:setAlpha( 1 )
				self.clipFinished( TramFuse, {} )
				RocketSHield:completeAnimation()
				self.RocketSHield:setAlpha( 1 )
				self.clipFinished( RocketSHield, {} )
				Ragnarok:completeAnimation()
				self.Ragnarok:setAlpha( 1 )
				self.clipFinished( Ragnarok, {} )
				WrathOfTheAncients:completeAnimation()
				self.WrathOfTheAncients:setAlpha( 1 )
				self.clipFinished( WrathOfTheAncients, {} )
				RagnarokBlueprintWidgetCastle:completeAnimation()
				self.RagnarokBlueprintWidgetCastle:setAlpha( 1 )
				self.clipFinished( RagnarokBlueprintWidgetCastle, {} )
				ElementalArrowsWidget:completeAnimation()
				self.ElementalArrowsWidget:setAlpha( 1 )
				self.clipFinished( ElementalArrowsWidget, {} )
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
		element.RocketShield:close()
		element.FuseBoxWidget:close()
		element.RagnarokBlueprintWidgetCastle:close()
		element.ElementalArrowsWidget:close()
		element.BubbleGumPackInGame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

