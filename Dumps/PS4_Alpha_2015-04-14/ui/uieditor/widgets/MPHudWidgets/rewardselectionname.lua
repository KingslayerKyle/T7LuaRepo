CoD.RewardSelectionName = InheritFrom( LUI.UIElement )
CoD.RewardSelectionName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RewardSelectionName )
	self.id = "RewardSelectionName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 28 )
	
	local RewardSelectionName = LUI.UIText.new()
	RewardSelectionName:setLeftRight( true, false, 0, 400 )
	RewardSelectionName:setTopBottom( true, false, 2, 27 )
	RewardSelectionName:setRGB( 1, 1, 1 )
	RewardSelectionName:setText( Engine.Localize( "$(killstreakRewards.currentKillstreakRewardName)" ) )
	RewardSelectionName:setTTF( "fonts/default.ttf" )
	RewardSelectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	RewardSelectionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardSelectionName )
	self.RewardSelectionName = RewardSelectionName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RewardSelectionName:completeAnimation()
				self.RewardSelectionName:setAlpha( 0 )
				self.clipFinished( RewardSelectionName, {} )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )
				local RewardSelectionNameFrame2 = function ( RewardSelectionName, event )
					local RewardSelectionNameFrame3 = function ( RewardSelectionName, event )
						if not event.interrupted then
							RewardSelectionName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						RewardSelectionName:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RewardSelectionName, event )
						else
							RewardSelectionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RewardSelectionNameFrame3( RewardSelectionName, event )
						return 
					else
						RewardSelectionName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						RewardSelectionName:registerEventHandler( "transition_complete_keyframe", RewardSelectionNameFrame3 )
					end
				end
				
				RewardSelectionName:completeAnimation()
				self.RewardSelectionName:setAlpha( 1 )
				RewardSelectionNameFrame2( RewardSelectionName, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

