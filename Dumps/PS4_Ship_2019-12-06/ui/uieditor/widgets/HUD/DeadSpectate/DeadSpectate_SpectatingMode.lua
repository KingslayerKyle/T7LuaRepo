require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate_SpectatingModeButtonPrompt" )

CoD.DeadSpectate_SpectatingMode = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_SpectatingMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DeadSpectate_SpectatingMode )
	self.id = "DeadSpectate_SpectatingMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local switchPrompt0 = LUI.UITightText.new()
	switchPrompt0:setLeftRight( false, false, -30.5, 60.5 )
	switchPrompt0:setTopBottom( true, false, 2.5, 22.5 )
	switchPrompt0:setText( Engine.Localize( "MPUI_FIRST_PERSON_VIEW" ) )
	switchPrompt0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	switchPrompt0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	switchPrompt0:setShaderVector( 0, 0, 0, 0, 0 )
	switchPrompt0:setShaderVector( 1, 0, 0, 0, 0 )
	switchPrompt0:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( switchPrompt0 )
	self.switchPrompt0 = switchPrompt0
	
	local button = CoD.DeadSpectate_SpectatingModeButtonPrompt.new( menu, controller )
	button:setLeftRight( false, false, -59.5, -34.5 )
	button:setTopBottom( true, false, 0, 25 )
	self:addElement( button )
	self.button = button
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				switchPrompt0:completeAnimation()
				self.switchPrompt0:setAlpha( 0 )
				self.clipFinished( switchPrompt0, {} )
				button:completeAnimation()
				self.button:setAlpha( 0 )
				self.clipFinished( button, {} )
			end
		},
		FirstPerson = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				switchPrompt0:completeAnimation()
				self.switchPrompt0:setAlpha( 1 )
				self.switchPrompt0:setText( Engine.Localize( "MPUI_FIRST_PERSON_VIEW" ) )
				self.clipFinished( switchPrompt0, {} )
				button:completeAnimation()
				self.button:setAlpha( 1 )
				self.clipFinished( button, {} )
			end
		},
		ThirdPerson = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				switchPrompt0:completeAnimation()
				self.switchPrompt0:setAlpha( 1 )
				self.switchPrompt0:setText( Engine.Localize( "MPUI_THIRD_PERSON_VIEW" ) )
				self.clipFinished( switchPrompt0, {} )
				button:completeAnimation()
				self.button:setAlpha( 1 )
				self.clipFinished( button, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FirstPerson",
			condition = function ( menu, element, event )
				local f5_local0 = IsActiveLocalClientsCountEqualTo( 1 )
				if f5_local0 then
					f5_local0 = IsGametypeSettingsValue( "disableThirdPersonSpectating", 0 )
					if f5_local0 then
						f5_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON )
						if f5_local0 then
							if not IsSplitscreenAndInGame( controller ) then
								f5_local0 = not IsArenaMode()
							else
								f5_local0 = false
							end
						end
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "ThirdPerson",
			condition = function ( menu, element, event )
				local f6_local0 = IsActiveLocalClientsCountEqualTo( 1 )
				if f6_local0 then
					f6_local0 = IsGametypeSettingsValue( "disableThirdPersonSpectating", 0 )
					if f6_local0 then
						if not IsSplitscreenAndInGame( controller ) then
							f6_local0 = not IsArenaMode()
						else
							f6_local0 = false
						end
					end
				end
				return f6_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.button:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

