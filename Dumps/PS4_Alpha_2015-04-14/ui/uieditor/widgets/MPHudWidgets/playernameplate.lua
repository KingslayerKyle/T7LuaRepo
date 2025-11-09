local PostLoadFunc = function ( self )
	self:registerEventHandler( "player_callout", CoD.InGameNotificationQueue.PlayerCallout )
	self:registerEventHandler( "player_obituary_callout", CoD.InGameNotificationQueue.PlayerObituaryCallout )
end

CoD.PlayerNamePlate = InheritFrom( LUI.UIElement )
CoD.PlayerNamePlate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerNamePlate )
	self.id = "PlayerNamePlate"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 60 )
	
	local namePlateImage = LUI.UIImage.new()
	namePlateImage:setLeftRight( true, true, 0, 0 )
	namePlateImage:setTopBottom( true, true, 0, 0 )
	namePlateImage:setRGB( 1, 1, 1 )
	namePlateImage:setAlpha( 0.9 )
	namePlateImage:setImage( RegisterImage( "uie_emblem_bg_default" ) )
	namePlateImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( namePlateImage )
	self.namePlateImage = namePlateImage
	
	local namePlateHeadingText = LUI.UITightText.new()
	namePlateHeadingText:setLeftRight( true, false, 0, 36 )
	namePlateHeadingText:setTopBottom( true, false, -19, 1 )
	namePlateHeadingText:setRGB( 1, 1, 1 )
	namePlateHeadingText:setText( Engine.Localize( "MENU_KILLED" ) )
	namePlateHeadingText:setTTF( "fonts/default.ttf" )
	self:addElement( namePlateHeadingText )
	self.namePlateHeadingText = namePlateHeadingText
	
	local namePlatePlayerName = LUI.UITightText.new()
	namePlatePlayerName:setLeftRight( true, false, 48.5, 208.5 )
	namePlatePlayerName:setTopBottom( true, false, 8, 28 )
	namePlatePlayerName:setRGB( 1, 1, 1 )
	namePlatePlayerName:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
	namePlatePlayerName:setTTF( "fonts/default.ttf" )
	self:addElement( namePlatePlayerName )
	self.namePlatePlayerName = namePlatePlayerName
	
	local namePlateClanTag = LUI.UITightText.new()
	namePlateClanTag:setLeftRight( true, false, 48.5, 98.5 )
	namePlateClanTag:setTopBottom( true, false, 35, 55 )
	namePlateClanTag:setRGB( 1, 1, 1 )
	namePlateClanTag:setText( Engine.Localize( "[WWWW]" ) )
	namePlateClanTag:setTTF( "fonts/default.ttf" )
	self:addElement( namePlateClanTag )
	self.namePlateClanTag = namePlateClanTag
	
	local namePlateRankIcon = LUI.UIImage.new()
	namePlateRankIcon:setLeftRight( true, false, 103, 135 )
	namePlateRankIcon:setTopBottom( true, false, 28, 60 )
	namePlateRankIcon:setRGB( 1, 1, 1 )
	namePlateRankIcon:setImage( RegisterImage( "uie_rank_comm" ) )
	namePlateRankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( namePlateRankIcon )
	self.namePlateRankIcon = namePlateRankIcon
	
	local namPlateRankText = LUI.UITightText.new()
	namPlateRankText:setLeftRight( true, false, 138, 154 )
	namPlateRankText:setTopBottom( true, false, 35, 55 )
	namPlateRankText:setRGB( 1, 1, 1 )
	namPlateRankText:setText( Engine.Localize( "55" ) )
	namPlateRankText:setTTF( "fonts/default.ttf" )
	self:addElement( namPlateRankText )
	self.namPlateRankText = namPlateRankText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				namePlateImage:completeAnimation()
				self.namePlateImage:setLeftRight( true, true, 0, 0 )
				self.namePlateImage:setTopBottom( true, true, 0, 0 )
				self.namePlateImage:setAlpha( 0.9 )
				self.clipFinished( namePlateImage, {} )
				namePlateHeadingText:completeAnimation()
				self.namePlateHeadingText:setLeftRight( true, false, 0, 36 )
				self.namePlateHeadingText:setTopBottom( true, false, -19, 1 )
				self.namePlateHeadingText:setAlpha( 1 )
				self.clipFinished( namePlateHeadingText, {} )
				namePlatePlayerName:completeAnimation()
				self.namePlatePlayerName:setLeftRight( true, false, 40, 200 )
				self.namePlatePlayerName:setTopBottom( true, false, 8, 28 )
				self.namePlatePlayerName:setAlpha( 1 )
				self.clipFinished( namePlatePlayerName, {} )
				namePlateClanTag:completeAnimation()
				self.namePlateClanTag:setLeftRight( true, false, 40, 90 )
				self.namePlateClanTag:setTopBottom( true, false, 35, 55 )
				self.namePlateClanTag:setAlpha( 1 )
				self.clipFinished( namePlateClanTag, {} )
				namePlateRankIcon:completeAnimation()
				self.namePlateRankIcon:setLeftRight( true, false, 94.5, 126.5 )
				self.namePlateRankIcon:setTopBottom( true, false, 28, 60 )
				self.namePlateRankIcon:setAlpha( 1 )
				self.clipFinished( namePlateRankIcon, {} )
				namPlateRankText:completeAnimation()
				self.namPlateRankText:setLeftRight( true, false, 129.5, 145.5 )
				self.namPlateRankText:setTopBottom( true, false, 35, 55 )
				self.namPlateRankText:setAlpha( 1 )
				self.clipFinished( namPlateRankText, {} )
			end,
			SlideUp = function ()
				self:setupElementClipCounter( 6 )
				local namePlateImageFrame2 = function ( namePlateImage, event )
					local namePlateImageFrame3 = function ( namePlateImage, event )
						local namePlateImageFrame4 = function ( namePlateImage, event )
							if not event.interrupted then
								namePlateImage:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateImage:setLeftRight( true, true, 0, 0 )
							namePlateImage:setTopBottom( true, true, 204, 204 )
							if event.interrupted then
								self.clipFinished( namePlateImage, event )
							else
								namePlateImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateImageFrame4( namePlateImage, event )
							return 
						else
							namePlateImage:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateImage:registerEventHandler( "transition_complete_keyframe", namePlateImageFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateImageFrame3( namePlateImage, event )
						return 
					else
						namePlateImage:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateImage:setTopBottom( true, true, 0, 0 )
						namePlateImage:registerEventHandler( "transition_complete_keyframe", namePlateImageFrame3 )
					end
				end
				
				namePlateImage:completeAnimation()
				self.namePlateImage:setLeftRight( true, true, 0, 0 )
				self.namePlateImage:setTopBottom( true, true, 138, 138 )
				namePlateImageFrame2( namePlateImage, {} )
				local namePlateHeadingTextFrame2 = function ( namePlateHeadingText, event )
					local namePlateHeadingTextFrame3 = function ( namePlateHeadingText, event )
						local namePlateHeadingTextFrame4 = function ( namePlateHeadingText, event )
							if not event.interrupted then
								namePlateHeadingText:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateHeadingText:setLeftRight( true, false, 0, 36 )
							namePlateHeadingText:setTopBottom( true, false, 184, 204 )
							if event.interrupted then
								self.clipFinished( namePlateHeadingText, event )
							else
								namePlateHeadingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateHeadingTextFrame4( namePlateHeadingText, event )
							return 
						else
							namePlateHeadingText:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateHeadingText:registerEventHandler( "transition_complete_keyframe", namePlateHeadingTextFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateHeadingTextFrame3( namePlateHeadingText, event )
						return 
					else
						namePlateHeadingText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateHeadingText:setTopBottom( true, false, -19, 1 )
						namePlateHeadingText:registerEventHandler( "transition_complete_keyframe", namePlateHeadingTextFrame3 )
					end
				end
				
				namePlateHeadingText:completeAnimation()
				self.namePlateHeadingText:setLeftRight( true, false, 0, 36 )
				self.namePlateHeadingText:setTopBottom( true, false, 118, 138 )
				namePlateHeadingTextFrame2( namePlateHeadingText, {} )
				local namePlatePlayerNameFrame2 = function ( namePlatePlayerName, event )
					local namePlatePlayerNameFrame3 = function ( namePlatePlayerName, event )
						local namePlatePlayerNameFrame4 = function ( namePlatePlayerName, event )
							if not event.interrupted then
								namePlatePlayerName:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlatePlayerName:setLeftRight( true, false, 49.5, 209.5 )
							namePlatePlayerName:setTopBottom( true, false, 211, 231 )
							if event.interrupted then
								self.clipFinished( namePlatePlayerName, event )
							else
								namePlatePlayerName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlatePlayerNameFrame4( namePlatePlayerName, event )
							return 
						else
							namePlatePlayerName:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlatePlayerName:registerEventHandler( "transition_complete_keyframe", namePlatePlayerNameFrame4 )
						end
					end
					
					if event.interrupted then
						namePlatePlayerNameFrame3( namePlatePlayerName, event )
						return 
					else
						namePlatePlayerName:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlatePlayerName:setTopBottom( true, false, 8, 28 )
						namePlatePlayerName:registerEventHandler( "transition_complete_keyframe", namePlatePlayerNameFrame3 )
					end
				end
				
				namePlatePlayerName:completeAnimation()
				self.namePlatePlayerName:setLeftRight( true, false, 49.5, 209.5 )
				self.namePlatePlayerName:setTopBottom( true, false, 145, 165 )
				namePlatePlayerNameFrame2( namePlatePlayerName, {} )
				local namePlateClanTagFrame2 = function ( namePlateClanTag, event )
					local namePlateClanTagFrame3 = function ( namePlateClanTag, event )
						local namePlateClanTagFrame4 = function ( namePlateClanTag, event )
							if not event.interrupted then
								namePlateClanTag:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateClanTag:setLeftRight( true, false, 49.5, 99.5 )
							namePlateClanTag:setTopBottom( true, false, 238, 258 )
							if event.interrupted then
								self.clipFinished( namePlateClanTag, event )
							else
								namePlateClanTag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateClanTagFrame4( namePlateClanTag, event )
							return 
						else
							namePlateClanTag:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateClanTag:registerEventHandler( "transition_complete_keyframe", namePlateClanTagFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateClanTagFrame3( namePlateClanTag, event )
						return 
					else
						namePlateClanTag:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateClanTag:setTopBottom( true, false, 35, 55 )
						namePlateClanTag:registerEventHandler( "transition_complete_keyframe", namePlateClanTagFrame3 )
					end
				end
				
				namePlateClanTag:completeAnimation()
				self.namePlateClanTag:setLeftRight( true, false, 49.5, 99.5 )
				self.namePlateClanTag:setTopBottom( true, false, 172, 192 )
				namePlateClanTagFrame2( namePlateClanTag, {} )
				local namePlateRankIconFrame2 = function ( namePlateRankIcon, event )
					local namePlateRankIconFrame3 = function ( namePlateRankIcon, event )
						local namePlateRankIconFrame4 = function ( namePlateRankIcon, event )
							if not event.interrupted then
								namePlateRankIcon:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateRankIcon:setLeftRight( true, false, 104, 136 )
							namePlateRankIcon:setTopBottom( true, false, 231, 263 )
							if event.interrupted then
								self.clipFinished( namePlateRankIcon, event )
							else
								namePlateRankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateRankIconFrame4( namePlateRankIcon, event )
							return 
						else
							namePlateRankIcon:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateRankIcon:registerEventHandler( "transition_complete_keyframe", namePlateRankIconFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateRankIconFrame3( namePlateRankIcon, event )
						return 
					else
						namePlateRankIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateRankIcon:setTopBottom( true, false, 28, 60 )
						namePlateRankIcon:registerEventHandler( "transition_complete_keyframe", namePlateRankIconFrame3 )
					end
				end
				
				namePlateRankIcon:completeAnimation()
				self.namePlateRankIcon:setLeftRight( true, false, 104, 136 )
				self.namePlateRankIcon:setTopBottom( true, false, 165, 197 )
				namePlateRankIconFrame2( namePlateRankIcon, {} )
				local namPlateRankTextFrame2 = function ( namPlateRankText, event )
					local namPlateRankTextFrame3 = function ( namPlateRankText, event )
						local namPlateRankTextFrame4 = function ( namPlateRankText, event )
							if not event.interrupted then
								namPlateRankText:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namPlateRankText:setLeftRight( true, false, 139, 155 )
							namPlateRankText:setTopBottom( true, false, 238, 258 )
							if event.interrupted then
								self.clipFinished( namPlateRankText, event )
							else
								namPlateRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namPlateRankTextFrame4( namPlateRankText, event )
							return 
						else
							namPlateRankText:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namPlateRankText:registerEventHandler( "transition_complete_keyframe", namPlateRankTextFrame4 )
						end
					end
					
					if event.interrupted then
						namPlateRankTextFrame3( namPlateRankText, event )
						return 
					else
						namPlateRankText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namPlateRankText:setTopBottom( true, false, 35, 55 )
						namPlateRankText:registerEventHandler( "transition_complete_keyframe", namPlateRankTextFrame3 )
					end
				end
				
				namPlateRankText:completeAnimation()
				self.namPlateRankText:setLeftRight( true, false, 139, 155 )
				self.namPlateRankText:setTopBottom( true, false, 172, 192 )
				namPlateRankTextFrame2( namPlateRankText, {} )
			end,
			SlideRight = function ()
				self:setupElementClipCounter( 6 )
				local namePlateImageFrame2 = function ( namePlateImage, event )
					local namePlateImageFrame3 = function ( namePlateImage, event )
						local namePlateImageFrame4 = function ( namePlateImage, event )
							if not event.interrupted then
								namePlateImage:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateImage:setLeftRight( true, true, -473, -473 )
							namePlateImage:setTopBottom( true, true, 0, 0 )
							if event.interrupted then
								self.clipFinished( namePlateImage, event )
							else
								namePlateImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateImageFrame4( namePlateImage, event )
							return 
						else
							namePlateImage:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateImage:registerEventHandler( "transition_complete_keyframe", namePlateImageFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateImageFrame3( namePlateImage, event )
						return 
					else
						namePlateImage:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateImage:setLeftRight( true, true, 0, 0 )
						namePlateImage:registerEventHandler( "transition_complete_keyframe", namePlateImageFrame3 )
					end
				end
				
				namePlateImage:completeAnimation()
				self.namePlateImage:setLeftRight( true, true, -471, -471 )
				self.namePlateImage:setTopBottom( true, true, 0, 0 )
				namePlateImageFrame2( namePlateImage, {} )
				local namePlateHeadingTextFrame2 = function ( namePlateHeadingText, event )
					local namePlateHeadingTextFrame3 = function ( namePlateHeadingText, event )
						local namePlateHeadingTextFrame4 = function ( namePlateHeadingText, event )
							if not event.interrupted then
								namePlateHeadingText:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateHeadingText:setLeftRight( true, false, -473, -437 )
							namePlateHeadingText:setTopBottom( true, false, -19, 1 )
							if event.interrupted then
								self.clipFinished( namePlateHeadingText, event )
							else
								namePlateHeadingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateHeadingTextFrame4( namePlateHeadingText, event )
							return 
						else
							namePlateHeadingText:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateHeadingText:setLeftRight( true, false, 0, 36 )
							namePlateHeadingText:registerEventHandler( "transition_complete_keyframe", namePlateHeadingTextFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateHeadingTextFrame3( namePlateHeadingText, event )
						return 
					else
						namePlateHeadingText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateHeadingText:setLeftRight( true, false, -1, 35 )
						namePlateHeadingText:registerEventHandler( "transition_complete_keyframe", namePlateHeadingTextFrame3 )
					end
				end
				
				namePlateHeadingText:completeAnimation()
				self.namePlateHeadingText:setLeftRight( true, false, -472, -436 )
				self.namePlateHeadingText:setTopBottom( true, false, -19, 1 )
				namePlateHeadingTextFrame2( namePlateHeadingText, {} )
				local namePlatePlayerNameFrame2 = function ( namePlatePlayerName, event )
					local namePlatePlayerNameFrame3 = function ( namePlatePlayerName, event )
						local namePlatePlayerNameFrame4 = function ( namePlatePlayerName, event )
							if not event.interrupted then
								namePlatePlayerName:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlatePlayerName:setLeftRight( true, false, -424.5, -264.5 )
							namePlatePlayerName:setTopBottom( true, false, 8, 28 )
							if event.interrupted then
								self.clipFinished( namePlatePlayerName, event )
							else
								namePlatePlayerName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlatePlayerNameFrame4( namePlatePlayerName, event )
							return 
						else
							namePlatePlayerName:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlatePlayerName:registerEventHandler( "transition_complete_keyframe", namePlatePlayerNameFrame4 )
						end
					end
					
					if event.interrupted then
						namePlatePlayerNameFrame3( namePlatePlayerName, event )
						return 
					else
						namePlatePlayerName:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlatePlayerName:setLeftRight( true, false, 48.5, 208.5 )
						namePlatePlayerName:registerEventHandler( "transition_complete_keyframe", namePlatePlayerNameFrame3 )
					end
				end
				
				namePlatePlayerName:completeAnimation()
				self.namePlatePlayerName:setLeftRight( true, false, -422.5, -262.5 )
				self.namePlatePlayerName:setTopBottom( true, false, 8, 28 )
				namePlatePlayerNameFrame2( namePlatePlayerName, {} )
				local namePlateClanTagFrame2 = function ( namePlateClanTag, event )
					local namePlateClanTagFrame3 = function ( namePlateClanTag, event )
						local namePlateClanTagFrame4 = function ( namePlateClanTag, event )
							if not event.interrupted then
								namePlateClanTag:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateClanTag:setLeftRight( true, false, -424.5, -374.5 )
							namePlateClanTag:setTopBottom( true, false, 35, 55 )
							if event.interrupted then
								self.clipFinished( namePlateClanTag, event )
							else
								namePlateClanTag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateClanTagFrame4( namePlateClanTag, event )
							return 
						else
							namePlateClanTag:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateClanTag:registerEventHandler( "transition_complete_keyframe", namePlateClanTagFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateClanTagFrame3( namePlateClanTag, event )
						return 
					else
						namePlateClanTag:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateClanTag:setLeftRight( true, false, 48.5, 98.5 )
						namePlateClanTag:registerEventHandler( "transition_complete_keyframe", namePlateClanTagFrame3 )
					end
				end
				
				namePlateClanTag:completeAnimation()
				self.namePlateClanTag:setLeftRight( true, false, -422.5, -372.5 )
				self.namePlateClanTag:setTopBottom( true, false, 35, 55 )
				namePlateClanTagFrame2( namePlateClanTag, {} )
				local namePlateRankIconFrame2 = function ( namePlateRankIcon, event )
					local namePlateRankIconFrame3 = function ( namePlateRankIcon, event )
						local namePlateRankIconFrame4 = function ( namePlateRankIcon, event )
							if not event.interrupted then
								namePlateRankIcon:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namePlateRankIcon:setLeftRight( true, false, -370, -338 )
							namePlateRankIcon:setTopBottom( true, false, 28, 60 )
							if event.interrupted then
								self.clipFinished( namePlateRankIcon, event )
							else
								namePlateRankIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namePlateRankIconFrame4( namePlateRankIcon, event )
							return 
						else
							namePlateRankIcon:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namePlateRankIcon:registerEventHandler( "transition_complete_keyframe", namePlateRankIconFrame4 )
						end
					end
					
					if event.interrupted then
						namePlateRankIconFrame3( namePlateRankIcon, event )
						return 
					else
						namePlateRankIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namePlateRankIcon:setLeftRight( true, false, 103, 135 )
						namePlateRankIcon:registerEventHandler( "transition_complete_keyframe", namePlateRankIconFrame3 )
					end
				end
				
				namePlateRankIcon:completeAnimation()
				self.namePlateRankIcon:setLeftRight( true, false, -368, -336 )
				self.namePlateRankIcon:setTopBottom( true, false, 28, 60 )
				namePlateRankIconFrame2( namePlateRankIcon, {} )
				local namPlateRankTextFrame2 = function ( namPlateRankText, event )
					local namPlateRankTextFrame3 = function ( namPlateRankText, event )
						local namPlateRankTextFrame4 = function ( namPlateRankText, event )
							if not event.interrupted then
								namPlateRankText:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							namPlateRankText:setLeftRight( true, false, -335, -319 )
							namPlateRankText:setTopBottom( true, false, 35, 55 )
							if event.interrupted then
								self.clipFinished( namPlateRankText, event )
							else
								namPlateRankText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							namPlateRankTextFrame4( namPlateRankText, event )
							return 
						else
							namPlateRankText:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							namPlateRankText:registerEventHandler( "transition_complete_keyframe", namPlateRankTextFrame4 )
						end
					end
					
					if event.interrupted then
						namPlateRankTextFrame3( namPlateRankText, event )
						return 
					else
						namPlateRankText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						namPlateRankText:setLeftRight( true, false, 138, 154 )
						namPlateRankText:registerEventHandler( "transition_complete_keyframe", namPlateRankTextFrame3 )
					end
				end
				
				namPlateRankText:completeAnimation()
				self.namPlateRankText:setLeftRight( true, false, -333, -317 )
				self.namPlateRankText:setTopBottom( true, false, 35, 55 )
				namPlateRankTextFrame2( namPlateRankText, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				namePlateImage:completeAnimation()
				self.namePlateImage:setAlpha( 0 )
				self.clipFinished( namePlateImage, {} )
				namePlateHeadingText:completeAnimation()
				self.namePlateHeadingText:setAlpha( 0 )
				self.clipFinished( namePlateHeadingText, {} )
				namePlatePlayerName:completeAnimation()
				self.namePlatePlayerName:setAlpha( 0 )
				self.clipFinished( namePlatePlayerName, {} )
				namePlateClanTag:completeAnimation()
				self.namePlateClanTag:setAlpha( 0 )
				self.clipFinished( namePlateClanTag, {} )
				namePlateRankIcon:completeAnimation()
				self.namePlateRankIcon:setAlpha( 0 )
				self.clipFinished( namePlateRankIcon, {} )
				namPlateRankText:completeAnimation()
				self.namPlateRankText:setAlpha( 0 )
				self.clipFinished( namPlateRankText, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

