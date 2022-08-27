-- 1cc57f4fc6e8a2927964cfb62c19eb6a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 294 )
	self:setTopBottom( true, false, 0, 18 )
	
	local gametype = LUI.UITightText.new()
	gametype:setLeftRight( true, false, 0, 495 )
	gametype:setTopBottom( true, false, 0, 18 )
	gametype:setRGB( 0.88, 0.89, 0.93 )
	gametype:setAlpha( 0.8 )
	gametype:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
	gametype:setTTF( "fonts/escom.ttf" )
	gametype:setLetterSpacing( 2 )
	self:addElement( gametype )
	self.gametype = gametype
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gametype:completeAnimation()
				self.gametype:setText( Engine.Localize( "MENU_SCOREBOARD_HEADER" ) )
				self.clipFinished( gametype, {} )
			end
		},
		Special = {
			DefaultClip = function ()
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

