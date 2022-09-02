-- 190f4654a9a1b638e5ad1212bf7d1acc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryIsland.RocketShieldBlueprintWidget_Island" )
require( "ui.uieditor.widgets.ZMInventoryIsland.GasMaskBlueprintWidget_Island" )
require( "ui.uieditor.widgets.ZMInventoryIsland.MachineToolsBlueprintWidget_Island" )
require( "ui.uieditor.widgets.ZMInventoryIsland.WonderWeaponBlueprintWidget_Island" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackInGame" )
require( "ui.uieditor.widgets.ZMInventoryIsland.BucketAndSeedWidget" )
require( "ui.uieditor.widgets.ZMInventoryIsland.IslandSkullWidget" )

CoD.InventoryWidgetIsland = InheritFrom( LUI.UIElement )
CoD.InventoryWidgetIsland.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.InventoryWidgetIsland )
	self.id = "InventoryWidgetIsland"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( false, true, -183.01, 0.99 )
	Image0:setImage( RegisterImage( "uie_t7_base_dlc2" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local RocketShield = CoD.RocketShieldBlueprintWidget_Island.new( menu, controller )
	RocketShield:setLeftRight( true, false, 135.51, 449.51 )
	RocketShield:setTopBottom( true, false, 591, 720 )
	self:addElement( RocketShield )
	self.RocketShield = RocketShield
	
	local GasMask = CoD.GasMaskBlueprintWidget_Island.new( menu, controller )
	GasMask:setLeftRight( true, false, 388, 702 )
	GasMask:setTopBottom( true, false, 588, 717 )
	self:addElement( GasMask )
	self.GasMask = GasMask
	
	local MachineTools = CoD.MachineToolsBlueprintWidget_Island.new( menu, controller )
	MachineTools:setLeftRight( true, false, 643.87, 957.87 )
	MachineTools:setTopBottom( true, false, 588, 717 )
	self:addElement( MachineTools )
	self.MachineTools = MachineTools
	
	local WonderWeapon = CoD.WonderWeaponBlueprintWidget_Island.new( menu, controller )
	WonderWeapon:setLeftRight( true, false, 877.32, 1191.32 )
	WonderWeapon:setTopBottom( true, false, 588, 717 )
	self:addElement( WonderWeapon )
	self.WonderWeapon = WonderWeapon
	
	local TextBucket = LUI.UIText.new()
	TextBucket:setLeftRight( false, false, -614.13, -516.63 )
	TextBucket:setTopBottom( false, true, -146.02, -132 )
	TextBucket:setRGB( 0.27, 0.25, 0.23 )
	TextBucket:setText( Engine.Localize( "ZM_ISLAND_INVENTORY_TITLE_BUCKET" ) )
	TextBucket:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextBucket:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBucket:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBucket )
	self.TextBucket = TextBucket
	
	local TextShield = LUI.UIText.new()
	TextShield:setLeftRight( false, false, -417.13, -319.63 )
	TextShield:setTopBottom( false, true, -146.02, -132 )
	TextShield:setRGB( 0.27, 0.25, 0.23 )
	TextShield:setText( Engine.Localize( "ZM_ISLAND_INVENTORY_TITLE_SHIELD" ) )
	TextShield:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextShield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextShield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextShield )
	self.TextShield = TextShield
	
	local TextGasMask = LUI.UIText.new()
	TextGasMask:setLeftRight( false, false, -170.13, -72.63 )
	TextGasMask:setTopBottom( false, true, -146.02, -132 )
	TextGasMask:setRGB( 0.27, 0.25, 0.23 )
	TextGasMask:setText( Engine.Localize( "ZM_ISLAND_INVENTORY_TITLE_GASMASK" ) )
	TextGasMask:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextGasMask:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextGasMask:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextGasMask )
	self.TextGasMask = TextGasMask
	
	local TextMachineTools = LUI.UIText.new()
	TextMachineTools:setLeftRight( false, false, 73.87, 171.37 )
	TextMachineTools:setTopBottom( false, true, -146.02, -132 )
	TextMachineTools:setRGB( 0.27, 0.25, 0.23 )
	TextMachineTools:setText( Engine.Localize( "ZM_ISLAND_INVENTORY_TITLE_MACHINETOOLS" ) )
	TextMachineTools:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextMachineTools:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextMachineTools:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextMachineTools )
	self.TextMachineTools = TextMachineTools
	
	local TextFNR = LUI.UIText.new()
	TextFNR:setLeftRight( false, false, 321.87, 419.37 )
	TextFNR:setTopBottom( false, true, -146.02, -132 )
	TextFNR:setRGB( 0.27, 0.25, 0.23 )
	TextFNR:setText( Engine.Localize( "ZM_ISLAND_INVENTORY_TITLE_FNR" ) )
	TextFNR:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextFNR:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextFNR:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextFNR )
	self.TextFNR = TextFNR
	
	local TextSkull = LUI.UIText.new()
	TextSkull:setLeftRight( false, false, 527.25, 612.75 )
	TextSkull:setTopBottom( false, true, -146.02, -132 )
	TextSkull:setRGB( 0.27, 0.25, 0.23 )
	TextSkull:setText( Engine.Localize( "ZM_ISLAND_INVENTORY_TITLE_SKULL" ) )
	TextSkull:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextSkull:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextSkull:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextSkull )
	self.TextSkull = TextSkull
	
	local BubbleGumPackInGame = CoD.BubbleGumPackInGame.new( menu, controller )
	BubbleGumPackInGame:setLeftRight( false, false, -184, 184 )
	BubbleGumPackInGame:setTopBottom( true, false, 36, 185 )
	self:addElement( BubbleGumPackInGame )
	self.BubbleGumPackInGame = BubbleGumPackInGame
	
	local BucketAndSeedWidget0 = CoD.BucketAndSeedWidget.new( menu, controller )
	BucketAndSeedWidget0:setLeftRight( true, false, -42.77, 153.23 )
	BucketAndSeedWidget0:setTopBottom( true, false, 535.23, 767.23 )
	BucketAndSeedWidget0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BucketAndSeedWidget0 )
	self.BucketAndSeedWidget0 = BucketAndSeedWidget0
	
	local IslandSkullWidget0 = CoD.IslandSkullWidget.new( menu, controller )
	IslandSkullWidget0:setLeftRight( true, false, 1129, 1293 )
	IslandSkullWidget0:setTopBottom( true, false, 572, 736 )
	IslandSkullWidget0:setScale( 0.6 )
	IslandSkullWidget0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( IslandSkullWidget0 )
	self.IslandSkullWidget0 = IslandSkullWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				RocketShield:completeAnimation()
				self.RocketShield:setAlpha( 0 )
				self.clipFinished( RocketShield, {} )

				GasMask:completeAnimation()
				self.GasMask:setAlpha( 0 )
				self.clipFinished( GasMask, {} )

				MachineTools:completeAnimation()
				self.MachineTools:setAlpha( 0 )
				self.clipFinished( MachineTools, {} )

				WonderWeapon:completeAnimation()
				self.WonderWeapon:setAlpha( 0 )
				self.clipFinished( WonderWeapon, {} )

				TextBucket:completeAnimation()
				self.TextBucket:setAlpha( 0 )
				self.clipFinished( TextBucket, {} )

				TextShield:completeAnimation()
				self.TextShield:setAlpha( 0 )
				self.clipFinished( TextShield, {} )

				TextGasMask:completeAnimation()
				self.TextGasMask:setAlpha( 0 )
				self.clipFinished( TextGasMask, {} )

				TextMachineTools:completeAnimation()
				self.TextMachineTools:setAlpha( 0 )
				self.clipFinished( TextMachineTools, {} )

				TextFNR:completeAnimation()
				self.TextFNR:setAlpha( 0 )
				self.clipFinished( TextFNR, {} )

				TextSkull:completeAnimation()
				self.TextSkull:setAlpha( 0 )
				self.clipFinished( TextSkull, {} )

				BucketAndSeedWidget0:completeAnimation()
				self.BucketAndSeedWidget0:setAlpha( 0 )
				self.clipFinished( BucketAndSeedWidget0, {} )

				IslandSkullWidget0:completeAnimation()
				self.IslandSkullWidget0:setAlpha( 0 )
				self.clipFinished( IslandSkullWidget0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )

				RocketShield:completeAnimation()
				self.RocketShield:setAlpha( 1 )
				self.clipFinished( RocketShield, {} )

				GasMask:completeAnimation()
				self.GasMask:setAlpha( 1 )
				self.clipFinished( GasMask, {} )

				MachineTools:completeAnimation()
				self.MachineTools:setAlpha( 1 )
				self.clipFinished( MachineTools, {} )

				WonderWeapon:completeAnimation()
				self.WonderWeapon:setAlpha( 1 )
				self.clipFinished( WonderWeapon, {} )

				TextBucket:completeAnimation()
				self.TextBucket:setAlpha( 1 )
				self.clipFinished( TextBucket, {} )

				TextShield:completeAnimation()
				self.TextShield:setAlpha( 1 )
				self.clipFinished( TextShield, {} )

				TextGasMask:completeAnimation()
				self.TextGasMask:setAlpha( 1 )
				self.clipFinished( TextGasMask, {} )

				TextMachineTools:completeAnimation()
				self.TextMachineTools:setAlpha( 1 )
				self.clipFinished( TextMachineTools, {} )

				TextFNR:completeAnimation()
				self.TextFNR:setAlpha( 1 )
				self.clipFinished( TextFNR, {} )

				TextSkull:completeAnimation()
				self.TextSkull:setAlpha( 1 )
				self.clipFinished( TextSkull, {} )

				BucketAndSeedWidget0:completeAnimation()
				self.BucketAndSeedWidget0:setAlpha( 1 )
				self.clipFinished( BucketAndSeedWidget0, {} )

				IslandSkullWidget0:completeAnimation()
				self.IslandSkullWidget0:setAlpha( 1 )
				self.clipFinished( IslandSkullWidget0, {} )
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
		element.GasMask:close()
		element.MachineTools:close()
		element.WonderWeapon:close()
		element.BubbleGumPackInGame:close()
		element.BucketAndSeedWidget0:close()
		element.IslandSkullWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

