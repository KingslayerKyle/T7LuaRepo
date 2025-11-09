require( "ui.T6.ScrollingVerticalList" )
require( "ui.T6.LeaderboardListButton" )

CoD.LeaderboardList = {}
CoD.LeaderboardList.ColumnWidth = {}
CoD.LeaderboardList.ColumnWidth[1] = 80
CoD.LeaderboardList.ColumnWidth[2] = 30
CoD.LeaderboardList.ColumnWidth[3] = 30
CoD.LeaderboardList.ColumnWidth[4] = 125
CoD.LeaderboardList.ColumnWidth[5] = 50
CoD.LeaderboardList.ColumnWidth[6] = 70
CoD.LeaderboardList.ColumnWidth[7] = 50
CoD.LeaderboardList.ColumnWidth[8] = 50
CoD.LeaderboardList.ColumnWidth[9] = 50
if CoD.isZombie == true then
	CoD.LeaderboardList.ColumnWidth[2] = 185
	CoD.LeaderboardList.ColumnWidth[3] = 94
	CoD.LeaderboardList.ColumnWidth[4] = 94
	CoD.LeaderboardList.ColumnWidth[5] = 94
	CoD.LeaderboardList.ColumnWidth[6] = 94
	CoD.LeaderboardList.ColumnWidth[7] = 94
	CoD.LeaderboardList.ColumnWidth[8] = 94
	CoD.LeaderboardList.ColumnWidth[9] = 94
end
CoD.LeaderboardList.RowHeight = CoD.CoD9Button.Height
CoD.LeaderboardList.ColumnSpacing = 5
local LeaderboardList_Update = function ( self, event )
	self.verticalList:removeAllChildren()
	local leaderboardData = Engine.GetLeaderboardData( event.controller )
	if leaderboardData == nil or #leaderboardData == 0 then
		DebugPrint( "No leaderboard data." )
		return 
	end
	for index, dataRow in ipairs( leaderboardData ) do
		local row = CoD.LeaderboardListButton.new( index, dataRow, {
			left = 0,
			top = 0,
			right = 0,
			bottom = CoD.LeaderboardList.RowHeight,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			spacing = CoD.LeaderboardList.ColumnSpacing
		} )
		self:addElementToList( row )
		if index == 1 and CoD.useController then
			row:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

CoD.LeaderboardList.new = function ( controller, defaultAnimationState, spacing, filter )
	if filter == nil then
		filter = CoD.LB_FILTER_NONE
	end
	local leaderboardList = CoD.ScrollingVerticalList.new( defaultAnimationState, spacing )
	leaderboardList.id = "LeaderboardList"
	leaderboardList:registerEventHandler( "leaderboardlist_update", LeaderboardList_Update )
	Engine.RequestLeaderboardData( controller, filter )
	return leaderboardList
end

