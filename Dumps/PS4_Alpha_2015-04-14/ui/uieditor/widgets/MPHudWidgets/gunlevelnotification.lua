local PostLoadFunc = function ( self )
	self:registerEventHandler( "gun_level_complete", CoD.InGameNotificationQueue.GunLevelComplete )
	self:registerEventHandler( "notification_complete", CoD.InGameNotificationQueue.NotificationComplete )
end

CoD.GunLevelNotification = InheritFrom( LUI.UIElement )
CoD.GunLevelNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GunLevelNotification )
	self.id = "GunLevelNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 146 )
	
	local weaponImage = LUI.UIImage.new()
	weaponImage:setLeftRight( false, false, -96, 96 )
	weaponImage:setTopBottom( true, false, 0, 96 )
	weaponImage:setRGB( 1, 1, 1 )
	weaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_grid" ) )
	weaponImage:setShaderVector( 0, 0, 0, 0, 0 )
	weaponImage:subscribeToGlobalModel( controller, "InGameNotifications", "earnedGunLevelWeaponImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( weaponImage )
	self.weaponImage = weaponImage
	
	local attachmentOrRewardText = LUI.UIText.new()
	attachmentOrRewardText:setLeftRight( true, true, 0, 0 )
	attachmentOrRewardText:setTopBottom( true, false, 96, 121 )
	attachmentOrRewardText:setRGB( 1, 1, 1 )
	attachmentOrRewardText:setTTF( "fonts/default.ttf" )
	attachmentOrRewardText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	attachmentOrRewardText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	attachmentOrRewardText:subscribeToGlobalModel( controller, "InGameNotifications", "earnedGunLevelAttachRewardText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentOrRewardText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( attachmentOrRewardText )
	self.attachmentOrRewardText = attachmentOrRewardText
	
	local weaponText = LUI.UIText.new()
	weaponText:setLeftRight( true, true, 0, 0 )
	weaponText:setTopBottom( true, false, 121, 146 )
	weaponText:setRGB( 1, 1, 1 )
	weaponText:setTTF( "fonts/default.ttf" )
	weaponText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponText:subscribeToGlobalModel( controller, "InGameNotifications", "earnedGunLevelWeaponName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponText )
	self.weaponText = weaponText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponImage:completeAnimation()
				self.weaponImage:setAlpha( 0 )
				self.weaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_grid" ) )
				self.clipFinished( weaponImage, {} )
				attachmentOrRewardText:completeAnimation()
				self.attachmentOrRewardText:setAlpha( 0 )
				self.clipFinished( attachmentOrRewardText, {} )
				weaponText:completeAnimation()
				self.weaponText:setAlpha( 0 )
				self.clipFinished( weaponText, {} )
			end,
			GunLevelEarned = function ()
				self:setupElementClipCounter( 3 )
				local weaponImageFrame2 = function ( weaponImage, event )
					local weaponImageFrame3 = function ( weaponImage, event )
						local weaponImageFrame4 = function ( weaponImage, event )
							local weaponImageFrame5 = function ( weaponImage, event )
								if not event.interrupted then
									weaponImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								weaponImage:setAlpha( 0 )
								weaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_grid" ) )
								if event.interrupted then
									self.clipFinished( weaponImage, event )
								else
									weaponImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								weaponImageFrame5( weaponImage, event )
								return 
							else
								weaponImage:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
								weaponImage:registerEventHandler( "transition_complete_keyframe", weaponImageFrame5 )
							end
						end
						
						if event.interrupted then
							weaponImageFrame4( weaponImage, event )
							return 
						else
							weaponImage:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							weaponImage:registerEventHandler( "transition_complete_keyframe", weaponImageFrame4 )
						end
					end
					
					if event.interrupted then
						weaponImageFrame3( weaponImage, event )
						return 
					else
						weaponImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						weaponImage:setAlpha( 1 )
						weaponImage:registerEventHandler( "transition_complete_keyframe", weaponImageFrame3 )
					end
				end
				
				weaponImage:completeAnimation()
				self.weaponImage:setAlpha( 0 )
				self.weaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_grid" ) )
				weaponImageFrame2( weaponImage, {} )
				local attachmentOrRewardTextFrame2 = function ( attachmentOrRewardText, event )
					local attachmentOrRewardTextFrame3 = function ( attachmentOrRewardText, event )
						local attachmentOrRewardTextFrame4 = function ( attachmentOrRewardText, event )
							if not event.interrupted then
								attachmentOrRewardText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							attachmentOrRewardText:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( attachmentOrRewardText, event )
							else
								attachmentOrRewardText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							attachmentOrRewardTextFrame4( attachmentOrRewardText, event )
							return 
						else
							attachmentOrRewardText:beginAnimation( "keyframe", 1349, false, false, CoD.TweenType.Linear )
							attachmentOrRewardText:registerEventHandler( "transition_complete_keyframe", attachmentOrRewardTextFrame4 )
						end
					end
					
					if event.interrupted then
						attachmentOrRewardTextFrame3( attachmentOrRewardText, event )
						return 
					else
						attachmentOrRewardText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						attachmentOrRewardText:setAlpha( 1 )
						attachmentOrRewardText:registerEventHandler( "transition_complete_keyframe", attachmentOrRewardTextFrame3 )
					end
				end
				
				attachmentOrRewardText:completeAnimation()
				self.attachmentOrRewardText:setAlpha( 0 )
				attachmentOrRewardTextFrame2( attachmentOrRewardText, {} )
				local weaponTextFrame2 = function ( weaponText, event )
					local weaponTextFrame3 = function ( weaponText, event )
						local weaponTextFrame4 = function ( weaponText, event )
							if not event.interrupted then
								weaponText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							weaponText:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( weaponText, event )
							else
								weaponText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weaponTextFrame4( weaponText, event )
							return 
						else
							weaponText:beginAnimation( "keyframe", 1349, false, false, CoD.TweenType.Linear )
							weaponText:registerEventHandler( "transition_complete_keyframe", weaponTextFrame4 )
						end
					end
					
					if event.interrupted then
						weaponTextFrame3( weaponText, event )
						return 
					else
						weaponText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						weaponText:setAlpha( 1 )
						weaponText:registerEventHandler( "transition_complete_keyframe", weaponTextFrame3 )
					end
				end
				
				weaponText:completeAnimation()
				self.weaponText:setAlpha( 0 )
				weaponTextFrame2( weaponText, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				weaponImage:completeAnimation()
				self.weaponImage:setAlpha( 0 )
				self.clipFinished( weaponImage, {} )
				attachmentOrRewardText:completeAnimation()
				self.attachmentOrRewardText:setAlpha( 0 )
				self.clipFinished( attachmentOrRewardText, {} )
				weaponText:completeAnimation()
				self.weaponText:setAlpha( 0 )
				self.clipFinished( weaponText, {} )
			end
		}
	}
	self.close = function ( self )
		self.weaponImage:close()
		self.attachmentOrRewardText:close()
		self.weaponText:close()
		CoD.GunLevelNotification.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

