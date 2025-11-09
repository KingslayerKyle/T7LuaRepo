require( "ui.uieditor.widgets.Notifications.Notification_Card" )
require( "ui.uieditor.widgets.Notifications.Notification_Timer" )
require( "ui.uieditor.widgets.Notifications.Notification_Bonus" )
require( "ui.uieditor.widgets.Notifications.Perks.NotificationPerksContainer" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_Callout" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard_ObituaryCallout" )
require( "ui.uieditor.widgets.Notifications.Medals.Notification_Medals" )
require( "ui.uieditor.widgets.Notifications.OutOfBounds.OutOfBounds" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.NotificationHeroWeaponProto" )
require( "ui.uieditor.widgets.Notifications.NotificationQueue" )

local NotificationPriority = {
	RankUp = 1,
	Medals = 2,
	Killstreaks = 3,
	HeroWeapons = 4
}
local AddToNotificationQueue = function ( self, event, priority, callback )
	
end

local OnNotificationComplete = function ( self )
	self.NotificationQueueActive = false
	self:processEvent( {
		name = "pump_notification_queue"
	} )
end

local ClearNotificationQueue = function ( self, event )
	for index = 1, #self.NotificationQueue, 1 do
		table.remove( self.NotificationQueue, index )
	end
	self.NotificationActive = false
	self:dispatchEventToChildren( event )
end

local PumpNotificationQueue = function ( self )
	if self.NotificationQueueActive == false and #self.NotificationQueue > 0 then
		local priority = -1
		local notificationIndex = -1
		for index = 1, #self.NotificationQueue, 1 do
			if priority < self.NotificationQueue[index].priority then
				priority = self.NotificationQueue[index].priority
				notificationIndex = index
			end
		end
		if priority < 0 or notificationIndex < 1 then
			error( "Incorrect priority " .. priority .. " or notificationIndex " .. notificationIndex .. " in notificationPopups. " )
		end
		local currentNotification = self.NotificationQueue[notificationIndex]
		self.NotificationQueueActive = true
		table.remove( self.NotificationQueue, notificationIndex )
		currentNotification.callback( self, currentNotification.event, priority )
	end
end

local PlayQueuedClip = function ( self, event )
	self:playClip( event.name )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local ShowTextNotification = function ( self, event )
	self.Title:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.Title:setRGB( r, g, b )
	self.SubTitleReg:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f7_local0, f7_local1, f7_local2, f7_local3 = Engine.UnpackRgba( event.data[4] )
	a = f7_local3
	self.SubTitleReg:setRGB( f7_local0, f7_local1, f7_local2 )
	self:playClip( "show_text_notify" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local ShowTextNotificationWithImage = function ( self, event )
	self.Title:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.Title:setRGB( r, g, b )
	self.SubTitleSmall:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f9_local0, f9_local1, f9_local2, f9_local3 = Engine.UnpackRgba( event.data[4] )
	a = f9_local3
	self.SubTitleSmall:setRGB( f9_local0, f9_local1, f9_local2 )
	self.TitleImage128:setImage( RegisterMaterial( Engine.GetIString( event.data[5], "CS_LOCALIZED_STRINGS" ) ) )
	self.TitleImage128:setupUIStreamedImage( 4000 )
	self:playClip( "show_text_image_notify" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local CountdownStart = function ( self, event )
	self.Title:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.Title:setRGB( r, g, b )
	self:playClip( "fade_in_prematch_timer" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local CountdownStart_Old = function ( self, event )
	self.Title:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.Title:setRGB( r, g, b )
	self.SubTitleReg:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f13_local0, f13_local1, f13_local2, f13_local3 = Engine.UnpackRgba( event.data[4] )
	a = f13_local3
	self.SubTitleReg:setRGB( f13_local0, f13_local1, f13_local2 )
	self:playClip( "fade_in_prematch_timer" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local CountdownSet_Old = function ( self, event )
	self.Title:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.Title:setRGB( r, g, b )
	self.SubTitleReg:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f15_local0, f15_local1, f15_local2, f15_local3 = Engine.UnpackRgba( event.data[4] )
	a = f15_local3
	self.SubTitleReg:setRGB( f15_local0, f15_local1, f15_local2 )
	self:processEvent( {
		name = "notification_complete"
	} )
end

local CountdownEnd_Old = function ( self, event )
	self:playClip( "fade_out_prematch_timer" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveStart = function ( self, event )
	self.TitleWave:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.TitleWave:setRGB( r, g, b )
	self.SubTitleReg:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f18_local0, f18_local1, f18_local2, f18_local3 = Engine.UnpackRgba( event.data[4] )
	a = f18_local3
	self.SubTitleReg:setRGB( f18_local0, f18_local1, f18_local2 )
	self:playClip( "wave_start" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveEnd = function ( self, event, priority )
	self.Title:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.Title:setRGB( r, g, b )
	self.SubTitleReg:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f20_local0, f20_local1, f20_local2, f20_local3 = Engine.UnpackRgba( event.data[4] )
	a = f20_local3
	self.SubTitleReg:setRGB( f20_local0, f20_local1, f20_local2 )
	local showWaveCompleteEvent = {
		name = "show_text_notify"
	}
	AddToNotificationQueue( self, showWaveCompleteEvent, priority, PlayQueuedClip )
	local hidePreviousWaveNameEvent = {
		name = "fade_out_wave_number"
	}
	AddToNotificationQueue( self, hidePreviousWaveNameEvent, priority, PlayQueuedClip )
	self:processEvent( {
		name = "notification_complete"
	} )
end

local WaveDock_ShowBonus = function ( self, event )
	self.DockBonus.TitleActive:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	self.DockBonus.TitleFail:setText( Engine.Localize( Engine.GetIString( event.data[2], "CS_LOCALIZED_STRINGS" ) ) )
	self.DockBonus.Icon:setImage( RegisterMaterial( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	self.DockBonus.Icon:setupUIStreamedImage( 4000 )
	self.DockBonus.Desc:setText( Engine.Localize( Engine.GetIString( event.data[4], "CS_LOCALIZED_STRINGS" ) ) )
	self:playClip( "fade_in_bonus" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_HideBonus = function ( self, event )
	self:playClip( "fade_out_bonus" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_BonusFailed = function ( self, event )
	self:playClip( "bonus_failed" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_ShowInfoA = function ( self, event )
	self.DockInfoA:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.DockInfoA:setRGB( r, g, b )
	self:playClip( "fade_in_dock_info_a" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_SetInfoA = function ( self, event )
	self.DockInfoA:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.DockInfoA:setRGB( r, g, b )
	self:processEvent( {
		name = "notification_complete"
	} )
end

local WaveDock_HideInfoA = function ( self, event )
	self:playClip( "fade_out_dock_info_a" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_ShowInfoB = function ( self, event )
	self.DockInfoB:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.DockInfoB:setRGB( r, g, b )
	self:playClip( "fade_in_dock_info_b" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_SetInfoB = function ( self, event )
	self.DockInfoB:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.DockInfoB:setRGB( r, g, b )
	self:processEvent( {
		name = "notification_complete"
	} )
end

local WaveDock_HideInfoB = function ( self, event )
	self:playClip( "fade_out_dock_info_b" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_ShowTimer = function ( self, event )
	self.DockTimer.Clock:setupEndTimer( event.data[1] )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.DockTimer.Clock:setRGB( r, g, b )
	self.DockTimer.Icon0:setImage( RegisterMaterial( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	self.DockTimer.Icon1:setImage( RegisterMaterial( Engine.GetIString( event.data[4], "CS_LOCALIZED_STRINGS" ) ) )
	self.DockTimer.Icon2:setImage( RegisterMaterial( Engine.GetIString( event.data[5], "CS_LOCALIZED_STRINGS" ) ) )
	self.DockTimer.Icon0:setupUIStreamedImage( 4000 )
	self.DockTimer.Icon1:setupUIStreamedImage( 4000 )
	self.DockTimer.Icon2:setupUIStreamedImage( 4000 )
	self:playClip( "fade_in_dock_timer" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_SetTimerColor = function ( self, event )
	local r, g, b, a = Engine.UnpackRgba( event.data[1] )
	self.DockTimer.Clock:setRGB( r, g, b )
	self:processEvent( {
		name = "notification_complete"
	} )
end

local WaveDock_HideTimer = function ( self, event )
	self:playClip( "fade_out_dock_timer" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveDock_Remove_Image = function ( self, event )
	local imageIndex = event.data[1]
	self:playClip( "fade_out_dock_timer_icon_" .. tostring( imageIndex ) )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
end

local WaveStart_Boss = function ( self, event )
	self.card0_Active = true
	self.card1_Active = true
	self.card2_Active = true
	self.TitleWave:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.TitleWave:setRGB( r, g, b )
	self.SubTitleReg:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f44_local0, f44_local1, f44_local2, f44_local3 = Engine.UnpackRgba( event.data[4] )
	a = f44_local3
	self.SubTitleReg:setRGB( f44_local0, f44_local1, f44_local2 )
	self.NotificationCard0.Image:setImage( RegisterMaterial( Engine.GetIString( event.data[5], "CS_LOCALIZED_STRINGS" ) ) )
	self.NotificationCard1.Image:setImage( RegisterMaterial( Engine.GetIString( event.data[6], "CS_LOCALIZED_STRINGS" ) ) )
	self.NotificationCard2.Image:setImage( RegisterMaterial( Engine.GetIString( event.data[7], "CS_LOCALIZED_STRINGS" ) ) )
	self.NotificationCard0.Image:setupUIStreamedImage( 4000 )
	self.NotificationCard1.Image:setupUIStreamedImage( 4000 )
	self.NotificationCard2.Image:setupUIStreamedImage( 4000 )
	self:playClip( "wave_start" )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:playClip( "fade_in_cards" )
		self:registerEventHandler( "clip_over", nil )
		self:registerEventHandler( "clip_over", function ( self, event )
			self:processEvent( {
				name = "notification_complete"
			} )
		end )
	end )
end

local SetCardText = function ( self, event )
	self.NotificationCard0.Text:setText( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) ) )
	local r, g, b, a = Engine.UnpackRgba( event.data[2] )
	self.NotificationCard0.Text:setRGB( r, g, b )
	self.NotificationCard1.Text:setText( Engine.Localize( Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" ) ) )
	local f47_local0, f47_local1, f47_local2, f47_local3 = Engine.UnpackRgba( event.data[4] )
	a = f47_local3
	self.NotificationCard1.Text:setRGB( f47_local0, f47_local1, f47_local2 )
	self.NotificationCard2.Text:setText( Engine.Localize( Engine.GetIString( event.data[5], "CS_LOCALIZED_STRINGS" ) ) )
	f47_local0, f47_local1, f47_local2, f47_local3 = Engine.UnpackRgba( event.data[6] )
	a = f47_local3
	self.NotificationCard2.Text:setRGB( f47_local0, f47_local1, f47_local2 )
	self:processEvent( {
		name = "notification_complete"
	} )
end

local Remove_Card0 = function ( self, event, priority )
	if self.card0_Active then
		self.card0_Active = false
		local fadeEvent = {
			name = "fade_card_0"
		}
		AddToNotificationQueue( self, fadeEvent, priority, PlayQueuedClip )
	end
	self:processEvent( {
		name = "notification_complete"
	} )
end

local Remove_Card1 = function ( self, event, priority )
	if self.card1_Active then
		self.card1_Active = false
		local fadeEvent = {
			name = "fade_card_1"
		}
		AddToNotificationQueue( self, fadeEvent, priority + 1, PlayQueuedClip )
		if self.card0_Active then
			local moveEvent = {}
			if self.card2_Active then
				moveEvent.name = "move_card_0_1"
			else
				moveEvent.name = "move_card_0_2"
			end
			AddToNotificationQueue( self, moveEvent, priority, PlayQueuedClip )
		end
	end
	self:processEvent( {
		name = "notification_complete"
	} )
end

local Remove_Card2 = function ( self, event, priority )
	if self.card2_Active then
		self.card2_Active = false
		local fadeEvent = {
			name = "fade_card_2"
		}
		AddToNotificationQueue( self, fadeEvent, priority + 2, PlayQueuedClip )
		if self.card1_Active then
			local moveEvent_Card1 = {
				name = "move_card_1_2"
			}
			AddToNotificationQueue( self, moveEvent_Card1, priority + 1, PlayQueuedClip )
			if self.card0_Active then
				local moveEvent_Card0 = {
					name = "move_card_0_1"
				}
				AddToNotificationQueue( self, moveEvent_Card0, priority, PlayQueuedClip )
			end
		elseif self.card0_Active then
			local moveEvent = {
				name = "move_card_0_2"
			}
			AddToNotificationQueue( self, moveEvent, priority, PlayQueuedClip )
		end
	end
	self:processEvent( {
		name = "notification_complete"
	} )
end

local ShowMedalNotification = function ( self, event )
	local medalIndex = event.data[1]
	local medalMaterialName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.NotificationPopups.MedalMaterialColumn )
	local medalName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.NotificationPopups.MedalNameColumn )
	self.Medals.Image:registerEventHandler( "streamed_image_ready", function ( element, event )
		self.Medals:playClip( "medal_received" )
		self.Medals:registerEventHandler( "clip_over", function ( element, event )
			self:processEvent( {
				name = "notification_complete"
			} )
		end )
	end )
	self.Medals.Image:registerEventHandler( "streamed_image_timed_out", function ( element, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
	self.Medals.Image:setupUIStreamedImage( 4000 )
	self.Medals.Image:setImage( RegisterMaterial( medalMaterialName ) )
	self.Medals.Text:setText( Engine.Localize( medalName ) )
	self.Medals.SubText:setText( "" )
end

local ShowRankUpNotification = function ( self, event )
	local rankID = event.data[1]
	local prestige = event.data[2]
	local unlockTokensAdded = event.data[3]
	local rankMaterialLowRes = Engine.TableLookup( nil, CoD.rankIconTable, 0, rankID, prestige + 1 )
	local rankMaterialName = rankMaterialLowRes .. "_lrg"
	local rankShortNameColumn = 4
	local rankFullNameColumn = 5
	local newRankTitle = Engine.TableLookup( event.controller, CoD.rankTable, 0, rankID, rankFullNameColumn )
	self.Medals.Image:registerEventHandler( "streamed_image_ready", function ( element, event )
		self.Medals:playClip( "medal_received" )
		self.Medals:registerEventHandler( "clip_over", function ( element, event )
			self:processEvent( {
				name = "notification_complete"
			} )
		end )
	end )
	self.Medals.Image:registerEventHandler( "streamed_image_timed_out", function ( element, event )
		self:processEvent( {
			name = "notification_complete"
		} )
	end )
	self.Medals.Image:setupUIStreamedImage( 4000 )
	self.Medals.Image:setImage( RegisterImage( rankMaterialName ) )
	self.Medals.Text:setText( Engine.Localize( newRankTitle ) )
	self.Medals.SubText:setText( Engine.Localize( "RANK_PROMOTED" ) )
end

local PostLoadFunc = function ( self, controller )
	self.NotificationQueueActive = false
	self.NotificationQueue = {}
	self:registerEventHandler( "pump_notification_queue", PumpNotificationQueue )
	self:registerEventHandler( "notification_complete", OnNotificationComplete )
	self.card0_Active = false
	self.card1_Active = false
	self.card2_Active = false
	self:registerEventHandler( "medal_received", function ( self, event )
		AddToNotificationQueue( self, event, NotificationPriority.Medals, ShowMedalNotification )
		self.NotificationQueueWidget:processEvent( event )
	end )
	self:registerEventHandler( "rank_up", function ( self, event )
		AddToNotificationQueue( self, event, NotificationPriority.RankUp, ShowRankUpNotification )
	end )
	self:registerEventHandler( "show_text_notification", function ( self, event )
		AddToNotificationQueue( self, event, 1, ShowTextNotification )
	end )
	self:registerEventHandler( "show_text_notification_image", function ( self, event )
		AddToNotificationQueue( self, event, 1, ShowTextNotificationWithImage )
	end )
	self:registerEventHandler( "countdown_start", function ( self, event )
		AddToNotificationQueue( self, event, 1, CountdownStart_Old )
	end )
	self:registerEventHandler( "countdown_set", function ( self, event )
		AddToNotificationQueue( self, event, 1, CountdownSet_Old )
	end )
	self:registerEventHandler( "countdown_end", function ( self, event )
		AddToNotificationQueue( self, event, 1, CountdownEnd_Old )
	end )
	self:registerEventHandler( "wave_start", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveStart )
	end )
	self:registerEventHandler( "wave_bonus_show", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_ShowBonus )
	end )
	self:registerEventHandler( "wave_bonus_failed", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_BonusFailed )
	end )
	self:registerEventHandler( "wave_bonus_hide", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_HideBonus )
	end )
	self:registerEventHandler( "wave_start_boss", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveStart_Boss )
	end )
	self:registerEventHandler( "set_boss_text", function ( self, event )
		AddToNotificationQueue( self, event, 1, SetCardText )
	end )
	self:registerEventHandler( "remove_boss", function ( self, event )
		local cardIndex = event.data[1]
		if cardIndex == 0 then
			AddToNotificationQueue( self, event, 1, Remove_Card0 )
		elseif cardIndex == 1 then
			AddToNotificationQueue( self, event, 1, Remove_Card1 )
		elseif cardIndex == 2 then
			AddToNotificationQueue( self, event, 1, Remove_Card2 )
		end
	end )
	self:registerEventHandler( "wave_end", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveEnd )
	end )
	self:registerEventHandler( "show_notification_dock_info_a", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_ShowInfoA )
	end )
	self:registerEventHandler( "set_notification_dock_info_a", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_SetInfoA )
	end )
	self:registerEventHandler( "hide_notification_dock_info_a", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_HideInfoA )
	end )
	self:registerEventHandler( "show_notification_dock_info_b", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_ShowInfoB )
	end )
	self:registerEventHandler( "set_notification_dock_info_b", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_SetInfoB )
	end )
	self:registerEventHandler( "hide_notification_dock_info_b", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_HideInfoB )
	end )
	self:registerEventHandler( "show_notification_dock_timer", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_ShowTimer )
	end )
	self:registerEventHandler( "set_notification_dock_timer_color", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_SetTimerColor )
	end )
	self:registerEventHandler( "hide_notification_dock_timer", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_HideTimer )
	end )
	self:registerEventHandler( "remove_notification_dock_image", function ( self, event )
		AddToNotificationQueue( self, event, 1, WaveDock_Remove_Image )
	end )
	local playerKilledCalloutModel = Engine.CreateModel( Engine.GetModelForController( controller ), "playerKilledCallout" )
	Engine.SetModelValue( playerKilledCalloutModel, false )
	self.PlayerCardObituaryCallout:subscribeToModel( playerKilledCalloutModel, function ( model )
		if Engine.GetModelValue( model ) == true or Engine.GetModelValue( model ) == 1 then
			self.PlayerCardObituaryCallout:playClip( "Bottom" )
			self.PlayerCardObituaryCallout:registerEventHandler( "clip_over", function ( self, event )
				Engine.SetModelValue( playerKilledCalloutModel, false )
			end )
		end
	end )
end

CoD.Notification = InheritFrom( LUI.UIElement )
CoD.Notification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification )
	self.id = "Notification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local TitleImage128 = LUI.UIImage.new()
	TitleImage128:setLeftRight( false, false, -64, 64 )
	TitleImage128:setTopBottom( true, false, 33, 161 )
	TitleImage128:setRGB( 1, 1, 1 )
	TitleImage128:setAlpha( 0 )
	TitleImage128:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleImage128 )
	self.TitleImage128 = TitleImage128
	
	local SubTitleSmall = LUI.UIText.new()
	SubTitleSmall:setLeftRight( false, false, -213.54, 213.54 )
	SubTitleSmall:setTopBottom( true, false, 190.5, 231.5 )
	SubTitleSmall:setRGB( 1, 1, 1 )
	SubTitleSmall:setAlpha( 0 )
	SubTitleSmall:setText( Engine.Localize( "qSUBTITLE" ) )
	SubTitleSmall:setTTF( "fonts/default.ttf" )
	SubTitleSmall:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubTitleSmall:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitleSmall )
	self.SubTitleSmall = SubTitleSmall
	
	local SubTitleReg = LUI.UIText.new()
	SubTitleReg:setLeftRight( false, false, -250, 250 )
	SubTitleReg:setTopBottom( true, false, 192.5, 252.5 )
	SubTitleReg:setRGB( 1, 1, 1 )
	SubTitleReg:setAlpha( 0 )
	SubTitleReg:setText( Engine.Localize( "qSUBTITLE" ) )
	SubTitleReg:setTTF( "fonts/default.ttf" )
	SubTitleReg:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubTitleReg:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubTitleReg )
	self.SubTitleReg = SubTitleReg
	
	local TitleWave = LUI.UITightText.new()
	TitleWave:setLeftRight( false, false, -154, 154 )
	TitleWave:setTopBottom( true, false, 132.5, 192.5 )
	TitleWave:setRGB( 1, 1, 1 )
	TitleWave:setAlpha( 0 )
	TitleWave:setText( Engine.Localize( "qTITLEWAVE" ) )
	TitleWave:setTTF( "fonts/default.ttf" )
	self:addElement( TitleWave )
	self.TitleWave = TitleWave
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, false, -250, 250 )
	Title:setTopBottom( true, false, 132.5, 192.5 )
	Title:setRGB( 1, 1, 1 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "qTITLE" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local NotificationCard0 = CoD.Notification_Card.new( menu, controller )
	NotificationCard0:setLeftRight( false, true, -844, -716 )
	NotificationCard0:setTopBottom( true, false, 97, 225 )
	NotificationCard0:setRGB( 1, 1, 1 )
	NotificationCard0:setAlpha( 0 )
	self:addElement( NotificationCard0 )
	self.NotificationCard0 = NotificationCard0
	
	local NotificationCard1 = CoD.Notification_Card.new( menu, controller )
	NotificationCard1:setLeftRight( false, true, -704, -576 )
	NotificationCard1:setTopBottom( true, false, 97, 225 )
	NotificationCard1:setRGB( 1, 1, 1 )
	NotificationCard1:setAlpha( 0 )
	self:addElement( NotificationCard1 )
	self.NotificationCard1 = NotificationCard1
	
	local NotificationCard2 = CoD.Notification_Card.new( menu, controller )
	NotificationCard2:setLeftRight( false, false, 75, 203 )
	NotificationCard2:setTopBottom( true, false, 97, 225 )
	NotificationCard2:setRGB( 1, 1, 1 )
	NotificationCard2:setAlpha( 0 )
	self:addElement( NotificationCard2 )
	self.NotificationCard2 = NotificationCard2
	
	local DockTimer = CoD.Notification_Timer.new( menu, controller )
	DockTimer:setLeftRight( false, true, -179, -15 )
	DockTimer:setTopBottom( true, false, 134.5, 179.5 )
	DockTimer:setRGB( 1, 1, 1 )
	DockTimer:setAlpha( 0 )
	DockTimer.Icon1:setAlpha( 0 )
	self:addElement( DockTimer )
	self.DockTimer = DockTimer
	
	local DockBonus = CoD.Notification_Bonus.new( menu, controller )
	DockBonus:setLeftRight( false, true, -221, -15 )
	DockBonus:setTopBottom( true, false, 134.5, 179.5 )
	DockBonus:setRGB( 1, 1, 1 )
	DockBonus:setAlpha( 0 )
	DockBonus.Background:setRGB( 0, 0, 0 )
	self:addElement( DockBonus )
	self.DockBonus = DockBonus
	
	local DockInfoB = LUI.UIText.new()
	DockInfoB:setLeftRight( false, true, -171, -15 )
	DockInfoB:setTopBottom( true, false, 109.5, 134.5 )
	DockInfoB:setRGB( 1, 1, 1 )
	DockInfoB:setAlpha( 0 )
	DockInfoB:setText( Engine.Localize( "Extract Unobtanium" ) )
	DockInfoB:setTTF( "fonts/default.ttf" )
	DockInfoB:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	DockInfoB:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DockInfoB )
	self.DockInfoB = DockInfoB
	
	local DockInfoA = LUI.UIText.new()
	DockInfoA:setLeftRight( false, true, -171, -15 )
	DockInfoA:setTopBottom( true, false, 84.5, 109.5 )
	DockInfoA:setRGB( 1, 1, 1 )
	DockInfoA:setAlpha( 0 )
	DockInfoA:setText( Engine.Localize( "5 Enemies Remaining" ) )
	DockInfoA:setTTF( "fonts/default.ttf" )
	DockInfoA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	DockInfoA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DockInfoA )
	self.DockInfoA = DockInfoA
	
	local PreMatchTimer = LUI.UITightText.new()
	PreMatchTimer:setLeftRight( false, false, -67.5, 67.5 )
	PreMatchTimer:setTopBottom( true, false, 299, 359 )
	PreMatchTimer:setRGB( 1, 1, 1 )
	PreMatchTimer:setAlpha( 0 )
	PreMatchTimer:setTTF( "fonts/default.ttf" )
	self:addElement( PreMatchTimer )
	self.PreMatchTimer = PreMatchTimer
	
	local NotificationPerksContainer = CoD.NotificationPerksContainer.new( menu, controller )
	NotificationPerksContainer:setLeftRight( false, true, -567, -38 )
	NotificationPerksContainer:setTopBottom( false, true, -519, -323 )
	NotificationPerksContainer:setRGB( 1, 1, 1 )
	self:addElement( NotificationPerksContainer )
	self.NotificationPerksContainer = NotificationPerksContainer
	
	local PlayerCardCallout = CoD.PlayerCard_Callout.new( menu, controller )
	PlayerCardCallout:setLeftRight( true, false, 22.5, 257.5 )
	PlayerCardCallout:setTopBottom( true, false, 327.5, 386.5 )
	PlayerCardCallout:setRGB( 1, 1, 1 )
	PlayerCardCallout:setYRot( 20 )
	self:addElement( PlayerCardCallout )
	self.PlayerCardCallout = PlayerCardCallout
	
	local PlayerCardObituaryCallout = CoD.PlayerCard_ObituaryCallout.new( menu, controller )
	PlayerCardObituaryCallout:setLeftRight( false, false, -125.5, 125.5 )
	PlayerCardObituaryCallout:setTopBottom( false, true, -73, -14 )
	PlayerCardObituaryCallout:setRGB( 1, 1, 1 )
	self:addElement( PlayerCardObituaryCallout )
	self.PlayerCardObituaryCallout = PlayerCardObituaryCallout
	
	local Medals = CoD.Notification_Medals.new( menu, controller )
	Medals:setLeftRight( false, false, -256, 256 )
	Medals:setTopBottom( true, false, 0, 178 )
	Medals:setRGB( 1, 1, 1 )
	self:addElement( Medals )
	self.Medals = Medals
	
	local OutOfBounds = CoD.OutOfBounds.new( menu, controller )
	OutOfBounds:setLeftRight( false, false, -200, 200 )
	OutOfBounds:setTopBottom( false, false, -42, 37 )
	OutOfBounds:setRGB( 1, 1, 1 )
	OutOfBounds:mergeStateConditions( {
		{
			stateName = "IsOutOfBounds",
			condition = function ( menu, element, event )
				return IsOutOfBounds( controller )
			end
		}
	} )
	OutOfBounds:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.outOfBoundsEndTime" ), function ( model )
		menu:updateElementState( OutOfBounds, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.outOfBoundsEndTime"
		} )
	end )
	self:addElement( OutOfBounds )
	self.OutOfBounds = OutOfBounds
	
	local NotificationHeroWeaponProto = CoD.NotificationHeroWeaponProto.new( menu, controller )
	NotificationHeroWeaponProto:setLeftRight( true, false, 390, 890 )
	NotificationHeroWeaponProto:setTopBottom( true, false, 33, 217.5 )
	NotificationHeroWeaponProto:setRGB( 1, 1, 1 )
	self:addElement( NotificationHeroWeaponProto )
	self.NotificationHeroWeaponProto = NotificationHeroWeaponProto
	
	local NotificationQueueWidget = CoD.NotificationQueue.new( menu, controller )
	NotificationQueueWidget:setLeftRight( true, true, 0, 0 )
	NotificationQueueWidget:setTopBottom( true, true, 0, 0 )
	NotificationQueueWidget:setRGB( 1, 1, 1 )
	self:addElement( NotificationQueueWidget )
	self.NotificationQueueWidget = NotificationQueueWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			wave_start_old = function ()
				self:setupElementClipCounter( 2 )
				local SubTitleRegFrame2 = function ( SubTitleReg, event )
					local SubTitleRegFrame3 = function ( SubTitleReg, event )
						if not event.interrupted then
							SubTitleReg:beginAnimation( "keyframe", 2250, false, false, CoD.TweenType.Linear )
						end
						SubTitleReg:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( SubTitleReg, event )
						else
							SubTitleReg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SubTitleRegFrame3( SubTitleReg, event )
						return 
					else
						SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						SubTitleReg:setAlpha( 1 )
						SubTitleReg:registerEventHandler( "transition_complete_keyframe", SubTitleRegFrame3 )
					end
				end
				
				SubTitleReg:completeAnimation()
				self.SubTitleReg:setAlpha( 0 )
				SubTitleRegFrame2( SubTitleReg, {} )
				local TitleWaveFrame2 = function ( TitleWave, event )
					local TitleWaveFrame3 = function ( TitleWave, event )
						if not event.interrupted then
							TitleWave:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						end
						TitleWave:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TitleWave, event )
						else
							TitleWave:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TitleWaveFrame3( TitleWave, event )
						return 
					else
						TitleWave:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TitleWave:setAlpha( 1 )
						TitleWave:registerEventHandler( "transition_complete_keyframe", TitleWaveFrame3 )
					end
				end
				
				TitleWave:completeAnimation()
				self.TitleWave:setAlpha( 0 )
				TitleWaveFrame2( TitleWave, {} )
			end,
			show_text_notify = function ()
				self:setupElementClipCounter( 2 )
				local SubTitleRegFrame2 = function ( SubTitleReg, event )
					local SubTitleRegFrame3 = function ( SubTitleReg, event )
						local SubTitleRegFrame4 = function ( SubTitleReg, event )
							if not event.interrupted then
								SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							SubTitleReg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( SubTitleReg, event )
							else
								SubTitleReg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SubTitleRegFrame4( SubTitleReg, event )
							return 
						else
							SubTitleReg:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
							SubTitleReg:registerEventHandler( "transition_complete_keyframe", SubTitleRegFrame4 )
						end
					end
					
					if event.interrupted then
						SubTitleRegFrame3( SubTitleReg, event )
						return 
					else
						SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						SubTitleReg:setAlpha( 1 )
						SubTitleReg:registerEventHandler( "transition_complete_keyframe", SubTitleRegFrame3 )
					end
				end
				
				SubTitleReg:completeAnimation()
				self.SubTitleReg:setAlpha( 0 )
				SubTitleRegFrame2( SubTitleReg, {} )
				local TitleFrame2 = function ( Title, event )
					local TitleFrame3 = function ( Title, event )
						local TitleFrame4 = function ( Title, event )
							if not event.interrupted then
								Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							Title:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Title, event )
							else
								Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TitleFrame4( Title, event )
							return 
						else
							Title:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
							Title:registerEventHandler( "transition_complete_keyframe", TitleFrame4 )
						end
					end
					
					if event.interrupted then
						TitleFrame3( Title, event )
						return 
					else
						Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Title:setAlpha( 1 )
						Title:registerEventHandler( "transition_complete_keyframe", TitleFrame3 )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				TitleFrame2( Title, {} )
			end,
			show_text_image_notify = function ()
				self:setupElementClipCounter( 3 )
				local TitleImage128Frame2 = function ( TitleImage128, event )
					local TitleImage128Frame3 = function ( TitleImage128, event )
						local TitleImage128Frame4 = function ( TitleImage128, event )
							local TitleImage128Frame5 = function ( TitleImage128, event )
								if not event.interrupted then
									TitleImage128:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								TitleImage128:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( TitleImage128, event )
								else
									TitleImage128:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TitleImage128Frame5( TitleImage128, event )
								return 
							else
								TitleImage128:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
								TitleImage128:registerEventHandler( "transition_complete_keyframe", TitleImage128Frame5 )
							end
						end
						
						if event.interrupted then
							TitleImage128Frame4( TitleImage128, event )
							return 
						else
							TitleImage128:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							TitleImage128:registerEventHandler( "transition_complete_keyframe", TitleImage128Frame4 )
						end
					end
					
					if event.interrupted then
						TitleImage128Frame3( TitleImage128, event )
						return 
					else
						TitleImage128:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TitleImage128:setAlpha( 1 )
						TitleImage128:registerEventHandler( "transition_complete_keyframe", TitleImage128Frame3 )
					end
				end
				
				TitleImage128:completeAnimation()
				self.TitleImage128:setAlpha( 0 )
				TitleImage128Frame2( TitleImage128, {} )
				local SubTitleSmallFrame2 = function ( SubTitleSmall, event )
					local SubTitleSmallFrame3 = function ( SubTitleSmall, event )
						local SubTitleSmallFrame4 = function ( SubTitleSmall, event )
							if not event.interrupted then
								SubTitleSmall:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							SubTitleSmall:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( SubTitleSmall, event )
							else
								SubTitleSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SubTitleSmallFrame4( SubTitleSmall, event )
							return 
						else
							SubTitleSmall:beginAnimation( "keyframe", 2250, false, false, CoD.TweenType.Linear )
							SubTitleSmall:registerEventHandler( "transition_complete_keyframe", SubTitleSmallFrame4 )
						end
					end
					
					if event.interrupted then
						SubTitleSmallFrame3( SubTitleSmall, event )
						return 
					else
						SubTitleSmall:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						SubTitleSmall:setAlpha( 1 )
						SubTitleSmall:registerEventHandler( "transition_complete_keyframe", SubTitleSmallFrame3 )
					end
				end
				
				SubTitleSmall:completeAnimation()
				self.SubTitleSmall:setAlpha( 0 )
				SubTitleSmallFrame2( SubTitleSmall, {} )
				local TitleFrame2 = function ( Title, event )
					local TitleFrame3 = function ( Title, event )
						local TitleFrame4 = function ( Title, event )
							if not event.interrupted then
								Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							Title:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Title, event )
							else
								Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TitleFrame4( Title, event )
							return 
						else
							Title:beginAnimation( "keyframe", 2250, false, false, CoD.TweenType.Linear )
							Title:registerEventHandler( "transition_complete_keyframe", TitleFrame4 )
						end
					end
					
					if event.interrupted then
						TitleFrame3( Title, event )
						return 
					else
						Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Title:setAlpha( 1 )
						Title:registerEventHandler( "transition_complete_keyframe", TitleFrame3 )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				TitleFrame2( Title, {} )
			end,
			fade_in_text = function ()
				self:setupElementClipCounter( 2 )
				local SubTitleRegFrame2 = function ( SubTitleReg, event )
					if not event.interrupted then
						SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SubTitleReg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SubTitleReg, event )
					else
						SubTitleReg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubTitleReg:completeAnimation()
				self.SubTitleReg:setAlpha( 0 )
				SubTitleRegFrame2( SubTitleReg, {} )
				local TitleFrame2 = function ( Title, event )
					if not event.interrupted then
						Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Title:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Title, event )
					else
						Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				TitleFrame2( Title, {} )
			end,
			fade_out_text = function ()
				self:setupElementClipCounter( 2 )
				local SubTitleRegFrame2 = function ( SubTitleReg, event )
					if not event.interrupted then
						SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SubTitleReg:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SubTitleReg, event )
					else
						SubTitleReg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubTitleReg:completeAnimation()
				self.SubTitleReg:setAlpha( 1 )
				SubTitleRegFrame2( SubTitleReg, {} )
				local TitleFrame2 = function ( Title, event )
					if not event.interrupted then
						Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Title:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Title, event )
					else
						Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				TitleFrame2( Title, {} )
			end,
			fade_card_0 = function ()
				self:setupElementClipCounter( 1 )
				local NotificationCard0Frame2 = function ( NotificationCard0, event )
					if not event.interrupted then
						NotificationCard0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					NotificationCard0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NotificationCard0, event )
					else
						NotificationCard0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationCard0:completeAnimation()
				self.NotificationCard0:setAlpha( 1 )
				NotificationCard0Frame2( NotificationCard0, {} )
			end,
			fade_card_1 = function ()
				self:setupElementClipCounter( 1 )
				local NotificationCard1Frame2 = function ( NotificationCard1, event )
					if not event.interrupted then
						NotificationCard1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					NotificationCard1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NotificationCard1, event )
					else
						NotificationCard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationCard1:completeAnimation()
				self.NotificationCard1:setAlpha( 1 )
				NotificationCard1Frame2( NotificationCard1, {} )
			end,
			fade_card_2 = function ()
				self:setupElementClipCounter( 1 )
				local NotificationCard2Frame2 = function ( NotificationCard2, event )
					if not event.interrupted then
						NotificationCard2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					NotificationCard2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NotificationCard2, event )
					else
						NotificationCard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationCard2:completeAnimation()
				self.NotificationCard2:setAlpha( 1 )
				NotificationCard2Frame2( NotificationCard2, {} )
			end,
			move_card_0_1 = function ()
				self:setupElementClipCounter( 1 )
				local NotificationCard0Frame2 = function ( NotificationCard0, event )
					if not event.interrupted then
						NotificationCard0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					NotificationCard0:setLeftRight( false, true, -143, -79 )
					NotificationCard0:setTopBottom( true, false, 134, 198 )
					if event.interrupted then
						self.clipFinished( NotificationCard0, event )
					else
						NotificationCard0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationCard0:completeAnimation()
				self.NotificationCard0:setLeftRight( false, true, -207, -143 )
				self.NotificationCard0:setTopBottom( true, false, 134, 198 )
				NotificationCard0Frame2( NotificationCard0, {} )
			end,
			move_card_1_2 = function ()
				self:setupElementClipCounter( 1 )
				local NotificationCard1Frame2 = function ( NotificationCard1, event )
					if not event.interrupted then
						NotificationCard1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					NotificationCard1:setLeftRight( false, true, -79, -15 )
					NotificationCard1:setTopBottom( true, false, 134, 198 )
					if event.interrupted then
						self.clipFinished( NotificationCard1, event )
					else
						NotificationCard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationCard1:completeAnimation()
				self.NotificationCard1:setLeftRight( false, true, -143, -79 )
				self.NotificationCard1:setTopBottom( true, false, 134, 198 )
				NotificationCard1Frame2( NotificationCard1, {} )
			end,
			move_card_0_2 = function ()
				self:setupElementClipCounter( 1 )
				local NotificationCard0Frame2 = function ( NotificationCard0, event )
					if not event.interrupted then
						NotificationCard0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					NotificationCard0:setLeftRight( false, true, -79, -15 )
					NotificationCard0:setTopBottom( true, false, 134, 198 )
					if event.interrupted then
						self.clipFinished( NotificationCard0, event )
					else
						NotificationCard0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotificationCard0:completeAnimation()
				self.NotificationCard0:setLeftRight( false, true, -143, -79 )
				self.NotificationCard0:setTopBottom( true, false, 134, 198 )
				NotificationCard0Frame2( NotificationCard0, {} )
			end,
			fade_out_wave_number = function ()
				self:setupElementClipCounter( 1 )
				local TitleWaveFrame2 = function ( TitleWave, event )
					if not event.interrupted then
						TitleWave:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					TitleWave:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TitleWave, event )
					else
						TitleWave:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TitleWave:completeAnimation()
				self.TitleWave:setAlpha( 1 )
				TitleWaveFrame2( TitleWave, {} )
			end,
			fade_in_bonus = function ()
				self:setupElementClipCounter( 3 )
				DockTimer:completeAnimation()
				self.DockTimer:setLeftRight( false, true, -179, -15 )
				self.DockTimer:setTopBottom( true, false, 134.5, 179.5 )
				self.DockTimer:setAlpha( 0 )
				self.clipFinished( DockTimer, {} )
				local DockBonusFrame2 = function ( DockBonus, event )
					if not event.interrupted then
						DockBonus:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.Background:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.Desc:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.TitleActive:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.Icon:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.TitleFail:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockBonus:setAlpha( 1 )
					DockBonus.Background:setRGB( 0, 0, 0 )
					DockBonus.Background:setAlpha( 1 )
					DockBonus.Desc:setAlpha( 1 )
					DockBonus.TitleActive:setAlpha( 1 )
					DockBonus.Icon:setAlpha( 1 )
					DockBonus.TitleFail:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockBonus, event )
					else
						DockBonus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockBonus:completeAnimation()
				DockBonus.Background:completeAnimation()
				DockBonus.Desc:completeAnimation()
				DockBonus.TitleActive:completeAnimation()
				DockBonus.Icon:completeAnimation()
				DockBonus.TitleFail:completeAnimation()
				self.DockBonus:setAlpha( 0 )
				self.DockBonus.Background:setRGB( 0, 0, 0 )
				self.DockBonus.Background:setAlpha( 1 )
				self.DockBonus.Desc:setAlpha( 1 )
				self.DockBonus.TitleActive:setAlpha( 1 )
				self.DockBonus.Icon:setAlpha( 1 )
				self.DockBonus.TitleFail:setAlpha( 0 )
				DockBonusFrame2( DockBonus, {} )
				PreMatchTimer:completeAnimation()
				self.PreMatchTimer:setLeftRight( false, false, -50, 50 )
				self.PreMatchTimer:setTopBottom( true, false, 195, 255 )
				self.PreMatchTimer:setAlpha( 0 )
				self.clipFinished( PreMatchTimer, {} )
			end,
			bonus_failed = function ()
				self:setupElementClipCounter( 1 )
				local DockBonusFrame2 = function ( DockBonus, event )
					local DockBonusFrame3 = function ( DockBonus, event )
						local DockBonusFrame4 = function ( DockBonus, event )
							if not event.interrupted then
								DockBonus:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								DockBonus.Background:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
								DockBonus.Desc:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
								DockBonus.TitleActive:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
								DockBonus.Icon:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
								DockBonus.TitleFail:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
							end
							DockBonus:setAlpha( 0 )
							DockBonus.Background:setRGB( 1, 0, 0 )
							DockBonus.Background:setAlpha( 1 )
							DockBonus.Desc:setAlpha( 1 )
							DockBonus.TitleActive:setAlpha( 0 )
							DockBonus.Icon:setAlpha( 0 )
							DockBonus.TitleFail:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( DockBonus, event )
							else
								DockBonus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DockBonusFrame4( DockBonus, event )
							return 
						else
							DockBonus:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
							DockBonus:registerEventHandler( "transition_complete_keyframe", DockBonusFrame4 )
						end
					end
					
					if event.interrupted then
						DockBonusFrame3( DockBonus, event )
						return 
					else
						DockBonus:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.Background:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.TitleActive:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.Icon:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.TitleFail:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockBonus.Background:setRGB( 1, 0, 0 )
						DockBonus.TitleActive:setAlpha( 0 )
						DockBonus.Icon:setAlpha( 0 )
						DockBonus.TitleFail:setAlpha( 1 )
						DockBonus:registerEventHandler( "transition_complete_keyframe", DockBonusFrame3 )
					end
				end
				
				DockBonus:completeAnimation()
				DockBonus.Background:completeAnimation()
				DockBonus.Desc:completeAnimation()
				DockBonus.TitleActive:completeAnimation()
				DockBonus.Icon:completeAnimation()
				DockBonus.TitleFail:completeAnimation()
				self.DockBonus:setAlpha( 1 )
				self.DockBonus.Background:setRGB( 0, 0, 0 )
				self.DockBonus.Background:setAlpha( 1 )
				self.DockBonus.Desc:setAlpha( 1 )
				self.DockBonus.TitleActive:setAlpha( 1 )
				self.DockBonus.Icon:setAlpha( 1 )
				self.DockBonus.TitleFail:setAlpha( 0 )
				DockBonusFrame2( DockBonus, {} )
			end,
			fade_out_bonus = function ()
				self:setupElementClipCounter( 1 )
				local DockBonusFrame2 = function ( DockBonus, event )
					if not event.interrupted then
						DockBonus:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockBonus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockBonus, event )
					else
						DockBonus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockBonus:completeAnimation()
				self.DockBonus:setAlpha( 1 )
				DockBonusFrame2( DockBonus, {} )
			end,
			fade_in_dock_info_a = function ()
				self:setupElementClipCounter( 1 )
				local DockInfoAFrame2 = function ( DockInfoA, event )
					if not event.interrupted then
						DockInfoA:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockInfoA:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DockInfoA, event )
					else
						DockInfoA:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockInfoA:completeAnimation()
				self.DockInfoA:setAlpha( 0 )
				DockInfoAFrame2( DockInfoA, {} )
			end,
			fade_out_dock_info_a = function ()
				self:setupElementClipCounter( 1 )
				local DockInfoAFrame2 = function ( DockInfoA, event )
					if not event.interrupted then
						DockInfoA:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockInfoA:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockInfoA, event )
					else
						DockInfoA:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockInfoA:completeAnimation()
				self.DockInfoA:setAlpha( 1 )
				DockInfoAFrame2( DockInfoA, {} )
			end,
			fade_in_dock_timer = function ()
				self:setupElementClipCounter( 3 )
				local DockTimerFrame2 = function ( DockTimer, event )
					if not event.interrupted then
						DockTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						DockTimer.Icon0:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockTimer.Icon1:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
						DockTimer.Icon2:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockTimer:setAlpha( 1 )
					DockTimer.Icon0:setAlpha( 1 )
					DockTimer.Icon1:setAlpha( 1 )
					DockTimer.Icon2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DockTimer, event )
					else
						DockTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockTimer:completeAnimation()
				DockTimer.Icon0:completeAnimation()
				DockTimer.Icon1:completeAnimation()
				DockTimer.Icon2:completeAnimation()
				self.DockTimer:setAlpha( 0 )
				self.DockTimer.Icon0:setAlpha( 1 )
				self.DockTimer.Icon1:setAlpha( 1 )
				self.DockTimer.Icon2:setAlpha( 1 )
				DockTimerFrame2( DockTimer, {} )
				DockInfoB:completeAnimation()
				self.DockInfoB:setLeftRight( false, true, -390, -15 )
				self.DockInfoB:setTopBottom( true, false, 109.5, 134.5 )
				self.clipFinished( DockInfoB, {} )
				DockInfoA:completeAnimation()
				self.DockInfoA:setLeftRight( false, true, -390, -15 )
				self.DockInfoA:setTopBottom( true, false, 84.5, 109.5 )
				self.clipFinished( DockInfoA, {} )
			end,
			fade_out_dock_timer = function ()
				self:setupElementClipCounter( 1 )
				local DockTimerFrame2 = function ( DockTimer, event )
					if not event.interrupted then
						DockTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockTimer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockTimer, event )
					else
						DockTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockTimer:completeAnimation()
				self.DockTimer:setAlpha( 1 )
				DockTimerFrame2( DockTimer, {} )
			end,
			fade_out_dock_timer_icon_0 = function ()
				self:setupElementClipCounter( 1 )
				local DockTimerFrame2 = function ( DockTimer, event )
					if not event.interrupted then
						DockTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						DockTimer.Icon0:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockTimer.Icon0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockTimer, event )
					else
						DockTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockTimer:completeAnimation()
				DockTimer.Icon0:completeAnimation()
				self.DockTimer.Icon0:setAlpha( 1 )
				DockTimerFrame2( DockTimer, {} )
			end,
			fade_out_dock_timer_icon_1 = function ()
				self:setupElementClipCounter( 1 )
				local DockTimerFrame2 = function ( DockTimer, event )
					if not event.interrupted then
						DockTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						DockTimer.Icon1:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockTimer.Icon1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockTimer, event )
					else
						DockTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockTimer:completeAnimation()
				DockTimer.Icon1:completeAnimation()
				self.DockTimer.Icon1:setAlpha( 1 )
				DockTimerFrame2( DockTimer, {} )
			end,
			fade_out_dock_timer_icon_2 = function ()
				self:setupElementClipCounter( 1 )
				local DockTimerFrame2 = function ( DockTimer, event )
					if not event.interrupted then
						DockTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						DockTimer.Icon2:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockTimer.Icon2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockTimer, event )
					else
						DockTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockTimer:completeAnimation()
				DockTimer.Icon2:completeAnimation()
				self.DockTimer.Icon2:setAlpha( 1 )
				DockTimerFrame2( DockTimer, {} )
			end,
			fade_in_dock_info_b = function ()
				self:setupElementClipCounter( 1 )
				local DockInfoBFrame2 = function ( DockInfoB, event )
					if not event.interrupted then
						DockInfoB:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockInfoB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DockInfoB, event )
					else
						DockInfoB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockInfoB:completeAnimation()
				self.DockInfoB:setAlpha( 0 )
				DockInfoBFrame2( DockInfoB, {} )
			end,
			fade_out_dock_info_b = function ()
				self:setupElementClipCounter( 1 )
				local DockInfoBFrame2 = function ( DockInfoB, event )
					if not event.interrupted then
						DockInfoB:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DockInfoB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( DockInfoB, event )
					else
						DockInfoB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DockInfoB:completeAnimation()
				self.DockInfoB:setAlpha( 1 )
				DockInfoBFrame2( DockInfoB, {} )
			end,
			fade_in_prematch_timer = function ()
				self:setupElementClipCounter( 2 )
				local SubTitleRegFrame2 = function ( SubTitleReg, event )
					if not event.interrupted then
						SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SubTitleReg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SubTitleReg, event )
					else
						SubTitleReg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubTitleReg:completeAnimation()
				self.SubTitleReg:setAlpha( 0 )
				SubTitleRegFrame2( SubTitleReg, {} )
				local TitleFrame2 = function ( Title, event )
					if not event.interrupted then
						Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Title:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Title, event )
					else
						Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				TitleFrame2( Title, {} )
			end,
			fade_out_prematch_timer = function ()
				self:setupElementClipCounter( 2 )
				local SubTitleRegFrame2 = function ( SubTitleReg, event )
					if not event.interrupted then
						SubTitleReg:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SubTitleReg:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SubTitleReg, event )
					else
						SubTitleReg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubTitleReg:completeAnimation()
				self.SubTitleReg:setAlpha( 1 )
				SubTitleRegFrame2( SubTitleReg, {} )
				local TitleFrame2 = function ( Title, event )
					if not event.interrupted then
						Title:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Title:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Title, event )
					else
						Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				TitleFrame2( Title, {} )
			end
		}
	}
	self.close = function ( self )
		self.NotificationCard0:close()
		self.NotificationCard1:close()
		self.NotificationCard2:close()
		self.DockTimer:close()
		self.DockBonus:close()
		self.NotificationPerksContainer:close()
		self.PlayerCardCallout:close()
		self.PlayerCardObituaryCallout:close()
		self.Medals:close()
		self.OutOfBounds:close()
		self.NotificationHeroWeaponProto:close()
		self.NotificationQueueWidget:close()
		CoD.Notification.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

