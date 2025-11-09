CoD.MOTD = {}
CoD.MOTD.MessageTop = 80
CoD.MOTD.MessageWidth = 450
CoD.MOTD.MessageHeight = 310
CoD.MOTD.ImagePadding = 130
CoD.MOTD.DownloadCheckInterval = 200
CoD.MOTD.PopulateActionText = function ( actionButton, textRef, event, motd )
	local prompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( textRef ), motd, event )
	actionButton:addElement( prompt )
end

CoD.MOTD.GetImageFileID = function ( imageName )
	if imageName ~= nil and imageName ~= "" then
		return Engine.GetMOTDImageFileID( imageName )
	else
		return "0"
	end
end

CoD.MOTD.AddAction = function ( motd, actionButton, action, actionContext, actionstring )
	local buttonEvent, buttonText = nil
	if action ~= nil then
		if action == "buyfrommotdcontext" then
			buttonEvent = "motd_buy_now"
			if actionstring ~= nil then
				buttonText = actionstring
			else
				buttonText = "MENU_BUY_NOW"
			end
		end
		if action == "buyfrombannercontext" then
			buttonEvent = "banner_buy_now"
			if actionstring ~= nil then
				buttonText = actionstring
			else
				buttonText = "MENU_PURCHASE_SEASON_PASS"
			end
		end
		if action == "playmoviefrombannercontext" then
			buttonEvent = "banner_play_movie_now"
			if actionstring ~= nil then
				buttonText = actionstring
			else
				buttonText = "MENU_WATCH_VIDEO"
			end
			Engine.Url_Load_Init()
			Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
			motd:registerEventHandler( "download_check", CoD.MOTD.VideoDownloadCheck )
			motd.downloadTimer = LUI.UITimer.new( CoD.MOTD.DownloadCheckInterval, "download_check", true, motd )
			motd:addElement( motd.downloadTimer )
			local bannerSpinnerPadding = 10
			motd.spinner = LUI.UIImage.new()
			motd.spinner:setLeftRight( false, true, -64 - bannerSpinnerPadding, -bannerSpinnerPadding )
			motd.spinner:setTopBottom( false, false, -32, 32 )
			motd.spinner:setImage( RegisterMaterial( "lui_loader" ) )
			motd.spinner:setShaderVector( 0, 0, 0, 0, 0 )
			motd.bannerContainer:addElement( motd.spinner )
		end
	end
	if buttonEvent ~= nil and buttonText ~= nil then
		CoD.MOTD.PopulateActionText( actionButton, buttonText, buttonEvent, motd )
	else
		actionButton:setAlpha( 0 )
	end
end

CoD.MOTD.Accept = function ( motd, event )
	Engine.Exec( event.controller, "resetThumbnailViewer" )
	if motd.m_version == nil then
		motd.m_version = 0
	end
	if Dvar.tu13_recordContentAvailable:get() == true then
		Engine.RecordContentAvailable( event.controller )
	end
	Engine.ExecNow( event.controller, "setMOTDViewed " .. motd.m_version )
	Engine.Url_Load_Destroy()
	motd:goBack()
	motd.occludedMenu:processEvent( {
		name = "motd_popup_closed",
		controller = event.controller
	} )
end

CoD.MOTD.SignedOut = function ( motd, event )
	local root = motd:getRoot()
	motd:goBack( event.controller )
	root:processEvent( {
		name = "open_popup",
		popupName = "signed_out",
		controller = event.controller
	} )
end

CoD.MOTD.ButtonPromptBack = function ( motd, event )
	Engine.Url_Load_Destroy()
	CoD.Menu.ButtonPromptBack( motd, event )
end

CoD.MOTD.VideoDownloadCheck = function ( self, event )
	if self.downloadTimer then
		self.downloadTimer:close()
		self.downloadTimer = nil
	end
	local bandwidth = Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
	if bandwidth ~= -1 then
		self.spinner:setAlpha( 0 )
	else
		self.downloadTimer = LUI.UITimer.new( CoD.MOTD.DownloadCheckInterval, "download_check", true )
		self:addElement( self.downloadTimer )
	end
end

CoD.MOTD.BuyFromMOTDContext = function ( motd, event )
	
end

CoD.MOTD.BuyFromBannerContext = function ( motd, event )
	if CoD.isPS3 then
		motd:goBack( event.controller )
		CoD.MainLobby.OpenStore( motd.occludedMenu, event )
	elseif CoD.isXBOX then
		if motd.bannerActionContext ~= nil and motd.bannerActionContext ~= "" then
			local offerProperties = {}
			local i = 1
			for token in string.gmatch( motd.bannerActionContext, "[^%s]+" ) do
				offerProperties[i] = token
				i = i + 1
			end
			Engine.ExecNow( event.controller, "buyOfferFromMOTD " .. offerProperties[1] .. " " .. offerProperties[2] )
		else
			motd:goBack( event.controller )
			CoD.MainLobby.OpenStore( motd.occludedMenu, event )
		end
	end
end

