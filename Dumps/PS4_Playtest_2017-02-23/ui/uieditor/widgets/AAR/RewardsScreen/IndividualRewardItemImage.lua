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
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local RewardImage = LUI.UIImage.new()
	RewardImage:setLeftRight( 0, 0, 0, 75 )
	RewardImage:setTopBottom( 0, 0, 0, 75 )
	RewardImage:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RewardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( 0, 0, 2, 74 )
	Notification2xpReward:setTopBottom( 0, 0, 2, 74 )
	Notification2xpReward:setAlpha( 0 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	self.resetProperties = function ()
		RewardImage:completeAnimation()
		Notification2xpReward:completeAnimation()
		RewardImage:setLeftRight( 0, 0, 0, 75 )
		RewardImage:setTopBottom( 0, 0, 0, 75 )
		RewardImage:setAlpha( 1 )
		Notification2xpReward:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CallingCard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				RewardImage:completeAnimation()
				self.RewardImage:setLeftRight( 0, 0, -176.5, 127.5 )
				self.RewardImage:setTopBottom( 0, 0, 0, 75 )
				self.clipFinished( RewardImage, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				RewardImage:completeAnimation()
				self.RewardImage:setAlpha( 0 )
				self.clipFinished( RewardImage, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Notification2xpReward:close()
		self.RewardImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

