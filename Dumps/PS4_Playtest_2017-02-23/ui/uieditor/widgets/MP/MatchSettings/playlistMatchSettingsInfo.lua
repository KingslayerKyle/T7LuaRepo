require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )

CoD.playlistMatchSettingsInfo = InheritFrom( LUI.UIElement )
CoD.playlistMatchSettingsInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.playlistMatchSettingsInfo )
	self.id = "playlistMatchSettingsInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 825 )
	self.anyChildUsesUpdateState = true
	
	local gameModeInfo = CoD.matchSettingsInfo.new( menu, controller )
	gameModeInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	gameModeInfo:setLeftRight( 0, 0, 0, 669 )
	gameModeInfo:setTopBottom( 0, 0, -0.5, 824.5 )
	gameModeInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	gameModeInfo:linkToElementModel( self, nil, false, function ( model )
		gameModeInfo:setModel( model, controller )
	end )
	self:addElement( gameModeInfo )
	self.gameModeInfo = gameModeInfo
	
	local playlistCount = LUI.UIText.new()
	playlistCount:setLeftRight( 0, 0, 1, 669 )
	playlistCount:setTopBottom( 0, 0, -33, -3 )
	playlistCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playlistCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	playlistCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	playlistCount:linkToElementModel( self, "playlistCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playlistCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( playlistCount )
	self.playlistCount = playlistCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.gameModeInfo:close()
		self.playlistCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

