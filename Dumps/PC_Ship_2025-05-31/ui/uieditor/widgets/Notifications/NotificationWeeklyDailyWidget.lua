require( "ui.uieditor.widgets.Notifications.NotificationWeeklyDailyTextWidget" )

CoD.NotificationWeeklyDailyWidget = InheritFrom( LUI.UIElement )
CoD.NotificationWeeklyDailyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationWeeklyDailyWidget )
	self.id = "NotificationWeeklyDailyWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 197 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local weeklydailybacker = LUI.UIImage.new()
	weeklydailybacker:setLeftRight( true, true, 39, -41 )
	weeklydailybacker:setTopBottom( false, true, -30, 0 )
	weeklydailybacker:setRGB( 0.24, 0.24, 0.24 )
	weeklydailybacker:setImage( RegisterImage( "uie_t7_hud_notif_bm_weeklydaily_backer" ) )
	weeklydailybacker:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	weeklydailybacker:setShaderVector( 0, 0.28, 0.5, 0, 0 )
	weeklydailybacker:setupNineSliceShader( 33, 15 )
	self:addElement( weeklydailybacker )
	self.weeklydailybacker = weeklydailybacker
	
	local NotificationWeeklyDailyTextWidget = CoD.NotificationWeeklyDailyTextWidget.new( menu, controller )
	NotificationWeeklyDailyTextWidget:setLeftRight( false, false, -98.5, 98.5 )
	NotificationWeeklyDailyTextWidget:setTopBottom( false, true, -16.92, 2.08 )
	NotificationWeeklyDailyTextWidget:setScale( 0.76 )
	NotificationWeeklyDailyTextWidget.WeeklyText:setText( Engine.Localize( "MPUI_BM_CONTRACT_WEEKLY" ) )
	LUI.OverrideFunction_CallOriginalFirst( NotificationWeeklyDailyTextWidget, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 1 )
	end )
	self:addElement( NotificationWeeklyDailyTextWidget )
	self.NotificationWeeklyDailyTextWidget = NotificationWeeklyDailyTextWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				weeklydailybacker:completeAnimation()
				self.weeklydailybacker:setAlpha( 1 )
				self.clipFinished( weeklydailybacker, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotificationWeeklyDailyTextWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

