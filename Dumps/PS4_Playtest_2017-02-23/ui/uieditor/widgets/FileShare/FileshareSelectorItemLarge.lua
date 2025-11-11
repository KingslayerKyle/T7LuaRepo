require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.FileShare.FileshareBookmarkedItem" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )

CoD.FileshareSelectorItemLarge = InheritFrom( LUI.UIElement )
CoD.FileshareSelectorItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectorItemLarge )
	self.id = "FileshareSelectorItemLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 367 )
	self:setTopBottom( 0, 0, 0, 352 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local sizeElement = LUI.UIImage.new()
	sizeElement:setLeftRight( 0, 0, 0, 345 )
	sizeElement:setTopBottom( 0, 0, 0, 238 )
	sizeElement:setAlpha( 0 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local WCFileshareIconExtraCamRender0 = LUI.UIImage.new()
	WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 1, 367 )
	WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -352, -146 )
	self:addElement( WCFileshareIconExtraCamRender0 )
	self.WCFileshareIconExtraCamRender0 = WCFileshareIconExtraCamRender0
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, -37 )
	BoxButtonLrgIdle:setAlpha( 0.24 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 0, 0 )
	MapImage:setTopBottom( 0, 1, 0, -38 )
	MapImage:setAlpha( 0 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( 0, 1, 0, 0 )
	Thumbnail:setTopBottom( 0, 1, 0, 0 )
	Thumbnail:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( 0.5, 0.5, -82, 92 )
	GameTypeImage:setTopBottom( 0.5, 0.5, -108, 66 )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local BarBg = LUI.UIImage.new()
	BarBg:setLeftRight( 0, 1, 0, 0 )
	BarBg:setTopBottom( 1, 1, -38, 0 )
	BarBg:setRGB( 0, 0, 0 )
	BarBg:setAlpha( 0.8 )
	self:addElement( BarBg )
	self.BarBg = BarBg
	
	local CategoryImage = LUI.UIImage.new()
	CategoryImage:setLeftRight( 0, 0, 5, 31 )
	CategoryImage:setTopBottom( 1, 1, -33, -6 )
	CategoryImage:linkToElementModel( self, "fileCategory", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryImage:setImage( RegisterImage( FileshareGetCategoryIcon( modelValue ) ) )
		end
	end )
	self:addElement( CategoryImage )
	self.CategoryImage = CategoryImage
	
	local TimeText = LUI.UIText.new()
	TimeText:setLeftRight( 0, 0, 36, 338 )
	TimeText:setTopBottom( 1, 1, -34, -7 )
	TimeText:setTTF( "fonts/default.ttf" )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeText )
	self.TimeText = TimeText
	
	local Duration = CoD.TextWithBg.new( menu, controller )
	Duration:setLeftRight( 1, 1, -67, 3 )
	Duration:setTopBottom( 0, 0, 0, 30 )
	Duration:setScale( 0.9 )
	Duration.Bg:setAlpha( 0.6 )
	Duration.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Duration.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( Duration )
	self.Duration = Duration
	
	local BookmarkedItem = CoD.FileshareBookmarkedItem.new( menu, controller )
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
	BookmarkedItem:setLeftRight( 0, 0, 0, 200 )
	BookmarkedItem:setTopBottom( 0, 0, -0.5, 44.5 )
	BookmarkedItem:setAlpha( 0 )
	BookmarkedItem:linkToElementModel( self, nil, false, function ( model )
		BookmarkedItem:setModel( model, controller )
	end )
	self:addElement( BookmarkedItem )
	self.BookmarkedItem = BookmarkedItem
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 2, 338 )
	LabelButton:setTopBottom( 1, 1, -69, -37 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -3, 3 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -3, 3 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, -3, 3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -5, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local ErrorImage = LUI.UIImage.new()
	ErrorImage:setLeftRight( 0, 0, 123, 245 )
	ErrorImage:setTopBottom( 0, 0, 79, 177 )
	ErrorImage:setAlpha( 0 )
	ErrorImage:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( ErrorImage )
	self.ErrorImage = ErrorImage
	
	self.WCFileshareIconExtraCamRender0:linkToElementModel( self, "showFileImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender0:setAlpha( modelValue )
		end
	end )
	self.WCFileshareIconExtraCamRender0:linkToElementModel( self, "renderFileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender0:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, modelValue ) )
		end
	end )
	self.MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	self.GameTypeImage:linkToElementModel( self, "showGameTypeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setAlpha( modelValue )
		end
	end )
	self.GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.TimeText:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TimeText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Duration:linkToElementModel( self, "duration", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Duration.Text:setText( Engine.Localize( FileshareGetDurationString( modelValue ) ) )
		end
	end )
	self.LabelButton:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( modelValue )
		end
	end )
	self.resetProperties = function ()
		sizeElement:completeAnimation()
		Duration:completeAnimation()
		WCFileshareIconExtraCamRender0:completeAnimation()
		Thumbnail:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		CategoryImage:completeAnimation()
		ErrorImage:completeAnimation()
		MapImage:completeAnimation()
		GameTypeImage:completeAnimation()
		BookmarkedItem:completeAnimation()
		TimeText:completeAnimation()
		sizeElement:setLeftRight( 0, 0, 0, 345 )
		sizeElement:setTopBottom( 0, 0, 0, 238 )
		Duration:setAlpha( 1 )
		WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 1, 367 )
		WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -352, -146 )
		Thumbnail:setAlpha( 1 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, -3, 3 )
		FocusBarT:setTopBottom( 0, 0, -5, 1 )
		FocusBarT:setAlpha( 0 )
		CategoryImage:setAlpha( 1 )
		ErrorImage:setLeftRight( 0, 0, 123, 245 )
		ErrorImage:setTopBottom( 0, 0, 79, 177 )
		ErrorImage:setAlpha( 0 )
		MapImage:setAlpha( 0 )
		BookmarkedItem:setAlpha( 0 )
		TimeText:setLeftRight( 0, 0, 36, 338 )
		TimeText:setTopBottom( 1, 1, -34, -7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, -6, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		InvalidNormal = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
				CategoryImage:completeAnimation()
				self.CategoryImage:setAlpha( 0 )
				self.clipFinished( CategoryImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( 0, 0, 123, 245 )
				self.ErrorImage:setTopBottom( 0, 0, 107, 205 )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 3, 351 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -350, -38 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, -3, 3 )
				self.FocusBarT:setTopBottom( 0, 0, -6, 0 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		InvalidShort = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 128, 354 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 368 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -226, 0 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
				CategoryImage:completeAnimation()
				self.CategoryImage:setAlpha( 0 )
				self.clipFinished( CategoryImage, {} )
				ErrorImage:completeAnimation()
				self.ErrorImage:setLeftRight( 0, 0, 123, 245 )
				self.ErrorImage:setTopBottom( 0, 0, 176, 274 )
				self.ErrorImage:setAlpha( 1 )
				self.clipFinished( ErrorImage, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 128, 354 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 368 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -226, 0 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 128, 354 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 368 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -226, 0 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 128, 354 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 368 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -226, 0 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 128, 354 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 368 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -226, 0 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
			end
		},
		Film = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
			end
		},
		Clip = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				TimeText:completeAnimation()
				self.TimeText:setLeftRight( 0, 0, 36, 342 )
				self.TimeText:setTopBottom( 1, 1, -34, -7 )
				self.clipFinished( TimeText, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 0, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( 0, 0, -0.5, 367.5 )
				self.sizeElement:setTopBottom( 0, 0, 145, 355 )
				self.clipFinished( sizeElement, {} )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( 0, 0, 2, 366 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( 1, 1, -206, -2 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				GameTypeImage:completeAnimation()
				self.clipFinished( GameTypeImage, {} )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InvalidNormal",
			condition = function ( menu, element, event )
				local f38_local0
				if not IsSelfModelValueTrue( element, controller, "isValid" ) then
					f38_local0 = FileshareShowNormalSizeIcons( element, controller )
				else
					f38_local0 = false
				end
				return f38_local0
			end
		},
		{
			stateName = "InvalidShort",
			condition = function ( menu, element, event )
				local f39_local0
				if not IsSelfModelValueTrue( element, controller, "isValid" ) then
					f39_local0 = not FileshareShowNormalSizeIcons( element, controller )
				else
					f39_local0 = false
				end
				return f39_local0
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				local f40_local0
				if not FileshareShowNormalSizeIcons( element, controller ) and not IsFileshareCategoryFilm( self, element, controller ) then
					f40_local0 = not IsFileshareCategoryClip( self, element, controller )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		},
		{
			stateName = "Film",
			condition = function ( menu, element, event )
				local f41_local0
				if not FileshareShowNormalSizeIcons( element, controller ) then
					f41_local0 = IsFileshareCategoryFilm( self, element, controller )
				else
					f41_local0 = false
				end
				return f41_local0
			end
		},
		{
			stateName = "Clip",
			condition = function ( menu, element, event )
				local f42_local0
				if not FileshareShowNormalSizeIcons( element, controller ) then
					f42_local0 = IsFileshareCategoryClip( self, element, controller )
				else
					f42_local0 = false
				end
				return f42_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isNormalSize" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isNormalSize"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.Duration:close()
		self.BookmarkedItem:close()
		self.LabelButton:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.WCFileshareIconExtraCamRender0:close()
		self.MapImage:close()
		self.Thumbnail:close()
		self.GameTypeImage:close()
		self.CategoryImage:close()
		self.TimeText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

