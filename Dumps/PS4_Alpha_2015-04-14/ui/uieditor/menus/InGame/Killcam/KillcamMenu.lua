require( "ui.uieditor.widgets.EndGameFlow.FinalKillcamWidget" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidget" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "post_killcam_transition", function ( self, event )
		self:playClip( "EndTransition" )
	end )
end

LUI.createMenu.KillcamMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "KillcamMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local FinalKillcamWidget = CoD.FinalKillcamWidget.new( self, controller )
	FinalKillcamWidget:setLeftRight( false, false, -640, 640 )
	FinalKillcamWidget:setTopBottom( false, false, -360, 360 )
	FinalKillcamWidget:setRGB( 1, 1, 1 )
	FinalKillcamWidget:setAlpha( 0 )
	self:addElement( FinalKillcamWidget )
	self.FinalKillcamWidget = FinalKillcamWidget
	
	local KillcamWidget = CoD.KillcamWidget.new( self, controller )
	KillcamWidget:setLeftRight( false, false, -640, 640 )
	KillcamWidget:setTopBottom( false, false, -360, 360 )
	KillcamWidget:setRGB( 1, 1, 1 )
	KillcamWidget:setAlpha( 0 )
	self:addElement( KillcamWidget )
	self.KillcamWidget = KillcamWidget
	
	local Foreground = LUI.UIImage.new()
	Foreground:setLeftRight( false, false, -640, 640 )
	Foreground:setTopBottom( false, false, -360, 360 )
	Foreground:setRGB( 0, 0, 0 )
	Foreground:setAlpha( 0 )
	Foreground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Foreground )
	self.Foreground = Foreground
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FinalKillcamWidget:completeAnimation()
				self.FinalKillcamWidget:setAlpha( 1 )
				self.clipFinished( FinalKillcamWidget, {} )
				KillcamWidget:completeAnimation()
				self.KillcamWidget:setAlpha( 1 )
				self.clipFinished( KillcamWidget, {} )
				Foreground:completeAnimation()
				self.Foreground:setAlpha( 0 )
				self.clipFinished( Foreground, {} )
			end,
			EndTransition = function ()
				self:setupElementClipCounter( 3 )
				local FinalKillcamWidgetFrame2 = function ( FinalKillcamWidget, event )
					if not event.interrupted then
						FinalKillcamWidget:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					FinalKillcamWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FinalKillcamWidget, event )
					else
						FinalKillcamWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FinalKillcamWidget:completeAnimation()
				self.FinalKillcamWidget:setAlpha( 1 )
				FinalKillcamWidgetFrame2( FinalKillcamWidget, {} )
				local KillcamWidgetFrame2 = function ( KillcamWidget, event )
					if not event.interrupted then
						KillcamWidget:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					KillcamWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( KillcamWidget, event )
					else
						KillcamWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidget:completeAnimation()
				self.KillcamWidget:setAlpha( 1 )
				KillcamWidgetFrame2( KillcamWidget, {} )
				local ForegroundFrame2 = function ( Foreground, event )
					local ForegroundFrame3 = function ( Foreground, event )
						if not event.interrupted then
							Foreground:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						Foreground:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Foreground, event )
						else
							Foreground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ForegroundFrame3( Foreground, event )
						return 
					else
						Foreground:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						Foreground:setAlpha( 1 )
						Foreground:registerEventHandler( "transition_complete_keyframe", ForegroundFrame3 )
					end
				end
				
				Foreground:completeAnimation()
				self.Foreground:setAlpha( 0 )
				ForegroundFrame2( Foreground, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.FinalKillcamWidget:close()
		self.KillcamWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

