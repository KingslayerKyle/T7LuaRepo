require( "ui.LUI.LUIVerticalList" )

CoD.FileshareSummary = {}
CoD.FileshareSummary.RowHeight = 40
CoD.FileshareSummary.HighlightNormal = 1
CoD.FileshareSummary.HighlightBright = 2
CoD.FileshareSummary.HighlightDark = 3
CoD.FileshareSummary.GetShadedIconUpdate = function ( iconElement, r, g, b, alpha, shadingAlpha, iconMaterial )
	if r ~= nil and g ~= nil and b ~= nil then
		iconElement.iconBg:setRGB( r, g, b )
	end
	if alpha ~= nil then
		iconElement.iconBg:setAlpha( alpha )
	end
	if shadingAlpha ~= nil then
		iconElement.iconShading:setAlpha( shadingAlpha )
	end
	if iconMaterial ~= nil then
		iconElement.icon:setImage( RegisterMaterial( iconMaterial ) )
		iconElement.icon:setAlpha( 1 )
	else
		iconElement.icon:setAlpha( 0 )
	end
end

CoD.FileshareSummary.GetShadedIcon = function ( r, g, b, alpha, shadingAlpha, iconMaterial )
	local iconElement = LUI.UIElement.new()
	
	local iconBg = LUI.UIImage.new()
	iconBg:setLeftRight( true, true, 0, 0 )
	iconBg:setTopBottom( true, true, 0, 0 )
	iconElement:addElement( iconBg )
	iconElement.iconBg = iconBg
	
	local iconShading = LUI.UIImage.new()
	iconShading:setLeftRight( true, true, 0, 0 )
	iconShading:setTopBottom( true, false, 0, 8 )
	iconShading:setRGB( 1, 1, 1 )
	iconElement:addElement( iconShading )
	iconElement.iconShading = iconShading
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -16, 16 )
	icon:setTopBottom( false, false, -16, 16 )
	iconElement:addElement( icon )
	iconElement.icon = icon
	
	iconElement.update = CoD.FileshareSummary.GetShadedIconUpdate
	iconElement:update( r, g, b, alpha, shadingAlpha, iconMaterial )
	return iconElement
end

CoD.FileshareSummary.PulseOn = function ( blinkingBar, event )
	blinkingBar:completeAnimation()
	blinkingBar:beginAnimation( "pulseon", 500 )
	blinkingBar:setAlpha( 0.8 )
end

CoD.FileshareSummary.PulseOff = function ( blinkingBar, event )
	blinkingBar:completeAnimation()
	blinkingBar:beginAnimation( "pulseoff", 500 )
	blinkingBar:setAlpha( 0.4 )
end

CoD.FileshareSummary.NewGroupRow = function ( group, maxBarWidth, highlightType, shouldPulse )
	local bgPadding = 3
	if group.occupied < 0 then
		group.occupied = 0
	end
	if group.remaining < 0 then
		group.remaining = 0
	end
	local iconAlpha = 1
	local shadedIconAlpha = 0.6
	if highlightType == CoD.FileshareSummary.HighlightDark then
		group.r = 0.4
		group.g = 0.4
		group.b = 0.4
		iconAlpha = 0.3
		shadedIconAlpha = 0.3
	end
	local percent = 0
	if group.occupied + group.remaining > 0 then
		percent = group.occupied / (group.occupied + group.remaining)
	end
	local spacing = 2
	local totalSpacing = spacing * (group.occupied - 1)
	local singleBarWidth = (maxBarWidth - totalSpacing) / (group.remaining + group.occupied)
	local groupRow = LUI.UIElement.new()
	groupRow:setLeftRight( true, true, 0, 0 )
	groupRow:setTopBottom( true, false, 0, CoD.FileshareSummary.RowHeight )
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0, 0 )
	bg:setAlpha( 1 )
	groupRow:addElement( bg )
	local shadedIcon = CoD.FileshareSummary.GetShadedIcon( group.r, group.g, group.b, iconAlpha, 0.3, group.icon )
	shadedIcon:setLeftRight( true, false, bgPadding, bgPadding + 50 )
	shadedIcon:setTopBottom( false, false, -16, 16 )
	groupRow:addElement( shadedIcon )
	for i = 1, group.occupied, 1 do
		local shadedBar = CoD.FileshareSummary.GetShadedIcon( group.r, group.g, group.b, shadedIconAlpha, 0.1 )
		local left = (singleBarWidth + spacing) * (i - 1)
		shadedBar:setLeftRight( true, false, bgPadding + 52 + left, bgPadding + 52 + left + singleBarWidth )
		shadedBar:setTopBottom( false, false, -16, 16 )
		groupRow:addElement( shadedBar )
	end
	local barWidth = (singleBarWidth + spacing) * group.occupied
	if highlightType == CoD.FileshareSummary.HighlightBright and group.remaining > 0 and shouldPulse == true then
		local blinkingBar = CoD.FileshareSummary.GetShadedIcon( group.r, group.g, group.b, 0.8, 0.1 )
		blinkingBar:setLeftRight( true, false, bgPadding + 52 + barWidth, bgPadding + 52 + barWidth + singleBarWidth )
		blinkingBar:setTopBottom( false, false, -16, 16 )
		blinkingBar:registerEventHandler( "transition_complete_pulseon", CoD.FileshareSummary.PulseOff )
		blinkingBar:registerEventHandler( "transition_complete_pulseoff", CoD.FileshareSummary.PulseOn )
		CoD.FileshareSummary.PulseOff( blinkingBar )
		groupRow:addElement( blinkingBar )
	end
	local name = LUI.UIText.new()
	name:setLeftRight( true, true, 60, 0 )
	name:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	name:setText( Engine.Localize( group.locName ) )
	name:setAlignment( LUI.Alignment.Left )
	groupRow:addElement( name )
	local slotsRemaining = LUI.UIText.new()
	slotsRemaining:setLeftRight( true, true, 0, -10 )
	slotsRemaining:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	if group.remaining == 0 then
		slotsRemaining:setText( group.occupied .. " - " .. Engine.Localize( "MENU_FILESHARE_FULL" ) )
		slotsRemaining:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
	else
		slotsRemaining:setText( group.occupied .. " / " .. group.occupied + group.remaining )
		slotsRemaining:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	end
	slotsRemaining:setAlignment( LUI.Alignment.Right )
	groupRow:addElement( slotsRemaining )
	local border = CoD.BorderT6.new( 1, 1, 1, 1, 0.2 )
	groupRow:addElement( border )
	if highlightType == CoD.FileshareSummary.HighlightDark then
		name:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
		slotsRemaining:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	end
	return groupRow
