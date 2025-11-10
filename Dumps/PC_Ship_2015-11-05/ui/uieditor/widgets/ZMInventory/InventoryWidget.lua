require( "ui.uieditor.widgets.ZMInventory.IDGunBlueprint.IDGunBlueprintWidget" )
require( "ui.uieditor.widgets.ZMInventory.FuseBox.FuseBoxWidget" )
require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldBlueprintWidget" )
require( "ui.uieditor.widgets.ZMInventory.SummoningKey.SummoningKeyWidget" )
require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualWidget" )
require( "ui.uieditor.widgets.ZMInventory.SpecialControls" )
require( "ui.uieditor.widgets.ZMInventory.Sprayer.SprayerWidget" )
require( "ui.uieditor.widgets.ZMInventory.QuestEgg.QuestEggWidget" )
require( "ui.uieditor.widgets.ZMInventory.FuseBox.FuseTitle" )
require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldTitle" )
require( "ui.uieditor.widgets.ZMInventory.IDGunBlueprint.IDGunBlueprintTitle" )
require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualItemTitle" )
require( "ui.uieditor.widgets.ZMInventory.Sprayer.SprayerWidgetTitle" )

CoD.InventoryWidget = InheritFrom( LUI.UIElement )
CoD.InventoryWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InventoryWidget )
	self.id = "InventoryWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local ShadowBox = LUI.UIImage.new()
	ShadowBox:setLeftRight( true, true, 0, 0 )
	ShadowBox:setTopBottom( false, true, -144, 0 )
	ShadowBox:setImage( RegisterImage( "uie_t7_base_shadowbox" ) )
	self:addElement( ShadowBox )
	self.ShadowBox = ShadowBox
	
	local IDGunBlueprintWidget = CoD.IDGunBlueprintWidget.new( menu, controller )
	IDGunBlueprintWidget:setLeftRight( false, false, -297.08, 16.92 )
	IDGunBlueprintWidget:setTopBottom( false, true, -131.13, -2.13 )
	IDGunBlueprintWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	IDGunBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( IDGunBlueprintWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( IDGunBlueprintWidget )
	self.IDGunBlueprintWidget = IDGunBlueprintWidget
	
	local FuseBoxWidget = CoD.FuseBoxWidget.new( menu, controller )
	FuseBoxWidget:setLeftRight( true, false, 0, 132 )
	FuseBoxWidget:setTopBottom( false, true, -150.13, -21.13 )
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
	
	local RocketShieldBlueprintWidget = CoD.RocketShieldBlueprintWidget.new( menu, controller )
	RocketShieldBlueprintWidget:setLeftRight( false, false, -520.77, -251.77 )
	RocketShieldBlueprintWidget:setTopBottom( false, true, -131.13, -2.13 )
	RocketShieldBlueprintWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	RocketShieldBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RocketShieldBlueprintWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( RocketShieldBlueprintWidget )
	self.RocketShieldBlueprintWidget = RocketShieldBlueprintWidget
	
	local SummoningKeyWidget = CoD.SummoningKeyWidget.new( menu, controller )
	SummoningKeyWidget:setLeftRight( false, false, -23.08, 92.98 )
	SummoningKeyWidget:setTopBottom( false, true, -131.13, -2 )
	SummoningKeyWidget:setScale( 0.85 )
	SummoningKeyWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	SummoningKeyWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( SummoningKeyWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( SummoningKeyWidget )
	self.SummoningKeyWidget = SummoningKeyWidget
	
	local RitualWidget = CoD.RitualWidget.new( menu, controller )
	RitualWidget:setLeftRight( false, false, 81.98, 367 )
	RitualWidget:setTopBottom( false, true, -124.5, -5.43 )
	RitualWidget:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	RitualWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RitualWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( RitualWidget )
	self.RitualWidget = RitualWidget
	
	local BeastControls = CoD.SpecialControls.new( menu, controller )
	BeastControls:setLeftRight( true, false, 64, 472 )
	BeastControls:setTopBottom( true, false, 387, 413 )
	self:addElement( BeastControls )
	self.BeastControls = BeastControls
	
	local SprayerWidget = CoD.SprayerWidget.new( menu, controller )
	SprayerWidget:setLeftRight( false, true, -210, -127 )
	SprayerWidget:setTopBottom( false, true, -113.5, -30.5 )
	SprayerWidget:setScale( 1.3 )
	SprayerWidget:mergeStateConditions( {
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				local f12_local0 = SprayerInUse( controller )
				if f12_local0 then
					f12_local0 = ShowSprayerWidget( controller )
					if f12_local0 then
						f12_local0 = AlwaysFalse()
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				local f13_local0 = SprayerMissing( controller )
				if f13_local0 then
					f13_local0 = ShowSprayerWidget( controller )
					if f13_local0 then
						f13_local0 = AlwaysFalse()
					end
				end
				return f13_local0
			end
		},
		{
			stateName = "Aquired",
			condition = function ( menu, element, event )
				local f14_local0 = SprayerFound( controller )
				if f14_local0 then
					f14_local0 = ShowSprayerWidget( controller )
					if f14_local0 then
						f14_local0 = AlwaysFalse()
					end
				end
				return f14_local0
			end
		}
	} )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.pod_sprayer_held" ), function ( model )
		menu:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.pod_sprayer_held"
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_using_sprayer" ), function ( model )
		menu:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_using_sprayer"
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_sprayer" ), function ( model )
		menu:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_sprayer"
		} )
	end )
	SprayerWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.pod_sprayer_hint_range" ), function ( model )
		menu:updateElementState( SprayerWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.pod_sprayer_hint_range"
		} )
	end )
	self:addElement( SprayerWidget )
	self.SprayerWidget = SprayerWidget
	
	local QuestEggWidget = CoD.QuestEggWidget.new( menu, controller )
	QuestEggWidget:setLeftRight( false, true, -104.5, -23.5 )
	QuestEggWidget:setTopBottom( false, true, -107.06, -26.07 )
	QuestEggWidget:setScale( 1.1 )
	QuestEggWidget:mergeStateConditions( {
		{
			stateName = "Flashing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	QuestEggWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( QuestEggWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( QuestEggWidget )
	self.QuestEggWidget = QuestEggWidget
	
	local FuseTitle = CoD.FuseTitle.new( menu, controller )
	FuseTitle:setLeftRight( true, false, 14.5, 113.5 )
	FuseTitle:setTopBottom( false, true, -155.75, -114.5 )
	self:addElement( FuseTitle )
	self.FuseTitle = FuseTitle
	
	local RocketShieldTitle = CoD.RocketShieldTitle.new( menu, controller )
	RocketShieldTitle:setLeftRight( true, false, 167.23, 348.73 )
	RocketShieldTitle:setTopBottom( false, true, -155.75, -114.5 )
	self:addElement( RocketShieldTitle )
	self.RocketShieldTitle = RocketShieldTitle
	
	local IDGunBlueprintTitle = CoD.IDGunBlueprintTitle.new( menu, controller )
	IDGunBlueprintTitle:setLeftRight( false, false, -230.83, -49.33 )
	IDGunBlueprintTitle:setTopBottom( false, true, -155.75, -114.5 )
	self:addElement( IDGunBlueprintTitle )
	self.IDGunBlueprintTitle = IDGunBlueprintTitle
	
	local RitualItemTitle = CoD.RitualItemTitle.new( menu, controller )
	RitualItemTitle:setLeftRight( false, false, 102.17, 283.67 )
	RitualItemTitle:setTopBottom( false, true, -155.75, -114.5 )
	self:addElement( RitualItemTitle )
	self.RitualItemTitle = RitualItemTitle
	
	local SprayerWidgetTitle = CoD.SprayerWidgetTitle.new( menu, controller )
	SprayerWidgetTitle:setLeftRight( false, true, -210, -28.5 )
	SprayerWidgetTitle:setTopBottom( false, true, -155.75, -114.5 )
	self:addElement( SprayerWidgetTitle )
	self.SprayerWidgetTitle = SprayerWidgetTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				ShadowBox:completeAnimation()
				self.ShadowBox:setAlpha( 0 )
				self.clipFinished( ShadowBox, {} )
				IDGunBlueprintWidget:completeAnimation()
				self.IDGunBlueprintWidget:setAlpha( 0 )
				self.clipFinished( IDGunBlueprintWidget, {} )
				FuseBoxWidget:completeAnimation()
				self.FuseBoxWidget:setAlpha( 0 )
				self.clipFinished( FuseBoxWidget, {} )
				RocketShieldBlueprintWidget:completeAnimation()
				self.RocketShieldBlueprintWidget:setAlpha( 0 )
				self.clipFinished( RocketShieldBlueprintWidget, {} )
				SummoningKeyWidget:completeAnimation()
				self.SummoningKeyWidget:setAlpha( 0 )
				self.clipFinished( SummoningKeyWidget, {} )
				RitualWidget:completeAnimation()
				self.RitualWidget:setAlpha( 0 )
				self.clipFinished( RitualWidget, {} )
				BeastControls:completeAnimation()
				self.BeastControls:setAlpha( 0 )
				self.clipFinished( BeastControls, {} )
				SprayerWidget:completeAnimation()
				self.SprayerWidget:setAlpha( 0 )
				self.clipFinished( SprayerWidget, {} )
				QuestEggWidget:completeAnimation()
				self.QuestEggWidget:setAlpha( 0 )
				self.clipFinished( QuestEggWidget, {} )
				FuseTitle:completeAnimation()
				self.FuseTitle:setAlpha( 0 )
				self.clipFinished( FuseTitle, {} )
				RocketShieldTitle:completeAnimation()
				self.RocketShieldTitle:setAlpha( 0 )
				self.clipFinished( RocketShieldTitle, {} )
				IDGunBlueprintTitle:completeAnimation()
				self.IDGunBlueprintTitle:setAlpha( 0 )
				self.clipFinished( IDGunBlueprintTitle, {} )
				RitualItemTitle:completeAnimation()
				self.RitualItemTitle:setAlpha( 0 )
				self.clipFinished( RitualItemTitle, {} )
				SprayerWidgetTitle:completeAnimation()
				self.SprayerWidgetTitle:setAlpha( 0 )
				self.clipFinished( SprayerWidgetTitle, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				ShadowBox:completeAnimation()
				self.ShadowBox:setAlpha( 1 )
				self.clipFinished( ShadowBox, {} )
				IDGunBlueprintWidget:completeAnimation()
				self.IDGunBlueprintWidget:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintWidget, {} )
				FuseBoxWidget:completeAnimation()
				self.FuseBoxWidget:setAlpha( 1 )
				self.clipFinished( FuseBoxWidget, {} )
				RocketShieldBlueprintWidget:completeAnimation()
				self.RocketShieldBlueprintWidget:setAlpha( 1 )
				self.clipFinished( RocketShieldBlueprintWidget, {} )
				SummoningKeyWidget:completeAnimation()
				self.SummoningKeyWidget:setAlpha( 1 )
				self.clipFinished( SummoningKeyWidget, {} )
				RitualWidget:completeAnimation()
				self.RitualWidget:setAlpha( 1 )
				self.clipFinished( RitualWidget, {} )
				BeastControls:completeAnimation()
				self.BeastControls:setAlpha( 1 )
				self.clipFinished( BeastControls, {} )
				SprayerWidget:completeAnimation()
				self.SprayerWidget:setAlpha( 1 )
				self.clipFinished( SprayerWidget, {} )
				QuestEggWidget:completeAnimation()
				self.QuestEggWidget:setAlpha( 1 )
				self.clipFinished( QuestEggWidget, {} )
				FuseTitle:completeAnimation()
				self.FuseTitle:setAlpha( 1 )
				self.clipFinished( FuseTitle, {} )
				RocketShieldTitle:completeAnimation()
				self.RocketShieldTitle:setAlpha( 1 )
				self.clipFinished( RocketShieldTitle, {} )
				IDGunBlueprintTitle:completeAnimation()
				self.IDGunBlueprintTitle:setAlpha( 1 )
				self.clipFinished( IDGunBlueprintTitle, {} )
				RitualItemTitle:completeAnimation()
				self.RitualItemTitle:setAlpha( 1 )
				self.clipFinished( RitualItemTitle, {} )
				SprayerWidgetTitle:completeAnimation()
				self.SprayerWidgetTitle:setAlpha( 1 )
				self.clipFinished( SprayerWidgetTitle, {} )
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
		element.IDGunBlueprintWidget:close()
		element.FuseBoxWidget:close()
		element.RocketShieldBlueprintWidget:close()
		element.SummoningKeyWidget:close()
		element.RitualWidget:close()
		element.BeastControls:close()
		element.SprayerWidget:close()
		element.QuestEggWidget:close()
		element.FuseTitle:close()
		element.RocketShieldTitle:close()
		element.IDGunBlueprintTitle:close()
		element.RitualItemTitle:close()
		element.SprayerWidgetTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

