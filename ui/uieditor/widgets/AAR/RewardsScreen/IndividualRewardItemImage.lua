-- 21cea8f899b97bd72863eca1d92d688a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpReward" )

CoD.IndividualRewardItemImage = InheritFrom( LUI.UIElement )
CoD.IndividualRewardItemImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.IndividualRewardItemImage )
	self.id = "IndividualRewardItemImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local RewardImage = LUI.UIImage.new()
	RewardImage:setLeftRight( true, true, 0, 0 )
	RewardImage:setTopBottom( true, true, 0, 0 )
	RewardImage:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			RewardImage:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( true, false, 1, 49 )
	Notification2xpReward:setTopBottom( true, false, 1, 49 )
	Notification2xpReward:setAlpha( 0 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	local DoubleCryptokeys = LUI.UIImage.new()
	DoubleCryptokeys:setLeftRight( true, true, 0, 2 )
	DoubleCryptokeys:setTopBottom( true, true, 0, 2 )
	DoubleCryptokeys:setAlpha( 0 )
	DoubleCryptokeys:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot_small" ) )
	self:addElement( DoubleCryptokeys )
	self.DoubleCryptokeys = DoubleCryptokeys
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				RewardImage:completeAnimation()
				self.RewardImage:setLeftRight( true, true, 0, 0 )
				self.RewardImage:setTopBottom( true, true, 0, 0 )
				self.RewardImage:setAlpha( 1 )
				self.clipFinished( RewardImage, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				self.clipFinished( Notification2xpReward, {} )
				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( DoubleCryptokeys, {} )
			end
		},
		CallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				RewardImage:completeAnimation()
				self.RewardImage:setLeftRight( true, false, -118, 85 )
				self.RewardImage:setTopBottom( true, false, 0, 50 )
				self.clipFinished( RewardImage, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				self.clipFinished( Notification2xpReward, {} )
				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( DoubleCryptokeys, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				RewardImage:completeAnimation()
				self.RewardImage:setAlpha( 0 )
				self.clipFinished( RewardImage, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
				DoubleCryptokeys:completeAnimation()
				self.DoubleCryptokeys:setAlpha( 0 )
				self.clipFinished( DoubleCryptokeys, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CallingCard",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isCallingCard" )
			end
		},
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rewardImage", "t7_hud_mp_notifications_xp_blue" ) and IsDoubleXP( controller )
			end
		}
	} )
	self:linkToElementModel( self, "isCallingCard", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isCallingCard"
		} )
	end )
	self:linkToElementModel( self, "rewardImage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rewardImage"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Notification2xpReward:close()
		element.RewardImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

