-- bef5a629125d68b6e0a760c39b4bbc6b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 40 )
	
	local NextRankIcon = LUI.UIImage.new()
	NextRankIcon:setLeftRight( true, false, 0, 41 )
	NextRankIcon:setTopBottom( true, false, 0, 40 )
	self:addElement( NextRankIcon )
	self.NextRankIcon = NextRankIcon
	
	local NextRank = LUI.UITightText.new()
	NextRank:setLeftRight( true, false, 43.5, 87 )
	NextRank:setTopBottom( true, false, 10, 32 )
	NextRank:setText( Engine.Localize( "55" ) )
	NextRank:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( NextRank )
	self.NextRank = NextRank
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GrowBig = function ()
				self:setupElementClipCounter( 2 )
				local NextRankIconFrame2 = function ( NextRankIcon, event )
					local NextRankIconFrame3 = function ( NextRankIcon, event )
						if not event.interrupted then
							NextRankIcon:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						NextRankIcon:setScale( 1 )
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
						NextRankIcon:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						NextRankIcon:setScale( 1.2 )
						NextRankIcon:registerEventHandler( "transition_complete_keyframe", NextRankIconFrame3 )
					end
				end
				
				NextRankIcon:completeAnimation()
				self.NextRankIcon:setScale( 1 )
				NextRankIconFrame2( NextRankIcon, {} )
				local NextRankFrame2 = function ( NextRank, event )
					local NextRankFrame3 = function ( NextRank, event )
						if not event.interrupted then
							NextRank:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						NextRank:setScale( 1 )
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
						NextRank:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						NextRank:setScale( 1.2 )
						NextRank:registerEventHandler( "transition_complete_keyframe", NextRankFrame3 )
					end
				end
				
				NextRank:completeAnimation()
				self.NextRank:setScale( 1 )
				NextRankFrame2( NextRank, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

