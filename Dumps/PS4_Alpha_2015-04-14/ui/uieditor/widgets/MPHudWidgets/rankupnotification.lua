local PostLoadFunc = function ( self )
	self:registerEventHandler( "rank_up", CoD.InGameNotificationQueue.RankUp )
	self:registerEventHandler( "notification_complete", CoD.InGameNotificationQueue.NotificationComplete )
end

CoD.RankUpNotification = InheritFrom( LUI.UIElement )
CoD.RankUpNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification )
	self.id = "RankUpNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 146 )
	
	local rankImage = LUI.UIImage.new()
	rankImage:setLeftRight( false, false, -48, 48 )
	rankImage:setTopBottom( true, false, 0, 96 )
	rankImage:setRGB( 1, 1, 1 )
	rankImage:setAlpha( 0 )
	rankImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	rankImage:subscribeToGlobalModel( controller, "InGameNotifications", "earnedRankUpImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankImage )
	self.rankImage = rankImage
	
	local rankNameText = LUI.UIText.new()
	rankNameText:setLeftRight( true, true, 0, 0 )
	rankNameText:setTopBottom( true, false, 96, 121 )
	rankNameText:setRGB( 1, 1, 1 )
	rankNameText:setAlpha( 0 )
	rankNameText:setTTF( "fonts/default.ttf" )
	rankNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rankNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rankNameText:subscribeToGlobalModel( controller, "InGameNotifications", "earnedRankUpName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankNameText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rankNameText )
	self.rankNameText = rankNameText
	
	local rankUpText = LUI.UITightText.new()
	rankUpText:setLeftRight( false, false, -85, 85 )
	rankUpText:setTopBottom( true, false, 121, 146 )
	rankUpText:setRGB( 1, 1, 1 )
	rankUpText:setAlpha( 0 )
	rankUpText:setText( Engine.Localize( "RANK_PROMOTED" ) )
	rankUpText:setTTF( "fonts/default.ttf" )
	self:addElement( rankUpText )
	self.rankUpText = rankUpText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 0 )
				self.clipFinished( rankImage, {} )
				rankNameText:completeAnimation()
				self.rankNameText:setAlpha( 0 )
				self.clipFinished( rankNameText, {} )
				rankUpText:completeAnimation()
				self.rankUpText:setAlpha( 0 )
				self.clipFinished( rankUpText, {} )
			end,
			RankUpEarned = function ()
				self:setupElementClipCounter( 3 )
				local rankImageFrame2 = function ( rankImage, event )
					local rankImageFrame3 = function ( rankImage, event )
						local rankImageFrame4 = function ( rankImage, event )
							local rankImageFrame5 = function ( rankImage, event )
								if not event.interrupted then
									rankImage:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
								end
								rankImage:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( rankImage, event )
								else
									rankImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								rankImageFrame5( rankImage, event )
								return 
							else
								rankImage:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
								rankImage:registerEventHandler( "transition_complete_keyframe", rankImageFrame5 )
							end
						end
						
						if event.interrupted then
							rankImageFrame4( rankImage, event )
							return 
						else
							rankImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							rankImage:registerEventHandler( "transition_complete_keyframe", rankImageFrame4 )
						end
					end
					
					if event.interrupted then
						rankImageFrame3( rankImage, event )
						return 
					else
						rankImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						rankImage:setAlpha( 0.9 )
						rankImage:registerEventHandler( "transition_complete_keyframe", rankImageFrame3 )
					end
				end
				
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 0 )
				rankImageFrame2( rankImage, {} )
				local rankNameTextFrame2 = function ( rankNameText, event )
					local rankNameTextFrame3 = function ( rankNameText, event )
						local rankNameTextFrame4 = function ( rankNameText, event )
							local rankNameTextFrame5 = function ( rankNameText, event )
								if not event.interrupted then
									rankNameText:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
								end
								rankNameText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( rankNameText, event )
								else
									rankNameText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								rankNameTextFrame5( rankNameText, event )
								return 
							else
								rankNameText:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
								rankNameText:registerEventHandler( "transition_complete_keyframe", rankNameTextFrame5 )
							end
						end
						
						if event.interrupted then
							rankNameTextFrame4( rankNameText, event )
							return 
						else
							rankNameText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							rankNameText:registerEventHandler( "transition_complete_keyframe", rankNameTextFrame4 )
						end
					end
					
					if event.interrupted then
						rankNameTextFrame3( rankNameText, event )
						return 
					else
						rankNameText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						rankNameText:setAlpha( 1 )
						rankNameText:registerEventHandler( "transition_complete_keyframe", rankNameTextFrame3 )
					end
				end
				
				rankNameText:completeAnimation()
				self.rankNameText:setAlpha( 0 )
				rankNameTextFrame2( rankNameText, {} )
				local rankUpTextFrame2 = function ( rankUpText, event )
					local rankUpTextFrame3 = function ( rankUpText, event )
						local rankUpTextFrame4 = function ( rankUpText, event )
							local rankUpTextFrame5 = function ( rankUpText, event )
								if not event.interrupted then
									rankUpText:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
								end
								rankUpText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( rankUpText, event )
								else
									rankUpText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								rankUpTextFrame5( rankUpText, event )
								return 
							else
								rankUpText:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
								rankUpText:registerEventHandler( "transition_complete_keyframe", rankUpTextFrame5 )
							end
						end
						
						if event.interrupted then
							rankUpTextFrame4( rankUpText, event )
							return 
						else
							rankUpText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							rankUpText:registerEventHandler( "transition_complete_keyframe", rankUpTextFrame4 )
						end
					end
					
					if event.interrupted then
						rankUpTextFrame3( rankUpText, event )
						return 
					else
						rankUpText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						rankUpText:setAlpha( 1 )
						rankUpText:registerEventHandler( "transition_complete_keyframe", rankUpTextFrame3 )
					end
				end
				
				rankUpText:completeAnimation()
				self.rankUpText:setAlpha( 0 )
				rankUpTextFrame2( rankUpText, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				rankImage:completeAnimation()
				self.rankImage:setAlpha( 0 )
				self.clipFinished( rankImage, {} )
				rankNameText:completeAnimation()
				self.rankNameText:setAlpha( 0 )
				self.clipFinished( rankNameText, {} )
				rankUpText:completeAnimation()
				self.rankUpText:setAlpha( 0 )
				self.clipFinished( rankUpText, {} )
			end
		}
	}
	self.close = function ( self )
		self.rankImage:close()
		self.rankNameText:close()
		CoD.RankUpNotification.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

