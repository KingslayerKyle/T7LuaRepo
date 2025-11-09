CoD.FileshareReport = {}
CoD.FileshareReport.ReportEmblem = function ( fileshareReport, event )
	Engine.ReportUser( fileshareReport.m_authorXuid, "offensive_emblem", 1, 1 )
	if fileshareReport.m_fileID ~= nil then
		Engine.RecordOffensiveEmblem( event.controller, fileshareReport.m_authorXuid, fileshareReport.m_fileID )
	end
	CoD.perController[event.controller].reportData = nil
	fileshareReport:goBack( event.controller )
end

LUI.createMenu.FileshareReport = function ( controller )
	local fileshareReport = CoD.Menu.NewMediumPopup( "FileshareReport" )
	local data = CoD.perController[controller].reportData
	fileshareReport:setOwner( controller )
	fileshareReport.m_authorXuid = data.authorXuid
	fileshareReport.m_fileID = data.fileID
	fileshareReport.body = LUI.UIElement.new()
	fileshareReport.body:setLeftRight( true, true, 0, 0 )
	fileshareReport.body:setTopBottom( true, true, 0, 0 )
	fileshareReport:addElement( fileshareReport.body )
	local y = 0
	fileshareReport.title = LUI.UIText.new()
	fileshareReport.title:setLeftRight( true, true, 0, 0 )
	fileshareReport.title:setTopBottom( true, false, y, y + CoD.textSize.Big )
	fileshareReport.title:setFont( CoD.fonts.Big )
	fileshareReport.title:setAlignment( LUI.Alignment.Left )
	fileshareReport.title:setText( Engine.ToUpper( Engine.Localize( "MENU_FILESHARE_REPORT_EMBLEM" ) ) )
	fileshareReport:addElement( fileshareReport.title )
	local y = y + CoD.textSize.Big + 40
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( true, false, y, y + 300 )
	fileshareReport.choiceList = choiceList
	fileshareReport.body:addElement( choiceList )
	local choice = choiceList:addButton( Engine.Localize( "MENU_FILESHARE_EMBLEM_IS_OFFENSIVE" ) )
	choice:setActionEventName( "report_emblem" )
	choice.hintText = Engine.Localize( "MENU_FILESHARE_REPORT_EMBLEM_HINT" )
	choiceList:addElement( choice )
	y = y + CoD.textSize.Default * 2 + 22
	fileshareReport:registerEventHandler( "report_emblem", CoD.FileshareReport.ReportEmblem )
	fileshareReport:addSelectButton()
	fileshareReport:addBackButton()
	y = 5
	local detailsPane = LUI.UIElement.new()
	detailsPane:setLeftRight( false, true, -470, 0 )
	detailsPane:setTopBottom( true, true, 0, 0 )
	fileshareReport.body:addElement( detailsPane )
	local mapWidth = 250
	local mapHeight = mapWidth * 9 / 16
	local thumbnail = LUI.UIImage.new()
	thumbnail:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_EMBLEM, data.fileID )
	mapWidth = 128
	mapHeight = mapWidth
	thumbnail:setLeftRight( true, false, 0, mapWidth )
	thumbnail:setTopBottom( true, false, y, y + mapHeight )
	detailsPane:addElement( thumbnail )
	y = y + mapHeight
	local name = LUI.UIText.new()
	name:setLeftRight( true, true, 0, 0 )
	name:setTopBottom( true, false, y, y + CoD.textSize.Condensed )
	name:setFont( CoD.fonts.Condensed )
	name:setText( data.name )
	name:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	name:setAlignment( LUI.Alignment.Left )
	detailsPane:addElement( name )
	y = y + CoD.textSize.Condensed
	local descArea = LUI.UIElement.new()
	descArea:setLeftRight( true, true, 0, 0 )
	descArea:setTopBottom( true, false, y, y + CoD.textSize.Default * 3 )
	descArea:setUseStencil( true )
	detailsPane:addElement( descArea )
	local description = LUI.UIText.new()
	description:setLeftRight( true, true, 0, 0 )
	description:setTopBottom( true, false, 0, CoD.textSize.Default )
	description:setFont( CoD.fonts.Default )
	description:setText( data.description )
	description:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	description:setAlignment( LUI.Alignment.Left )
	descArea:addElement( description )
	y = y + CoD.textSize.Default * 3
	local date = LUI.UIText.new()
	date:setLeftRight( true, true, 0, 0 )
	date:setTopBottom( true, false, y, y + CoD.textSize.Default )
	date:setFont( CoD.fonts.Default )
	date:setText( data.time )
	date:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	date:setAlignment( LUI.Alignment.Left )
	detailsPane:addElement( date )
	y = y + CoD.textSize.Default
	local author = LUI.UIText.new()
	author:setLeftRight( true, true, 0, 0 )
	author:setTopBottom( true, false, y, y + CoD.textSize.Default )
	author:setFont( CoD.fonts.Default )
	author:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) .. " " .. data.author )
	author:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	author:setAlignment( LUI.Alignment.Left )
	detailsPane:addElement( author )
	y = y + CoD.textSize.Default + 10
	local viewPanel = CoD.FileshareManager.StatPanel( 0, y, "views" )
	viewPanel:update( data.views )
	detailsPane:addElement( viewPanel )
	local likePanel = CoD.FileshareManager.StatPanel( 145, y, "likes" )
	likePanel:update( data.likes )
	detailsPane:addElement( likePanel )
	local dislikePanel = CoD.FileshareManager.StatPanel( 290, y, "dislikes" )
	dislikePanel:update( data.dislikes )
	detailsPane:addElement( dislikePanel )
	choice:processEvent( {
		name = "gain_focus"
	} )
	return fileshareReport
end

