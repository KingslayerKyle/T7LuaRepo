CoD.LeaderboardListButton = {}
CoD.LeaderboardListButton.Height = 30
CoD.LeaderboardListButton.TextOffset = 5
CoD.LeaderboardListButton.TextHeight = CoD.textSize.Default
CoD.LeaderboardListButton.Font = CoD.fonts.Default
CoD.LeaderboardListButton.BackgroundColor = {
	r = 1,
	g = 1,
	b = 1,
	a = 0
}
local CoD_LeaderboardListButton_SoundListener_GainFocus = function ( self, event )
	Engine.PlaySound( "uin_navigation_click" )
end

CoD.LeaderboardListButton.SetupTextElement = function ( textElement )
	textElement:registerAnimationState( "disabled", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.5
	} )
	textElement:registerAnimationState( "button_over", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	textElement:registerAnimationState( "button_over_disabled", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.5
	} )
	LUI.UIButton.SetupElement( textElement )
end

CoD.LeaderboardListButton.new = function ( index, dataRow, defaultAnimationState, actionEventName )
	local LeaderboardListButton = LUI.UIButton.new( defaultAnimationState, actionEventName )
	LeaderboardListButton.id = "LeaderboardListButton"
	LeaderboardListButton.serverIndex = index - 1
	local buttonBackground = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = CoD.LeaderboardListButton.BackgroundColor.r,
		green = CoD.LeaderboardListButton.BackgroundColor.g,
		blue = CoD.LeaderboardListButton.BackgroundColor.b,
		alpha = CoD.LeaderboardListButton.BackgroundColor.a,
		material = RegisterMaterial( "menu_mp_lobby_bar_name" )
	} )
	buttonBackground:registerAnimationState( "button_over", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.5
	} )
	LUI.UIButton.SetupElement( buttonBackground )
	LeaderboardListButton.background = buttonBackground
	LeaderboardListButton:addElement( buttonBackground )
	local row = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = CoD.LeaderboardList.ColumnSpacing
	} )
	row:addSpacer( CoD.LeaderboardListButton.TextOffset )
	for colIndex, dataCol in ipairs( dataRow ) do
		local f3_local3 = nil
		if colIndex ~= 2 or true == CoD.isZombie then
			f3_local3 = LUI.UIText.new( {
				left = 0,
				top = -CoD.LeaderboardListButton.TextHeight / 2,
				right = CoD.LeaderboardList.ColumnWidth[colIndex],
				bottom = CoD.LeaderboardListButton.TextHeight / 2,
				red = 1,
				green = 1,
				blue = 1,
				alpha = 1,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = false,
				bottomAnchor = false,
				font = CoD.LeaderboardListButton.Font
			} )
			f3_local3:setText( dataCol.col )
			CoD.LeaderboardListButton.SetupTextElement( f3_local3 )
		else
			f3_local3 = LUI.UIImage.new( {
				left = 0,
				top = 0,
				right = CoD.LeaderboardList.ColumnWidth[colIndex],
				bottom = CoD.LeaderboardListButton.TextHeight + 5,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false,
				alpha = 1,
				material = RegisterMaterial( dataCol.col )
			} )
		end
		row:addElement( f3_local3 )
	end
	LeaderboardListButton:addElement( row )
	local soundListener = LUI.UIElement.new()
	LeaderboardListButton:addElement( soundListener )
	soundListener:registerEventHandler( "gain_focus", CoD_LeaderboardListButton_SoundListener_GainFocus )
	return LeaderboardListButton
end

