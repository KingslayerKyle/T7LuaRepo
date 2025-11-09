CoD.StartMenu_MusicTracks_TrackListInfo = InheritFrom( LUI.UIElement )
CoD.StartMenu_MusicTracks_TrackListInfo.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_MusicTracks_TrackListInfo )
	self.id = "StartMenu_MusicTracks_TrackListInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 501 )
	self:setTopBottom( true, false, 0, 20 )
	
	local selectedFilter = LUI.UITightText.new()
	selectedFilter:setLeftRight( true, false, 0, 124 )
	selectedFilter:setTopBottom( true, false, 0, 20 )
	selectedFilter:setRGB( 0, 0, 0 )
	selectedFilter:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	selectedFilter:subscribeToGlobalModel( controller, "MusicTracksBase", "currentFilter", function ( model )
		local currentFilter = Engine.GetModelValue( model )
		if currentFilter then
			selectedFilter:setText( LocalizeIntoStrXIfEqualsElseY( "MENU_ALL", "MENU_SHOWING_ALL_TRACKS", "MENU_SHOWING_X_TRACKS", currentFilter ) )
		end
	end )
	self:addElement( selectedFilter )
	self.selectedFilter = selectedFilter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.selectedFilter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

