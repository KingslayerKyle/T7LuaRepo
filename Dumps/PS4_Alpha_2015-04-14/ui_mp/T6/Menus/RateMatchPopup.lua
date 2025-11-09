CoD.RateMatchPopup = {}
local top = 0
local headerTextSize = CoD.textSize.Big
local messageTopOffset = 30
local messageTextSize = CoD.textSize.Condensed
local messageWidth = 400
local logo = nil
local imageID = 0
local iconSize = 256
local iconTopOffset = 10
local buttonListOffset = 370
local hasDeclinedSurvey = false
local hasExitedSurvey = false
CoD.RateMatchPopup.CreateHeader = function ( popup, message )
	popup.headerLabel = LUI.UIText.new()
	popup.headerLabel:setLeftRight( true, true, 0, 0 )
	popup.headerLabel:setTopBottom( true, false, 0, headerTextSize )
	popup.headerLabel:setAlpha( CoD.textAlpha )
	popup.headerLabel:setAlignment( LUI.Alignment.Left )
	popup.headerLabel:setFont( CoD.fonts.Condensed )
	popup.headerLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	popup.headerLabel:setText( Engine.Localize( message ) )
	popup:addElement( popup.headerLabel )
end

CoD.RateMatchPopup.CreateMessage = function ( popup )
	top = messageTopOffset
	popup.messageLabel = LUI.UIText.new()
	popup.messageLabel:setLeftRight( true, false, 0, messageWidth )
	popup.messageLabel:setTopBottom( true, false, top + messageTopOffset, top + messageTopOffset + messageTextSize )
	popup.messageLabel:setAlignment( LUI.Alignment.Left )
	popup.messageLabel:setFont( CoD.fonts.Condensed )
	popup.messageLabel:setText( Engine.Localize( "MENU_NETWORK_QUALITY_DESCRIPTION" ) )
	popup:addElement( popup.messageLabel )
end

CoD.RateMatchPopup.AddLargeLogo = function ( popup, controller, material )
	local logoContainer = LUI.UIElement.new()
	logoContainer:setLeftRight( false, true, -iconSize, 0 )
	logoContainer:setTopBottom( false, false, -(iconSize / 2) - iconTopOffset, iconSize / 2 - iconTopOffset )
	logo = LUI.UIImage.new()
	logo:setLeftRight( true, true, 0, 0 )
	logo:setTopBottom( true, true, 0, 0 )
	logo:setImage( RegisterMaterial( material ) )
	logoContainer:addElement( logo )
	popup:addElement( logoContainer )
end

CoD.RateMatchPopup.CreateButtonList = function ( popup )
	popup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = top + buttonListOffset,
		bottom = 0
	} )
	popup:addElement( popup.buttonList )
	local declineButton = popup.buttonList:addButton( Engine.Localize( "MENU_NETWORK_QUALITY_DECLINE" ), Engine.Localize( "MENU_NETWORK_QUALITY_DECLINE_HINT" ) )
	declineButton:setActionEventName( "track_match_rating_decline" )
	local excellentButton = popup.buttonList:addButton( Engine.Localize( "MENU_NETWORK_QUALITY_EXCELLENT" ), Engine.Localize( "MENU_NETWORK_QUALITY_EXCELLENT_HINT" ) )
	excellentButton:setActionEventName( "track_match_rating_excellent" )
	local goodButton = popup.buttonList:addButton( Engine.Localize( "MENU_NETWORK_QUALITY_GOOD" ), Engine.Localize( "MENU_NETWORK_QUALITY_GOOD_HINT" ) )
	goodButton:setActionEventName( "track_match_rating_good" )
	local poorButton = popup.buttonList:addButton( Engine.Localize( "MENU_NETWORK_QUALITY_POOR" ), Engine.Localize( "MENU_NETWORK_QUALITY_POOR_HINT" ) )
	poorButton:setActionEventName( "track_match_rating_poor" )
	popup.buttonList:processEvent( {
		name = "gain_focus"
	} )
end

