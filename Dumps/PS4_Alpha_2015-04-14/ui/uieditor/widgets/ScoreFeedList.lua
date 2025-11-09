require( "ui.uieditor.widgets.MPHudWidgets.ScoreFeedRow" )

local ScoreFeedList_AddRow = function ( self, label, score )
	local rows = self.rows
	local maxRows = 4
	local row = CoD.ScoreFeedRow.new()
	row:setState( "DefaultState" )
	row.scoreNameText:setText( label )
	LUI.UIVerticalList.addElementToTop( self, row )
	table.insert( rows, row )
	if self.timer then
		self.timer:close()
	end
	local timer = LUI.UITimer.new( 1000, "time_up_reset", true )
	self:addElement( timer )
	self.timer = timer
	
	if maxRows < #rows then
		rows[1]:playClip( "FadeOut" )
		LUI.UIVerticalList.removeElement( self, rows[1] )
		table.remove( rows, 1 )
	end
end

local ScoreFeedList_TimeUpReset = function ( self, event )
	self.timer = nil
	for i = 1, #self.rows, 1 do
		self.rows[i]:playClip( "Invisible" )
	end
end

local PostLoadFunc = function ( self )
	self.rows = {}
	self.addRow = ScoreFeedList_AddRow
	self:registerEventHandler( "time_up_reset", ScoreFeedList_TimeUpReset )
end

CoD.ScoreFeedList = InheritFrom( LUI.UIElement )
CoD.ScoreFeedList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreFeedList )
	self.id = "ScoreFeedList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 106 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

