CoD.SpecialControls = InheritFrom( LUI.UIElement )
CoD.SpecialControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialControls )
	self.id = "SpecialControls"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 26 )
	
	local ControlHints = LUI.UIText.new()
	ControlHints:setLeftRight( true, false, 0, 408 )
	ControlHints:setTopBottom( true, false, 0, 26 )
	ControlHints:setText( Engine.Localize( "ZM_ZOD_EXIT_BEAST_MODE_HINT_COOP" ) )
	ControlHints:setTTF( "fonts/default.ttf" )
	ControlHints:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ControlHints:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ControlHints )
	self.ControlHints = ControlHints
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ControlHints:completeAnimation()
				self.ControlHints:setAlpha( 0 )
				self.clipFinished( ControlHints, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ControlHints:completeAnimation()
				self.ControlHints:setAlpha( 1 )
				self.clipFinished( ControlHints, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

