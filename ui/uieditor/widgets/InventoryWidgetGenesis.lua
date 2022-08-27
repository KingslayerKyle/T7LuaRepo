-- 5bf416930a7fc09f9820addcaf8d9d30
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryGenesis.InventoryTextBox_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.ApothiconGatewormScoreboardBackground_Genesis" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackInGame" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.ApothiconGatewormWidget_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.KeeperProtectorWidgets_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.RocketShieldWidget_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryGenesis.RunesOfCreationWidget_Genesis" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeGroup" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.ChallengesCompletedWidgetStalingrad" )

CoD.InventoryWidgetGenesis = InheritFrom( LUI.UIElement )
CoD.InventoryWidgetGenesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InventoryWidgetGenesis )
	self.id = "InventoryWidgetGenesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Base = LUI.UIImage.new()
	Base:setLeftRight( true, true, 0, 0 )
	Base:setTopBottom( false, true, -184, 0 )
	Base:setImage( RegisterImage( "uie_t7_base_dlc4" ) )
	self:addElement( Base )
	self.Base = Base
	
	local RunesTitle = CoD.InventoryTextBox_Genesis.new( menu, controller )
	RunesTitle:setLeftRight( false, false, 349.87, 456.87 )
	RunesTitle:setTopBottom( false, true, -147, -133 )
	RunesTitle.TextKeeper:setText( Engine.Localize( "ZM_GENESIS_RUNESOFCREATION" ) )
	RunesTitle:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsAnyInventoryItemVisible4( controller, "gen_rune_electricity", "gen_rune_fire", "gen_rune_light", "gen_rune_shadow" )
			end
		}
	} )
	RunesTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RunesTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RunesTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_electricity" ), function ( model )
		menu:updateElementState( RunesTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_electricity"
		} )
	end )
	RunesTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_fire" ), function ( model )
		menu:updateElementState( RunesTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_fire"
		} )
	end )
	RunesTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_light" ), function ( model )
		menu:updateElementState( RunesTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_light"
		} )
	end )
	RunesTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.gen_rune_shadow" ), function ( model )
		menu:updateElementState( RunesTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.gen_rune_shadow"
		} )
	end )
	self:addElement( RunesTitle )
	self.RunesTitle = RunesTitle
	
	local ShieldTitle = CoD.InventoryTextBox_Genesis.new( menu, controller )
	ShieldTitle:setLeftRight( false, false, -170.88, -63.88 )
	ShieldTitle:setTopBottom( false, true, -147.02, -133.02 )
	ShieldTitle.TextKeeper:setText( Engine.Localize( "ZM_GENESIS_DRAGON_SHIELD" ) )
	ShieldTitle:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsAnyInventoryItemVisible3( controller, "piece_riotshield_dolly", "piece_riotshield_door", "piece_riotshield_clamp" )
			end
		}
	} )
	ShieldTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( ShieldTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ShieldTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_dolly" ), function ( model )
		menu:updateElementState( ShieldTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_dolly"
		} )
	end )
	ShieldTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_door" ), function ( model )
		menu:updateElementState( ShieldTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_door"
		} )
	end )
	ShieldTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_riotshield_clamp" ), function ( model )
		menu:updateElementState( ShieldTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_riotshield_clamp"
		} )
	end )
	self:addElement( ShieldTitle )
	self.ShieldTitle = ShieldTitle
	
	local KeeperTitle = CoD.InventoryTextBox_Genesis.new( menu, controller )
	KeeperTitle:setLeftRight( false, false, -513.13, -406.13 )
	KeeperTitle:setTopBottom( false, true, -147, -133 )
	KeeperTitle.TextKeeper:setText( Engine.Localize( "ZM_GENESIS_ROBOT_NAME" ) )
	KeeperTitle:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsAnyInventoryItemVisible3( controller, "keeper_callbox_head", "keeper_callbox_totem", "keeper_callbox_gem" )
			end
		}
	} )
	KeeperTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( KeeperTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	KeeperTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.keeper_callbox_head" ), function ( model )
		menu:updateElementState( KeeperTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.keeper_callbox_head"
		} )
	end )
	KeeperTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.keeper_callbox_totem" ), function ( model )
		menu:updateElementState( KeeperTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.keeper_callbox_totem"
		} )
	end )
	KeeperTitle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.keeper_callbox_gem" ), function ( model )
		menu:updateElementState( KeeperTitle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.keeper_callbox_gem"
		} )
	end )
	self:addElement( KeeperTitle )
	self.KeeperTitle = KeeperTitle
	
	local ApothiconEggOrGatewormTextAndImage = CoD.ApothiconGatewormScoreboardBackground_Genesis.new( menu, controller )
	ApothiconEggOrGatewormTextAndImage:setLeftRight( true, false, 705.87, 813.37 )
	ApothiconEggOrGatewormTextAndImage:setTopBottom( true, false, 572.98, 707.5 )
	self:addElement( ApothiconEggOrGatewormTextAndImage )
	self.ApothiconEggOrGatewormTextAndImage = ApothiconEggOrGatewormTextAndImage
	
	local BubbleGumPackInGame = CoD.BubbleGumPackInGame.new( menu, controller )
	BubbleGumPackInGame:setLeftRight( false, false, -184, 184 )
	BubbleGumPackInGame:setTopBottom( true, false, 36, 185 )
	self:addElement( BubbleGumPackInGame )
	self.BubbleGumPackInGame = BubbleGumPackInGame
	
	local ApothiconGatewormWidget = CoD.ApothiconGatewormWidget_Genesis.new( menu, controller )
	ApothiconGatewormWidget:setLeftRight( true, false, 672.12, 845.12 )
	ApothiconGatewormWidget:setTopBottom( true, false, 570, 743 )
	self:addElement( ApothiconGatewormWidget )
	self.ApothiconGatewormWidget = ApothiconGatewormWidget
	
	local KeeperProtectorWidgetsGenesis = CoD.KeeperProtectorWidgets_Genesis.new( menu, controller )
	KeeperProtectorWidgetsGenesis:setLeftRight( true, false, 16.62, 330.62 )
	KeeperProtectorWidgetsGenesis:setTopBottom( true, false, 586, 715 )
	self:addElement( KeeperProtectorWidgetsGenesis )
	self.KeeperProtectorWidgetsGenesis = KeeperProtectorWidgetsGenesis
	
	local RocketShieldWidgetGenesis = CoD.RocketShieldWidget_Genesis.new( menu, controller )
	RocketShieldWidgetGenesis:setLeftRight( true, false, 366.62, 680.62 )
	RocketShieldWidgetGenesis:setTopBottom( true, false, 584, 713 )
	self:addElement( RocketShieldWidgetGenesis )
	self.RocketShieldWidgetGenesis = RocketShieldWidgetGenesis
	
	local RunesOfCreationWidgetGenesis = CoD.RunesOfCreationWidget_Genesis.new( menu, controller )
	RunesOfCreationWidgetGenesis:setLeftRight( true, false, 850, 1258 )
	RunesOfCreationWidgetGenesis:setTopBottom( true, false, 592, 721 )
	self:addElement( RunesOfCreationWidgetGenesis )
	self.RunesOfCreationWidgetGenesis = RunesOfCreationWidgetGenesis
	
	local GameTimeGroup = CoD.GameTimeGroup.new( menu, controller )
	GameTimeGroup:setLeftRight( false, false, 184, 580 )
	GameTimeGroup:setTopBottom( true, false, 35, 131 )
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
				return AlwaysTrue()
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
	ChallengesCompletedWidgetStalingrad:setLeftRight( false, false, -454.38, -198.74 )
	ChallengesCompletedWidgetStalingrad:setTopBottom( true, false, 39, 190 )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget1.IconOutline:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_01_outline" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget1.RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_01_new" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget1.RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_01" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget2.IconOutline:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_02_outline" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget2.RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_02_new" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget2.RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_02" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget3.IconOutline:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_03_outline" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget3.RewardUnclaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_03_new" ) )
	ChallengesCompletedWidgetStalingrad.ChallengeStateWidget3.RewardClaimedImage:setImage( RegisterImage( "uie_t7_icon_dlc4_challenge_medals_03" ) )
	ChallengesCompletedWidgetStalingrad.Title:setText( Engine.Localize( "ZM_GENESIS_TRIALS_COMPLETED" ) )
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
				self:setupElementClipCounter( 7 )
				Base:completeAnimation()
				self.Base:setAlpha( 0 )
				self.clipFinished( Base, {} )
				ApothiconEggOrGatewormTextAndImage:completeAnimation()
				self.ApothiconEggOrGatewormTextAndImage:setAlpha( 0 )
				self.clipFinished( ApothiconEggOrGatewormTextAndImage, {} )
				ApothiconGatewormWidget:completeAnimation()
				self.ApothiconGatewormWidget:setAlpha( 0 )
				self.clipFinished( ApothiconGatewormWidget, {} )
				KeeperProtectorWidgetsGenesis:completeAnimation()
				self.KeeperProtectorWidgetsGenesis:setAlpha( 0 )
				self.clipFinished( KeeperProtectorWidgetsGenesis, {} )
				RocketShieldWidgetGenesis:completeAnimation()
				self.RocketShieldWidgetGenesis:setAlpha( 0 )
				self.clipFinished( RocketShieldWidgetGenesis, {} )
				RunesOfCreationWidgetGenesis:completeAnimation()
				self.RunesOfCreationWidgetGenesis:setAlpha( 0 )
				self.clipFinished( RunesOfCreationWidgetGenesis, {} )
				GameTimeGroup:completeAnimation()
				self.GameTimeGroup:setAlpha( 0 )
				self.clipFinished( GameTimeGroup, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Base:completeAnimation()
				self.Base:setAlpha( 1 )
				self.clipFinished( Base, {} )
				ApothiconEggOrGatewormTextAndImage:completeAnimation()
				self.ApothiconEggOrGatewormTextAndImage:setAlpha( 1 )
				self.clipFinished( ApothiconEggOrGatewormTextAndImage, {} )
				ApothiconGatewormWidget:completeAnimation()
				self.ApothiconGatewormWidget:setAlpha( 1 )
				self.clipFinished( ApothiconGatewormWidget, {} )
				KeeperProtectorWidgetsGenesis:completeAnimation()
				self.KeeperProtectorWidgetsGenesis:setAlpha( 1 )
				self.clipFinished( KeeperProtectorWidgetsGenesis, {} )
				RocketShieldWidgetGenesis:completeAnimation()
				self.RocketShieldWidgetGenesis:setAlpha( 1 )
				self.clipFinished( RocketShieldWidgetGenesis, {} )
				RunesOfCreationWidgetGenesis:completeAnimation()
				self.RunesOfCreationWidgetGenesis:setAlpha( 1 )
				self.clipFinished( RunesOfCreationWidgetGenesis, {} )
				GameTimeGroup:completeAnimation()
				self.GameTimeGroup:setAlpha( 1 )
				self.clipFinished( GameTimeGroup, {} )
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
		element.RunesTitle:close()
		element.ShieldTitle:close()
		element.KeeperTitle:close()
		element.ApothiconEggOrGatewormTextAndImage:close()
		element.BubbleGumPackInGame:close()
		element.ApothiconGatewormWidget:close()
		element.KeeperProtectorWidgetsGenesis:close()
		element.RocketShieldWidgetGenesis:close()
		element.RunesOfCreationWidgetGenesis:close()
		element.GameTimeGroup:close()
		element.ChallengesCompletedWidgetStalingrad:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

