CoD.Briefing = {}
CoD.Briefing.showSkipButton = true
local Briefing_Remove = function ( self, event )
	self:removeAllChildren()
	self:close()
end

local Briefing_StartPlay = function ( self, event )
	Engine.SetDvar( "ui_luiLoadingScreen", 0 )
	Briefing_Remove( self, event )
	Engine.Exec( nil, "playerstart" )
end

local Briefing_StartCinematic_PlayOutro = function ( previousLevelName )
	if Dvar.ui_singlemission:get() == 1 then
		return false
	elseif previousLevelName == "nicaragua" then
		Engine.StartLoadingCinematic( "nicaragua_frontend", false )
	elseif previousLevelName == "panama_3" then
		Engine.StartLoadingCinematic( "panama_frontend", false )
	elseif previousLevelName == "blackout" then
		if 1 == Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "CHINA_IS_ALLY" ) and Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "BRIGGS_DEAD" ) == 0 then
			Engine.StartLoadingCinematic( "blackout_frontenda", false )
		else
			Engine.StartLoadingCinematic( "blackout_frontendb", false )
		end
	elseif previousLevelName == "angola_2" or previousLevelName == "pakistan_3" or previousLevelName == "karma_2" or previousLevelName == "yemen" then
		Engine.StartLoadingCinematic( "vtol_outro_1_frontend", false )
	elseif previousLevelName == "haiti" then
		local f3_local0 = Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "MENENDEZ_DEAD_IN_HAITI" ) == 0
		local f3_local1 = Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "MASON_SR_DEAD" ) == 0
		if Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "KARMA_DEAD_IN_KARMA" ) ~= 0 or Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "KARMA_DEAD_IN_COMMAND_CENTER" ) ~= 0 or Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "KARMA_CAPTURED" ) ~= 0 and 1 ~= Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "SO_WAR_SOCOTRA_SUCCESS" ) then
			local f3_local2 = false
		else
			local karma_alive = true
		end
		if not f3_local0 then
			if not f3_local1 then
				Engine.StartLoadingCinematic( "b3_revolution", false )
			else
				Engine.StartLoadingCinematic( "evd;a2_vault_jr_dead;b3_revolution;evd", false )
			end
		elseif not f3_local1 then
			if f3_local2 then
				Engine.StartLoadingCinematic( "b1_karma_alive2", false )
			else
				Engine.StartLoadingCinematic( "b2_karma_dead2;c1_karma_dead;evn", false )
			end
		elseif f3_local2 then
			Engine.StartLoadingCinematic( "evd;a2_vault_jr_dead;b1_karma_alive2;evd", false )
		else
			Engine.StartLoadingCinematic( "evd;a2_vault_jr_dead;b2_karma_dead2;c1_karma_dead;evn", false )
		end
	else
		return false
	end
	return true
end

