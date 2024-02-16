-- 433367ee2dc7b30c5ade29c3215d2f3e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackInGame" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.PodControlWidget" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonCollarControllerWidgets_stalingrad" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonShieldWidgets_Stalingrad" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonEggWidget" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeGroup" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.ChallengesCompletedWidgetStalingrad" )

CoD.InventoryWidgetStalingrad = InheritFrom( LUI.UIElement )
CoD.InventoryWidgetStalingrad.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.InventoryWidgetStalingrad )
	self.id = "InventoryWidgetStalingrad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( false, true, -183.01, 0.99 )
	Image0:setImage( RegisterImage( "uie_t7_base_dlc3" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBucket = LUI.UIText.new()
	TextBucket:setLeftRight( false, false, -601.13, -493.63 )
	TextBucket:setTopBottom( false, true, -146.02, -132 )
	TextBucket:setRGB( 0.27, 0.25, 0.23 )
	TextBucket:setText( Engine.Localize( "ZM_STALINGRAD_INVENTORY_SLOT01" ) )
	TextBucket:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextBucket:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBucket:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBucket )
	self.TextBucket = TextBucket
	
	local TextShield = LUI.UIText.new()
	TextShield:setLeftRight( false, false, -356.5, -139 )
	TextShield:setTopBottom( false, true, -146.02, -132 )
	TextShield:setRGB( 0.27, 0.25, 0.23 )
	TextShield:setText( Engine.Localize( "ZM_STALINGRAD_INVENTORY_SLOT02" ) )
	TextShield:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextShield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextShield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextShield )
	self.TextShield = TextShield
	
	local TextMachineTools = LUI.UIText.new()
	TextMachineTools:setLeftRight( false, false, 135.25, 353.75 )
	TextMachineTools:setTopBottom( false, true, -146.02, -132 )
	TextMachineTools:setRGB( 0.27, 0.25, 0.23 )
	TextMachineTools:setText( Engine.Localize( "ZM_STALINGRAD_INVENTORY_SLOT03" ) )
	TextMachineTools:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextMachineTools:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextMachineTools:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextMachineTools )
	self.TextMachineTools = TextMachineTools
	
	local TextSkull = LUI.UIText.new()
	TextSkull:setLeftRight( false, false, 499.25, 605.75 )
	TextSkull:setTopBottom( false, true, -146.02, -132 )
	TextSkull:setRGB( 0.27, 0.25, 0.23 )
	TextSkull:setText( Engine.Localize( "ZM_STALINGRAD_INVENTORY_SLOT04" ) )
	TextSkull:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextSkull:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextSkull:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextSkull )
	self.TextSkull = TextSkull
	
	local BubbleGumPackInGame = CoD.BubbleGumPackInGame.new( menu, controller )
	BubbleGumPackInGame:setLeftRight( false, false, -276, 92 )
	BubbleGumPackInGame:setTopBottom( true, false, 36, 185 )
	self:addElement( BubbleGumPackInGame )
	self.BubbleGumPackInGame = BubbleGumPackInGame
	
	local PodControlWidget = CoD.PodControlWidget.new( menu, controller )
	PodControlWidget:setLeftRight( true, false, -12, 184.84 )
	PodControlWidget:setTopBottom( true, false, 540, 773 )
	PodControlWidget:setScale( 1.4 )
	PodControlWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	PodControlWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( PodControlWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( PodControlWidget )
	self.PodControlWidget = PodControlWidget
	
	local DragonCollarControllerWidgets = CoD.DragonCollarControllerWidgets_stalingrad.new( menu, controller )
	DragonCollarControllerWidgets:setLeftRight( true, false, 659.5, 1106.5 )
	DragonCollarControllerWidgets:setTopBottom( true, false, 591.99, 720.99 )
	DragonCollarControllerWidgets:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DragonCollarControllerWidgets:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( DragonCollarControllerWidgets, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( DragonCollarControllerWidgets )
	self.DragonCollarControllerWidgets = DragonCollarControllerWidgets
	
	local DragonShieldWidgets = CoD.DragonShieldWidgets_Stalingrad.new( menu, controller )
	DragonShieldWidgets:setLeftRight( true, false, 211.84, 596.84 )
	DragonShieldWidgets:setTopBottom( true, false, 589.5, 718.5 )
	DragonShieldWidgets:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DragonShieldWidgets:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( DragonShieldWidgets, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( DragonShieldWidgets )
	self.DragonShieldWidgets = DragonShieldWidgets
	
	local DragonEggWidget = CoD.DragonEggWidget.new( menu, controller )
	DragonEggWidget:setLeftRight( true, false, 1114.96, 1288.04 )
	DragonEggWidget:setTopBottom( true, false, 569.95, 743.03 )
	DragonEggWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	DragonEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( DragonEggWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	DragonEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_egg" ), function ( model )
		menu:updateElementState( DragonEggWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_egg"
		} )
	end )
	self:addElement( DragonEggWidget )
	self.DragonEggWidget = DragonEggWidget
	
	local GameTimeGroup = CoD.GameTimeGroup.new( menu, controller )
	GameTimeGroup:setLeftRight( true, false, 214, 610 )
	GameTimeGroup:setTopBottom( true, false, 35.5, 131.5 )
	GameTimeGroup:setScale( 0.95 )
	GameTimeGroup:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsZombies() and AlwaysFalse()
			end
		},
		{
			stateName = "InventoryScreen",
			condition = function ( menu, element, event )
				return IsZombies() and AlwaysTrue()
			end
		}
	} )
	GameTimeGroup:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( GameTimeGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( GameTimeGroup )
	self.GameTimeGroup = GameTimeGroup
	
	local ChallengesCompletedWidgetStalingrad = CoD.ChallengesCompletedWidgetStalingrad.new( menu, controller )
	ChallengesCompletedWidgetStalingrad:setLeftRight( false, true, -529, -273.37 )
	ChallengesCompletedWidgetStalingrad:setTopBottom( true, false, 39, 190 )
	ChallengesCompletedWidgetStalingrad:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	ChallengesCompletedWidgetStalingrad:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( ChallengesCompletedWidgetStalingrad, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( ChallengesCompletedWidgetStalingrad )
	self.ChallengesCompletedWidgetStalingrad = ChallengesCompletedWidgetStalingrad
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				TextBucket:completeAnimation()
				self.TextBucket:setAlpha( 0 )
				self.clipFinished( TextBucket, {} )

				TextShield:completeAnimation()
				self.TextShield:setAlpha( 0 )
				self.clipFinished( TextShield, {} )

				TextMachineTools:completeAnimation()
				self.TextMachineTools:setAlpha( 0 )
				self.clipFinished( TextMachineTools, {} )

				TextSkull:completeAnimation()
				self.TextSkull:setAlpha( 0 )
				self.clipFinished( TextSkull, {} )

				BubbleGumPackInGame:completeAnimation()
				self.BubbleGumPackInGame:setAlpha( 1 )
				self.clipFinished( BubbleGumPackInGame, {} )

				PodControlWidget:completeAnimation()
				self.PodControlWidget:setAlpha( 0 )
				self.clipFinished( PodControlWidget, {} )

				DragonCollarControllerWidgets:completeAnimation()
				self.DragonCollarControllerWidgets:setAlpha( 0 )
				self.clipFinished( DragonCollarControllerWidgets, {} )

				DragonShieldWidgets:completeAnimation()
				self.DragonShieldWidgets:setAlpha( 0 )
				self.clipFinished( DragonShieldWidgets, {} )

				DragonEggWidget:completeAnimation()
				self.DragonEggWidget:setAlpha( 0 )
				self.clipFinished( DragonEggWidget, {} )

				GameTimeGroup:completeAnimation()
				self.GameTimeGroup:setAlpha( 0 )
				self.clipFinished( GameTimeGroup, {} )

				ChallengesCompletedWidgetStalingrad:completeAnimation()
				self.ChallengesCompletedWidgetStalingrad:setAlpha( 0 )
				self.clipFinished( ChallengesCompletedWidgetStalingrad, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				TextBucket:completeAnimation()
				self.TextBucket:setAlpha( 1 )
				self.clipFinished( TextBucket, {} )

				TextShield:completeAnimation()
				self.TextShield:setAlpha( 1 )
				self.clipFinished( TextShield, {} )

				TextMachineTools:completeAnimation()
				self.TextMachineTools:setAlpha( 1 )
				self.clipFinished( TextMachineTools, {} )

				TextSkull:completeAnimation()
				self.TextSkull:setAlpha( 1 )
				self.clipFinished( TextSkull, {} )

				BubbleGumPackInGame:completeAnimation()
				self.BubbleGumPackInGame:setAlpha( 1 )
				self.clipFinished( BubbleGumPackInGame, {} )

				PodControlWidget:completeAnimation()
				self.PodControlWidget:setAlpha( 1 )
				self.clipFinished( PodControlWidget, {} )

				DragonCollarControllerWidgets:completeAnimation()
				self.DragonCollarControllerWidgets:setAlpha( 1 )
				self.clipFinished( DragonCollarControllerWidgets, {} )

				DragonShieldWidgets:completeAnimation()
				self.DragonShieldWidgets:setAlpha( 1 )
				self.clipFinished( DragonShieldWidgets, {} )

				DragonEggWidget:completeAnimation()
				self.DragonEggWidget:setAlpha( 1 )
				self.clipFinished( DragonEggWidget, {} )

				GameTimeGroup:completeAnimation()
				self.GameTimeGroup:setAlpha( 1 )
				self.clipFinished( GameTimeGroup, {} )

				ChallengesCompletedWidgetStalingrad:completeAnimation()
				self.ChallengesCompletedWidgetStalingrad:setAlpha( 1 )
				self.clipFinished( ChallengesCompletedWidgetStalingrad, {} )
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
		element.PodControlWidget:close()
		element.DragonCollarControllerWidgets:close()
		element.DragonShieldWidgets:close()
		element.DragonEggWidget:close()
		element.GameTimeGroup:close()
		element.ChallengesCompletedWidgetStalingrad:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
