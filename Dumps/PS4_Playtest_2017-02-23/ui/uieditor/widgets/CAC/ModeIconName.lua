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
	self:setLeftRight( 0, 0, 0, 435 )
	self:setTopBottom( 0, 0, 0, 76 )
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( 0, 0, 0, 46 )
	GameModeIcon:setTopBottom( 0, 0, 0, 46 )
	GameModeIcon:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeIcon:setImage( RegisterImage( SessionModeToSessionModeImage( modelValue ) ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameModeText = LUI.UIText.new()
	GameModeText:setLeftRight( 0, 0, 57, 435 )
	GameModeText:setTopBottom( 0, 0, 0, 45 )
	GameModeText:setTTF( "fonts/escom.ttf" )
	GameModeText:setLetterSpacing( 1 )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameModeText:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeText:setText( SessionModeToLocalizedSessionMode( modelValue ) )
		end
	end )
	self:addElement( GameModeText )
	self.GameModeText = GameModeText
	
	local GameModeDescription = LUI.UIText.new()
	GameModeDescription:setLeftRight( 0, 0, 5, 435 )
	GameModeDescription:setTopBottom( 1, 1, -30, 0 )
	GameModeDescription:setTTF( "fonts/escom.ttf" )
	GameModeDescription:setLetterSpacing( 1 )
	GameModeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameModeDescription:linkToElementModel( self, "unlockSessionMode", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeDescription:setText( PersonalizationItemUnlockModeDesc( "unlockSessionMode", modelValue ) )
		end
	end )
	self:addElement( GameModeDescription )
	self.GameModeDescription = GameModeDescription
	
	self.resetProperties = function ()
		GameModeIcon:completeAnimation()
		GameModeText:completeAnimation()
		GameModeDescription:completeAnimation()
		GameModeIcon:setAlpha( 1 )
		GameModeText:setAlpha( 1 )
		GameModeDescription:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualToEnumOrSelfModelNil( element, controller, "unlockSessionMode", Enum.eModes.MODE_INVALID )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameModeIcon:close()
		self.GameModeText:close()
		self.GameModeDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

