require( "ui.uieditor.widgets.HUD.Killcam.KillcamHeader" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnPnl" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetVignetteTop" )
require( "ui.uieditor.widgets.HUD.Outcome.WinnerFactionInfo" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if Engine.GetGametypeSetting( "teamCount" ) == 1 then
		f1_arg0.WinnerFactionInfo:close()
	end
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "gameScore" )
	local f1_local1 = false
	if Engine.GetModel( f1_local0, "draw" ) then
		f1_local1 = Engine.GetModelValue( Engine.GetModel( f1_local0, "draw" ) )
	end
	if f1_local1 then
		f1_arg0.WinnerFactionInfo:close()
	end
end

CoD.FinalKillcamWidget = InheritFrom( LUI.UIElement )
CoD.FinalKillcamWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FinalKillcamWidget )
	self.id = "FinalKillcamWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Header = CoD.KillcamHeader.new( menu, controller )
	Header:setLeftRight( false, false, -640, 640 )
	Header:setTopBottom( true, false, 0, 128 )
	self:addElement( Header )
	self.Header = Header
	
	local KillcamWidgetFctnPnl0 = CoD.KillcamWidgetFctnPnl.new( menu, controller )
	KillcamWidgetFctnPnl0:setLeftRight( true, false, 0, 400 )
	KillcamWidgetFctnPnl0:setTopBottom( true, false, 0, 200 )
	KillcamWidgetFctnPnl0:setRGB( 0.44, 0.44, 0.44 )
	self:addElement( KillcamWidgetFctnPnl0 )
	self.KillcamWidgetFctnPnl0 = KillcamWidgetFctnPnl0
	
	local Footer = CoD.KillcamWidgetVignetteTop.new( menu, controller )
	Footer:setLeftRight( false, false, -640, 640 )
	Footer:setTopBottom( false, false, 268, 380 )
	Footer:setAlpha( 0.7 )
	Footer:setXRot( 180 )
	self:addElement( Footer )
	self.Footer = Footer
	
	local WinnerFactionInfo = CoD.WinnerFactionInfo.new( menu, controller )
	WinnerFactionInfo:setLeftRight( true, false, 0, 390 )
	WinnerFactionInfo:setTopBottom( true, false, 0, 180 )
	WinnerFactionInfo.KillcamWidgetTitleStatus0.SubTitle:setText( Engine.Localize( "MENU_WINNERS_CAPS" ) )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionDisplayName", function ( model )
		local winnersFactionDisplayName = Engine.GetModelValue( model )
		if winnersFactionDisplayName then
			WinnerFactionInfo.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( winnersFactionDisplayName ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon0:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItem.WinningTeamFactionIcon:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon0:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	WinnerFactionInfo:subscribeToGlobalModel( controller, "FactionsGlobal", "winnersFactionIcon", function ( model )
		local winnersFactionIcon = Engine.GetModelValue( model )
		if winnersFactionIcon then
			WinnerFactionInfo.OutcomeFactionIcon.OutcomeFactionIconItemForCodCaster.WinningTeamFactionIcon:setImage( RegisterImage( winnersFactionIcon ) )
		end
	end )
	self:addElement( WinnerFactionInfo )
	self.WinnerFactionInfo = WinnerFactionInfo
	
	local PlayerCard = CoD.PlayerCard.new( menu, controller )
	PlayerCard:setLeftRight( true, false, 67, 375 )
	PlayerCard:setTopBottom( false, true, -79, -20 )
	PlayerCard:subscribeToGlobalModel( controller, "Attacker", nil, function ( model )
		PlayerCard:setModel( model, controller )
	end )
	PlayerCard:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			PlayerCard.CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local BlackForeground = LUI.UIImage.new()
	BlackForeground:setLeftRight( true, true, 0, 0 )
	BlackForeground:setTopBottom( true, true, 0, 0 )
	BlackForeground:setRGB( 0, 0, 0 )
	BlackForeground:setAlpha( 0 )
	self:addElement( BlackForeground )
	self.BlackForeground = BlackForeground
	
	local TransitionImageBottom = LUI.UIImage.new()
	TransitionImageBottom:setLeftRight( true, true, 0, 0 )
	TransitionImageBottom:setTopBottom( false, true, -302.4, 57.6 )
	TransitionImageBottom:setRGB( 0, 0, 0 )
	TransitionImageBottom:setAlpha( 0 )
	self:addElement( TransitionImageBottom )
	self.TransitionImageBottom = TransitionImageBottom
	
	local TransitionImageTop = LUI.UIImage.new()
	TransitionImageTop:setLeftRight( true, true, 0, 0 )
	TransitionImageTop:setTopBottom( true, false, -57.6, 302.4 )
	TransitionImageTop:setRGB( 0, 0, 0 )
	TransitionImageTop:setAlpha( 0 )
	self:addElement( TransitionImageTop )
	self.TransitionImageTop = TransitionImageTop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Header:completeAnimation()
				self.Header:setAlpha( 0 )
				self.clipFinished( Header, {} )
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 0 )
				self.clipFinished( KillcamWidgetFctnPnl0, {} )
				Footer:completeAnimation()
				self.Footer:setAlpha( 0 )
				self.clipFinished( Footer, {} )
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 0 )
				self.clipFinished( WinnerFactionInfo, {} )
				PlayerCard:completeAnimation()
				self.PlayerCard:setAlpha( 0 )
				self.clipFinished( PlayerCard, {} )
				BlackForeground:completeAnimation()
				self.BlackForeground:setAlpha( 0 )
				self.clipFinished( BlackForeground, {} )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local HeaderFrame2 = function ( Header, event )
					local HeaderFrame3 = function ( Header, event )
						local HeaderFrame4 = function ( Header, event )
							if not event.interrupted then
								Header:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							end
							Header:setLeftRight( false, false, -640, 640 )
							Header:setTopBottom( true, false, 0, 128 )
							Header:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Header, event )
							else
								Header:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HeaderFrame4( Header, event )
							return 
						else
							Header:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
							Header:setAlpha( 0.51 )
							Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame4 )
						end
					end
					
					if event.interrupted then
						HeaderFrame3( Header, event )
						return 
					else
						Header:beginAnimation( "keyframe", 349, false, true, CoD.TweenType.Linear )
						Header:setTopBottom( true, false, 0, 128 )
						Header:setAlpha( 1 )
						Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame3 )
					end
				end
				
				Header:completeAnimation()
				self.Header:setLeftRight( false, false, -640, 640 )
				self.Header:setTopBottom( true, false, -40, 88 )
				self.Header:setAlpha( 0 )
				HeaderFrame2( Header, {} )
				local KillcamWidgetFctnPnl0Frame2 = function ( KillcamWidgetFctnPnl0, event )
					if not event.interrupted then
						KillcamWidgetFctnPnl0:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
					end
					KillcamWidgetFctnPnl0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( KillcamWidgetFctnPnl0, event )
					else
						KillcamWidgetFctnPnl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 0 )
				KillcamWidgetFctnPnl0Frame2( KillcamWidgetFctnPnl0, {} )
				local FooterFrame2 = function ( Footer, event )
					local FooterFrame3 = function ( Footer, event )
						local FooterFrame4 = function ( Footer, event )
							if not event.interrupted then
								Footer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
							end
							Footer:setLeftRight( false, false, -640, 640 )
							Footer:setTopBottom( false, false, 268, 380 )
							Footer:setAlpha( 0.7 )
							if event.interrupted then
								self.clipFinished( Footer, event )
							else
								Footer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FooterFrame4( Footer, event )
							return 
						else
							Footer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							Footer:setAlpha( 0.4 )
							Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame4 )
						end
					end
					
					if event.interrupted then
						FooterFrame3( Footer, event )
						return 
					else
						Footer:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Linear )
						Footer:setTopBottom( false, false, 268, 380 )
						Footer:setAlpha( 0.7 )
						Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame3 )
					end
				end
				
				Footer:completeAnimation()
				self.Footer:setLeftRight( false, false, -640, 640 )
				self.Footer:setTopBottom( false, false, 316.5, 428.5 )
				self.Footer:setAlpha( 0 )
				FooterFrame2( Footer, {} )
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 1 )
				self.clipFinished( WinnerFactionInfo, {} )
				local PlayerCardFrame2 = function ( PlayerCard, event )
					local PlayerCardFrame3 = function ( PlayerCard, event )
						local PlayerCardFrame4 = function ( PlayerCard, event )
							local PlayerCardFrame5 = function ( PlayerCard, event )
								if not event.interrupted then
									PlayerCard:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
								end
								PlayerCard:setLeftRight( true, false, 67, 375 )
								PlayerCard:setTopBottom( false, true, -93, -34 )
								PlayerCard:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( PlayerCard, event )
								else
									PlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PlayerCardFrame5( PlayerCard, event )
								return 
							else
								PlayerCard:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
								PlayerCard:setAlpha( 0.44 )
								PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerCardFrame4( PlayerCard, event )
							return 
						else
							PlayerCard:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
							PlayerCard:setAlpha( 1 )
							PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerCardFrame3( PlayerCard, event )
						return 
					else
						PlayerCard:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						PlayerCard:setLeftRight( true, false, 67, 375 )
						PlayerCard:setTopBottom( false, true, -93, -34 )
						PlayerCard:setAlpha( 0.96 )
						PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame3 )
					end
				end
				
				PlayerCard:completeAnimation()
				self.PlayerCard:setLeftRight( true, false, 64, 372 )
				self.PlayerCard:setTopBottom( false, true, 12.5, 71.5 )
				self.PlayerCard:setAlpha( 0 )
				PlayerCardFrame2( PlayerCard, {} )
				BlackForeground:completeAnimation()
				self.BlackForeground:setAlpha( 0 )
				self.clipFinished( BlackForeground, {} )
				local TransitionImageBottomFrame2 = function ( TransitionImageBottom, event )
					if not event.interrupted then
						TransitionImageBottom:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					TransitionImageBottom:setLeftRight( true, true, 0, 0 )
					TransitionImageBottom:setTopBottom( false, true, 0, 360 )
					TransitionImageBottom:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TransitionImageBottom, event )
					else
						TransitionImageBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TransitionImageBottom:completeAnimation()
				self.TransitionImageBottom:setLeftRight( true, true, 0, 0 )
				self.TransitionImageBottom:setTopBottom( false, true, -360, 0 )
				self.TransitionImageBottom:setAlpha( 1 )
				TransitionImageBottomFrame2( TransitionImageBottom, {} )
				local TransitionImageTopFrame2 = function ( TransitionImageTop, event )
					if not event.interrupted then
						TransitionImageTop:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					TransitionImageTop:setLeftRight( true, true, 0, 0 )
					TransitionImageTop:setTopBottom( true, false, -360, 0 )
					TransitionImageTop:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TransitionImageTop, event )
					else
						TransitionImageTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TransitionImageTop:completeAnimation()
				self.TransitionImageTop:setLeftRight( true, true, 0, 0 )
				self.TransitionImageTop:setTopBottom( true, false, 0, 360 )
				self.TransitionImageTop:setAlpha( 1 )
				TransitionImageTopFrame2( TransitionImageTop, {} )
			end,
			End = function ()
				self:setupElementClipCounter( 6 )
				local HeaderFrame2 = function ( Header, event )
					local HeaderFrame3 = function ( Header, event )
						local HeaderFrame4 = function ( Header, event )
							local HeaderFrame5 = function ( Header, event )
								local HeaderFrame6 = function ( Header, event )
									local HeaderFrame7 = function ( Header, event )
										local HeaderFrame8 = function ( Header, event )
											local HeaderFrame9 = function ( Header, event )
												if not event.interrupted then
													Header:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												end
												Header:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Header, event )
												else
													Header:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												HeaderFrame9( Header, event )
												return 
											else
												Header:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Header:setAlpha( 0.15 )
												Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame9 )
											end
										end
										
										if event.interrupted then
											HeaderFrame8( Header, event )
											return 
										else
											Header:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Header:setAlpha( 0.1 )
											Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame8 )
										end
									end
									
									if event.interrupted then
										HeaderFrame7( Header, event )
										return 
									else
										Header:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										Header:setAlpha( 0.3 )
										Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame7 )
									end
								end
								
								if event.interrupted then
									HeaderFrame6( Header, event )
									return 
								else
									Header:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Header:setAlpha( 0.55 )
									Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame6 )
								end
							end
							
							if event.interrupted then
								HeaderFrame5( Header, event )
								return 
							else
								Header:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Header:setAlpha( 0.14 )
								Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame5 )
							end
						end
						
						if event.interrupted then
							HeaderFrame4( Header, event )
							return 
						else
							Header:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Header:setAlpha( 0.7 )
							Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame4 )
						end
					end
					
					if event.interrupted then
						HeaderFrame3( Header, event )
						return 
					else
						Header:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Header:registerEventHandler( "transition_complete_keyframe", HeaderFrame3 )
					end
				end
				
				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				HeaderFrame2( Header, {} )
				local KillcamWidgetFctnPnl0Frame2 = function ( KillcamWidgetFctnPnl0, event )
					if not event.interrupted then
						KillcamWidgetFctnPnl0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					KillcamWidgetFctnPnl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( KillcamWidgetFctnPnl0, event )
					else
						KillcamWidgetFctnPnl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				KillcamWidgetFctnPnl0:completeAnimation()
				self.KillcamWidgetFctnPnl0:setAlpha( 1 )
				KillcamWidgetFctnPnl0Frame2( KillcamWidgetFctnPnl0, {} )
				local FooterFrame2 = function ( Footer, event )
					local FooterFrame3 = function ( Footer, event )
						local FooterFrame4 = function ( Footer, event )
							local FooterFrame5 = function ( Footer, event )
								local FooterFrame6 = function ( Footer, event )
									local FooterFrame7 = function ( Footer, event )
										local FooterFrame8 = function ( Footer, event )
											local FooterFrame9 = function ( Footer, event )
												if not event.interrupted then
													Footer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												end
												Footer:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Footer, event )
												else
													Footer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												FooterFrame9( Footer, event )
												return 
											else
												Footer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Footer:setAlpha( 0.25 )
												Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame9 )
											end
										end
										
										if event.interrupted then
											FooterFrame8( Footer, event )
											return 
										else
											Footer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Footer:setAlpha( 0.09 )
											Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame8 )
										end
									end
									
									if event.interrupted then
										FooterFrame7( Footer, event )
										return 
									else
										Footer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Footer:setAlpha( 0.4 )
										Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame7 )
									end
								end
								
								if event.interrupted then
									FooterFrame6( Footer, event )
									return 
								else
									Footer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Footer:setAlpha( 0.6 )
									Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame6 )
								end
							end
							
							if event.interrupted then
								FooterFrame5( Footer, event )
								return 
							else
								Footer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Footer:setAlpha( 0.14 )
								Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame5 )
							end
						end
						
						if event.interrupted then
							FooterFrame4( Footer, event )
							return 
						else
							Footer:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Footer:setAlpha( 0.75 )
							Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame4 )
						end
					end
					
					if event.interrupted then
						FooterFrame3( Footer, event )
						return 
					else
						Footer:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						Footer:registerEventHandler( "transition_complete_keyframe", FooterFrame3 )
					end
				end
				
				Footer:completeAnimation()
				self.Footer:setAlpha( 0.7 )
				FooterFrame2( Footer, {} )
				local WinnerFactionInfoFrame2 = function ( WinnerFactionInfo, event )
					local WinnerFactionInfoFrame3 = function ( WinnerFactionInfo, event )
						local WinnerFactionInfoFrame4 = function ( WinnerFactionInfo, event )
							local WinnerFactionInfoFrame5 = function ( WinnerFactionInfo, event )
								local WinnerFactionInfoFrame6 = function ( WinnerFactionInfo, event )
									local WinnerFactionInfoFrame7 = function ( WinnerFactionInfo, event )
										local WinnerFactionInfoFrame8 = function ( WinnerFactionInfo, event )
											if not event.interrupted then
												WinnerFactionInfo:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											end
											WinnerFactionInfo:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( WinnerFactionInfo, event )
											else
												WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											WinnerFactionInfoFrame8( WinnerFactionInfo, event )
											return 
										else
											WinnerFactionInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											WinnerFactionInfo:setAlpha( 0.11 )
											WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame8 )
										end
									end
									
									if event.interrupted then
										WinnerFactionInfoFrame7( WinnerFactionInfo, event )
										return 
									else
										WinnerFactionInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										WinnerFactionInfo:setAlpha( 0 )
										WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame7 )
									end
								end
								
								if event.interrupted then
									WinnerFactionInfoFrame6( WinnerFactionInfo, event )
									return 
								else
									WinnerFactionInfo:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									WinnerFactionInfo:setAlpha( 0.21 )
									WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame6 )
								end
							end
							
							if event.interrupted then
								WinnerFactionInfoFrame5( WinnerFactionInfo, event )
								return 
							else
								WinnerFactionInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								WinnerFactionInfo:setAlpha( 0.41 )
								WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame5 )
							end
						end
						
						if event.interrupted then
							WinnerFactionInfoFrame4( WinnerFactionInfo, event )
							return 
						else
							WinnerFactionInfo:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							WinnerFactionInfo:setAlpha( 0.04 )
							WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame4 )
						end
					end
					
					if event.interrupted then
						WinnerFactionInfoFrame3( WinnerFactionInfo, event )
						return 
					else
						WinnerFactionInfo:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						WinnerFactionInfo:setAlpha( 0.55 )
						WinnerFactionInfo:registerEventHandler( "transition_complete_keyframe", WinnerFactionInfoFrame3 )
					end
				end
				
				WinnerFactionInfo:completeAnimation()
				self.WinnerFactionInfo:setAlpha( 1 )
				WinnerFactionInfoFrame2( WinnerFactionInfo, {} )
				local PlayerCardFrame2 = function ( PlayerCard, event )
					local PlayerCardFrame3 = function ( PlayerCard, event )
						local PlayerCardFrame4 = function ( PlayerCard, event )
							local PlayerCardFrame5 = function ( PlayerCard, event )
								local PlayerCardFrame6 = function ( PlayerCard, event )
									if not event.interrupted then
										PlayerCard:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									end
									PlayerCard:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( PlayerCard, event )
									else
										PlayerCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									PlayerCardFrame6( PlayerCard, event )
									return 
								else
									PlayerCard:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									PlayerCard:setAlpha( 0.4 )
									PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerCardFrame5( PlayerCard, event )
								return 
							else
								PlayerCard:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PlayerCard:setAlpha( 0.09 )
								PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerCardFrame4( PlayerCard, event )
							return 
						else
							PlayerCard:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							PlayerCard:setAlpha( 0.6 )
							PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerCardFrame3( PlayerCard, event )
						return 
					else
						PlayerCard:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						PlayerCard:registerEventHandler( "transition_complete_keyframe", PlayerCardFrame3 )
					end
				end
				
				PlayerCard:completeAnimation()
				self.PlayerCard:setAlpha( 1 )
				PlayerCardFrame2( PlayerCard, {} )
				local BlackForegroundFrame2 = function ( BlackForeground, event )
					if not event.interrupted then
						BlackForeground:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					BlackForeground:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BlackForeground, event )
					else
						BlackForeground:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackForeground:completeAnimation()
				self.BlackForeground:setAlpha( 0 )
				BlackForegroundFrame2( BlackForeground, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				local f56_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f56_local0 then
					f56_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
				end
				return f56_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	Header.id = "Header"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Header:close()
		element.KillcamWidgetFctnPnl0:close()
		element.Footer:close()
		element.WinnerFactionInfo:close()
		element.PlayerCard:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

