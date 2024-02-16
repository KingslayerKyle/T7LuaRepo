-- 98f127c12212ccdb7f85721e4cedede1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldPieceWidget" )

CoD.MusicalPartsWidget_Tomb = InheritFrom( LUI.UIElement )
CoD.MusicalPartsWidget_Tomb.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MusicalPartsWidget_Tomb )
	self.id = "MusicalPartsWidget_Tomb"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, -19, 325.57 )
	bg:setTopBottom( false, false, -115.66, 119.66 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_inventory_quest_musical" ) )
	self:addElement( bg )
	self.bg = bg
	
	local RecordPiece = CoD.RocketShieldPieceWidget.new( menu, controller )
	RecordPiece:setLeftRight( true, false, 112.5, 201.5 )
	RecordPiece:setTopBottom( true, false, 19.5, 108.5 )
	RecordPiece:setScale( 0.89 )
	RecordPiece.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_musicalpart_2" ) )
	RecordPiece.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_musicalpart_2" ) )
	RecordPiece:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_record_zm_vinyl_master" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryWidgetVisible( controller, "show_musical_parts_widget" ) and IsInventoryPieceVisible( controller, "piece_record_zm_vinyl_master" )
			end
		}
	} )
	RecordPiece:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( RecordPiece, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	RecordPiece:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_record_zm_vinyl_master" ), function ( model )
		menu:updateElementState( RecordPiece, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_record_zm_vinyl_master"
		} )
	end )
	RecordPiece:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		menu:updateElementState( RecordPiece, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( RecordPiece )
	self.RecordPiece = RecordPiece
	
	local GramophonePiece = CoD.RocketShieldPieceWidget.new( menu, controller )
	GramophonePiece:setLeftRight( true, false, 39, 128 )
	GramophonePiece:setTopBottom( true, false, 19.5, 108.5 )
	GramophonePiece:setScale( 0.87 )
	GramophonePiece.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_icon_hd_musicalpart_1" ) )
	GramophonePiece.PieceImage:setImage( RegisterImage( "uie_t7_zm_icon_hd_musicalpart_1" ) )
	GramophonePiece:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsInventoryPieceVisible( controller, "piece_record_zm_player" )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "piece_record_zm_player" ) and IsInventoryWidgetVisible( controller, "show_musical_parts_widget" )
			end
		}
	} )
	GramophonePiece:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( GramophonePiece, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	GramophonePiece:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.piece_record_zm_player" ), function ( model )
		menu:updateElementState( GramophonePiece, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.piece_record_zm_player"
		} )
	end )
	GramophonePiece:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		menu:updateElementState( GramophonePiece, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( GramophonePiece )
	self.GramophonePiece = GramophonePiece
	
	local WaterCrystal = CoD.RocketShieldPieceWidget.new( menu, controller )
	WaterCrystal:setLeftRight( true, false, 187.5, 276.5 )
	WaterCrystal:setTopBottom( true, false, 20.5, 109.5 )
	WaterCrystal.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_water" ) )
	WaterCrystal.PieceImage:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_water" ) )
	WaterCrystal:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsModelValueEqualTo( controller, "zmInventory.current_gem", 4 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.current_gem", 4 ) and IsInventoryWidgetVisible( controller, "show_musical_parts_widget" )
			end
		}
	} )
	WaterCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( WaterCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	WaterCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.current_gem" ), function ( model )
		menu:updateElementState( WaterCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.current_gem"
		} )
	end )
	WaterCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		menu:updateElementState( WaterCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( WaterCrystal )
	self.WaterCrystal = WaterCrystal
	
	local FireCrystal = CoD.RocketShieldPieceWidget.new( menu, controller )
	FireCrystal:setLeftRight( true, false, 187.5, 276.5 )
	FireCrystal:setTopBottom( true, false, 20.5, 109.5 )
	FireCrystal:setScale( 0.86 )
	FireCrystal.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_fire" ) )
	FireCrystal.PieceImage:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_fire" ) )
	FireCrystal:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsModelValueEqualTo( controller, "zmInventory.current_gem", 1 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.current_gem", 1 ) and IsInventoryWidgetVisible( controller, "show_musical_parts_widget" )
			end
		}
	} )
	FireCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( FireCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	FireCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.current_gem" ), function ( model )
		menu:updateElementState( FireCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.current_gem"
		} )
	end )
	FireCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		menu:updateElementState( FireCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( FireCrystal )
	self.FireCrystal = FireCrystal
	
	local LightningCrystal = CoD.RocketShieldPieceWidget.new( menu, controller )
	LightningCrystal:setLeftRight( true, false, 187.5, 276.5 )
	LightningCrystal:setTopBottom( true, false, 20.5, 109.5 )
	LightningCrystal:setScale( 0.86 )
	LightningCrystal.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_lightning" ) )
	LightningCrystal.PieceImage:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_lightning" ) )
	LightningCrystal:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsModelValueEqualTo( controller, "zmInventory.current_gem", 3 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.current_gem", 3 ) and IsInventoryWidgetVisible( controller, "show_musical_parts_widget" )
			end
		}
	} )
	LightningCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( LightningCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LightningCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.current_gem" ), function ( model )
		menu:updateElementState( LightningCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.current_gem"
		} )
	end )
	LightningCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		menu:updateElementState( LightningCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( LightningCrystal )
	self.LightningCrystal = LightningCrystal
	
	local AirCrystal = CoD.RocketShieldPieceWidget.new( menu, controller )
	AirCrystal:setLeftRight( true, false, 187.5, 276.5 )
	AirCrystal:setTopBottom( true, false, 20.5, 109.5 )
	AirCrystal:setScale( 0.86 )
	AirCrystal.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_wind" ) )
	AirCrystal.PieceImage:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_wind" ) )
	AirCrystal:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsModelValueEqualTo( controller, "zmInventory.current_gem", 2 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmInventory.current_gem", 2 ) and IsInventoryWidgetVisible( controller, "show_musical_parts_widget" )
			end
		}
	} )
	AirCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( AirCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	AirCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.current_gem" ), function ( model )
		menu:updateElementState( AirCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.current_gem"
		} )
	end )
	AirCrystal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.show_musical_parts_widget" ), function ( model )
		menu:updateElementState( AirCrystal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.show_musical_parts_widget"
		} )
	end )
	self:addElement( AirCrystal )
	self.AirCrystal = AirCrystal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				RecordPiece:completeAnimation()
				self.RecordPiece:setAlpha( 0 )
				self.clipFinished( RecordPiece, {} )

				GramophonePiece:completeAnimation()
				self.GramophonePiece:setAlpha( 0 )
				self.clipFinished( GramophonePiece, {} )

				WaterCrystal:completeAnimation()
				self.WaterCrystal:setAlpha( 0 )
				self.clipFinished( WaterCrystal, {} )

				FireCrystal:completeAnimation()
				self.FireCrystal:setAlpha( 0 )
				self.clipFinished( FireCrystal, {} )

				LightningCrystal:completeAnimation()
				self.LightningCrystal:setAlpha( 0 )
				self.clipFinished( LightningCrystal, {} )

				AirCrystal:completeAnimation()
				self.AirCrystal:setAlpha( 0 )
				self.clipFinished( AirCrystal, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
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
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )

				RecordPiece:completeAnimation()
				self.RecordPiece:setLeftRight( true, false, 117.5, 206.5 )
				self.RecordPiece:setTopBottom( true, false, 18, 107 )
				self.RecordPiece:setAlpha( 1 )
				self.clipFinished( RecordPiece, {} )

				GramophonePiece:completeAnimation()
				self.GramophonePiece:setAlpha( 1 )
				self.clipFinished( GramophonePiece, {} )

				WaterCrystal:completeAnimation()
				self.WaterCrystal:setLeftRight( true, false, 195, 284 )
				self.WaterCrystal:setTopBottom( true, false, 18, 107 )
				self.WaterCrystal:setAlpha( 1 )
				self.clipFinished( WaterCrystal, {} )

				FireCrystal:completeAnimation()

				FireCrystal.PieceImageNewGreen:completeAnimation()

				FireCrystal.PieceImage:completeAnimation()
				self.FireCrystal:setLeftRight( true, false, 195, 284 )
				self.FireCrystal:setTopBottom( true, false, 18, 107 )
				self.FireCrystal:setAlpha( 1 )
				self.FireCrystal.PieceImageNewGreen:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_fire" ) )
				self.FireCrystal.PieceImage:setImage( RegisterImage( "uie_t7_zm_hd_craftable_element_fire" ) )
				self.clipFinished( FireCrystal, {} )

				LightningCrystal:completeAnimation()
				self.LightningCrystal:setLeftRight( true, false, 195, 284 )
				self.LightningCrystal:setTopBottom( true, false, 18, 107 )
				self.LightningCrystal:setAlpha( 1 )
				self.clipFinished( LightningCrystal, {} )

				AirCrystal:completeAnimation()
				self.AirCrystal:setLeftRight( true, false, 195, 284 )
				self.AirCrystal:setTopBottom( true, false, 18, 107 )
				self.AirCrystal:setAlpha( 1 )
				self.clipFinished( AirCrystal, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				RecordPiece:completeAnimation()
				self.RecordPiece:setAlpha( 1 )
				self.clipFinished( RecordPiece, {} )

				GramophonePiece:completeAnimation()
				self.GramophonePiece:setLeftRight( true, false, 39, 128 )
				self.GramophonePiece:setTopBottom( true, false, 19.5, 108.5 )
				self.GramophonePiece:setAlpha( 1 )
				self.clipFinished( GramophonePiece, {} )

				WaterCrystal:completeAnimation()
				self.WaterCrystal:setLeftRight( true, false, 190.17, 279.17 )
				self.WaterCrystal:setTopBottom( true, false, 20.5, 109.5 )
				self.WaterCrystal:setAlpha( 1 )
				self.clipFinished( WaterCrystal, {} )

				FireCrystal:completeAnimation()
				self.FireCrystal:setLeftRight( true, false, 187.5, 276.5 )
				self.FireCrystal:setTopBottom( true, false, 20.5, 109.5 )
				self.FireCrystal:setAlpha( 1 )
				self.clipFinished( FireCrystal, {} )

				LightningCrystal:completeAnimation()
				self.LightningCrystal:setLeftRight( true, false, 187.5, 276.5 )
				self.LightningCrystal:setTopBottom( true, false, 20.5, 109.5 )
				self.LightningCrystal:setAlpha( 1 )
				self.clipFinished( LightningCrystal, {} )

				AirCrystal:completeAnimation()
				self.AirCrystal:setLeftRight( true, false, 187.5, 276.5 )
				self.AirCrystal:setTopBottom( true, false, 20.5, 109.5 )
				self.AirCrystal:setAlpha( 1 )
				self.clipFinished( AirCrystal, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RecordPiece:close()
		element.GramophonePiece:close()
		element.WaterCrystal:close()
		element.FireCrystal:close()
		element.LightningCrystal:close()
		element.AirCrystal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
