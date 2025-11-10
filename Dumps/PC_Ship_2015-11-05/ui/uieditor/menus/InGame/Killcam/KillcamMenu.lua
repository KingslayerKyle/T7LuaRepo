require( "ui.uieditor.widgets.EndGameFlow.FinalKillcamWidget" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidget" )
require( "ui.uieditor.widgets.MPHudWidgets.KillcamRespawnPrompt" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.killcamAllowRespawn" ), 0 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "KillcamMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FinalKillcamWidget = CoD.FinalKillcamWidget.new( self, controller )
	FinalKillcamWidget:setLeftRight( true, true, 0, 0 )
	FinalKillcamWidget:setTopBottom( true, true, 0, 0 )
	FinalKillcamWidget:setAlpha( 0 )
	self:addElement( FinalKillcamWidget )
	self.FinalKillcamWidget = FinalKillcamWidget
	
	local KillcamWidget = CoD.KillcamWidget.new( self, controller )
	KillcamWidget:setLeftRight( true, true, 0, 0 )
	KillcamWidget:setTopBottom( true, true, 0, 0 )
	KillcamWidget:setAlpha( 0 )
	self:addElement( KillcamWidget )
	self.KillcamWidget = KillcamWidget
	
	local Foreground = LUI.UIImage.new()
	Foreground:setLeftRight( true, true, 0, 0 )
	Foreground:setTopBottom( true, true, 0, 0 )
	Foreground:setRGB( 0, 0, 0 )
	self:addElement( Foreground )
	self.Foreground = Foreground
	
	local KillcamRespawnPrompt = CoD.KillcamRespawnPrompt.new( self, controller )
	KillcamRespawnPrompt:setLeftRight( false, false, -171, 171 )
	KillcamRespawnPrompt:setTopBottom( true, false, 499, 529 )
	KillcamRespawnPrompt:setAlpha( 0 )
	KillcamRespawnPrompt:subscribeToGlobalModel( controller, "HUDItems", "killcamAllowRespawn", function ( model )
		local killcamAllowRespawn = Engine.GetModelValue( model )
		if killcamAllowRespawn then
			KillcamRespawnPrompt.RespawnPrompt:setText( Engine.Localize( KillCamAllowRespawnToString( controller, killcamAllowRespawn ) ) )
		end
	end )
	self:addElement( KillcamRespawnPrompt )
	self.KillcamRespawnPrompt = KillcamRespawnPrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FinalKillcamWidget:completeAnimation()
				self.FinalKillcamWidget:setAlpha( 1 )
				self.clipFinished( FinalKillcamWidget, {} )
				KillcamWidget:completeAnimation()
				self.KillcamWidget:setAlpha( 1 )
				self.clipFinished( KillcamWidget, {} )
				Foreground:completeAnimation()
				self.Foreground:setAlpha( 0 )
				self.clipFinished( Foreground, {} )
				KillcamRespawnPrompt:completeAnimation()
				self.KillcamRespawnPrompt:setAlpha( 1 )
				self.clipFinished( KillcamRespawnPrompt, {} )
			end,
			EndTransition = function ()
				self:setupElementClipCounter( 4 )
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
				local KillcamRespawnPromptFrame2 = function ( KillcamRespawnPrompt, event )
					if not event.interrupted then
						KillcamRespawnPrompt:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					KillcamRespawnPrompt:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( KillcamRespawnPrompt, event )
					else
						KillcamRespawnPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamRespawnPrompt:completeAnimation()
				self.KillcamRespawnPrompt:setAlpha( 1 )
				KillcamRespawnPromptFrame2( KillcamRespawnPrompt, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local f11_local0 = self
		if IsParamModelEqualToString( model, "post_killcam_transition" ) then
			PlayClip( self, "EndTransition", controller )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FinalKillcamWidget:close()
		element.KillcamWidget:close()
		element.KillcamRespawnPrompt:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "KillcamMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

