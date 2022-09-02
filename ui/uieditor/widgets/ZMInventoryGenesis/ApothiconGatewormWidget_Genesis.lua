-- e06bf008a29feeba9e0badfac38604a9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonEggPieceWidget" )

CoD.ApothiconGatewormWidget_Genesis = InheritFrom( LUI.UIElement )
CoD.ApothiconGatewormWidget_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ApothiconGatewormWidget_Genesis )
	self.id = "ApothiconGatewormWidget_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 173 )
	self:setTopBottom( true, false, 0, 173 )
	self.anyChildUsesUpdateState = true
	
	local GatewormBG = CoD.onOffImage.new( menu, controller )
	GatewormBG:setLeftRight( true, false, 14.86, 172 )
	GatewormBG:setTopBottom( true, false, -17, 183 )
	GatewormBG.image:setImage( RegisterImage( "uie_t7_base_quest_gateworm_dlc4" ) )
	GatewormBG:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "player_gate_worm" )
			end
		}
	} )
	GatewormBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_gate_worm" ), function ( model )
		menu:updateElementState( GatewormBG, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_gate_worm"
		} )
	end )
	self:addElement( GatewormBG )
	self.GatewormBG = GatewormBG
	
	local ApothiconBG = CoD.onOffImage.new( menu, controller )
	ApothiconBG:setLeftRight( true, false, 14.86, 172 )
	ApothiconBG:setTopBottom( true, false, -17, 183 )
	ApothiconBG.image:setImage( RegisterImage( "uie_t7_base_quest_egg_dlc4" ) )
	ApothiconBG:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "player_apothicon_egg" )
			end
		}
	} )
	ApothiconBG:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_apothicon_egg" ), function ( model )
		menu:updateElementState( ApothiconBG, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_apothicon_egg"
		} )
	end )
	self:addElement( ApothiconBG )
	self.ApothiconBG = ApothiconBG
	
	local GatewormPieceWidget = CoD.DragonEggPieceWidget.new( menu, controller )
	GatewormPieceWidget:setLeftRight( true, false, 44.04, 133.04 )
	GatewormPieceWidget:setTopBottom( true, false, 41, 130 )
	GatewormPieceWidget.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_gateworm" ) )
	GatewormPieceWidget.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_gateworm" ) )
	GatewormPieceWidget:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "player_gate_worm" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f7_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f7_local0 = IsInventoryWidgetVisible( controller, "widget_gate_worm" )
					if f7_local0 then
						f7_local0 = IsInventoryPieceVisible( controller, "player_gate_worm" )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	GatewormPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( GatewormPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	GatewormPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_gate_worm" ), function ( model )
		menu:updateElementState( GatewormPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_gate_worm"
		} )
	end )
	GatewormPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_gate_worm" ), function ( model )
		menu:updateElementState( GatewormPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_gate_worm"
		} )
	end )
	self:addElement( GatewormPieceWidget )
	self.GatewormPieceWidget = GatewormPieceWidget
	
	local ApothiconEggPieceWidget = CoD.DragonEggPieceWidget.new( menu, controller )
	ApothiconEggPieceWidget:setLeftRight( true, false, 45.04, 134.04 )
	ApothiconEggPieceWidget:setTopBottom( true, false, 41, 130 )
	ApothiconEggPieceWidget:setScale( 1.2 )
	ApothiconEggPieceWidget.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_apothicon" ) )
	ApothiconEggPieceWidget.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc4_apothicon" ) )
	ApothiconEggPieceWidget:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "player_apothicon_egg" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f12_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f12_local0 = IsInventoryWidgetVisible( controller, "widget_apothicon_egg" )
					if f12_local0 then
						f12_local0 = IsInventoryPieceVisible( controller, "player_apothicon_egg" )
					end
				else
					f12_local0 = false
				end
				return f12_local0
			end
		}
	} )
	ApothiconEggPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( ApothiconEggPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ApothiconEggPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_apothicon_egg" ), function ( model )
		menu:updateElementState( ApothiconEggPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_apothicon_egg"
		} )
	end )
	ApothiconEggPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_apothicon_egg" ), function ( model )
		menu:updateElementState( ApothiconEggPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_apothicon_egg"
		} )
	end )
	self:addElement( ApothiconEggPieceWidget )
	self.ApothiconEggPieceWidget = ApothiconEggPieceWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GatewormBG:completeAnimation()
				self.GatewormBG:setAlpha( 0 )
				self.clipFinished( GatewormBG, {} )

				ApothiconBG:completeAnimation()
				self.ApothiconBG:setAlpha( 0 )
				self.clipFinished( ApothiconBG, {} )

				GatewormPieceWidget:completeAnimation()
				self.GatewormPieceWidget:setAlpha( 0 )
				self.clipFinished( GatewormPieceWidget, {} )

				ApothiconEggPieceWidget:completeAnimation()
				self.ApothiconEggPieceWidget:setAlpha( 0 )
				self.clipFinished( ApothiconEggPieceWidget, {} )
			end
		},
		ScoreboardHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GatewormBG:completeAnimation()
				self.GatewormBG:setAlpha( 0 )
				self.clipFinished( GatewormBG, {} )

				ApothiconBG:completeAnimation()
				self.ApothiconBG:setAlpha( 0 )
				self.clipFinished( ApothiconBG, {} )

				GatewormPieceWidget:completeAnimation()
				self.GatewormPieceWidget:setAlpha( 0 )
				self.clipFinished( GatewormPieceWidget, {} )

				ApothiconEggPieceWidget:completeAnimation()
				self.ApothiconEggPieceWidget:setAlpha( 0 )
				self.clipFinished( ApothiconEggPieceWidget, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GatewormBG:completeAnimation()
				self.GatewormBG:setAlpha( 0 )
				self.clipFinished( GatewormBG, {} )

				ApothiconBG:completeAnimation()
				self.ApothiconBG:setAlpha( 0 )
				self.clipFinished( ApothiconBG, {} )

				GatewormPieceWidget:completeAnimation()
				self.GatewormPieceWidget:setAlpha( 1 )
				self.clipFinished( GatewormPieceWidget, {} )

				ApothiconEggPieceWidget:completeAnimation()
				self.ApothiconEggPieceWidget:setAlpha( 1 )
				self.ApothiconEggPieceWidget:setScale( 1.2 )
				self.clipFinished( ApothiconEggPieceWidget, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local GatewormBGFrame2 = function ( GatewormBG, event )
					local GatewormBGFrame3 = function ( GatewormBG, event )
						local GatewormBGFrame4 = function ( GatewormBG, event )
							if not event.interrupted then
								GatewormBG:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							GatewormBG:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GatewormBG, event )
							else
								GatewormBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GatewormBGFrame4( GatewormBG, event )
							return 
						else
							GatewormBG:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							GatewormBG:registerEventHandler( "transition_complete_keyframe", GatewormBGFrame4 )
						end
					end
					
					if event.interrupted then
						GatewormBGFrame3( GatewormBG, event )
						return 
					else
						GatewormBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						GatewormBG:setAlpha( 1 )
						GatewormBG:registerEventHandler( "transition_complete_keyframe", GatewormBGFrame3 )
					end
				end
				
				GatewormBG:completeAnimation()
				self.GatewormBG:setAlpha( 0 )
				GatewormBGFrame2( GatewormBG, {} )
				local ApothiconBGFrame2 = function ( ApothiconBG, event )
					local ApothiconBGFrame3 = function ( ApothiconBG, event )
						local ApothiconBGFrame4 = function ( ApothiconBG, event )
							if not event.interrupted then
								ApothiconBG:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							ApothiconBG:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ApothiconBG, event )
							else
								ApothiconBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ApothiconBGFrame4( ApothiconBG, event )
							return 
						else
							ApothiconBG:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							ApothiconBG:registerEventHandler( "transition_complete_keyframe", ApothiconBGFrame4 )
						end
					end
					
					if event.interrupted then
						ApothiconBGFrame3( ApothiconBG, event )
						return 
					else
						ApothiconBG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						ApothiconBG:setAlpha( 1 )
						ApothiconBG:registerEventHandler( "transition_complete_keyframe", ApothiconBGFrame3 )
					end
				end
				
				ApothiconBG:completeAnimation()
				self.ApothiconBG:setAlpha( 0 )
				ApothiconBGFrame2( ApothiconBG, {} )

				GatewormPieceWidget:completeAnimation()
				self.GatewormPieceWidget:setAlpha( 1 )
				self.clipFinished( GatewormPieceWidget, {} )

				ApothiconEggPieceWidget:completeAnimation()
				self.ApothiconEggPieceWidget:setLeftRight( true, false, 45.04, 134.04 )
				self.ApothiconEggPieceWidget:setTopBottom( true, false, 41, 130 )
				self.ApothiconEggPieceWidget:setAlpha( 1 )
				self.ApothiconEggPieceWidget:setScale( 1 )
				self.clipFinished( ApothiconEggPieceWidget, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ScoreboardHidden",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and AlwaysFalse()
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsEitherInventoryItemVisible( controller, "player_apothicon_egg_bg", "player_gate_worm_bg" ) and AlwaysFalse()
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_apothicon_egg_bg" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_apothicon_egg_bg"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_gate_worm_bg" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_gate_worm_bg"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GatewormBG:close()
		element.ApothiconBG:close()
		element.GatewormPieceWidget:close()
		element.ApothiconEggPieceWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

