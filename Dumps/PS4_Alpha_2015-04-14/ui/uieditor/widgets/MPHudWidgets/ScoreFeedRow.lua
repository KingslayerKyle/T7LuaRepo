CoD.ScoreFeedRow = InheritFrom( LUI.UIElement )
CoD.ScoreFeedRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreFeedRow )
	self.id = "ScoreFeedRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 25 )
	
	local scoreNameText = LUI.UITightText.new()
	scoreNameText:setLeftRight( true, false, 0, 92 )
	scoreNameText:setTopBottom( true, true, 0, 0 )
	scoreNameText:setRGB( 1, 1, 1 )
	scoreNameText:setText( Engine.Localize( "SCORE_HPM_KILL" ) )
	scoreNameText:setTTF( "fonts/default.ttf" )
	self:addElement( scoreNameText )
	self.scoreNameText = scoreNameText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				scoreNameText:completeAnimation()
				self.scoreNameText:setAlpha( 1 )
				self.clipFinished( scoreNameText, {} )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )
				local scoreNameTextFrame2 = function ( scoreNameText, event )
					local scoreNameTextFrame3 = function ( scoreNameText, event )
						if not event.interrupted then
							scoreNameText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						scoreNameText:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( scoreNameText, event )
						else
							scoreNameText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						scoreNameTextFrame3( scoreNameText, event )
						return 
					else
						scoreNameText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						scoreNameText:registerEventHandler( "transition_complete_keyframe", scoreNameTextFrame3 )
					end
				end
				
				scoreNameText:completeAnimation()
				self.scoreNameText:setAlpha( 1 )
				scoreNameTextFrame2( scoreNameText, {} )
			end,
			Invisible = function ()
				self:setupElementClipCounter( 1 )
				scoreNameText:completeAnimation()
				self.scoreNameText:setAlpha( 0 )
				self.clipFinished( scoreNameText, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

