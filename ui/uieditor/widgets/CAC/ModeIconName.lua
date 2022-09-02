-- 94af7c987162aff3a45c31c8251cbef1
-- This hash is used for caching, delete to decompile the file again

CoD.ModeIconName = InheritFrom( LUI.UIElement )
CoD.ModeIconName.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ModeIconName )
	self.id = "ModeIconName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 290 )
	self:setTopBottom( true, false, 0, 51 )
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( true, false, 0, 31 )
	GameModeIcon:setTopBottom( true, false, 0, 31 )
	GameModeIcon:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		local unlockSessionMode = Engine.GetModelValue( model )
		if unlockSessionMode then
			GameModeIcon:setImage( RegisterImage( SessionModeToSessionModeImage( unlockSessionMode ) ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameModeText = LUI.UIText.new()
	GameModeText:setLeftRight( true, false, 38, 290 )
	GameModeText:setTopBottom( true, false, 0, 30 )
	GameModeText:setTTF( "fonts/escom.ttf" )
	GameModeText:setLetterSpacing( 1 )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameModeText:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		local unlockSessionMode = Engine.GetModelValue( model )
		if unlockSessionMode then
			GameModeText:setText( SessionModeToLocalizedSessionMode( unlockSessionMode ) )
		end
	end )
	self:addElement( GameModeText )
	self.GameModeText = GameModeText
	
	local GameModeDescription = LUI.UIText.new()
	GameModeDescription:setLeftRight( true, false, 3, 290 )
	GameModeDescription:setTopBottom( false, true, -20, 0 )
	GameModeDescription:setTTF( "fonts/escom.ttf" )
	GameModeDescription:setLetterSpacing( 1 )
	GameModeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameModeDescription:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		local unlockSessionMode = Engine.GetModelValue( model )
		if unlockSessionMode then
			GameModeDescription:setText( PersonalizationItemUnlockModeDesc( "unlockSessionMode", unlockSessionMode ) )
		end
	end )
	self:addElement( GameModeDescription )
	self.GameModeDescription = GameModeDescription
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 0 )
				self.clipFinished( GameModeIcon, {} )

				GameModeText:completeAnimation()
				self.GameModeText:setAlpha( 0 )
				self.clipFinished( GameModeText, {} )

				GameModeDescription:completeAnimation()
				self.GameModeDescription:setAlpha( 0 )
				self.clipFinished( GameModeDescription, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 1 )
				self.clipFinished( GameModeIcon, {} )

				GameModeText:completeAnimation()
				self.GameModeText:setAlpha( 1 )
				self.clipFinished( GameModeText, {} )

				GameModeDescription:completeAnimation()
				self.GameModeDescription:setAlpha( 1 )
				self.clipFinished( GameModeDescription, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsSelfModelValueEqualToEnumOrSelfModelNil( element, controller, "unlockSessionMode", Enum.eModes.MODE_INVALID ) then
					f7_local0 = not IsSelfModelValueEqualTo( element, controller, "filterMode", "extras" )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	self:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockSessionMode"
		} )
	end )
	self:linkToElementModel( self, "filterMode", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "filterMode"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameModeIcon:close()
		element.GameModeText:close()
		element.GameModeDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

