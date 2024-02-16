CoD.GameSettings_Description = InheritFrom( LUI.UIElement )
CoD.GameSettings_Description.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_Description )
	self.id = "GameSettings_Description"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 489 )
	self:setTopBottom( true, false, 0, 135 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 489 )
	Image0:setTopBottom( true, false, 0, 135 )
	Image0:setRGB( 0.5, 0.5, 0.5 )
	Image0:setAlpha( 0.25 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 23.5, 465.5 )
	Title:setTopBottom( true, false, 42.5, 67.5 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 23.5, 465.5 )
	TextBox0:setTopBottom( true, false, 10, 44 )
	TextBox0:setRGB( 0.97, 0.56, 0.03 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "GametypeSettings", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GameSettingsGameModeRulesList0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Title:close()
		self.TextBox0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

