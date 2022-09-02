-- a148eaf7f3427369a9c188c18af65d9b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.DragonStrikeWidgets_Stalingrad = InheritFrom( LUI.UIElement )
CoD.DragonStrikeWidgets_Stalingrad.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DragonStrikeWidgets_Stalingrad )
	self.id = "DragonStrikeWidgets_Stalingrad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 232 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 46.54, 148.64 )
	bg:setTopBottom( true, false, 55.96, 185.91 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_dragonstrike_dlc3" ) )
	self:addElement( bg )
	self.bg = bg
	
	local MachineToolsPieceWidget0 = CoD.RocketShieldPieceWidget.new( menu, controller )
	MachineToolsPieceWidget0:setLeftRight( true, false, 47, 136 )
	MachineToolsPieceWidget0:setTopBottom( true, false, 77.24, 166.24 )
	MachineToolsPieceWidget0:setScale( 0.6 )
	MachineToolsPieceWidget0.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragonstrike_new" ) )
	MachineToolsPieceWidget0.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragonstrike" ) )
	MachineToolsPieceWidget0:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_dragon_strike" )
			end
		}
	} )
	MachineToolsPieceWidget0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragon_strike" ), function ( model )
		menu:updateElementState( MachineToolsPieceWidget0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragon_strike"
		} )
	end )
	self:addElement( MachineToolsPieceWidget0 )
	self.MachineToolsPieceWidget0 = MachineToolsPieceWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget0, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
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
							bg:beginAnimation( "keyframe", 2680, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )

				MachineToolsPieceWidget0:completeAnimation()
				self.MachineToolsPieceWidget0:setAlpha( 1 )
				self.clipFinished( MachineToolsPieceWidget0, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "widget_dragon_strike" )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_dragon_strike" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_dragon_strike"
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
		element.MachineToolsPieceWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

