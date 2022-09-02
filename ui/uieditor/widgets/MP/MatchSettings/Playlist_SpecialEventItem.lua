-- 58a44b25287be3990740734a04c6d068
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MP.MatchSettings.Playlist_SpecialEventIcon" )

CoD.Playlist_SpecialEventItem = InheritFrom( LUI.UIElement )
CoD.Playlist_SpecialEventItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Playlist_SpecialEventItem )
	self.id = "Playlist_SpecialEventItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 34 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local PlaylistSpecialEventIcon = CoD.Playlist_SpecialEventIcon.new( menu, controller )
	PlaylistSpecialEventIcon:setLeftRight( true, false, -7, 41 )
	PlaylistSpecialEventIcon:setTopBottom( false, false, -24, 24 )
	PlaylistSpecialEventIcon:setScale( 0.65 )
	self:addElement( PlaylistSpecialEventIcon )
	self.PlaylistSpecialEventIcon = PlaylistSpecialEventIcon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlaylistSpecialEventIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

