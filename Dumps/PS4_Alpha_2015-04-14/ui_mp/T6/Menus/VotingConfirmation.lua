CoD.VoteConfirmation = {}
CoD.VoteConfirmation.ComicsSwapIndex = 3
CoD.VoteConfirmation.Close = function ( voteConf, event )
	voteConf:goBack()
	voteConf.occludedMenu:processEvent( {
		name = "voting_popup_closed",
		controller = event.controller
	} )
end

CoD.VoteConfirmation.Share = function ( voteConf, event )
	local controller = event.controller
	if Engine.IsFacebookLinked( controller ) and voteConf.m_vote ~= nil and voteConf.m_itemName ~= nil then
		Engine.FacebookPost( event.controller, "message", Engine.Localize( "MENU_FB_VOTE_MESSAGE", voteConf.m_itemName ), "link", Dvar.fbVoteUrl:get(), "picture", Dvar.fbVoteImageUrl:get() .. "bg_home_new.jpg", "name", Engine.Localize( "MENU_FB_VOTE_TITLE" ), "caption", Engine.Localize( "MENU_FB_VOTE_CAPTION" ), "description", Engine.Localize( "MENU_FB_VOTE_DESC" ) )
		voteConf:openPopup( "Voting_Facebook_Post_Success", controller, voteConf.m_itemName )
	else
		voteConf:openPopup( "Voting_Facebook_Link_Account", controller )
	end
end

CoD.VoteConfirmation.AddVoteInfo = function ( votes, voteItem )
	local vote = {
		item = voteItem,
		count = Engine.GetCounterValue( voteItem.CounterName )
	}
	table.insert( votes, vote )
end

CoD.VoteConfirmation.GetVoteString = function ( vote, selectedVote, totalVotes )
	local percent = 0
	local caption = Engine.ToUpper( vote.item.VotingItemString )
	if 0 < tonumber( totalVotes ) then
		percent = tonumber( vote.count ) * 100 / tonumber( totalVotes )
	else
		percent = 25
	end
	return string.format( "%.1f", percent ) .. "%", caption
end

CoD.VoteConfirmation.Comparison = function ( a, b )
	return tonumber( b.count ) < tonumber( a.count )
end

CoD.VoteConfirmation.GetAnimState = function ( position )
	local animState = {}
	local x = 0
	local y = 0
	local topPadding = 0
	local xSpacing = 380
	local ySpacing = 280
	if position == "topleft" then
		x = -xSpacing / 2
		y = -ySpacing / 2
	elseif position == "topright" then
		x = xSpacing / 2
		y = -ySpacing / 2
	elseif position == "bottomleft" then
		x = -xSpacing / 2
		y = ySpacing / 2
	else
		x = xSpacing / 2
		y = ySpacing / 2
	end
	animState.leftAnchor = false
	animState.rightAnchor = false
	animState.topAnchor = false
	animState.bottomAnchor = false
	animState.left = x - CoD.VotingPopup.VotingItemWidth / 2
	animState.right = x + CoD.VotingPopup.VotingItemWidth / 2
	animState.top = y - CoD.VotingPopup.VotingItemHeight / 2 + topPadding
	animState.bottom = y + CoD.VotingPopup.VotingItemHeight / 2 + topPadding
	return animState
end

CoD.VoteConfirmation.CreateElement = function ( centerElementContainer, vote, selectedVote, totalVotes, position, alpha )
	if vote == nil then
		return 
	else
		local votingItemContainer = LUI.UIElement.new()
		votingItemContainer:registerAnimationState( "default", CoD.VoteConfirmation.GetAnimState( position ) )
		votingItemContainer:animateToState( "default" )
		centerElementContainer:addElement( votingItemContainer )
		local desc, caption = CoD.VoteConfirmation.GetVoteString( vote, selectedVote, totalVotes )
		CoD.VotingPopup.CreateVotingItemElement( votingItemContainer, vote.item.ImageName, desc, caption )
		votingItemContainer:setAlpha( alpha )
	end
end

CoD.VoteConfirmation.ComicsHack = function ( votes )
	for i = 1, 2, 1 do
		if votes[i].item.ImageName == "menu_motd_votecamo_4b" then
			local swapImageName = votes[CoD.VoteConfirmation.ComicsSwapIndex].item.ImageName
			local swapVotingItemString = votes[CoD.VoteConfirmation.ComicsSwapIndex].item.VotingItemString
			votes[CoD.VoteConfirmation.ComicsSwapIndex].item.ImageName = votes[i].item.ImageName
			votes[CoD.VoteConfirmation.ComicsSwapIndex].item.VotingItemString = votes[i].item.VotingItemString
			votes[i].item.ImageName = swapImageName
			votes[i].item.VotingItemString = swapVotingItemString
		end
	end
end

