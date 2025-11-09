require( "ui.uieditor.widgets.HUD.ZM_Notif.ZmNotif1_CursorHint" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.TrialComplete_TitleBox" )

CoD.TrialCompleteNotification = InheritFrom( LUI.UIElement )
CoD.TrialCompleteNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TrialCompleteNotification )
	self.id = "TrialCompleteNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 250 )
	
	local ZmNotif1CursorHint = CoD.ZmNotif1_CursorHint.new( menu, controller )
	ZmNotif1CursorHint:setLeftRight( true, false, -82, 430 )
	ZmNotif1CursorHint:setTopBottom( true, false, 210.16, 230.16 )
	self:addElement( ZmNotif1CursorHint )
	self.ZmNotif1CursorHint = ZmNotif1CursorHint
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -64, 64 )
	image:setTopBottom( true, false, 38, 166 )
	self:addElement( image )
	self.image = image
	
	local TrialCompleteTitleBox = CoD.TrialComplete_TitleBox.new( menu, controller )
	TrialCompleteTitleBox:setLeftRight( true, false, -2, 350 )
	TrialCompleteTitleBox:setTopBottom( true, false, 177, 202 )
	self:addElement( TrialCompleteTitleBox )
	self.TrialCompleteTitleBox = TrialCompleteTitleBox
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( true, false, 335.72, 383.72 )
	Sound:setTopBottom( true, false, -100.23, -52.22 )
	Sound:setPlaySoundDirect( true )
	self:addElement( Sound )
	self.Sound = Sound
	
	self.ZmNotif1CursorHint:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			ZmNotif1CursorHint.CursorHintText:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			image:setImage( RegisterImage( icon ) )
		end
	end )
	self.TrialCompleteTitleBox:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			TrialCompleteTitleBox.ScorestreaksLabel:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "zmb_trial_complete", controller )
				self.clipFinished( Sound, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmNotif1CursorHint:close()
		element.TrialCompleteTitleBox:close()
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