local Briefing_StartCinematic = function ( self, event )
	CoD.Briefing.showSkipButton = true
	local controller = Engine.GetPrimaryController()
	if self.image then
		self.image:setAlpha( 1 )
	end
	Engine.SetDvar( "ui_drawSpinnerAfterMovie", 0 )
	if event.levelName == "frontend" then
		if not Engine.DvarBool( nil, "ui_saveandquit" ) then
			if Engine.DvarInt( nil, "com_introPlayed" ) == 0 then
				CoD.Briefing.showSkipButton = false
				if not CoD.isWIIU then
					Engine.StartLoadingCinematic( "dolby", false )
				end
				Engine.StartLoadingCinematic( "treyarch", true )
				if Engine.GetProfileVarInt( controller, "com_first_time" ) == 1 then
					Engine.StartLoadingCinematic( "intro", true )
				end
			else
				if not Briefing_StartCinematic_PlayOutro( event.previousLevelName ) and event.previousLevelName ~= "" then
					Engine.StartLoadingCinematic( "vtol_outro_2_frontend", false )
				end
				Engine.SetDvar( "ui_drawSpinnerAfterMovie", 1 )
			end
		else
			if event.previousLevelName == "monsoon" or event.previousLevelName == "pakistan" or event.previousLevelName == "pakistan_2" or event.previousLevelName == "pakistan_3" or event.previousLevelName == "la_1" or event.previousLevelName == "la_1b" or event.previousLevelName == "la_2" or event.previousLevelName == "haiti" then
				Engine.StartLoadingCinematic( "vtol_outro_2_frontend", false )
			else
				Engine.StartLoadingCinematic( "vtol_outro_1_frontend", false )
			end
			Engine.SetDvar( "ui_drawSpinnerAfterMovie", 1 )
		end
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
		if self.image then
			self.image:setImage( nil )
			self.image:setAlpha( 0 )
		end
	else
		if event.levelName == "angola_2" or event.levelName == "karma_2" or event.levelName == "la_1b" or event.levelName == "la_2" or event.levelName == "pakistan_2" or event.levelName == "pakistan_3" or event.levelName == "panama_2" or event.levelName == "panama_3" or event.previousLevelName == "haiti" then
			CoD.Briefing.showSkipButton = false
		end
		if event.previousLevelName ~= "frontend" and event.previousLevelName ~= "so_cmp_frontend" and event.previousLevelName ~= "" then
			local previousLevelIndex = Engine.TableLookup( nil, CoD.levelLookupTable, 1, event.previousLevelName, 0 )
			local nextLevelIndex = Engine.TableLookup( nil, CoD.levelLookupTable, 1, event.levelName, 0 )
			if previousLevelIndex < nextLevelIndex then
				Briefing_StartCinematic_PlayOutro( event.previousLevelName )
			end
		end
		local cinematicString = ""
		if event.levelName == "karma" then
			if Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "HARPER_SCARRED" ) == 1 then
				cinematicString = cinematicString .. "karma_load_b;"
			else
				cinematicString = cinematicString .. "karma_load_a;"
			end
		elseif event.levelName == "yemen" then
			if Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "KARMA_DEAD_IN_KARMA" ) == 1 or Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "KARMA_CAPTURED" ) == 1 and Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "SO_WAR_SOCOTRA_SUCCESS" ) == 0 then
				cinematicString = cinematicString .. "yemen_load_2b;"
			else
				cinematicString = cinematicString .. "yemen_load_2a;"
			end
			cinematicString = cinematicString .. "yemen_load_3;"
		elseif event.levelName == "blackout" then
			
		else
			cinematicString = cinematicString .. event.levelName .. "_load;"
		end
		if event.levelName == "blackout" then
			if Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "CHINA_IS_ALLY" ) == 1 then
				cinematicString = cinematicString .. "blackout_load_2b;"
			else
				cinematicString = cinematicString .. "blackout_load_2a;"
			end
			cinematicString = cinematicString .. "blackout_load_3;"
		elseif event.levelName == "la_1" then
			if Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "CHINA_IS_ALLY" ) == 1 then
				cinematicString = cinematicString .. "la_1_load_2a;"
			else
				cinematicString = cinematicString .. "la_1_load_2b;"
			end
			cinematicString = cinematicString .. "la_1_load_3;"
		elseif event.levelName == "haiti" then
			if Engine.GetDStat( controller, "PlayerCareerStats", "storypoints", "CHINA_IS_ALLY" ) == 1 then
				cinematicString = cinematicString .. "haiti_load_2a;"
			else
				cinematicString = cinematicString .. "haiti_load_2b;"
			end
			cinematicString = cinematicString .. "haiti_load_3;"
		end
		Engine.StartLoadingCinematic( cinematicString, false )
		Engine.SetDvar( "ui_drawSpinnerAfterMovie", 1 )
	end
end

local Briefing_MouseUp = function ( self, event )
	if event.button == "left" then
		self:processEvent( {
			name = "button_action"
		} )
	end
end

local Briefing_DisplayContinuePrompt = function ( self, event )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	local errorMsg = Dvar.ui_errorMessage:get()
	if errorMsg ~= "" then
		self.errorText = LUI.UIText.new( {
			left = -safeAreaWidth / 2,
			top = 36,
			right = safeAreaWidth / 2,
			bottom = 36 + CoD.textSize.Condensed,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			font = CoD.fonts.Condensed,
			alignment = LUI.Alignment.Left
		} )
		self:addElement( self.errorText )
		self.errorText:setText( errorMsg )
		Dvar.ui_errorMessage:set( "" )
	end
	if CoD.Briefing.showSkipButton then
		if not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
			self.continueButton:registerEventHandler( "hide_continue_button", CoD.Briefing.HideContinueButton )
			self.continueButton:addElement( LUI.UITimer.new( 5000, "hide_continue_button", true, self.continueButton ) )
		end
		self.continueButton:beginAnimation( "show", 1000 )
		self.continueButton:setAlpha( 1 )
	end
	return LUI.UIButton.gainFocus( self.continueButton, event )
end