CoD.VoteConfirmation.Setup = function ( voteConf )
	local y = CoD.VotingPopup.MessageTop
	CoD.VotingPopup.AddTitle( voteConf, Engine.Localize( "MENU_VOTE_SUBMITTED_TITLE", Engine.ToUpper( voteConf.m_itemName ) ), y )
	local centerElementContainer = LUI.UIElement.new()
	centerElementContainer:setLeftRight( true, true, 0, 0 )
	centerElementContainer:setTopBottom( true, true, 0, 0 )
	local votes = {}
	CoD.VoteConfirmation.AddVoteInfo( votes, voteConf.LeftVotingItem )
	CoD.VoteConfirmation.AddVoteInfo( votes, voteConf.RightVotingItem )
	CoD.VoteConfirmation.AddVoteInfo( votes, voteConf.TopVotingItem )
	CoD.VoteConfirmation.AddVoteInfo( votes, voteConf.BottomVotingItem )
	local totalVotes = 0
	for i = 1, 4, 1 do
		if votes[i] ~= nil then
			totalVotes = totalVotes + votes[i].count
		end
	end
	table.sort( votes, CoD.VoteConfirmation.Comparison )
	CoD.VoteConfirmation.ComicsHack( votes )
	CoD.VoteConfirmation.CreateElement( centerElementContainer, votes[1], voteConf.m_vote, totalVotes, "topleft", 1 )
	CoD.VoteConfirmation.CreateElement( centerElementContainer, votes[2], voteConf.m_vote, totalVotes, "topright", 1 )
	CoD.VoteConfirmation.CreateElement( centerElementContainer, votes[3], voteConf.m_vote, totalVotes, "bottomleft", 0.3 )
	CoD.VoteConfirmation.CreateElement( centerElementContainer, votes[4], voteConf.m_vote, totalVotes, "bottomright", 0.3 )
	local line = LUI.UIImage.new()
	line:setLeftRight( true, true, 0, 0 )
	line:setTopBottom( false, false, 30, 31 )
	line:setRGB( 0.5, 0.5, 0.5 )
	line:setAlpha( 0.1 )
	centerElementContainer:addElement( line )
	voteConf:addElement( centerElementContainer )
end

LUI.createMenu.VotingConfirmation = function ( controller )
	local voteConf = CoD.Menu.New( "VotingConfirmation" )
	voteConf:addLargePopupBackground()
	local continueButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_CONTINUE" ), voteConf, "voteconf_continue" )
	voteConf:registerEventHandler( "voteconf_continue", CoD.VoteConfirmation.Close )
	voteConf:registerEventHandler( "voteconf_share", CoD.VoteConfirmation.Share )
	voteConf:addLeftButtonPrompt( continueButton )
	local sendVoteToFBEnabled = Dvar.tu11_sendVoteToFBEnabled:get()
	if sendVoteToFBEnabled == true then
		local fbButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_FB_SEND_TO_FACEBOOK" ), voteConf, "voteconf_share" )
		voteConf:addLeftButtonPrompt( fbButton )
	end
	voteConf.setup = CoD.VoteConfirmation.Setup
	return voteConf
end

LUI.createMenu.Voting_Facebook_Post_Success = function ( controller, itemName )
	local popup = CoD.Popup.SetupPopup( "Voting_Facebook_Post_Success", controller )
	popup.title:setText( Engine.Localize( "MENU_FB_MSG_SENT" ) )
	popup.msg:setText( Engine.Localize( "MENU_FB_MSG_DESC", Engine.Localize( "MENU_FB_VOTE_MESSAGE", itemName ) ) )
	popup:addSelectButton( Engine.Localize( "MPUI_OK" ), 100, "button_prompt_back" )
	local invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", popup, "button_prompt_back", true )
	popup:addLeftButtonPrompt( invisibleBackButton )
	return popup
end

local Voting_LinkToFacebook = function ( self, event )
	Engine.ExecNow( controller, "fbLinkFacebook" )
end

local Voting_LinkToFacebookSuccess = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "voteconf_share",
		controller = event.controller
	} )
end

LUI.createMenu.Voting_Facebook_Link_Account = function ( controller )
	local popup = CoD.Popup.SetupPopupChoice( "Voting_Facebook_Link_Account", controller )
	popup.title:setText( Engine.Localize( "MENU_FACEBOOK" ) )
	popup.msg:setText( Engine.Localize( "MENU_FACEBOOK_ACCOUNT_LINK_DESC" ) )
	popup:addBackButton()
	popup.choiceA:setLabel( Engine.Localize( "MENU_LINK_ACCOUNT" ) )
	popup.choiceB:setLabel( Engine.Localize( "MENU_NOT_NOW" ) )
	popup.choiceA:setActionEventName( "link_facebook" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "link_facebook", Voting_LinkToFacebook )
	popup:registerEventHandler( "facebook_register_success", Voting_LinkToFacebookSuccess )
	return popup
end