CoD.MOTD.PlayMovieFromBannerContext = function ( motd, event )
	if motd.bannerActionContext and motd.bannerActionContext ~= "" then
		motd.url = motd.bannerActionContext
		local lang = Engine.GetLangAbbr()
		motd.url = motd.url .. "_" .. lang
		local bandwidth = Engine.Url_Load_MeasureDownloadBandwidth( "akamai://rand.bin" )
		if string.sub( motd.url, -2, -2 ) == "_" or bandwidth ~= -1 then
			CoD.Codtv.VideoCardClearPlayback()
			local url = motd.url .. "_low.webm"
			local platform = "ps3"
			if CoD.isXBOX then
				platform = "xbox"
			end
			if bandwidth > 524288 then
				url = motd.url .. "_" .. platform .. "_4.webm"
			elseif bandwidth > 393216 then
				url = motd.url .. "_" .. platform .. "_3.webm"
			elseif bandwidth > 262144 then
				url = motd.url .. "_" .. platform .. "_2.webm"
			elseif bandwidth > 131072 then
				url = motd.url .. "_" .. platform .. "_1.webm"
			end
			if string.sub( motd.url, -2, -2 ) == "_" then
				url = motd.url .. ".webm"
			end
			CoD.Codtv.WebMPlayback = Engine.WebM_Open( url, CoD.Codtv.WebMPlaybackMaterial )
			CoD.perController[event.controller].url = url
			local videoPlayer = motd:openPopup( "Video_Player", event.controller )
			CoD.Codtv.VideoCardPlay( videoPlayer )
		end
	end
end

CoD.MOTD.DescriptorsDone = function ( motd, event )
	if motd.image ~= nil and motd.imageID ~= nil then
		motd.image:setAlpha( 1 )
		motd.image:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( motd.imageID ) )
		Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( motd.imageID ), 1 )
	end
	if motd.bannerImage ~= nil and motd.bannerImageID ~= nil then
		motd.bannerImage:setAlpha( 1 )
		motd.bannerImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( motd.bannerImageID ) )
		Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( motd.bannerImageID ), 1 )
	end
end

