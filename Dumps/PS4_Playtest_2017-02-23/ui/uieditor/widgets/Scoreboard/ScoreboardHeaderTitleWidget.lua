CoD.ScoreboardHeaderTitleWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardHeaderTitleWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardHeaderTitleWidget )
	self.id = "ScoreboardHeaderTitleWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 441 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local gametype = LUI.UITightText.new()
	gametype:setLeftRight( 0, 0, 0, 742 )
	gametype:setTopBottom( 0, 0, 0, 27 )
	gametype:setRGB( 0.88, 0.89, 0.93 )
	gametype:setAlpha( 0.8 )
	gametype:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
	gametype:setTTF( "fonts/escom.ttf" )
	gametype:setLetterSpacing( 2 )
	self:addElement( gametype )
	self.gametype = gametype
	
	self.resetProperties = function ()
		gametype:completeAnimation()
		gametype:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Special = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				gametype:completeAnimation()
				self.gametype:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER_SPECIAL" ) )
				self.clipFinished( gametype, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Special",
			condition = function ( menu, element, event )
				return LobbyConnectedToDedicatedHost()
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

