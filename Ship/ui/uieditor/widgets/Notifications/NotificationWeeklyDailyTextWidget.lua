-- 625428db000ad771be06f6f154084b0a
-- This hash is used for caching, delete to decompile the file again

CoD.NotificationWeeklyDailyTextWidget = InheritFrom( LUI.UIElement )
CoD.NotificationWeeklyDailyTextWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.NotificationWeeklyDailyTextWidget )
	self.id = "NotificationWeeklyDailyTextWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 197 )
	self:setTopBottom( true, false, 0, 19 )
	
	local WeeklyText = LUI.UIText.new()
	WeeklyText:setLeftRight( false, false, -98.5, 98.5 )
	WeeklyText:setTopBottom( true, false, 0, 19 )
	WeeklyText:setText( Engine.Localize( "MPUI_BM_CONTRACT_WEEKLY" ) )
	WeeklyText:setTTF( "fonts/escom.ttf" )
	WeeklyText:setLetterSpacing( 5.6 )
	WeeklyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	WeeklyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WeeklyText )
	self.WeeklyText = WeeklyText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				WeeklyText:completeAnimation()
				self.WeeklyText:setAlpha( 1 )
				self.clipFinished( WeeklyText, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
