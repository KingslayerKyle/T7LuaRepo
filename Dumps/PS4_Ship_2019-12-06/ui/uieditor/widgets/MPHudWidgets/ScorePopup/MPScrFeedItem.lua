CoD.MPScrFeedItem = InheritFrom( LUI.UIElement )
CoD.MPScrFeedItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPScrFeedItem )
	self.id = "MPScrFeedItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 18 )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 0, 240 )
	TextBox:setTopBottom( true, false, 0, 18 )
	TextBox:setText( Engine.Localize( "Killed Attacker" ) )
	TextBox:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextBox:completeAnimation()
				self.TextBox:setAlpha( 1 )
				self.clipFinished( TextBox, {} )
			end,
			NewLine = function ()
				self:setupElementClipCounter( 1 )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( true, false, 0, 240 )
					TextBox:setTopBottom( true, false, 0, 18 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, false, 0, 240 )
				self.TextBox:setTopBottom( true, false, 0, 4 )
				TextBoxFrame2( TextBox, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextBox:completeAnimation()
				self.TextBox:setAlpha( 0 )
				self.clipFinished( TextBox, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f6_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f6_local0 then
					f6_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
				end
				return f6_local0
			end
		}
	} )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

