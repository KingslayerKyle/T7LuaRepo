require( "ui.uieditor.widgets.FileShare.FileshareBookmarkedItem" )
require( "ui.uieditor.widgets.FileShare.SelectedFilmSummaryInformation" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Theater.Theater_TitleLabel" )

CoD.SelectedFilmInformation = InheritFrom( LUI.UIElement )
CoD.SelectedFilmInformation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectedFilmInformation )
	self.id = "SelectedFilmInformation"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 625 )
	self:setTopBottom( 0, 0, 0, 807 )
	self.anyChildUsesUpdateState = true
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 0, 0, 626 )
	MapImage:setTopBottom( 0, 0, 0, 352 )
	MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( 0, 0, 0, 626 )
	Thumbnail:setTopBottom( 0, 0, 0, 352 )
	Thumbnail:setAlpha( 0 )
	Thumbnail:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Thumbnail:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( 0, 0, 472, 608 )
	GameTypeImage:setTopBottom( 0, 0, 15, 151 )
	GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local AuthorName = LUI.UIText.new()
	AuthorName:setLeftRight( 0, 0, 18, 626 )
	AuthorName:setTopBottom( 1, 1, -327, -291 )
	AuthorName:setTTF( "fonts/default.ttf" )
	AuthorName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	AuthorName:setShaderVector( 0, 0.04, 0, 0, 0 )
	AuthorName:setShaderVector( 1, 0.02, 0, 0, 0 )
	AuthorName:setShaderVector( 2, 1, 0, 0, 0 )
	AuthorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AuthorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	AuthorName:linkToElementModel( self, "fileAuthorName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AuthorName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( AuthorName )
	self.AuthorName = AuthorName
	
	local CreateTime = LUI.UIText.new()
	CreateTime:setLeftRight( 0, 0, 18, 626 )
	CreateTime:setTopBottom( 1, 1, -291, -261 )
	CreateTime:setTTF( "fonts/default.ttf" )
	CreateTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CreateTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CreateTime:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CreateTime:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CreateTime )
	self.CreateTime = CreateTime
	
	local MatchType = LUI.UIText.new()
	MatchType:setLeftRight( 0, 0, 18, 626 )
	MatchType:setTopBottom( 1, 1, -259, -229 )
	MatchType:setTTF( "fonts/default.ttf" )
	MatchType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MatchType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MatchType:linkToElementModel( self, "matchmakingMode", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MatchType:setText( FileshareGetMatchmakingMode( modelValue ) )
		end
	end )
	self:addElement( MatchType )
	self.MatchType = MatchType
	
	local SelectedFilmSummaryInformation = CoD.SelectedFilmSummaryInformation.new( menu, controller )
	SelectedFilmSummaryInformation:setLeftRight( 0, 0, 1, 625 )
	SelectedFilmSummaryInformation:setTopBottom( 1, 1, -198, -80 )
	SelectedFilmSummaryInformation:linkToElementModel( self, "summary", false, function ( model )
		SelectedFilmSummaryInformation:setModel( model, controller )
	end )
	SelectedFilmSummaryInformation:registerEventHandler( "fileshare_summary_downloaded", function ( element, event )
		local retVal = nil
		FileshareHandleDownloadSummary( self, element, controller, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( SelectedFilmSummaryInformation )
	self.SelectedFilmSummaryInformation = SelectedFilmSummaryInformation
	
	local BookmarkedItem = CoD.FileshareBookmarkedItem.new( menu, controller )
	BookmarkedItem:mergeStateConditions( {
		{
			stateName = "IconOnly",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "IconWithText",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBookmarked" )
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
	
	local GametypeOnMapName = LUI.UIText.new()
	GametypeOnMapName:setLeftRight( 0, 0, 18, 626 )
	GametypeOnMapName:setTopBottom( 1, 1, -381, -351 )
	GametypeOnMapName:setTTF( "fonts/default.ttf" )
	GametypeOnMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GametypeOnMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GametypeOnMapName:linkToElementModel( self, "fileDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GametypeOnMapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GametypeOnMapName )
	self.GametypeOnMapName = GametypeOnMapName
	
	local Duration = CoD.TextWithBg.new( menu, controller )
	Duration:setLeftRight( 1, 1, -64, -5 )
	Duration:setTopBottom( 0, 0, 318, 348 )
	Duration.Bg:setAlpha( 0.6 )
	Duration.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Duration.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Duration:linkToElementModel( self, "duration", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Duration.Text:setText( Engine.Localize( FileshareGetDurationString( modelValue ) ) )
		end
	end )
	self:addElement( Duration )
	self.Duration = Duration
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -3, 3 )
	StartMenuframenoBG0:setTopBottom( 0, 1, -3, -451 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local TheaterTitleLabel = CoD.Theater_TitleLabel.new( menu, controller )
	TheaterTitleLabel:setLeftRight( 0, 0, 12, 607 )
	TheaterTitleLabel:setTopBottom( 0, 0, 368, 420 )
	TheaterTitleLabel:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TheaterTitleLabel.ScorestreaksLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TheaterTitleLabel )
	self.TheaterTitleLabel = TheaterTitleLabel
	
	self.resetProperties = function ()
		MatchType:completeAnimation()
		MapImage:completeAnimation()
		GameTypeImage:completeAnimation()
		Thumbnail:completeAnimation()
		MatchType:setAlpha( 1 )
		MapImage:setAlpha( 1 )
		GameTypeImage:setAlpha( 1 )
		Thumbnail:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				MapImage:completeAnimation()
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )
				MatchType:completeAnimation()
				self.MatchType:setAlpha( 0 )
				self.clipFinished( MatchType, {} )
			end
		},
		Film = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Film",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEitherValue( element, controller, "fileCategory", "film", "recentgames" )
			end
		}
	} )
	self:linkToElementModel( self, "fileCategory", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileCategory"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SelectedFilmSummaryInformation:close()
		self.BookmarkedItem:close()
		self.Duration:close()
		self.StartMenuframenoBG0:close()
		self.TheaterTitleLabel:close()
		self.MapImage:close()
		self.Thumbnail:close()
		self.GameTypeImage:close()
		self.AuthorName:close()
		self.CreateTime:close()
		self.MatchType:close()
		self.GametypeOnMapName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

