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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.9 )
	self:addElement( Background )
	self.Background = Background
	
	local RedLine = LUI.UIImage.new()
	RedLine:setLeftRight( 0, 0, 0, 1920 )
	RedLine:setTopBottom( 0, 0, 310, 318 )
	RedLine:setRGB( 1, 0.6, 0 )
	RedLine:setAlpha( 0.82 )
	self:addElement( RedLine )
	self.RedLine = RedLine
	
	local BodyBackground = LUI.UIImage.new()
	BodyBackground:setLeftRight( 0, 0, 0, 1920 )
	BodyBackground:setTopBottom( 0, 0, 314, 845 )
	BodyBackground:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( BodyBackground )
	self.BodyBackground = BodyBackground
	
	local PromptBackground = LUI.UIImage.new()
	PromptBackground:setLeftRight( 0, 0, 0, 1920 )
	PromptBackground:setTopBottom( 0, 0, 845, 917 )
	PromptBackground:setRGB( 0.24, 0.24, 0.24 )
	self:addElement( PromptBackground )
	self.PromptBackground = PromptBackground
	
	local DialogSpinner0 = CoD.DialogSpinner.new( menu, controller )
	DialogSpinner0:setLeftRight( 0, 0, 804, 996 )
	DialogSpinner0:setTopBottom( 0, 0, 540, 732 )
	self:addElement( DialogSpinner0 )
	self.DialogSpinner0 = DialogSpinner0
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 690, 990 )
	Title:setTopBottom( 0, 0, 365, 437 )
	Title:setText( Engine.Localize( "MENU_NEW" ) )
	Title:setTTF( "fonts/default.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( 0, 0, 690, 1538 )
	Subtitle:setTopBottom( 0, 0, 435, 473 )
	Subtitle:setText( Engine.Localize( "MENU_NEW" ) )
	Subtitle:setTTF( "fonts/default.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local WorkingTitle = LUI.UITightText.new()
	WorkingTitle:setLeftRight( 0, 0, 690, 990 )
	WorkingTitle:setTopBottom( 0, 0, 365, 437 )
	WorkingTitle:setText( Engine.Localize( "MENU_NEW" ) )
	WorkingTitle:setTTF( "fonts/default.ttf" )
	self:addElement( WorkingTitle )
	self.WorkingTitle = WorkingTitle
	
	local DoneTitle = LUI.UITightText.new()
	DoneTitle:setLeftRight( 0, 0, 690, 990 )
	DoneTitle:setTopBottom( 0, 0, 365, 437 )
	DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	DoneTitle:setTTF( "fonts/default.ttf" )
	self:addElement( DoneTitle )
	self.DoneTitle = DoneTitle
	
	local ErrorTitle = LUI.UITightText.new()
	ErrorTitle:setLeftRight( 0, 0, 690, 990 )
	ErrorTitle:setTopBottom( 0, 0, 365, 437 )
	ErrorTitle:setAlpha( 0 )
	ErrorTitle:setText( Engine.Localize( "MENU_ERROR_CAPS" ) )
	ErrorTitle:setTTF( "fonts/default.ttf" )
	self:addElement( ErrorTitle )
	self.ErrorTitle = ErrorTitle
	
	local ErrorSubtitle = LUI.UIText.new()
	ErrorSubtitle:setLeftRight( 0, 0, 690, 1538 )
	ErrorSubtitle:setTopBottom( 0, 0, 435, 473 )
	ErrorSubtitle:setText( Engine.Localize( "MENU_NEW" ) )
	ErrorSubtitle:setTTF( "fonts/default.ttf" )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ErrorSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ErrorSubtitle )
	self.ErrorSubtitle = ErrorSubtitle
	
	self.resetProperties = function ()
		WorkingTitle:completeAnimation()
		DialogSpinner0:completeAnimation()
		DoneTitle:completeAnimation()
		ErrorSubtitle:completeAnimation()
		Title:completeAnimation()
		Subtitle:completeAnimation()
		ErrorTitle:completeAnimation()
		WorkingTitle:setAlpha( 1 )
		DialogSpinner0:setAlpha( 1 )
		DoneTitle:setAlpha( 1 )
		ErrorSubtitle:setAlpha( 1 )
		Title:setAlpha( 1 )
		Subtitle:setAlpha( 1 )
		Subtitle:setText( Engine.Localize( "MENU_NEW" ) )
		ErrorTitle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		WorkingState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				Subtitle:completeAnimation()
				self.Subtitle:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
				self.clipFinished( Subtitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		ErrorState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
			end
		},
		CustomState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				DialogSpinner0:completeAnimation()
				self.DialogSpinner0:setAlpha( 0 )
				self.clipFinished( DialogSpinner0, {} )
				WorkingTitle:completeAnimation()
				self.WorkingTitle:setAlpha( 0 )
				self.clipFinished( WorkingTitle, {} )
				DoneTitle:completeAnimation()
				self.DoneTitle:setAlpha( 0 )
				self.clipFinished( DoneTitle, {} )
				ErrorSubtitle:completeAnimation()
				self.ErrorSubtitle:setAlpha( 0 )
				self.clipFinished( ErrorSubtitle, {} )
			end
		},
		DoneState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
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

