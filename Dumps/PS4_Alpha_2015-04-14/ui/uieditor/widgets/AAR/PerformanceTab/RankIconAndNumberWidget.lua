CoD.RankIconAndNumberWidget = InheritFrom( LUI.UIElement )
CoD.RankIconAndNumberWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankIconAndNumberWidget )
	self.id = "RankIconAndNumberWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 30 )
	
	local NextRankIcon = LUI.UIImage.new()
	NextRankIcon:setLeftRight( true, true, 0, -18 )
	NextRankIcon:setTopBottom( true, true, 0, 0 )
	NextRankIcon:setRGB( 1, 1, 1 )
	NextRankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( NextRankIcon )
	self.NextRankIcon = NextRankIcon
	
	local NextRank = LUI.UITightText.new()
	NextRank:setLeftRight( false, true, -18, 0 )
	NextRank:setTopBottom( true, true, 5, -5 )
	NextRank:setRGB( 1, 1, 1 )
	NextRank:setText( Engine.Localize( "55" ) )
	NextRank:setTTF( "fonts/Entovo.ttf" )
	self:addElement( NextRank )
	self.NextRank = NextRank
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				NextRankIcon:completeAnimation()
				self.NextRankIcon:setLeftRight( true, false, 0, 30 )
				self.NextRankIcon:setTopBottom( true, false, 0, 30 )
				self.clipFinished( NextRankIcon, {} )
				NextRank:completeAnimation()
				self.NextRank:setLeftRight( true, false, 30, 48 )
				self.NextRank:setTopBottom( true, false, 5, 25 )
				self.clipFinished( NextRank, {} )
			end,
			GrowBig = function ()
				self:setupElementClipCounter( 2 )
				local NextRankIconFrame2 = function ( NextRankIcon, event )
					local NextRankIconFrame3 = function ( NextRankIcon, event )
						if not event.interrupted then
							NextRankIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						NextRankIcon:setLeftRight( true, false, 0, 30 )
						NextRankIcon:setTopBottom( true, false, 0, 30 )
						if event.interrupted then
							self.clipFinished( NextRankIcon, event )
						else
							NextRankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NextRankIconFrame3( NextRankIcon, event )
						return 
					else
						NextRankIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						NextRankIcon:setLeftRight( true, false, 0, 40 )
						NextRankIcon:setTopBottom( true, false, 0, 40 )
						NextRankIcon:registerEventHandler( "transition_complete_keyframe", NextRankIconFrame3 )
					end
				end
				
				NextRankIcon:completeAnimation()
				self.NextRankIcon:setLeftRight( true, false, 0, 30 )
				self.NextRankIcon:setTopBottom( true, false, 0, 30 )
				NextRankIconFrame2( NextRankIcon, {} )
				local NextRankFrame2 = function ( NextRank, event )
					local NextRankFrame3 = function ( NextRank, event )
						if not event.interrupted then
							NextRank:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						NextRank:setLeftRight( true, false, 30, 48 )
						NextRank:setTopBottom( true, false, 5, 25 )
						if event.interrupted then
							self.clipFinished( NextRank, event )
						else
							NextRank:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NextRankFrame3( NextRank, event )
						return 
					else
						NextRank:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						NextRank:setLeftRight( true, false, 39, 69 )
						NextRank:setTopBottom( true, false, 0, 30 )
						NextRank:registerEventHandler( "transition_complete_keyframe", NextRankFrame3 )
					end
				end
				
				NextRank:completeAnimation()
				self.NextRank:setLeftRight( true, false, 30, 48 )
				self.NextRank:setTopBottom( true, false, 5, 25 )
				NextRankFrame2( NextRank, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

