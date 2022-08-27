-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpReward" )

CoD.MedalXpWidget = InheritFrom( LUI.UIElement )
CoD.MedalXpWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalXpWidget )
	self.id = "MedalXpWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 145 )
	self:setTopBottom( true, false, 0, 46 )
	self.anyChildUsesUpdateState = true
	
	local XpIcon = LUI.UIImage.new()
	XpIcon:setLeftRight( true, false, 0, 46.29 )
	XpIcon:setTopBottom( true, false, 0, 46.29 )
	XpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XpIcon )
	self.XpIcon = XpIcon
	
	local XpValue = LUI.UITightText.new()
	XpValue:setLeftRight( true, false, 57.43, 145.44 )
	XpValue:setTopBottom( true, false, 10.65, 35.65 )
	XpValue:setText( Engine.Localize( "+1000 XP" ) )
	XpValue:setTTF( "fonts/default.ttf" )
	self:addElement( XpValue )
	self.XpValue = XpValue
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( true, false, -1, 47 )
	Notification2xpReward:setTopBottom( true, false, -1, 47 )
	Notification2xpReward:setAlpha( 0 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				XpIcon:completeAnimation()
				self.XpIcon:setAlpha( 0 )
				self.clipFinished( XpIcon, {} )
				XpValue:completeAnimation()
				self.XpValue:setAlpha( 0 )
				self.clipFinished( XpValue, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				XpIcon:completeAnimation()
				self.XpIcon:setAlpha( 1 )
				self.clipFinished( XpIcon, {} )
				XpValue:completeAnimation()
				self.XpValue:setAlpha( 1 )
				self.clipFinished( XpValue, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				XpIcon:completeAnimation()
				self.XpIcon:setAlpha( 0 )
				self.clipFinished( XpIcon, {} )
				XpValue:completeAnimation()
				self.XpValue:setAlpha( 1 )
				self.clipFinished( XpValue, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "aarType", "public" ) and not IsDoubleXP( controller )
			end
		},
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "aarType", "public" ) and IsDoubleXP( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "aarType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarType"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Notification2xpReward:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

