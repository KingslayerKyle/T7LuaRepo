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
	self:setLeftRight( 0, 0, 0, 126 )
	self:setTopBottom( 0, 0, 0, 126 )
	
	local pingImage = LUI.UIImage.new()
	pingImage:setLeftRight( 0.5, 0.5, -48, 48 )
	pingImage:setTopBottom( 0, 0, 0, 96 )
	self:addElement( pingImage )
	self.pingImage = pingImage
	
	local pingText = LUI.UITightText.new()
	pingText:setLeftRight( 0.5, 0.5, -150, 150 )
	pingText:setTopBottom( 0, 0, 96, 126 )
	pingText:setTTF( "fonts/default.ttf" )
	self:addElement( pingText )
	self.pingText = pingText
	
	self.pingImage:linkToElementModel( self, "pingIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			pingImage:setImage( RegisterImage( GetScoreboardPlayerPingBarImage( modelValue ) ) )
		end
	end )
	self.pingText:linkToElementModel( self, "pingIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			pingText:setText( GetScoreboardPlayerPingRange( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.pingImage:close()
		self.pingText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