CoD.RateMatchPopup.TrackEvent = function ( self, event, choice, completedSurvey )
	self:processEvent( {
		name = "button_prompt_back"
	} )
	Engine.SetDvar( "tu_10_matchRatingSampleChance", 0 )
	if completedSurvey then
		CoD.AfterActionReport.RateMatchSurveyComplete = true
	end
	local recordEventString = ""
	local aarStats = CoD.AfterActionReport.Stats
	if aarStats.currentStats ~= nil then
		local demoFileID = aarStats.currentStats.AfterActionReportStats.demoFileID:get()
		if demoFileID ~= nil and demoFileID ~= "0" then
			recordEventString = demoFileID
		end
	end
	recordEventString = recordEventString .. ", " .. choice
	local networkConnectionType = Engine.GetConnectionType()
	recordEventString = recordEventString .. ", " .. networkConnectionType
	print( "SendRecordEvent: " .. recordEventString )
	Engine.SendRecordEvent( event.controller, CoD.RECORD_EVENT_RATE_MATCH, recordEventString )
end

CoD.RateMatchPopup.TrackEvent_Decline = function ( self, event )
	if hasDeclinedSurvey ~= true then
		CoD.RateMatchPopup.TrackEvent( self, event, "DECLINE", false )
	end
	self:processEvent( {
		name = "button_prompt_back"
	} )
	hasDeclinedSurvey = true
end

CoD.RateMatchPopup.TrackEvent_Excellent = function ( self, event )
	CoD.RateMatchPopup.TrackEvent( self, event, "EXCELLENT", true )
end

CoD.RateMatchPopup.TrackEvent_Good = function ( self, event )
	CoD.RateMatchPopup.TrackEvent( self, event, "GOOD", true )
end

CoD.RateMatchPopup.TrackEvent_Poor = function ( self, event )
	CoD.RateMatchPopup.TrackEvent( self, event, "POOR", true )
end

CoD.RateMatchPopup.TrackEvent_Exit = function ( self, event )
	if hasExitedSurvey ~= true then
		CoD.RateMatchPopup.TrackEvent( self, event, "EXIT", false )
	end
	self:processEvent( {
		name = "button_prompt_back"
	} )
	hasExitedSurvey = true
end

LUI.createMenu.RateMatchPopup = function ( controller )
	local rateMatchPopup = CoD.Menu.New( "RateMatchPopup" )
	rateMatchPopup:setOwner( controller )
	rateMatchPopup:addLargePopupBackground()
	CoD.RateMatchPopup.CreateHeader( rateMatchPopup, Engine.Localize( "MENU_NETWORK_QUALITY_PROMPT" ) )
	CoD.RateMatchPopup.CreateMessage( rateMatchPopup )
	CoD.RateMatchPopup.CreateButtonList( rateMatchPopup )
	CoD.RateMatchPopup.AddLargeLogo( rateMatchPopup, controller, "menu_motd_survey" )
	rateMatchPopup.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_NETWORK_QUALITY_ACCEPT" ), nil, "" )
	rateMatchPopup:addLeftButtonPrompt( rateMatchPopup.primaryButton )
	rateMatchPopup.secondaryButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MENU_BACK" ), rateMatchPopup, "track_match_rating_exit" )
	rateMatchPopup:addLeftButtonPrompt( rateMatchPopup.secondaryButton )
	rateMatchPopup:registerEventHandler( "track_match_rating_decline", CoD.RateMatchPopup.TrackEvent_Decline )
	rateMatchPopup:registerEventHandler( "track_match_rating_excellent", CoD.RateMatchPopup.TrackEvent_Excellent )
	rateMatchPopup:registerEventHandler( "track_match_rating_good", CoD.RateMatchPopup.TrackEvent_Good )
	rateMatchPopup:registerEventHandler( "track_match_rating_poor", CoD.RateMatchPopup.TrackEvent_Poor )
	rateMatchPopup:registerEventHandler( "track_match_rating_exit", CoD.RateMatchPopup.TrackEvent_Exit )
	return rateMatchPopup
end

