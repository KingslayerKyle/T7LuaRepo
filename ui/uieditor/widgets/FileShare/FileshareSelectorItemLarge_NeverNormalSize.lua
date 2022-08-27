-- dfc54cbda889b09553cf6b560e8ed66b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareSelectorItemLarge_Image" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.FileShare.FileshareBookmarkedItem" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.FileshareSelectorItemLarge_NeverNormalSize = InheritFrom( LUI.UIElement )
CoD.FileshareSelectorItemLarge_NeverNormalSize.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectorItemLarge_NeverNormalSize )
	self.id = "FileshareSelectorItemLarge_NeverNormalSize"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 151 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Image = CoD.FileshareSelectorItemLarge_Image.new( menu, controller )
	Image:setLeftRight( false, false, -117.5, 117.5 )
	Image:setTopBottom( false, false, -75.5, 75.5 )
	Image:linkToElementModel( self, nil, false, function ( model )
		Image:setModel( model, controller )
	end )
	Image:linkToElementModel( self, "showFileImage", true, function ( model )
		local showFileImage = Engine.GetModelValue( model )
		if showFileImage then
			Image.WCFileshareIconExtraCamRender0:setAlpha( showFileImage )
		end
	end )
	Image:linkToElementModel( self, "renderFileId", true, function ( model )
		local renderFileId = Engine.GetModelValue( model )
		if renderFileId then
			Image.WCFileshareIconExtraCamRender0:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, renderFileId ) )
		end
	end )
	Image:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			Image.MapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	Image:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			Image.Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", fileId ) )
		end
	end )
	Image:mergeStateConditions( {
		{
			stateName = "InvalidNormal",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsSelfModelValueTrue( element, controller, "isValid" ) then
					f7_local0 = FileshareIsElementNormalSizeIcon( self, element, controller )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "InvalidShort",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsSelfModelValueTrue( element, controller, "isValid" ) then
					f8_local0 = not FileshareIsElementNormalSizeIcon( self, element, controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsFileshareCategoryFilm( self, element, controller ) and not IsFileshareCategoryClip( self, element, controller ) and not IsFileshareCategoryScreenshot( self, element, controller ) then
					f9_local0 = not FileshareIsElementNormalSizeIcon( self, element, controller )
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Film",
			condition = function ( menu, element, event )
				return IsFileshareCategoryFilm( self, element, controller ) and not FileshareIsElementNormalSizeIcon( self, element, controller )
			end
		},
		{
			stateName = "Clip",
			condition = function ( menu, element, event )
				return IsFileshareCategoryClip( self, element, controller ) and not FileshareIsElementNormalSizeIcon( self, element, controller )
			end
		},
		{
			stateName = "Screenshot",
			condition = function ( menu, element, event )
				return IsFileshareCategoryScreenshot( self, element, controller ) and not FileshareIsElementNormalSizeIcon( self, element, controller )
			end
		}
	} )
	Image:linkToElementModel( Image, "isValid", true, function ( model )
		menu:updateElementState( Image, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isValid"
		} )
	end )
	self:addElement( Image )
	self.Image = Image
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -1, 1 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, -25 )
	BoxButtonLrgIdle:setAlpha( 0.24 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( false, false, -54.5, 61.5 )
	GameTypeImage:setTopBottom( false, false, -71.75, 44.25 )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local BarBg = LUI.UIImage.new()
	BarBg:setLeftRight( true, true, 0, 0 )
	BarBg:setTopBottom( false, true, -25, 0 )
	BarBg:setRGB( 0, 0, 0 )
	BarBg:setAlpha( 0.8 )
	self:addElement( BarBg )
	self.BarBg = BarBg
	
	local CategoryImage = LUI.UIImage.new()
	CategoryImage:setLeftRight( true, false, 3, 20.5 )
	CategoryImage:setTopBottom( false, true, -22, -4 )
	CategoryImage:linkToElementModel( self, "fileCategory", true, function ( model )
		local fileCategory = Engine.GetModelValue( model )
		if fileCategory then
			CategoryImage:setImage( RegisterImage( FileshareGetCategoryIcon( fileCategory ) ) )
		end
	end )
	self:addElement( CategoryImage )
	self.CategoryImage = CategoryImage
	
	local TimeText = LUI.UIText.new()
	TimeText:setLeftRight( true, false, 23.88, 225 )
	TimeText:setTopBottom( false, true, -22.5, -4.5 )
	TimeText:setTTF( "fonts/default.ttf" )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeText )
	self.TimeText = TimeText
	
	local Duration = CoD.TextWithBg.new( menu, controller )
	Duration:setLeftRight( false, true, -44.5, 2 )
	Duration:setTopBottom( true, false, -0.25, 19.75 )
	Duration:setScale( 0.9 )
	Duration.Bg:setAlpha( 0.6 )
	Duration.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Duration.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( Duration )
	self.Duration = Duration
	
	local BookmarkedItem = CoD.FileshareBookmarkedItem.new( menu, controller )
	BookmarkedItem:setLeftRight( true, false, 0, 133 )
	BookmarkedItem:setTopBottom( true, false, 0, 30 )
	BookmarkedItem:setAlpha( 0 )
	BookmarkedItem:linkToElementModel( self, nil, false, function ( model )
		BookmarkedItem:setModel( model, controller )
	end )
	BookmarkedItem:mergeStateConditions( {
		{
			stateName = "IconOnly",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBookmarked" )
			end
		},
		{
			stateName = "IconWithText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	BookmarkedItem:linkToElementModel( BookmarkedItem, "isBookmarked", true, function ( model )
		menu:updateElementState( BookmarkedItem, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBookmarked"
		} )
	end )
	self:addElement( BookmarkedItem )
	self.BookmarkedItem = BookmarkedItem
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( true, false, 1, 225 )
	LabelButton:setTopBottom( false, true, -46, -25 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -2, 2 )
	StartMenuframenoBG0:setTopBottom( true, true, -2, 2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -2, 2 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -3, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local ErrorImage = LUI.UIImage.new()
	ErrorImage:setLeftRight( true, false, 76.88, 158.13 )
	ErrorImage:setTopBottom( true, false, 29.25, 94.25 )
	ErrorImage:setAlpha( 0 )
	ErrorImage:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( ErrorImage )
	self.ErrorImage = ErrorImage
	
	local ProcessingOverlay = LUI.UIImage.new()
	ProcessingOverlay:setLeftRight( true, true, 0, 0 )
	ProcessingOverlay:setTopBottom( true, true, 0, 0 )
	ProcessingOverlay:setRGB( 0, 0, 0 )
	ProcessingOverlay:setAlpha( 0 )
	self:addElement( ProcessingOverlay )
	self.ProcessingOverlay = ProcessingOverlay
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( false, false, -100, 100 )
	ProcessingText:setTopBottom( false, false, -27, 7 )
	ProcessingText:setAlpha( 0 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING" ) )
	ProcessingText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	self.GameTypeImage:linkToElementModel( self, "showGameTypeImage", true, function ( model )
		local showGameTypeImage = Engine.GetModelValue( model )
		if showGameTypeImage then
			GameTypeImage:setAlpha( showGameTypeImage )
		end
	end )
	self.GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local gameTypeImage = Engine.GetModelValue( model )
		if gameTypeImage then
			GameTypeImage:setImage( RegisterImage( gameTypeImage ) )
		end
	end )
	self.TimeText:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local fileCreateTime = Engine.GetModelValue( model )
		if fileCreateTime then
			TimeText:setText( Engine.Localize( fileCreateTime ) )
		end
	end )
	self.Duration:linkToElementModel( self, "duration", true, function ( model )
		local duration = Engine.GetModelValue( model )
		if duration then
			Duration.Text:setText( Engine.Localize( FileshareGetDurationString( duration ) ) )
		end
	end )
	self.LabelButton:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			LabelButton.itemName:setText( fileName )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 0 )
				self.clipFinished( BookmarkedItem, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( true, false, 81.88, 163.13 )
				self.ErrorImage:setTopBottom( true, false, 71.25, 136.5 )
				self.ErrorImage:setAlpha( 0 )
				self.clipFinished( ErrorImage, {} )
				ProcessingOverlay:completeAnimation()
				self.ProcessingOverlay:setAlpha( 0 )
				self.clipFinished( ProcessingOverlay, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setAlpha( 0 )
				self.clipFinished( ErrorImage, {} )
				ProcessingOverlay:completeAnimation()
				self.ProcessingOverlay:setAlpha( 0.6 )
				self.clipFinished( ProcessingOverlay, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 1 )
				self.clipFinished( ProcessingText, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		InvalidShort = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CategoryImage:completeAnimation()
				self.CategoryImage:setAlpha( 0 )
				self.clipFinished( CategoryImage, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
				ProcessingOverlay:completeAnimation()
				self.ProcessingOverlay:setAlpha( 0 )
				self.clipFinished( ProcessingOverlay, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setAlpha( 0 )
				self.clipFinished( ErrorImage, {} )
				ProcessingOverlay:completeAnimation()
				self.ProcessingOverlay:setAlpha( 0 )
				self.clipFinished( ProcessingOverlay, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Film = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setAlpha( 0 )
				self.clipFinished( ErrorImage, {} )
				ProcessingOverlay:completeAnimation()
				self.ProcessingOverlay:setAlpha( 0 )
				self.clipFinished( ProcessingOverlay, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Clip = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				TimeText:completeAnimation()
				self.TimeText:setLeftRight( true, false, 23.88, 228.13 )
				self.TimeText:setTopBottom( false, true, -22.5, -4.5 )
				self.clipFinished( TimeText, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 0 )
				self.clipFinished( BookmarkedItem, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setAlpha( 0 )
				self.clipFinished( ErrorImage, {} )
				ProcessingOverlay:completeAnimation()
				self.ProcessingOverlay:setAlpha( 0 )
				self.clipFinished( ProcessingOverlay, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				LabelButton:completeAnimation()
				self.LabelButton:setAlpha( 1 )
				self.clipFinished( LabelButton, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 1 )
				self.clipFinished( Duration, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Processing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "InvalidShort",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isValid" )
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				local f47_local0
				if not IsFileshareCategoryFilm( self, element, controller ) then
					f47_local0 = not IsFileshareCategoryClip( self, element, controller )
				else
					f47_local0 = false
				end
				return f47_local0
			end
		},
		{
			stateName = "Film",
			condition = function ( menu, element, event )
				return IsFileshareCategoryFilm( self, element, controller )
			end
		},
		{
			stateName = "Clip",
			condition = function ( menu, element, event )
				return IsFileshareCategoryClip( self, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "isValid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isValid"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Image:close()
		element.BoxButtonLrgIdle:close()
		element.Duration:close()
		element.BookmarkedItem:close()
		element.LabelButton:close()
		element.StartMenuframenoBG0:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.GameTypeImage:close()
		element.CategoryImage:close()
		element.TimeText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

