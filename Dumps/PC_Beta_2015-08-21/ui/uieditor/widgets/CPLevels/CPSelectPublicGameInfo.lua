require( "ui.uieditor.widgets.CPLevels.CPMissionInfo" )

CoD.CPSelectPublicGameInfo = InheritFrom( LUI.UIElement )
CoD.CPSelectPublicGameInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CPSelectPublicGameInfo )
	self.id = "CPSelectPublicGameInfo"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 869 )
	self:setTopBottom( true, false, 0, 417 )
	
	local CPMissionInfo = CoD.CPMissionInfo.new( menu, controller )
	CPMissionInfo:setLeftRight( true, false, 0, 869 )
	CPMissionInfo:setTopBottom( true, false, 0, 417 )
	CPMissionInfo:linkToElementModel( self, "mapInfoVis", true, function ( model )
		local mapInfoVis = Engine.GetModelValue( model )
		if mapInfoVis then
			CPMissionInfo:setAlpha( mapInfoVis )
		end
	end )
	CPMissionInfo:linkToElementModel( self, nil, false, function ( model )
		CPMissionInfo:setModel( model, controller )
	end )
	self:addElement( CPMissionInfo )
	self.CPMissionInfo = CPMissionInfo
	
	local InfoImage = LUI.UIImage.new()
	InfoImage:setLeftRight( true, false, 39, 856 )
	InfoImage:setTopBottom( true, false, 0, 259 )
	InfoImage:linkToElementModel( self, "Image", true, function ( model )
		local Image = Engine.GetModelValue( model )
		if Image then
			InfoImage:setImage( RegisterImage( Image ) )
		end
	end )
	self:addElement( InfoImage )
	self.InfoImage = InfoImage
	
	local InfoText = LUI.UIText.new()
	InfoText:setLeftRight( true, false, 39, 430 )
	InfoText:setTopBottom( true, false, 272.38, 297.38 )
	InfoText:setTTF( "fonts/default.ttf" )
	InfoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	InfoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	InfoText:linkToElementModel( self, "infoText", true, function ( model )
		local infoText = Engine.GetModelValue( model )
		if infoText then
			InfoText:setText( Engine.Localize( infoText ) )
		end
	end )
	self:addElement( InfoText )
	self.InfoText = InfoText
	
	local PlayerCount = LUI.UIText.new()
	PlayerCount:setLeftRight( true, false, 656, 856 )
	PlayerCount:setTopBottom( true, false, 234, 259 )
	PlayerCount:setTTF( "fonts/default.ttf" )
	PlayerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PlayerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerCount:linkToElementModel( self, "playerCountText", true, function ( model )
		local playerCountText = Engine.GetModelValue( model )
		if playerCountText then
			PlayerCount:setText( Engine.Localize( playerCountText ) )
		end
	end )
	self:addElement( PlayerCount )
	self.PlayerCount = PlayerCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPMissionInfo:close()
		element.InfoImage:close()
		element.InfoText:close()
		element.PlayerCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

