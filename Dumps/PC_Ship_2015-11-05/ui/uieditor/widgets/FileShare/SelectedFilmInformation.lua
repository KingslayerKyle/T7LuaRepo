require( "ui.uieditor.widgets.FileShare.SelectedFilmSummaryInformation" )
require( "ui.uieditor.widgets.FileShare.FileshareBookmarkedItem" )
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
	self:setLeftRight( true, false, 0, 417 )
	self:setTopBottom( true, false, 0, 538 )
	self.anyChildUsesUpdateState = true
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, false, 0, 417 )
	MapImage:setTopBottom( true, false, 0, 234.56 )
	MapImage:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( true, false, 314.2, 405.2 )
	GameTypeImage:setTopBottom( true, false, 10, 101 )
	GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local gameTypeImage = Engine.GetModelValue( model )
		if gameTypeImage then
			GameTypeImage:setImage( RegisterImage( gameTypeImage ) )
		end
	end )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local AuthorName = LUI.UIText.new()
	AuthorName:setLeftRight( true, false, 11.8, 417.2 )
	AuthorName:setTopBottom( false, true, -218, -194 )
	AuthorName:setTTF( "fonts/default.ttf" )
	AuthorName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	AuthorName:setShaderVector( 0, 0.04, 0, 0, 0 )
	AuthorName:setShaderVector( 1, 0.02, 0, 0, 0 )
	AuthorName:setShaderVector( 2, 1, 0, 0, 0 )
	AuthorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AuthorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	AuthorName:linkToElementModel( self, "fileAuthorName", true, function ( model )
		local fileAuthorName = Engine.GetModelValue( model )
		if fileAuthorName then
			AuthorName:setText( Engine.Localize( fileAuthorName ) )
		end
	end )
	self:addElement( AuthorName )
	self.AuthorName = AuthorName
	
	local CreateTime = LUI.UIText.new()
	CreateTime:setLeftRight( true, false, 11.8, 417.2 )
	CreateTime:setTopBottom( false, true, -194, -174 )
	CreateTime:setTTF( "fonts/default.ttf" )
	CreateTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CreateTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CreateTime:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local fileCreateTime = Engine.GetModelValue( model )
		if fileCreateTime then
			CreateTime:setText( Engine.Localize( fileCreateTime ) )
		end
	end )
	self:addElement( CreateTime )
	self.CreateTime = CreateTime
	
	local MatchType = LUI.UIText.new()
	MatchType:setLeftRight( true, false, 11.8, 417.2 )
	MatchType:setTopBottom( false, true, -172.47, -152.47 )
	MatchType:setTTF( "fonts/default.ttf" )
	MatchType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MatchType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MatchType:linkToElementModel( self, "matchmakingMode", true, function ( model )
		local matchmakingMode = Engine.GetModelValue( model )
		if matchmakingMode then
			MatchType:setText( Engine.Localize( FileshareGetMatchmakingMode( matchmakingMode ) ) )
		end
	end )
	self:addElement( MatchType )
	self.MatchType = MatchType
	
	local SelectedFilmSummaryInformation = CoD.SelectedFilmSummaryInformation.new( menu, controller )
	SelectedFilmSummaryInformation:setLeftRight( true, false, 0.8, 417 )
	SelectedFilmSummaryInformation:setTopBottom( false, true, -132, -53 )
	SelectedFilmSummaryInformation:linkToElementModel( self, "summary", false, function ( model )
		SelectedFilmSummaryInformation:setModel( model, controller )
	end )
	SelectedFilmSummaryInformation:registerEventHandler( "fileshare_summary_downloaded", function ( element, event )
		local f8_local0 = nil
		FileshareHandleDownloadSummary( self, element, controller, event )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( SelectedFilmSummaryInformation )
	self.SelectedFilmSummaryInformation = SelectedFilmSummaryInformation
	
	local BookmarkedItem = CoD.FileshareBookmarkedItem.new( menu, controller )
	BookmarkedItem:setLeftRight( true, false, 0, 129.5 )
	BookmarkedItem:setTopBottom( true, false, 0, 30 )
	BookmarkedItem:setAlpha( 0 )
	BookmarkedItem:linkToElementModel( self, nil, false, function ( model )
		BookmarkedItem:setModel( model, controller )
	end )
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
	self:addElement( BookmarkedItem )
	self.BookmarkedItem = BookmarkedItem
	
	local GametypeOnMapName = LUI.UIText.new()
	GametypeOnMapName:setLeftRight( true, false, 11.8, 417.2 )
	GametypeOnMapName:setTopBottom( false, true, -254, -234 )
	GametypeOnMapName:setTTF( "fonts/default.ttf" )
	GametypeOnMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GametypeOnMapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GametypeOnMapName:linkToElementModel( self, "fileDescription", true, function ( model )
		local fileDescription = Engine.GetModelValue( model )
		if fileDescription then
			GametypeOnMapName:setText( Engine.Localize( fileDescription ) )
		end
	end )
	self:addElement( GametypeOnMapName )
	self.GametypeOnMapName = GametypeOnMapName
	
	local Duration = CoD.TextWithBg.new( menu, controller )
	Duration:setLeftRight( false, true, -42.75, -3.25 )
	Duration:setTopBottom( true, false, 212, 232 )
	Duration.Bg:setAlpha( 0.6 )
	Duration.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Duration.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Duration:linkToElementModel( self, "duration", true, function ( model )
		local duration = Engine.GetModelValue( model )
		if duration then
			Duration.Text:setText( Engine.Localize( FileshareGetDurationString( duration ) ) )
		end
	end )
	self:addElement( Duration )
	self.Duration = Duration
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -2, 2 )
	StartMenuframenoBG0:setTopBottom( true, true, -2, -301 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local TheaterTitleLabel = CoD.Theater_TitleLabel.new( menu, controller )
	TheaterTitleLabel:setLeftRight( true, false, 7.8, 404.2 )
	TheaterTitleLabel:setTopBottom( true, false, 245, 280 )
	TheaterTitleLabel:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			TheaterTitleLabel.ScorestreaksLabel:setText( Engine.Localize( fileName ) )
		end
	end )
	self:addElement( TheaterTitleLabel )
	self.TheaterTitleLabel = TheaterTitleLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelectedFilmSummaryInformation:close()
		element.BookmarkedItem:close()
		element.Duration:close()
		element.StartMenuframenoBG0:close()
		element.TheaterTitleLabel:close()
		element.MapImage:close()
		element.GameTypeImage:close()
		element.AuthorName:close()
		element.CreateTime:close()
		element.MatchType:close()
		element.GametypeOnMapName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