local Briefing_SetMatureFilter = function ( self, event )
	self.image:setShaderVector( 0, event.xstart, event.xend, event.ystart, event.yend )
end

local Briefing_UpdateImage = function ( image, event )
	if Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
		image:setImage( nil )
		image:setAlpha( 0 )
	elseif Engine.IsCinematicWebm() then
		if not image.iswebm then
			image:setImage( RegisterMaterial( "webm_720p" ) )
			image.iswebm = true
		end
	elseif image.iswebm then
		image:setImage( RegisterMaterial( "cinematic" ) )
		image.iswebm = false
	end
end

CoD.Briefing.HideContinueButton = function ( self, event )
	self:beginAnimation( "hide", 1000 )
	self:setAlpha( 0 )
end

LUI.createMenu.Briefing = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self.image = LUI.UIImage.new()
	self.image:setLeftRight( true, true, 0, 0 )
	if CoD.isPC then
		local height = 1280 / Engine.GetAspectRatio()
		local offset = (height - 720) / 2
		self.image:setTopBottom( true, true, offset, -offset )
	elseif Dvar.wideScreen:get() == true then
		self.image:setTopBottom( true, true, 0, 0 )
	else
		self.image:setTopBottom( true, true, 90, -90 )
	end
	self.image:setImage( RegisterMaterial( "cinematic" ) )
	self.image.iswebm = false
	self.image:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( self.image )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	self.safearea = LUI.UIElement.new()
	self.safearea:setLeftRight( false, false, -safeAreaWidth / 2, safeAreaWidth / 2 )
	self.safearea:setTopBottom( false, false, -safeAreaHeight / 2, safeAreaHeight / 2 )
	self:addElement( self.safearea )
	local subtitles = LUI.UIElement.new()
	subtitles:setLeftRight( true, true, 0, 0 )
	subtitles:setTopBottom( true, true, 0, 0 )
	subtitles:setupCinematicSubtitles()
	self.safearea:addElement( subtitles )
	local rtsContainer = LUI.UIElement.new()
	rtsContainer:setLeftRight( true, true, 0, 0 )
	rtsContainer:setTopBottom( true, true, 0, 0 )
	self.rtsContainer = rtsContainer
	self:addElement( self.rtsContainer )
	local f10_local0 = {}
	local text_dim = GetTextDimensions( Engine.Localize( "PLATFORM_SKIP" ), CoD.fonts.Condensed, CoD.textSize.Condensed )
	local leftOffset = 15
	local topOffset = 15
	self.continueButton = LUI.UIButton.new()
	self.continueButton:setLeftRight( false, false, -safeAreaWidth, safeAreaWidth / 2 - leftOffset )
	self.continueButton:setTopBottom( false, false, safeAreaHeight / 2 - CoD.textSize.Condensed - topOffset, safeAreaHeight / 2 - topOffset )
	self.continueButton:setAlignment( LUI.Alignment.Right )
	self.continueButton:setAlpha( 0 )
	self.continueButton:setActionEventName( "briefing_startplay" )
	self:addElement( self.continueButton )
	self.continueButton:addElement( CoD.ButtonPrompt.new( "start", "", self, "briefing_startplay", true ) )
	self.continueButton.label = LUI.UIText.new()
	self.continueButton.label:setLeftRight( true, true, 0, 0 )
	self.continueButton.label:setTopBottom( true, true, 0, 0 )
	self.continueButton.label:setFont( CoD.fonts.Condensed )
	self.continueButton.label:setAlignment( LUI.Alignment.Right )
	self.continueButton:addElement( self.continueButton.label )
	self.continueButton.label:setText( Engine.Localize( "PLATFORM_SKIP" ) )
	self.continueButton:setHandleMouse( false )
	self:registerEventHandler( "mouseup", Briefing_MouseUp )
	self:registerEventHandler( "briefing_hide", Briefing_Remove )
	self:registerEventHandler( "briefing_displaycontinue", Briefing_DisplayContinuePrompt )
	self:registerEventHandler( "briefing_startplay", Briefing_StartPlay )
	self:registerEventHandler( "briefing_startcinematic", Briefing_StartCinematic )
	self:registerEventHandler( "briefing_setmaturefilter", Briefing_SetMatureFilter )
	self.image:registerEventHandler( "briefing_updateimage", Briefing_UpdateImage )
	self:addElement( LUI.UITimer.new( 16, "briefing_updateimage", false, self.image ) )
	return self
end

