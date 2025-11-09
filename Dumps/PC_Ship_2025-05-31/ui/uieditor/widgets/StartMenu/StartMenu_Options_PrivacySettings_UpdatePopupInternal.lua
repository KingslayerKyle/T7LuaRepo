require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )

CoD.StartMenu_Options_PrivacySettings_UpdatePopupInternal = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PrivacySettings_UpdatePopupInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PrivacySettings_UpdatePopupInternal )
	self.id = "StartMenu_Options_PrivacySettings_UpdatePopupInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 523, 0 )
	darkbg:setRGB( 0.17, 0.16, 0.16 )
	darkbg:setAlpha( 0.95 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 2, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local darkbg0 = LUI.UIImage.new()
	darkbg0:setLeftRight( true, true, 0, 0 )
	darkbg0:setTopBottom( true, true, -20, -507.62 )
	darkbg0:setRGB( 0.17, 0.16, 0.16 )
	darkbg0:setAlpha( 0.95 )
	self:addElement( darkbg0 )
	self.darkbg0 = darkbg0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local RedLine = LUI.UIImage.new()
	RedLine:setLeftRight( true, false, 0, 1280 )
	RedLine:setTopBottom( true, false, 206.88, 211.88 )
	RedLine:setRGB( 1, 0.6, 0 )
	RedLine:setAlpha( 0.82 )
	self:addElement( RedLine )
	self.RedLine = RedLine
	
	local BodyBackground = LUI.UIImage.new()
	BodyBackground:setLeftRight( true, false, 0, 1280 )
	BodyBackground:setTopBottom( true, false, 212.38, 524.85 )
	BodyBackground:setRGB( 0.1, 0.1, 0.1 )
	BodyBackground:setAlpha( 0.95 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local Ambers = LUI.UIImage.new()
	Ambers:setLeftRight( true, false, 0, 1280 )
	Ambers:setTopBottom( true, false, 212.38, 523 )
	Ambers:setAlpha( 0.65 )
	Ambers:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Ambers )
	self.Ambers = Ambers
	
	local PromptBackground = LUI.UIImage.new()
	PromptBackground:setLeftRight( true, false, 0, 1280 )
	PromptBackground:setTopBottom( true, false, 523, 574.73 )
	PromptBackground:setRGB( 0, 0, 0 )
	self:addElement( PromptBackground )
	self.PromptBackground = PromptBackground
	
	local DialogSpinner0 = CoD.DialogSpinner.new( menu, controller )
	DialogSpinner0:setLeftRight( true, false, 536.07, 664.07 )
	DialogSpinner0:setTopBottom( true, false, 327, 455 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	local WorkingTitle = LUI.UITightText.new()
	WorkingTitle:setLeftRight( true, false, 460.07, 740.07 )
	WorkingTitle:setTopBottom( true, false, 228.26, 262.26 )
	WorkingTitle:setText( Engine.Localize( "MENU_NEW" ) )
	WorkingTitle:setTTF( "fonts/default.ttf" )
	self:addElement( WorkingTitle )
	self.WorkingTitle = WorkingTitle
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 460.07, 742.57 )
	Title:setTopBottom( true, false, 228.26, 262.26 )
	Title:setText( Engine.Localize( "MENU_NEW" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 460.07, 742.57 )
	Subtitle:setTopBottom( true, false, 268.41, 288.41 )
	Subtitle:setText( Engine.Localize( "MENU_NEW" ) )
	Subtitle:setTTF( "fonts/default.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local DoneTitle = LUI.UITightText.new()
	DoneTitle:setLeftRight( true, false, 460.07, 766.07 )
	DoneTitle:setTopBottom( true, false, 228.26, 262.26 )
	DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	DoneTitle:setTTF( "fonts/default.ttf" )
	self:addElement( DoneTitle )
	self.DoneTitle = DoneTitle
	
	local ErrorTitle = LUI.UITightText.new()
	ErrorTitle:setLeftRight( true, false, 460.07, 742.57 )
	ErrorTitle:setTopBottom( true, false, 228.26, 262.26 )
	ErrorTitle:setAlpha( 0 )
	ErrorTitle:setText( Engine.Localize( "MENU_ERROR_CAPS" ) )
	ErrorTitle:setTTF( "fonts/default.ttf" )
	self:addElement( ErrorTitle )
	self.ErrorTitle = ErrorTitle
	
	local ErrorSubtitle = LUI.UIText.new()
	ErrorSubtitle:setLeftRight( true, false, 460.07, 1001.57 )
	ErrorSubtitle:setTopBottom( true, false, 268.41, 293.41 )
	ErrorSubtitle:setText( Engine.Localize( "MENU_NEW" ) )
	ErrorSubtitle:setTTF( "fonts/default.ttf" )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ErrorSubtitle )
	self.ErrorSubtitle = ErrorSubtitle
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, 0, 0 )
	LineLeft:setTopBottom( false, true, -197, -192.85 )
	LineLeft:setAlpha( 0.9 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 1 )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorTitle:completeAnimation()
				self.ErrorTitle:setAlpha( 0 )
				self.clipFinished( ErrorTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		WorkingState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 1 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 1 )
				self.clipFinished( WorkingTitle, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 1 )
				self.Subtitle:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorTitle:completeAnimation()
				self.ErrorTitle:setAlpha( 0 )
				self.clipFinished( ErrorTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		ErrorState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 0 )
				self.Subtitle:setText( Engine.Localize( "" ) )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorTitle:completeAnimation()
				self.ErrorTitle:setAlpha( 1 )
				self.clipFinished( ErrorTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 1 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		DoneState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 0 )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 1 )
				self.clipFinished( DoneTitle, {} )
				ErrorTitle:completeAnimation()
				self.ErrorTitle:setAlpha( 0 )
				self.clipFinished( ErrorTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		CustomState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 1 )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorTitle:completeAnimation()
				self.ErrorTitle:setAlpha( 0 )
				self.clipFinished( ErrorTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS )
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED )
			end
		},
		{
			stateName = "DoneState",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_COMPLETE )
			end
		},
		{
			stateName = "CustomState",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrivacySettingManagementForm.updateProgressState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PrivacySettingManagementForm.updateProgressState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.DialogSpinner0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

