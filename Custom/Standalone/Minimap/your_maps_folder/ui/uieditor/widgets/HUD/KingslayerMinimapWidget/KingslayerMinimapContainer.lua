require( "ui.uieditor.widgets.HUD.KingslayerMinimapWidget.KingslayerMinimap" )

CoD.KingslayerMinimapContainer = InheritFrom( LUI.UIElement )
CoD.KingslayerMinimapContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KingslayerMinimapContainer )
	self.id = "KingslayerMinimapContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.CompassMinimapStroke1 = LUI.UIImage.new()
	self.CompassMinimapStroke1:setLeftRight( true, false, 18, 196 )
	self.CompassMinimapStroke1:setTopBottom( true, false, 23, 201 )
	self.CompassMinimapStroke1:setImage( RegisterImage( "ui_t7_hud_minimap_circle_bg" ) )
	self.CompassMinimapStroke1:setRGB( 0, 0, 0 )
	self.CompassMinimapStroke1:setScale( 1 )
	self.CompassMinimapStroke1:setAlpha( 0.25 )
	self:addElement( self.CompassMinimapStroke1 )

	self.CompassMinimapStroke2 = LUI.UIImage.new()
	self.CompassMinimapStroke2:setLeftRight( true, false, 18, 196 )
	self.CompassMinimapStroke2:setTopBottom( true, false, 23, 201 )
	self.CompassMinimapStroke2:setImage( RegisterImage( "ui_t7_hud_minimap_circle_bg" ) )
	self.CompassMinimapStroke2:setRGB( 1, 1, 1 )
	self.CompassMinimapStroke2:setScale( 0.96 )
	self.CompassMinimapStroke2:setAlpha( 0.5 )
	self:addElement( self.CompassMinimapStroke2 )

	self.CompassMinimapStroke3 = LUI.UIImage.new()
	self.CompassMinimapStroke3:setLeftRight( true, false, 18, 196 )
	self.CompassMinimapStroke3:setTopBottom( true, false, 23, 201 )
	self.CompassMinimapStroke3:setImage( RegisterImage( "ui_t7_hud_minimap_circle_bg" ) )
	self.CompassMinimapStroke3:setRGB( 0.1, 0.1, 0.1 )
	self.CompassMinimapStroke3:setScale( 0.95 )
	self:addElement( self.CompassMinimapStroke3 )

	self.CompassMinimapBG = LUI.UIImage.new()
	self.CompassMinimapBG:setLeftRight( true, false, 18, 196 )
	self.CompassMinimapBG:setTopBottom( true, false, 23, 201 )
	self.CompassMinimapBG:setImage( RegisterImage( "ui_t7_hud_minimap_circle_bg" ) )
	self.CompassMinimapBG:setRGB( 0, 0, 0 )
	self.CompassMinimapBG:setScale( 0.91 )
	self:addElement( self.CompassMinimapBG )

	self.KingslayerMinimap = CoD.KingslayerMinimap.new( menu, controller )
	self.KingslayerMinimap:setLeftRight( true, true, 0, 0 )
	self.KingslayerMinimap:setTopBottom( true, true, 0, 0 )
	self.KingslayerMinimap:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( self.KingslayerMinimap )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.CompassMinimapStroke1:completeAnimation()
				self.CompassMinimapStroke1:setAlpha( 0.25 )
				self.clipFinished( self.CompassMinimapStroke1, {} )

				self.CompassMinimapStroke2:completeAnimation()
				self.CompassMinimapStroke2:setAlpha( 0.5 )
				self.clipFinished( self.CompassMinimapStroke2, {} )

				self.CompassMinimapStroke3:completeAnimation()
				self.CompassMinimapStroke3:setAlpha( 1 )
				self.clipFinished( self.CompassMinimapStroke3, {} )

				self.CompassMinimapBG:completeAnimation()
				self.CompassMinimapBG:setAlpha( 1 )
				self.clipFinished( self.CompassMinimapBG, {} )

				self.KingslayerMinimap:completeAnimation()
				self.KingslayerMinimap:setAlpha( 1 )
				self.clipFinished( self.KingslayerMinimap, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				self.CompassMinimapStroke1:completeAnimation()
				self.CompassMinimapStroke1:setAlpha( 0 )
				self.clipFinished( self.CompassMinimapStroke1, {} )

				self.CompassMinimapStroke2:completeAnimation()
				self.CompassMinimapStroke2:setAlpha( 0 )
				self.clipFinished( self.CompassMinimapStroke2, {} )

				self.CompassMinimapStroke3:completeAnimation()
				self.CompassMinimapStroke3:setAlpha( 0 )
				self.clipFinished( self.CompassMinimapStroke3, {} )

				self.CompassMinimapBG:completeAnimation()
				self.CompassMinimapBG:setAlpha( 0 )
				self.clipFinished( self.CompassMinimapBG, {} )

				self.KingslayerMinimap:completeAnimation()
				self.KingslayerMinimap:setAlpha( 0 )
				self.clipFinished( self.KingslayerMinimap, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
				and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
					return false
				else
					return true
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CompassMinimapStroke1:close()
		element.CompassMinimapStroke2:close()
		element.CompassMinimapStroke3:close()
		element.CompassMinimapBG:close()
		element.KingslayerMinimap:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