end

CoD.FileshareSummary.new = function ( top, width, maxBarWidth, groups, highlightedGroupName, shouldPulse )
	local summary = LUI.UIElement.new()
	summary:setLeftRight( false, true, -width, 0 )
	summary:setTopBottom( true, true, top, 0 )
	local numRows = #groups
	local y = 0
	local listSpacing = 4
	local bgHeight = CoD.textSize.ExtraSmall + 10 + numRows * CoD.FileshareSummary.RowHeight + (numRows - 1) * listSpacing
	if highlightedGroupName ~= nil then
		bgHeight = CoD.textSize.ExtraSmall + 10 + CoD.FileshareSummary.RowHeight
	end
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, -8, 8 )
	bg:setTopBottom( true, false, 0, bgHeight )
	bg:setRGB( 0.2, 0.2, 0.2 )
	bg:setAlpha( 0.3 )
	summary:addElement( bg )
	local heading = LUI.UIText.new()
	heading:setLeftRight( true, true, 0, 0 )
	heading:setTopBottom( true, false, y, y + CoD.textSize.ExtraSmall )
	heading:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	heading:setText( Engine.Localize( "MENU_FILESHARE_SAVED_FILES" ) )
	heading:setFont( CoD.fonts.ExtraSmall )
	heading:setAlignment( LUI.Alignment.Left )
	heading:setAlpha( 1 )
	summary:addElement( heading )
	local filesRemaining = LUI.UIText.new()
	filesRemaining:setLeftRight( true, true, 0, 0 )
	filesRemaining:setTopBottom( true, false, y, y + CoD.textSize.ExtraSmall )
	filesRemaining:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	filesRemaining:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_USED" ) )
	filesRemaining:setFont( CoD.fonts.ExtraSmall )
	filesRemaining:setAlignment( LUI.Alignment.Right )
	filesRemaining:setAlpha( 1 )
	summary:addElement( filesRemaining )
	y = y + CoD.textSize.ExtraSmall + 5
	local list = LUI.UIVerticalList.new()
	list:setLeftRight( true, true, 0, 0 )
	list:setTopBottom( true, true, y, 0 )
	list:setSpacing( listSpacing )
	summary:addElement( list )
	for i = 1, numRows, 1 do
		local highlight = CoD.FileshareSummary.HighlightNormal
		if highlightedGroupName ~= nil then
			if groups[i].name == highlightedGroupName then
				local row = CoD.FileshareSummary.NewGroupRow( groups[i], maxBarWidth, CoD.FileshareSummary.HighlightBright, shouldPulse )
				list:addElement( row )
			end
		end
		local row = CoD.FileshareSummary.NewGroupRow( groups[i], maxBarWidth, highlight, shouldPulse )
		list:addElement( row )
	end
	return summary
end

