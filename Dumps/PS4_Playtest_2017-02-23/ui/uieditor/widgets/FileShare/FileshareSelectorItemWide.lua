require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.FileShare.FileshareBookmarkedItem" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Theater.Theater_TextLable" )

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
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 172 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, 0, 0 )
	BoxButtonLrgIdle:setAlpha( 0.15 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local FileImage = LUI.UIImage.new()
	FileImage:setLeftRight( 0, 1, 0, 0 )
	FileImage:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FileImage )
	self.FileImage = FileImage
	
	local PlusImage = LUI.UIImage.new()
	PlusImage:setLeftRight( 0, 0, 108, 204 )
	PlusImage:setTopBottom( 0, 0, 35, 131 )
	PlusImage:setImage( RegisterImage( "uie_t7_icon_menu_simple_publish_green" ) )
	self:addElement( PlusImage )
	self.PlusImage = PlusImage
	
	local WCFileshareIconExtraCamRender0 = LUI.UIImage.new()
	WCFileshareIconExtraCamRender0:setLeftRight( 0, 1, 0, 0 )
	WCFileshareIconExtraCamRender0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( WCFileshareIconExtraCamRender0 )
	self.WCFileshareIconExtraCamRender0 = WCFileshareIconExtraCamRender0
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 2, -2 )
	MapImage:setTopBottom( 0, 1, 2, -2 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( 0, 1, 0, 0 )
	Thumbnail:setTopBottom( 0, 1, 0, 0 )
	Thumbnail:setAlpha( 0 )
	Thumbnail:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
	local tint = LUI.UIImage.new()
	tint:setLeftRight( 0, 1, 2, -2 )
	tint:setTopBottom( 0, 1, 2, -2 )
	tint:setRGB( 0, 0, 0 )
	tint:setAlpha( 0 )
	self:addElement( tint )
	self.tint = tint
	
	local Duration = CoD.TextWithBg.new( menu, controller )
	Duration:setLeftRight( 1, 1, -53, 1 )
	Duration:setTopBottom( 0, 0, 0, 24 )
	Duration:setScale( 0.8 )
	Duration.Bg:setAlpha( 0.4 )
	Duration.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Duration.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( Duration )
	self.Duration = Duration
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( 0.5, 0.5, -54, 54 )
	GameTypeImage:setTopBottom( 0.5, 0.5, -63, 45 )
	GameTypeImage:setAlpha( 0 )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local LabelButton = CoD.Theater_TextLable.new( menu, controller )
	LabelButton:setLeftRight( 0, 0, 1, 298 )
	LabelButton:setTopBottom( 1, 1, -30, -2 )
	LabelButton.itemName:setRGB( 0.99, 0.99, 0.99 )
	LabelButton.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
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
	BookmarkedItem:setLeftRight( 0, 0, 0, 194 )
	BookmarkedItem:setTopBottom( 0, 0, -0.5, 44.5 )
	BookmarkedItem:setAlpha( 0 )
	BookmarkedItem:linkToElementModel( self, nil, false, function ( model )
		BookmarkedItem:setModel( model, controller )
	end )
	self:addElement( BookmarkedItem )
	self.BookmarkedItem = BookmarkedItem
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -2, 2 )
	FocusBarT:setTopBottom( 0, 0, -5, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -2, 2 )
	FocusBarB:setTopBottom( 1, 1, -1, 5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -2, 2 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -2, 2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.FileImage:linkToElementModel( self, "showFileImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileImage:setAlpha( modelValue )
		end
	end )
	self.FileImage:linkToElementModel( self, "fileImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.PlusImage:linkToElementModel( self, "showPlusImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlusImage:setAlpha( modelValue )
		end
	end )
	self.WCFileshareIconExtraCamRender0:linkToElementModel( self, "showFileImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender0:setAlpha( modelValue )
		end
	end )
	self.WCFileshareIconExtraCamRender0:linkToElementModel( self, "fileId", true, function ( model )
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
	self.Duration:linkToElementModel( self, "duration", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Duration.Text:setText( Engine.Localize( FileshareGetDurationString( modelValue ) ) )
		end
	end )
	self.GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.LabelButton:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LabelButton.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		MapImage:completeAnimation()
		Duration:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BookmarkedItem:completeAnimation()
		GameTypeImage:completeAnimation()
		tint:completeAnimation()
		Thumbnail:completeAnimation()
		MapImage:setAlpha( 1 )
		Duration:setAlpha( 1 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BookmarkedItem:setAlpha( 0 )
		GameTypeImage:setAlpha( 0 )
		tint:setAlpha( 0 )
		Thumbnail:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Duration:completeAnimation()
				self.Duration:setAlpha( 0 )
				self.clipFinished( Duration, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BookmarkedItem:completeAnimation()
				self.BookmarkedItem:setAlpha( 1 )
				self.clipFinished( BookmarkedItem, {} )
			end
		},
		Film = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 1 )
				self.clipFinished( GameTypeImage, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )
			end
		},
		Clip = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )
				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				tint:completeAnimation()
				self.tint:setAlpha( 0.15 )
				self.clipFinished( tint, {} )
			end
		}
	}
	self:mergeStateConditions( {
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.Duration:close()
		self.LabelButton:close()
		self.BookmarkedItem:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuframenoBG0:close()
		self.FileImage:close()
		self.PlusImage:close()
		self.WCFileshareIconExtraCamRender0:close()
		self.MapImage:close()
		self.Thumbnail:close()
		self.GameTypeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

