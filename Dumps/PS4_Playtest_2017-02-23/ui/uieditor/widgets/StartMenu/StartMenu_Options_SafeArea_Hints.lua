require( "ui.uieditor.widgets.buttonprompt" )

CoD.StartMenu_Options_SafeArea_Hints = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_SafeArea_Hints.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_SafeArea_Hints )
	self.id = "StartMenu_Options_SafeArea_Hints"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local InstructionText = LUI.UIText.new()
	InstructionText:setLeftRight( 0, 1, 0, 0 )
	InstructionText:setTopBottom( 0.5, 0.5, -87, -49 )
	InstructionText:setText( Engine.Localize( "PLATFORM_SAFEAREA_INSTRUCTIONS" ) )
	InstructionText:setTTF( "fonts/default.ttf" )
	InstructionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	InstructionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( InstructionText )
	self.InstructionText = InstructionText
	
	local HorizontalAdjustment = LUI.UIText.new()
	HorizontalAdjustment:setLeftRight( 0, 1, 0, 0 )
	HorizontalAdjustment:setTopBottom( 0.5, 0.5, 11, 49 )
	HorizontalAdjustment:setText( Engine.Localize( "PLATFORM_SAFE_AREA_ADJUST_HORIZONTAL" ) )
	HorizontalAdjustment:setTTF( "fonts/default.ttf" )
	HorizontalAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HorizontalAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HorizontalAdjustment )
	self.HorizontalAdjustment = HorizontalAdjustment
	
	local VerticalAdjustment = LUI.UIText.new()
	VerticalAdjustment:setLeftRight( 0, 1, 0, 0 )
	VerticalAdjustment:setTopBottom( 0.5, 0.5, 49, 87 )
	VerticalAdjustment:setText( Engine.Localize( "PLATFORM_SAFE_AREA_ADJUST_VERTICAL" ) )
	VerticalAdjustment:setTTF( "fonts/default.ttf" )
	VerticalAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VerticalAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VerticalAdjustment )
	self.VerticalAdjustment = VerticalAdjustment
	
	local SafeAreaAdjustment = LUI.UIText.new()
	SafeAreaAdjustment:setLeftRight( 0, 0, 0, 1920 )
	SafeAreaAdjustment:setTopBottom( 0, 0, 317, 368 )
	SafeAreaAdjustment:setText( Engine.Localize( "MENU_SAFE_AREA_ADJUSTMENT" ) )
	SafeAreaAdjustment:setTTF( "fonts/default.ttf" )
	SafeAreaAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SafeAreaAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SafeAreaAdjustment )
	self.SafeAreaAdjustment = SafeAreaAdjustment
	
	local ConfirmButtonPrompt = CoD.buttonprompt.new( menu, controller )
	ConfirmButtonPrompt:setLeftRight( 0, 0, 888, 1032 )
	ConfirmButtonPrompt:setTopBottom( 0, 0, 706, 752 )
	ConfirmButtonPrompt.label:setText( Engine.Localize( "MENU_EMBLEM_CONFIRM_CHANGES" ) )
	ConfirmButtonPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ConfirmButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ConfirmButtonPrompt )
	self.ConfirmButtonPrompt = ConfirmButtonPrompt
	
	local GotItButtonPrompt = CoD.buttonprompt.new( menu, controller )
	GotItButtonPrompt:setLeftRight( 0, 0, 888, 1030 )
	GotItButtonPrompt:setTopBottom( 0, 0, 706, 752 )
	GotItButtonPrompt.label:setText( Engine.Localize( "MENU_WELCOME_MENU_GOT_IT" ) )
	GotItButtonPrompt:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GotItButtonPrompt.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GotItButtonPrompt )
	self.GotItButtonPrompt = GotItButtonPrompt
	
	local DisplayAreaAdjustment = LUI.UIText.new()
	DisplayAreaAdjustment:setLeftRight( 0, 0, 0, 1920 )
	DisplayAreaAdjustment:setTopBottom( 0, 0, 317, 368 )
	DisplayAreaAdjustment:setText( Engine.Localize( "MENU_DISPLAY_AREA_ADJUSTMENT" ) )
	DisplayAreaAdjustment:setTTF( "fonts/default.ttf" )
	DisplayAreaAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DisplayAreaAdjustment:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DisplayAreaAdjustment )
	self.DisplayAreaAdjustment = DisplayAreaAdjustment
	
	local BestResults = LUI.UIText.new()
	BestResults:setLeftRight( 0, 0, 0, 1920 )
	BestResults:setTopBottom( 0, 0, 398, 436 )
	BestResults:setText( Engine.Localize( "MENU_SAFE_AREA_BEST_RESULTS" ) )
	BestResults:setTTF( "fonts/default.ttf" )
	BestResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BestResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestResults )
	self.BestResults = BestResults
	
	local SettingPS4 = LUI.UIText.new()
	SettingPS4:setLeftRight( 0, 0, 0, 1920 )
	SettingPS4:setTopBottom( 0, 0, 460, 498 )
	SettingPS4:setText( Engine.Localize( "MENU_SETTING_CONTROLLED" ) )
	SettingPS4:setTTF( "fonts/default.ttf" )
	SettingPS4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SettingPS4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SettingPS4 )
	self.SettingPS4 = SettingPS4
	
	local AdjustInSoundAndScreen = LUI.UIText.new()
	AdjustInSoundAndScreen:setLeftRight( 0, 0, 0, 1920 )
	AdjustInSoundAndScreen:setTopBottom( 0, 0, 628, 666 )
	AdjustInSoundAndScreen:setText( Engine.Localize( "MENU_ADJUST_SAFE_AREA_VISIT" ) )
	AdjustInSoundAndScreen:setTTF( "fonts/default.ttf" )
	AdjustInSoundAndScreen:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AdjustInSoundAndScreen:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AdjustInSoundAndScreen )
	self.AdjustInSoundAndScreen = AdjustInSoundAndScreen
	
	self.resetProperties = function ()
		SafeAreaAdjustment:completeAnimation()
		VerticalAdjustment:completeAnimation()
		HorizontalAdjustment:completeAnimation()
		InstructionText:completeAnimation()
		ConfirmButtonPrompt:completeAnimation()
		AdjustInSoundAndScreen:completeAnimation()
		SettingPS4:completeAnimation()
		BestResults:completeAnimation()
		DisplayAreaAdjustment:completeAnimation()
		GotItButtonPrompt:completeAnimation()
		SafeAreaAdjustment:setAlpha( 1 )
		VerticalAdjustment:setAlpha( 1 )
		HorizontalAdjustment:setAlpha( 1 )
		InstructionText:setAlpha( 1 )
		ConfirmButtonPrompt:setAlpha( 1 )
		AdjustInSoundAndScreen:setAlpha( 1 )
		SettingPS4:setAlpha( 1 )
		BestResults:setAlpha( 1 )
		DisplayAreaAdjustment:setAlpha( 1 )
		GotItButtonPrompt:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				InstructionText:completeAnimation()
				self.InstructionText:setAlpha( 0 )
				self.clipFinished( InstructionText, {} )
				HorizontalAdjustment:completeAnimation()
				self.HorizontalAdjustment:setAlpha( 0 )
				self.clipFinished( HorizontalAdjustment, {} )
				VerticalAdjustment:completeAnimation()
				self.VerticalAdjustment:setAlpha( 0 )
				self.clipFinished( VerticalAdjustment, {} )
				SafeAreaAdjustment:completeAnimation()
				self.SafeAreaAdjustment:setAlpha( 0 )
				self.clipFinished( SafeAreaAdjustment, {} )
				ConfirmButtonPrompt:completeAnimation()
				self.ConfirmButtonPrompt:setAlpha( 0 )
				self.clipFinished( ConfirmButtonPrompt, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				GotItButtonPrompt:completeAnimation()
				self.GotItButtonPrompt:setAlpha( 0 )
				self.clipFinished( GotItButtonPrompt, {} )
				DisplayAreaAdjustment:completeAnimation()
				self.DisplayAreaAdjustment:setAlpha( 0 )
				self.clipFinished( DisplayAreaAdjustment, {} )
				BestResults:completeAnimation()
				self.BestResults:setAlpha( 0 )
				self.clipFinished( BestResults, {} )
				SettingPS4:completeAnimation()
				self.SettingPS4:setAlpha( 0 )
				self.clipFinished( SettingPS4, {} )
				AdjustInSoundAndScreen:completeAnimation()
				self.AdjustInSoundAndScreen:setAlpha( 0 )
				self.clipFinished( AdjustInSoundAndScreen, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurango()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ConfirmButtonPrompt:close()
		self.GotItButtonPrompt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

