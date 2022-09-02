-- 6d582a211412deb0bb79f52f6b17e13c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryStalingrad.DragonEggPieceWidget" )

CoD.DragonEggWidget = InheritFrom( LUI.UIElement )
CoD.DragonEggWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DragonEggWidget )
	self.id = "DragonEggWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 173 )
	self:setTopBottom( true, false, 0, 173 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 14.86, 172 )
	BG:setTopBottom( true, false, -17, 183 )
	BG:setImage( RegisterImage( "uie_t7_base_quest_dragonegg_dlc3" ) )
	self:addElement( BG )
	self.BG = BG
	
	local DragonEggPieceWidget = CoD.DragonEggPieceWidget.new( menu, controller )
	DragonEggPieceWidget:setLeftRight( true, false, 44.04, 133.04 )
	DragonEggPieceWidget:setTopBottom( true, false, 43, 132 )
	DragonEggPieceWidget:setScale( 1.95 )
	DragonEggPieceWidget.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragon_egg_new" ) )
	DragonEggPieceWidget.PieceImage:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragon_egg" ) )
	DragonEggPieceWidget:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_egg" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f3_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f3_local0 = IsInventoryWidgetVisible( controller, "widget_egg" )
					if f3_local0 then
						f3_local0 = IsInventoryPieceVisible( controller, "piece_egg" )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	DragonEggPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( DragonEggPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	DragonEggPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_egg" ), function ( model )
		menu:updateElementState( DragonEggPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_egg"
		} )
	end )
	DragonEggPieceWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_egg" ), function ( model )
		menu:updateElementState( DragonEggPieceWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_egg"
		} )
	end )
	self:addElement( DragonEggPieceWidget )
	self.DragonEggPieceWidget = DragonEggPieceWidget
	
	local DragonEggMeter = LUI.UIImage.new()
	DragonEggMeter:setLeftRight( true, false, 2, 175.09 )
	DragonEggMeter:setTopBottom( true, false, -1, 172.09 )
	DragonEggMeter:setAlpha( 0.75 )
	DragonEggMeter:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragon_egg_meter" ) )
	self:addElement( DragonEggMeter )
	self.DragonEggMeter = DragonEggMeter
	
	local DragonEggFill = LUI.UIImage.new()
	DragonEggFill:setLeftRight( true, false, 5, 178.09 )
	DragonEggFill:setTopBottom( true, false, 4, 177.09 )
	DragonEggFill:setRGB( 1, 0.94, 0 )
	DragonEggFill:setImage( RegisterImage( "uie_t7_icon_inventory_dlc3_dragon_egg_fill" ) )
	DragonEggFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	DragonEggFill:setShaderVector( 1, 0.5, 0, 0, 0 )
	DragonEggFill:setShaderVector( 2, 0.5, 0, 0, 0 )
	DragonEggFill:setShaderVector( 3, 0.02, 0.02, 0, 0 )
	DragonEggFill:subscribeToGlobalModel( controller, "ZMStalingradInventory", "progress_egg", function ( model )
		local progressEgg = Engine.GetModelValue( model )
		if progressEgg then
			DragonEggFill:setShaderVector( 0, CoD.GetVectorComponentFromString( progressEgg, 1 ), CoD.GetVectorComponentFromString( progressEgg, 2 ), CoD.GetVectorComponentFromString( progressEgg, 3 ), CoD.GetVectorComponentFromString( progressEgg, 4 ) )
		end
	end )
	self:addElement( DragonEggFill )
	self.DragonEggFill = DragonEggFill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				DragonEggPieceWidget:completeAnimation()
				self.DragonEggPieceWidget:setAlpha( 0 )
				self.clipFinished( DragonEggPieceWidget, {} )

				DragonEggMeter:completeAnimation()
				self.DragonEggMeter:setAlpha( 0 )
				self.clipFinished( DragonEggMeter, {} )

				DragonEggFill:completeAnimation()
				self.DragonEggFill:setAlpha( 0 )
				self.clipFinished( DragonEggFill, {} )
			end
		},
		ScoreboardHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				DragonEggPieceWidget:completeAnimation()
				self.DragonEggPieceWidget:setAlpha( 0 )
				self.clipFinished( DragonEggPieceWidget, {} )

				DragonEggMeter:completeAnimation()
				self.DragonEggMeter:setAlpha( 0 )
				self.clipFinished( DragonEggMeter, {} )

				DragonEggFill:completeAnimation()
				self.DragonEggFill:setAlpha( 0 )
				self.clipFinished( DragonEggFill, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				DragonEggPieceWidget:completeAnimation()
				self.DragonEggPieceWidget:setAlpha( 1 )
				self.clipFinished( DragonEggPieceWidget, {} )

				DragonEggMeter:completeAnimation()
				self.DragonEggMeter:setAlpha( 0.75 )
				self.clipFinished( DragonEggMeter, {} )

				DragonEggFill:completeAnimation()
				self.DragonEggFill:setAlpha( 1 )
				self.clipFinished( DragonEggFill, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local BGFrame2 = function ( BG, event )
					local BGFrame3 = function ( BG, event )
						local BGFrame4 = function ( BG, event )
							if not event.interrupted then
								BG:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							BG:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BG, event )
							else
								BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BGFrame4( BG, event )
							return 
						else
							BG:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							BG:registerEventHandler( "transition_complete_keyframe", BGFrame4 )
						end
					end
					
					if event.interrupted then
						BGFrame3( BG, event )
						return 
					else
						BG:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BG:setAlpha( 1 )
						BG:registerEventHandler( "transition_complete_keyframe", BGFrame3 )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				BGFrame2( BG, {} )

				DragonEggPieceWidget:completeAnimation()
				self.DragonEggPieceWidget:setAlpha( 1 )
				self.clipFinished( DragonEggPieceWidget, {} )

				DragonEggMeter:completeAnimation()
				self.DragonEggMeter:setAlpha( 0 )
				self.clipFinished( DragonEggMeter, {} )

				DragonEggFill:completeAnimation()
				self.DragonEggFill:setAlpha( 0 )
				self.clipFinished( DragonEggFill, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ScoreboardHidden",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not IsInventoryPieceVisible( controller, "piece_egg" )
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
				return IsInventoryWidgetVisible( controller, "widget_egg" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_egg" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_egg"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_egg" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_egg"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DragonEggPieceWidget:close()
		element.DragonEggFill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

