-- e83242666556a9217d5f1b4efe6f2ec4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpReward" )

CoD.IconRewardWidget = InheritFrom( LUI.UIElement )
CoD.IconRewardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.IconRewardWidget )
	self.id = "IconRewardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local ImageScanline = LUI.UIImage.new()
	ImageScanline:setLeftRight( false, true, -48, 0 )
	ImageScanline:setTopBottom( false, false, -24, 24 )
	ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines" ) )
	ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
	ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
	ImageScanline:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( ImageScanline )
	self.ImageScanline = ImageScanline
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( true, false, 0, 48 )
	Notification2xpReward:setTopBottom( true, false, 0, 48 )
	Notification2xpReward:setAlpha( 0 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( false, true, -48, 0 )
				self.ImageScanline:setTopBottom( false, false, -24, 24 )
				self.ImageScanline:setAlpha( 1 )
				self.clipFinished( ImageScanline, {} )

				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				self.clipFinished( Notification2xpReward, {} )
			end
		},
		CallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( false, true, -111, 19 )
				self.ImageScanline:setTopBottom( false, false, -16, 16 )
				self.ImageScanline:setAlpha( 1 )
				self.clipFinished( ImageScanline, {} )

				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				self.clipFinished( Notification2xpReward, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( false, true, -48, 0 )
				self.ImageScanline:setTopBottom( false, false, -24, 24 )
				self.ImageScanline:setAlpha( 0 )
				self.clipFinished( ImageScanline, {} )

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
				return true
			end
		},
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return IsDoubleXP( controller ) and IsSelfModelValueEqualTo( element, controller, "icon", "t7_hud_mp_notifications_xp_blue" )
			end
		}
	} )
	self:linkToElementModel( self, "icon", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "icon"
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
