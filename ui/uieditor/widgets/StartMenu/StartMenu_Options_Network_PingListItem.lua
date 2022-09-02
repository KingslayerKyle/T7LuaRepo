-- ed1879eb7f3bf316ab65c42099e007aa
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_Options_Network_PingListItem = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Network_PingListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Network_PingListItem )
	self.id = "StartMenu_Options_Network_PingListItem"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 84 )
	
	local pingImage = LUI.UIImage.new()
	pingImage:setLeftRight( false, false, -32, 32 )
	pingImage:setTopBottom( true, false, 0, 64 )
	self:addElement( pingImage )
	self.pingImage = pingImage
	
	local pingText = LUI.UITightText.new()
	pingText:setLeftRight( false, false, -100, 100 )
	pingText:setTopBottom( true, false, 64, 84 )
	pingText:setTTF( "fonts/default.ttf" )
	self:addElement( pingText )
	self.pingText = pingText
	
	self.pingImage:linkToElementModel( self, "pingIndex", true, function ( model )
		local pingIndex = Engine.GetModelValue( model )
		if pingIndex then
			pingImage:setImage( RegisterImage( GetScoreboardPlayerPingBarImage( pingIndex ) ) )
		end
	end )
	self.pingText:linkToElementModel( self, "pingIndex", true, function ( model )
		local pingIndex = Engine.GetModelValue( model )
		if pingIndex then
			pingText:setText( Engine.Localize( GetScoreboardPlayerPingRange( pingIndex ) ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.pingImage:close()
		element.pingText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

