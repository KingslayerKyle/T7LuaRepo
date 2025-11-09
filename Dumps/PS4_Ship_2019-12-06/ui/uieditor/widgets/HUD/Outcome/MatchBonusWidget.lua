require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Title" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpReward" )

CoD.MatchBonusWidget = InheritFrom( LUI.UIElement )
CoD.MatchBonusWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MatchBonusWidget )
	self.id = "MatchBonusWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 284 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local XpIcon0 = LUI.UIImage.new()
	XpIcon0:setLeftRight( false, false, -31, 31 )
	XpIcon0:setTopBottom( true, false, 0, 62 )
	XpIcon0:setRGB( 0.04, 0.8, 1 )
	XpIcon0:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XpIcon0 )
	self.XpIcon0 = XpIcon0
	
	local MatchBonusNew0 = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	MatchBonusNew0:setLeftRight( false, false, -142, 142 )
	MatchBonusNew0:setTopBottom( true, false, 96, 128 )
	MatchBonusNew0.FEButtonPanel0:setAlpha( 0.7 )
	MatchBonusNew0.Glow:setRGB( 0.04, 0.8, 1 )
	MatchBonusNew0.Glow:setAlpha( 0.12 )
	MatchBonusNew0.MatchText:setRGB( 0.04, 0.8, 1 )
	MatchBonusNew0.MatchText:setTTF( "fonts/escom.ttf" )
	MatchBonusNew0:subscribeToGlobalModel( controller, "GameScore", "matchBonus", function ( model )
		local matchBonus = Engine.GetModelValue( model )
		if matchBonus then
			MatchBonusNew0.MatchText:setText( Engine.Localize( matchBonus ) )
		end
	end )
	self:addElement( MatchBonusNew0 )
	self.MatchBonusNew0 = MatchBonusNew0
	
	local MatchBonusTitleNew0 = CoD.PrematchCountdown_Title.new( menu, controller )
	MatchBonusTitleNew0:setLeftRight( false, false, -116, 116 )
	MatchBonusTitleNew0:setTopBottom( true, false, 63.39, 95.6 )
	MatchBonusTitleNew0.MatchText:setText( Engine.Localize( "MPUI_MATCHBONUS_CAPS" ) )
	self:addElement( MatchBonusTitleNew0 )
	self.MatchBonusTitleNew0 = MatchBonusTitleNew0
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( true, false, 118, 166 )
	Notification2xpReward:setTopBottom( true, false, 7, 55 )
	Notification2xpReward:setAlpha( 0 )
	Notification2xpReward:setScale( 1.3 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 0 )
				self.clipFinished( XpIcon0, {} )
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 0 )
				self.clipFinished( MatchBonusNew0, {} )
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 0 )
				self.clipFinished( MatchBonusTitleNew0, {} )
			end,
			Show_Two_Team = function ()
				self:setupElementClipCounter( 0 )
			end,
			End_Transition = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowFFAOutcome = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local XpIcon0Frame2 = function ( XpIcon0, event )
					local XpIcon0Frame3 = function ( XpIcon0, event )
						local XpIcon0Frame4 = function ( XpIcon0, event )
							if not event.interrupted then
								XpIcon0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							end
							XpIcon0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( XpIcon0, event )
							else
								XpIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							XpIcon0Frame4( XpIcon0, event )
							return 
						else
							XpIcon0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							XpIcon0:setAlpha( 0.2 )
							XpIcon0:registerEventHandler( "transition_complete_keyframe", XpIcon0Frame4 )
						end
					end
					
					if event.interrupted then
						XpIcon0Frame3( XpIcon0, event )
						return 
					else
						XpIcon0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
						XpIcon0:setAlpha( 1 )
						XpIcon0:registerEventHandler( "transition_complete_keyframe", XpIcon0Frame3 )
					end
				end
				
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 0 )
				XpIcon0Frame2( XpIcon0, {} )
				local MatchBonusNew0Frame2 = function ( MatchBonusNew0, event )
					local MatchBonusNew0Frame3 = function ( MatchBonusNew0, event )
						local MatchBonusNew0Frame4 = function ( MatchBonusNew0, event )
							local MatchBonusNew0Frame5 = function ( MatchBonusNew0, event )
								if not event.interrupted then
									MatchBonusNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								end
								MatchBonusNew0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( MatchBonusNew0, event )
								else
									MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MatchBonusNew0Frame5( MatchBonusNew0, event )
								return 
							else
								MatchBonusNew0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								MatchBonusNew0:setAlpha( 0.2 )
								MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusNew0Frame5 )
							end
						end
						
						if event.interrupted then
							MatchBonusNew0Frame4( MatchBonusNew0, event )
							return 
						else
							MatchBonusNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
							MatchBonusNew0:setAlpha( 1 )
							MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusNew0Frame4 )
						end
					end
					
					if event.interrupted then
						MatchBonusNew0Frame3( MatchBonusNew0, event )
						return 
					else
						MatchBonusNew0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusNew0Frame3 )
					end
				end
				
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 0 )
				MatchBonusNew0Frame2( MatchBonusNew0, {} )
				local MatchBonusTitleNew0Frame2 = function ( MatchBonusTitleNew0, event )
					local MatchBonusTitleNew0Frame3 = function ( MatchBonusTitleNew0, event )
						local MatchBonusTitleNew0Frame4 = function ( MatchBonusTitleNew0, event )
							local MatchBonusTitleNew0Frame5 = function ( MatchBonusTitleNew0, event )
								if not event.interrupted then
									MatchBonusTitleNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								end
								MatchBonusTitleNew0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( MatchBonusTitleNew0, event )
								else
									MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MatchBonusTitleNew0Frame5( MatchBonusTitleNew0, event )
								return 
							else
								MatchBonusTitleNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								MatchBonusTitleNew0:setAlpha( 0.2 )
								MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusTitleNew0Frame5 )
							end
						end
						
						if event.interrupted then
							MatchBonusTitleNew0Frame4( MatchBonusTitleNew0, event )
							return 
						else
							MatchBonusTitleNew0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							MatchBonusTitleNew0:setAlpha( 1 )
							MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusTitleNew0Frame4 )
						end
					end
					
					if event.interrupted then
						MatchBonusTitleNew0Frame3( MatchBonusTitleNew0, event )
						return 
					else
						MatchBonusTitleNew0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusTitleNew0Frame3 )
					end
				end
				
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 0 )
				MatchBonusTitleNew0Frame2( MatchBonusTitleNew0, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 0 )
				self.clipFinished( XpIcon0, {} )
				local MatchBonusNew0Frame2 = function ( MatchBonusNew0, event )
					local MatchBonusNew0Frame3 = function ( MatchBonusNew0, event )
						local MatchBonusNew0Frame4 = function ( MatchBonusNew0, event )
							local MatchBonusNew0Frame5 = function ( MatchBonusNew0, event )
								if not event.interrupted then
									MatchBonusNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								end
								MatchBonusNew0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( MatchBonusNew0, event )
								else
									MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MatchBonusNew0Frame5( MatchBonusNew0, event )
								return 
							else
								MatchBonusNew0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
								MatchBonusNew0:setAlpha( 0.2 )
								MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusNew0Frame5 )
							end
						end
						
						if event.interrupted then
							MatchBonusNew0Frame4( MatchBonusNew0, event )
							return 
						else
							MatchBonusNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
							MatchBonusNew0:setAlpha( 1 )
							MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusNew0Frame4 )
						end
					end
					
					if event.interrupted then
						MatchBonusNew0Frame3( MatchBonusNew0, event )
						return 
					else
						MatchBonusNew0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						MatchBonusNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusNew0Frame3 )
					end
				end
				
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 0 )
				MatchBonusNew0Frame2( MatchBonusNew0, {} )
				local MatchBonusTitleNew0Frame2 = function ( MatchBonusTitleNew0, event )
					local MatchBonusTitleNew0Frame3 = function ( MatchBonusTitleNew0, event )
						local MatchBonusTitleNew0Frame4 = function ( MatchBonusTitleNew0, event )
							local MatchBonusTitleNew0Frame5 = function ( MatchBonusTitleNew0, event )
								if not event.interrupted then
									MatchBonusTitleNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								end
								MatchBonusTitleNew0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( MatchBonusTitleNew0, event )
								else
									MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MatchBonusTitleNew0Frame5( MatchBonusTitleNew0, event )
								return 
							else
								MatchBonusTitleNew0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Bounce )
								MatchBonusTitleNew0:setAlpha( 0.2 )
								MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusTitleNew0Frame5 )
							end
						end
						
						if event.interrupted then
							MatchBonusTitleNew0Frame4( MatchBonusTitleNew0, event )
							return 
						else
							MatchBonusTitleNew0:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							MatchBonusTitleNew0:setAlpha( 1 )
							MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusTitleNew0Frame4 )
						end
					end
					
					if event.interrupted then
						MatchBonusTitleNew0Frame3( MatchBonusTitleNew0, event )
						return 
					else
						MatchBonusTitleNew0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MatchBonusTitleNew0:registerEventHandler( "transition_complete_keyframe", MatchBonusTitleNew0Frame3 )
					end
				end
				
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 0 )
				MatchBonusTitleNew0Frame2( MatchBonusTitleNew0, {} )
				local Notification2xpRewardFrame2 = function ( Notification2xpReward, event )
					local Notification2xpRewardFrame3 = function ( Notification2xpReward, event )
						local Notification2xpRewardFrame4 = function ( Notification2xpReward, event )
							if not event.interrupted then
								Notification2xpReward:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							end
							Notification2xpReward:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Notification2xpReward, event )
							else
								Notification2xpReward:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Notification2xpRewardFrame4( Notification2xpReward, event )
							return 
						else
							Notification2xpReward:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
							Notification2xpReward:setAlpha( 0.2 )
							Notification2xpReward:registerEventHandler( "transition_complete_keyframe", Notification2xpRewardFrame4 )
						end
					end
					
					if event.interrupted then
						Notification2xpRewardFrame3( Notification2xpReward, event )
						return 
					else
						Notification2xpReward:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Bounce )
						Notification2xpReward:setAlpha( 1 )
						Notification2xpReward:registerEventHandler( "transition_complete_keyframe", Notification2xpRewardFrame3 )
					end
				end
				
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				Notification2xpRewardFrame2( Notification2xpReward, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return ShowMatchBonus( element, controller ) and not IsDoubleXP( controller )
			end
		},
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return ShowMatchBonus( element, controller ) and IsDoubleXP( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.isRoundEnd" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.isRoundEnd"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.matchBonus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.matchBonus"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MatchBonusNew0:close()
		element.MatchBonusTitleNew0:close()
		element.Notification2xpReward:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

