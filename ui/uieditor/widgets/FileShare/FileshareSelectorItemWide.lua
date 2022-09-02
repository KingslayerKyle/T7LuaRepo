-- baf77d78f85f57fbb7c91bac5e5e055d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )
require( "ui.uieditor.widgets.FileShare.FileshareBookmarkedItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.FileshareSelectorItemWide = InheritFrom( LUI.UIElement )
CoD.FileshareSelectorItemWide.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectorItemWide )
	self.id = "FileshareSelectorItemWide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 115 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, 0 )
	BoxButtonLrgIdle:setAlpha( 0.15 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local FileImage = LUI.UIImage.new()
	FileImage:setLeftRight( true, true, 0, 0 )
	FileImage:setTopBottom( true, true, 0, 0 )
	self:addElement( FileImage )
	self.FileImage = FileImage
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( true, false, 72, 136 )
	PlusImage:setTopBottom( true, false, 23.5, 87.5 )
	PlusImage:setImage( RegisterImage( "uie_t7_icon_menu_simple_publish_green" ) )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	local WCFileshareIconExtraCamRender0 = LUI.UIImage.new()
	WCFileshareIconExtraCamRender0:setLeftRight( true, true, 0, 0 )
	WCFileshareIconExtraCamRender0:setTopBottom( true, true, 0, 0 )
	self:addElement( WCFileshareIconExtraCamRender0 )
	self.WCFileshareIconExtraCamRender0 = WCFileshareIconExtraCamRender0
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 1, -1 )
	MapImage:setTopBottom( true, true, 1, -1 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( true, true, 0, 0 )
	Thumbnail:setTopBottom( true, true, 0, 0 )
	Thumbnail:setAlpha( 0 )
	Thumbnail:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", fileId ) )
		end
	end )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
	local tint = LUI.UIImage.new()
	tint:setLeftRight( true, true, 1, -1 )
	tint:setTopBottom( true, true, 1, -1 )
	tint:setRGB( 0, 0, 0 )
	tint:setAlpha( 0 )
	self:addElement( tint )
	self.tint = tint
	
	local Duration = CoD.TextWithBg.new( menu, controller )
	Duration:setLeftRight( false, true, -35, 1 )
	Duration:setTopBottom( true, false, 0, 16.25 )
	Duration:setScale( 0.8 )
	Duration.Bg:setAlpha( 0.4 )
	Duration.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Duration.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( Duration )
	self.Duration = Duration
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( false, false, -36, 36 )
	GameTypeImage:setTopBottom( false, false, -42, 30 )
	GameTypeImage:setAlpha( 0 )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( true, false, 1, 199 )
	LabelButton:setTopBottom( false, true, -20, -1 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local BookmarkedItem = CoD.FileshareBookmarkedItem.new( menu, controller )
	BookmarkedItem:setLeftRight( true, false, 0, 129 )
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
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -1, 1 )
	FocusBarT:setTopBottom( true, false, -3, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -1, 1 )
	FocusBarB:setTopBottom( false, true, -1, 3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -1, 1 )
	StartMenuframenoBG0:setTopBottom( true, true, -1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.FileImage:linkToElementModel( self, "showFileImage", true, function ( model )
		local showFileImage = Engine.GetModelValue( model )
		if showFileImage then
			FileImage:setAlpha( showFileImage )
		end
	end )
	self.FileImage:linkToElementModel( self, "fileImage", true, function ( model )
		local fileImage = Engine.GetModelValue( model )
		if fileImage then
			FileImage:setImage( RegisterImage( fileImage ) )
		end
	end )
	self.PlusImage:linkToElementModel( self, "showPlusImage", true, function ( model )
		local showPlusImage = Engine.GetModelValue( model )
		if showPlusImage then
			PlusImage:setAlpha( showPlusImage )
		end
	end )
	self.WCFileshareIconExtraCamRender0:linkToElementModel( self, "showFileImage", true, function ( model )
		local showFileImage = Engine.GetModelValue( model )
		if showFileImage then
			WCFileshareIconExtraCamRender0:setAlpha( showFileImage )
		end
	end )
	self.WCFileshareIconExtraCamRender0:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender0:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	self.MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	self.Duration:linkToElementModel( self, "duration", true, function ( model )
		local duration = Engine.GetModelValue( model )
		if duration then
			Duration.Text:setText( Engine.Localize( FileshareGetDurationString( duration ) ) )
		end
	end )
	self.GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local gameTypeImage = Engine.GetModelValue( model )
		if gameTypeImage then
			GameTypeImage:setImage( RegisterImage( gameTypeImage ) )
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
				self:setupElementClipCounter( 6 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )

				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )

				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )

				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )

				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 0 )
				self.clipFinished( BookmarkedItem, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Film = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )

				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 1 )
				self.clipFinished( GameTypeImage, {} )

				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 5 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 5 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Clip = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )

				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )

				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 0 )
				self.clipFinished( BookmarkedItem, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.15 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Film",
			condition = function ( menu, element, event )
				return IsFileshareCategoryFilm( self, element, controller ) and not IsSelfModelValueTrue( element, controller, "isPublishNew" )
			end
		},
		{
			stateName = "Clip",
			condition = function ( menu, element, event )
				return IsFileshareCategoryClip( self, element, controller ) and not IsSelfModelValueTrue( element, controller, "isPublishNew" )
			end
		}
	} )
	self:linkToElementModel( self, "isPublishNew", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isPublishNew"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgIdle:close()
		element.Duration:close()
		element.LabelButton:close()
		element.BookmarkedItem:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuframenoBG0:close()
		element.FileImage:close()
		element.PlusImage:close()
		element.WCFileshareIconExtraCamRender0:close()
		element.MapImage:close()
		element.Thumbnail:close()
		element.GameTypeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