LUI.createMenu.MOTD = function ( controller )
	local motd = CoD.Menu.New( "MOTD" )
	motd:addLargePopupBackground()
	if not CoD.isZombie then
		motd:addTitle( Engine.Localize( "MENU_MESSAGE_OF_THE_DAY" ) )
	end
	local selectPromptText = "MENU_MOTD_ACCEPT"
	if CoD.isZombie then
		selectPromptText = "MENU_ACCEPT"
	end
	local data = Engine.GetMOTD()
	if data.isValid == true then
		motd.m_version = data.motdVersion
		motd.m_actionContext = data.actionContext
		local y = CoD.MOTD.MessageTop
		local title = LUI.UIText.new()
		title:setLeftRight( true, false, 0, CoD.MOTD.MessageWidth )
		title:setTopBottom( true, false, y, y + CoD.textSize.Big )
		title:setFont( CoD.fonts.Big )
		title:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		title:setText( data.title )
		motd:addElement( title )
		y = y + CoD.textSize.Big + 10
		local messageEl = LUI.UIElement.new()
		messageEl:setLeftRight( true, false, 0, CoD.MOTD.MessageWidth )
		messageEl:setTopBottom( true, false, y, y + CoD.MOTD.MessageHeight )
		motd:addElement( messageEl )
		local message = LUI.UIText.new( nil, true )
		message:setLeftRight( true, true, 0, 0 )
		message:setTopBottom( true, false, 0, CoD.textSize.ExtraSmall )
		message:setFont( CoD.fonts.ExtraSmall )
		message:setText( data.message )
		message:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		message:setAlignment( LUI.Alignment.Left )
		messageEl:addElement( message )
		y = y + CoD.MOTD.MessageHeight
		local actionButton = LUI.UIElement.new()
		actionButton:setLeftRight( true, false, 0, CoD.MOTD.MessageWidth )
		actionButton:setTopBottom( true, false, y, y + CoD.textSize.Condensed )
		actionButton:addElement( CoD.BorderT6.new( 1, 0.5, 0.5, 0.5, 0.2, -3 ) )
		motd:addElement( actionButton )
		local actionBg = LUI.UIImage.new()
		actionBg:setLeftRight( true, true, 2, -2 )
		actionBg:setTopBottom( true, false, 2, CoD.textSize.Condensed * 0.6 )
		actionBg:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		actionBg:setAlpha( 0.1 )
		actionButton:addElement( actionBg )
		CoD.MOTD.AddAction( motd, actionButton, data.action, data.actionContext, data.actionString )
		local image = LUI.UIImage.new()
		image:setLeftRight( true, false, CoD.MOTD.ImagePadding + CoD.MOTD.MessageWidth, CoD.MOTD.MessageWidth + CoD.MOTD.ImagePadding + 256 )
		image:setTopBottom( true, false, CoD.MOTD.MessageTop + 50, CoD.MOTD.MessageTop + 50 + 256 )
		image:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( data.image ) )
		image:setAlpha( 0 )
		motd:addElement( image )
		motd.imageID = data.image
		motd.image = image
		if data.bannerImage ~= "" then
			local bannerFontName = "Default"
			local bannerFont = CoD.fonts[bannerFontName]
			local bannerFontHeight = CoD.textSize[bannerFontName]
			local bannerTextSpacing = 2
			local bannerHeight = bannerFontHeight * 3 + bannerTextSpacing
			local bannerWidthOffset = 10
			local bannerWidth = CoD.Menu.Width - bannerWidthOffset * 2
			local bannerBottomOffset = CoD.ButtonPrompt.Height + 20
			local backgroundInset = 4
			
			local bannerContainer = LUI.UIElement.new()
			bannerContainer:setLeftRight( false, false, -(bannerWidth / 2), bannerWidth / 2 )
			bannerContainer:setTopBottom( false, true, -bannerBottomOffset - bannerHeight, -bannerBottomOffset )
			motd:addElement( bannerContainer )
			motd.bannerContainer = bannerContainer
			
			local bannerContainerBackground = LUI.UIImage.new()
			bannerContainerBackground:setLeftRight( true, true, 1, -1 )
			bannerContainerBackground:setTopBottom( true, true, 1, -1 )
			bannerContainerBackground:setRGB( 0, 0, 0 )
			bannerContainerBackground:setAlpha( 0.6 )
			bannerContainer:addElement( bannerContainerBackground )
			local imageLeftOffset = 6
			local imageHeight = bannerHeight - imageLeftOffset * 2
			local imageWidth = imageHeight * 4
			
			local bannerImage = LUI.UIImage.new()
			bannerImage:setLeftRight( true, false, imageLeftOffset, imageLeftOffset + imageWidth )
			bannerImage:setTopBottom( false, false, -(imageHeight / 2), imageHeight / 2 )
			bannerImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, CoD.MOTD.GetImageFileID( data.bannerImage ) )
			bannerImage:setAlpha( 0 )
			bannerContainer:addElement( bannerImage )
			motd.bannerImage = bannerImage
			
			motd.bannerImageID = data.bannerImage
			local bannerContainerBackgroundGrad = LUI.UIImage.new()
			bannerContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
			bannerContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, bannerHeight * 0.6 )
			bannerContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
			bannerContainerBackgroundGrad:setAlpha( 0.1 )
			bannerContainer:addElement( bannerContainerBackgroundGrad )
			bannerContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
			bannerContainer:addElement( bannerContainer.border )
			local bannerTextLeft = imageLeftOffset + imageWidth + 2 * imageLeftOffset
			local bannerTitle = LUI.UIText.new()
			bannerTitle:setLeftRight( true, true, bannerTextLeft, 0 )
			bannerTitle:setTopBottom( false, false, bannerTextSpacing - bannerFontHeight - 5, bannerTextSpacing - 5 )
			bannerTitle:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
			bannerTitle:setFont( bannerFont )
			bannerTitle:setText( data.bannerTitle )
			bannerTitle:setAlignment( LUI.Alignment.Left )
			bannerContainer:addElement( bannerTitle )
			local bannerAction = LUI.UIElement.new()
			bannerAction:setLeftRight( true, true, bannerTextLeft, 0 )
			bannerAction:setTopBottom( false, false, -bannerTextSpacing + 5, -bannerTextSpacing + 5 + bannerFontHeight )
			bannerAction:setAlignment( LUI.Alignment.Left )
			bannerContainer:addElement( bannerAction )
			motd.bannerAction = data.bannerAction
			motd.bannerActionContext = data.bannerActionContext
			motd.bannerActionString = data.bannerActionString
			CoD.MOTD.AddAction( motd, bannerAction, motd.bannerAction, motd.bannerActionContext, motd.bannerActionString )
		end
	end
	local selectPrompt = CoD.ButtonPrompt.new( "primary", Engine.Localize( selectPromptText ), motd, "motd_accept" )
	motd:addLeftButtonPrompt( selectPrompt )
	motd:addBackButton()
	motd:registerEventHandler( "motd_accept", CoD.MOTD.Accept )
	motd:registerEventHandler( "motd_buy_now", CoD.MOTD.BuyFromMOTDContext )
	motd:registerEventHandler( "banner_buy_now", CoD.MOTD.BuyFromBannerContext )
	motd:registerEventHandler( "banner_play_movie_now", CoD.MOTD.PlayMovieFromBannerContext )
	motd:registerEventHandler( "signed_out", CoD.MOTD.SignedOut )
	motd:registerEventHandler( "motd_image_descriptors_done", CoD.MOTD.DescriptorsDone )
	motd:registerEventHandler( "button_prompt_back", CoD.MOTD.ButtonPromptBack )
	Engine.Exec( controller, "resetThumbnailViewer" )
	Engine.Exec( controller, "motdGetImageDescriptors" )
	return motd
end

function MOTD_ShowDefaultMsg( controller )
	return true
end

function MOTD_ShowTrialDLC1Msg( controller, mode )
	if not Engine.IsContentAvailableByPakName( "dlc1" ) then
		return true
	else
		return false
	end
end

