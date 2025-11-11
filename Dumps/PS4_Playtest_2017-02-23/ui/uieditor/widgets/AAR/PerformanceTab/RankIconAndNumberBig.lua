CoD.RankIconAndNumberBig = InheritFrom( LUI.UIElement )
CoD.RankIconAndNumberBig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankIconAndNumberBig )
	self.id = "RankIconAndNumberBig"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 234 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local NextRankIcon = LUI.UIImage.new()
	NextRankIcon:setLeftRight( 0.5, 0.5, -109, -48 )
	NextRankIcon:setTopBottom( 0.5, 0.5, -30, 30 )
	self:addElement( NextRankIcon )
	self.NextRankIcon = NextRankIcon
	
	local NextRank = LUI.UITightText.new()
	NextRank:setLeftRight( 0.5, 0.5, 44, 100 )
	NextRank:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	NextRank:setText( Engine.Localize( "55" ) )
	NextRank:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( NextRank )
	self.NextRank = NextRank
	
	local LEVEL = LUI.UIText.new()
	LEVEL:setLeftRight( 0.5, 0.5, -46, 35 )
	LEVEL:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	LEVEL:setText( Engine.Localize( "MENU_LEVEL_CAPS" ) )
	LEVEL:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LEVEL:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	LEVEL:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LEVEL )
	self.LEVEL = LEVEL
	
	self.resetProperties = function ()
		NextRankIcon:completeAnimation()
		NextRank:completeAnimation()
		NextRankIcon:setScale( 1 )
		NextRank:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GrowBig = function ()
				self.resetProperties()
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

