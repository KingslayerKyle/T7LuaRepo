-- c903010a8e48e3541ab2b112c8b6d9bd
-- This hash is used for caching, delete to decompile the file again

CoD.Prematch_WaitingForPlayers = InheritFrom( LUI.UIElement )
CoD.Prematch_WaitingForPlayers.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Prematch_WaitingForPlayers )
	self.id = "Prematch_WaitingForPlayers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local waitingForPlayersLabel = LUI.UITightText.new()
	waitingForPlayersLabel:setLeftRight( false, false, -100, 100 )
	waitingForPlayersLabel:setTopBottom( false, false, -70, -10 )
	waitingForPlayersLabel:setText( Engine.Localize( "MP_WAITING_FOR_PLAYERS_SHOUTCASTER" ) )
	waitingForPlayersLabel:setTTF( "fonts/default.ttf" )
	self:addElement( waitingForPlayersLabel )
	self.waitingForPlayersLabel = waitingForPlayersLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local waitingForPlayersLabelFrame2 = function ( waitingForPlayersLabel, event )
					local waitingForPlayersLabelFrame3 = function ( waitingForPlayersLabel, event )
						if not event.interrupted then
							waitingForPlayersLabel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						waitingForPlayersLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( waitingForPlayersLabel, event )
						else
							waitingForPlayersLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						waitingForPlayersLabelFrame3( waitingForPlayersLabel, event )
						return 
					else
						waitingForPlayersLabel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						waitingForPlayersLabel:setAlpha( 0.75 )
						waitingForPlayersLabel:registerEventHandler( "transition_complete_keyframe", waitingForPlayersLabelFrame3 )
					end
				end
				
				waitingForPlayersLabel:completeAnimation()
				self.waitingForPlayersLabel:setAlpha( 1 )
				waitingForPlayersLabelFrame2( waitingForPlayersLabel, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

