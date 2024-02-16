require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )

CoD.FullscreeenPupupSteamForm = InheritFrom( LUI.UIElement )
CoD.FullscreeenPupupSteamForm.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FullscreeenPupupSteamForm )
	self.id = "FullscreeenPupupSteamForm"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.9 )
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
	BodyBackground:setTopBottom( true, false, 209.38, 563.16 )
	BodyBackground:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local PromptBackground = LUI.UIImage.new()
	PromptBackground:setLeftRight( true, false, 0, 1280 )
	PromptBackground:setTopBottom( true, false, 563.16, 611.16 )
	PromptBackground:setRGB( 0.24, 0.24, 0.24 )
	self:addElement( PromptBackground )
	self.PromptBackground = PromptBackground
	
	local DialogSpinner0 = CoD.DialogSpinner.new( menu, controller )
	DialogSpinner0:setLeftRight( true, false, 536.07, 664.07 )
	DialogSpinner0:setTopBottom( true, false, 360, 488 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 460.07, 660.07 )
	Title:setTopBottom( true, false, 243.26, 291.26 )
	Title:setText( Engine.Localize( "MENU_NEW" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 460.07, 1025.07 )
	Subtitle:setTopBottom( true, false, 290.41, 315.41 )
	Subtitle:setText( Engine.Localize( "MENU_NEW" ) )
	Subtitle:setTTF( "fonts/default.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local WorkingTitle = LUI.UITightText.new()
	WorkingTitle:setLeftRight( true, false, 460.07, 660.07 )
	WorkingTitle:setTopBottom( true, false, 243.26, 291.26 )
	WorkingTitle:setText( Engine.Localize( "MENU_NEW" ) )
	WorkingTitle:setTTF( "fonts/default.ttf" )
	self:addElement( WorkingTitle )
	self.WorkingTitle = WorkingTitle
	
	local DoneTitle = LUI.UITightText.new()
	DoneTitle:setLeftRight( true, false, 460.07, 660.07 )
	DoneTitle:setTopBottom( true, false, 243.26, 291.26 )
	DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	DoneTitle:setTTF( "fonts/default.ttf" )
	self:addElement( DoneTitle )
	self.DoneTitle = DoneTitle
	
	local ErrorTitle = LUI.UITightText.new()
	ErrorTitle:setLeftRight( true, false, 460.07, 660.07 )
	ErrorTitle:setTopBottom( true, false, 243.26, 291.26 )
	ErrorTitle:setAlpha( 0 )
	ErrorTitle:setText( Engine.Localize( "MENU_ERROR_CAPS" ) )
	ErrorTitle:setTTF( "fonts/default.ttf" )
	self:addElement( ErrorTitle )
	self.ErrorTitle = ErrorTitle
	
	local ErrorSubtitle = LUI.UIText.new()
	ErrorSubtitle:setLeftRight( true, false, 460.07, 1025.07 )
	ErrorSubtitle:setTopBottom( true, false, 290.41, 315.41 )
	ErrorSubtitle:setText( Engine.Localize( "MENU_NEW" ) )
	ErrorSubtitle:setTTF( "fonts/default.ttf" )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ErrorSubtitle )
	self.ErrorSubtitle = ErrorSubtitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 1 )
				self.clipFinished( Subtitle, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
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
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 1 )
				self.Subtitle:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
				self.clipFinished( Subtitle, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 1 )
				self.clipFinished( WorkingTitle, {} )
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
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 0 )
				self.Subtitle:setText( Engine.Localize( "" ) )
				self.clipFinished( Subtitle, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
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
		CustomState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 1 )
				self.clipFinished( Subtitle, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
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
		DoneState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setAlpha( 0 )
				self.clipFinished( Subtitle, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 1 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DialogSpinner0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

