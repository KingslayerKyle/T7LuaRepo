require( "ui.uieditor.widgets.Reticles.BlackCell.BlackCellInternal" )

local PreLoadFunc = function ( self, controller )
	self:setupReticle( controller )
end

CoD.BlackCell = InheritFrom( LUI.UIElement )
CoD.BlackCell.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackCell )
	self.id = "BlackCell"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.BlackCellInternal.new( menu, controller )
	internal:setLeftRight( false, false, -640, 640 )
	internal:setTopBottom( false, false, -360, 360 )
	internal:setAlpha( 0 )
	internal:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end
		},
		ADS = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ADS",
			condition = function ( menu, element, event )
				local f6_local0 = IsModelValueTrue( controller, "currentWeapon.lookingDownSights" )
				if f6_local0 then
					if (not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DRAW_RETICLE ) or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON )) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON ) then
						f6_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					else
						f6_local0 = false
					end
				end
				return f6_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lookingDownSights" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lookingDownSights"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_RETICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_RETICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_THIRDPERSON
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

