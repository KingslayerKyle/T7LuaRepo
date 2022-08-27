-- 519c2f237271fb28e95e3e2f7e816c25
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.CommsSystem.EventMessage" )
require( "ui.uieditor.widgets.CPSystems.CommsSystem.CommsHeader" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget" )

local f0_local0 = {
	ProcessMessageOff = 1,
	OffsiteComms = 2,
	EventMessage = 3
}
local f0_local1 = 5
local f0_local2 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = nil
	local f1_local1 = f1_arg1.event
	if not f1_local1.data then
		return false
	elseif type( f1_local1.data[1] ) == "number" then
		if #f1_local1.data >= 2 then
			f1_local0 = Engine.Localize( Engine.GetIString( f1_local1.data[1], "CS_LOCALIZED_STRINGS" ), Engine.GetGamertagForClient( f1_local1.controller, f1_local1.data[2] ) )
		else
			f1_local0 = Engine.Localize( Engine.GetIString( f1_local1.data[1], "CS_LOCALIZED_STRINGS" ) )
		end
	else
		f1_local0 = Engine.Localize( f1_local1.data[1] )
	end
	if f1_arg0.MessageList:findItem( {
		messageText = f1_local0
	}, nil, false, false ) then
		return true
	end
	return false
end

local f0_local3 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = {
		priority = f2_arg2,
		callback = f2_arg3,
		event = f2_arg1
	}
	if f2_arg1.data and type( f2_arg1.data[1] ) == "number" and Engine.GetIString( f2_arg1.data[1], "CS_LOCALIZED_STRINGS" ) == "CP_SH_CAIRO_PLAYER_READY" and f0_local2( f2_arg0, f2_local0 ) then
		return 
	else
		table.insert( f2_arg0.messageQueue, f2_local0 )
		f2_arg0:processEvent( {
			name = "pump_message_queue"
		} )
	end
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	f3_arg0.messageQueueActive = false
	f3_arg0:processEvent( {
		name = "pump_message_queue"
	} )
end

local f0_local5 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0
	local f4_local1 = f4_arg0.MessageList:findItem( nil, {
		messageIndex = f4_arg0.messageQueueNextModelIndex - 1
	}, false, false )
	f4_local1:registerEventHandler( "clip_over", function ( element, event )
		element:registerEventHandler( "clip_over", CoD.NullFunction )
		local f5_local0 = Engine.GetModel( f4_local1:getModel(), "messageText" )
		if f5_local0 then
			Engine.SetModelValue( f5_local0, "" )
		end
		f4_local0.messageQueueNextModelIndex = f4_local0.messageQueueNextModelIndex - 1
		f4_local0:processEvent( {
			name = "process_message_added"
		} )
	end )
	f4_local1:playClip( "Off" )
	if f4_arg0.messageQueueNextModelIndex == 2 and f4_arg0.currentState == "DefaultState" then
		f4_arg0.CommsHeader:playClip( "Off" )
	end
end

local f0_local6 = function ( f6_arg0 )
	f6_arg0:setState( "DefaultState" )
	f6_arg0.CommsWidget:setState( "HudStop" )
	if f6_arg0:getParent() then
		local f6_local0 = f6_arg0:getParent()
		if f6_local0.PanelVignetteRight then
			f6_local0 = f6_arg0:getParent()
			f6_local0.PanelVignetteRight:setState( "HudStop" )
		end
	end
	if f6_arg0.messageQueueNextModelIndex == 1 and f6_arg0.currentState == "DefaultState" then
		f6_arg0.CommsHeader:playClip( "Off" )
	end
end

local f0_local7 = function ( f7_arg0 )
	local f7_local0 = f7_arg0.messageQueueNextModelIndex
	local f7_local1 = false
	if f7_arg0.messageQueueNextModelIndex > 1 then
		for f7_local2 = f7_local0, 2, -1 do
			local f7_local5 = f7_local2 - 1
			local f7_local6 = f7_local2
			local f7_local7 = f7_arg0.MessageList:findItem( nil, {
				messageIndex = f7_local5
			}, false, false )
			local f7_local8 = f7_arg0.MessageList:findItem( nil, {
				messageIndex = f7_local6
			}, false, false )
			local f7_local9 = f7_arg0
			local f7_local10 = f7_local7:getModel()
			local f7_local11 = f7_local8:getModel()
			f7_local8:setState( f7_local7.currentState )
			f7_local8:playClip( "Down" )
			f7_local7:playClip( "DefaultClip" )
			if f7_local1 == false then
				f7_local8:registerEventHandler( "clip_over", function ( element, event )
					element:registerEventHandler( "clip_over", CoD.NullFunction )
					f7_local9:processEvent( {
						name = "update_list_layout_complete"
					} )
				end )
				f7_local1 = true
			end
			Engine.SetModelValue( Engine.GetModel( f7_local11, "messageText" ), Engine.GetModelValue( Engine.GetModel( f7_local10, "messageText" ) ) )
			Engine.SetModelValue( Engine.GetModel( f7_local11, "icon" ), Engine.GetModelValue( Engine.GetModel( f7_local10, "icon" ) ) )
		end
		f7_arg0.MessageList:updateLayout()
	else
		f7_arg0:processEvent( {
			name = "update_list_layout_complete"
		} )
	end
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	if f9_arg0.messageQueueActive == false and #f9_arg0.messageQueue > 0 then
		local f9_local0 = f0_local1 < f9_arg0.messageQueueNextModelIndex
		local f9_local1 = 10
		local f9_local2 = -1
		for f9_local3 = 1, #f9_arg0.messageQueue, 1 do
			if f9_arg0.messageQueue[f9_local3].priority < f9_local1 then
				f9_local1 = f9_arg0.messageQueue[f9_local3].priority
				f9_local2 = f9_local3
			end
		end
		if f9_local0 and f9_local1 ~= f0_local0.ProcessMessageOff then
			if f9_arg0.check_message_queue_timer_exists ~= true then
				f9_arg0:addElement( LUI.UITimer.new( 1000, {
					name = "pump_message_queue_full"
				}, true, f9_arg0 ) )
				f9_arg0.check_message_queue_timer_exists = true
			end
			return 
		elseif f9_local1 == 10 or f9_local2 < 1 then
			error( "Incorrect priority " .. f9_local1 .. " or messageIndex " .. f9_local2 .. " in Comms System. " )
		else
			local f9_local3 = f9_arg0.messageQueue[f9_local2]
			f9_arg0.messageQueueActive = true
			table.remove( f9_arg0.messageQueue, f9_local2 )
			if f9_local1 == f0_local0.EventMessage then
				f9_arg0:registerEventHandler( "update_list_layout_complete", function ( element, event )
					if element.messageQueueNextModelIndex == 1 then
						element.CommsHeader:playClip( "Add" )
					end
					f9_local3.callback( element, f9_local3.event, f9_local1 )
				end )
				f0_local7( f9_arg0 )
			else
				f9_arg0:registerEventHandler( "update_list_layout_complete", CoD.NullFunction )
				f9_local3.callback( f9_arg0, f9_local3.event, f9_local1 )
			end
		end
	end
end

local f0_local9 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg1.controller
	local f11_local1 = Engine.GetIString( f11_arg1.data[1], "CS_LOCALIZED_STRINGS" )
	local f11_local2 = ""
	if f11_local1 == "CPUI_DIAZ_SEBASTIAN" then
		f11_local2 = "t7_cp_hud_commswidget_diaz"
	elseif f11_local1 == "CPUI_EGYPTIAN_ARMY1" then
		f11_local2 = "t7_cp_hud_commswidget_egasoldier1"
	elseif f11_local1 == "CPUI_EGYPTIAN_COMMAND" then
		f11_local2 = "t7_cp_hud_commswidget_egypt"
	elseif f11_local1 == "CPUI_GOH_XIULAN" then
		f11_local2 = "t7_cp_hud_commswidget_gohxiulan"
	elseif f11_local1 == "CPUI_HENDRICKS_JACOB" then
		f11_local2 = "t7_cp_hud_commswidget_hendricks"
	elseif f11_local1 == "CPUI_KHALIL_ZEYAD" then
		f11_local2 = "t7_cp_hud_commswidget_khalil"
	elseif f11_local1 == "CPUI_MARETTI_PETER" then
		f11_local2 = "t7_cp_hud_commswidget_maretti"
	elseif f11_local1 == "CPUI_KANE_RACHEL" then
		if f11_arg0.isMapSingLevel then
			f11_local2 = "t7_cp_hud_commswidget_rachel_sing"
		else
			f11_local2 = "t7_cp_hud_commswidget_rachel"
		end
	elseif f11_local1 == "CPUI_HALL_SARAH" then
		f11_local2 = "t7_cp_hud_commswidget_sarah"
	elseif f11_local1 == "CPUI_TAYLOR_JOHN" then
		f11_local2 = "t7_cp_hud_commswidget_taylor"
	elseif f11_local1 == "CPUI_VTOL_PILOT" then
		f11_local2 = "t7_cp_hud_commswidget_vtolpilot"
	end
	if f11_local2 == "" then
		return 
	end
	Engine.SetModelValue( Engine.GetModel( f11_arg0.commsWidgetModel, "characterName" ), f11_local1 )
	Engine.SetModelValue( Engine.GetModel( f11_arg0.commsWidgetModel, "characterImage" ), f11_local2 )
	f11_arg0:setState( "OffsiteCommsActive" )
	f11_arg0.CommsHeader:playClip( "Add" )
	f11_arg0.CommsWidget:setState( "HudStart" )
	if f11_arg0:getParent() then
		local f11_local3 = f11_arg0:getParent()
		if f11_local3.PanelVignetteRight then
			f11_local3 = f11_arg0:getParent()
			f11_local3.PanelVignetteRight:setState( "HudStart" )
		end
	end
	f11_arg0:registerEventHandler( "clip_over", function ( element, event )
		element:registerEventHandler( "clip_over", CoD.NullFunction )
		element:processEvent( {
			name = "process_message_added"
		} )
	end )
end

local f0_local10 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = nil
	if type( f13_arg1.data[1] ) == "number" then
		if #f13_arg1.data >= 2 then
			f13_local0 = Engine.Localize( Engine.GetIString( f13_arg1.data[1], "CS_LOCALIZED_STRINGS" ), Engine.GetGamertagForClient( f13_arg1.controller, f13_arg1.data[2] ) )
		else
			f13_local0 = Engine.Localize( Engine.GetIString( f13_arg1.data[1], "CS_LOCALIZED_STRINGS" ) )
		end
	else
		f13_local0 = Engine.Localize( f13_arg1.data[1] )
	end
	local f13_local1 = "t7_hud_mod_chain_32"
	local f13_local2 = f13_arg1.controller
	local f13_local3 = f13_arg0.MessageList:findItem( nil, {
		messageIndex = 1
	}, false, false )
	if f13_local3 then
		f13_local3:playClip( "Add" )
		local f13_local4 = f13_local3:getModel()
		Engine.SetModelValue( Engine.GetModel( f13_local4, "messageText" ), f13_local0 )
		Engine.SetModelValue( Engine.GetModel( f13_local4, "icon" ), f13_local1 )
		f13_arg0.MessageList:updateLayout()
		f13_arg0:addElement( LUI.UITimer.new( 5000, {
			name = "message_off_event",
			controller = f13_local2
		}, true, f13_arg0 ) )
	end
	f13_arg0.messageQueueNextModelIndex = f13_arg0.messageQueueNextModelIndex + 1
	f13_arg0:processEvent( {
		name = "process_message_added"
	} )
end

local PostLoadFunc = function ( self, controller, menu )
	local f14_local0 = Engine.GetModelForController( controller )
	self:setModel( Engine.GetModel( f14_local0, "CommsMessages" ) )
	self.commsWidgetModel = Engine.GetModel( f14_local0, "CommsWidget" )
	self.CommsWidget:setModel( self.commsWidgetModel )
	self.messageQueue = {}
	self.messageQueueNextModelIndex = 1
	self.messageQueueActive = false
	self:registerEventHandler( "pump_message_queue", f0_local8 )
	self:registerEventHandler( "process_message_added", f0_local4 )
	self:registerEventHandler( "message_off_event", function ( element, event )
		f0_local3( element, event, f0_local0.ProcessMessageOff, f0_local5 )
	end )
	self:registerEventHandler( "pump_message_queue_full", function ( element, event )
		element.check_message_queue_timer_exists = false
		f0_local8( element, event )
	end )
	self.AddCommsEventMessage = function ( f17_arg0, f17_arg1 )
		f0_local3( f17_arg0, f17_arg1, f0_local0.EventMessage, f0_local10 )
	end
	
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "offsite_comms_complete" then
			f0_local6( self )
		elseif modelValue == "offsite_comms_message" then
			f0_local3( self, {
				controller = controller,
				data = CoD.GetScriptNotifyData( model )
			}, f0_local0.OffsiteComms, f0_local9 )
		elseif modelValue == "comms_event_message" then
			f0_local3( self, {
				controller = controller,
				data = CoD.GetScriptNotifyData( model )
			}, f0_local0.EventMessage, f0_local10 )
		end
	end )
	self.isMapSingLevel = string.find( Dvar.ui_mapname:get(), "sing" ) ~= nil
end

CoD.CommsSystemWidget = InheritFrom( LUI.UIElement )
CoD.CommsSystemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsSystemWidget )
	self.id = "CommsSystemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 500 )
	self.anyChildUsesUpdateState = true
	
	local MessageList = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	MessageList:makeFocusable()
	MessageList:setLeftRight( true, false, 75, 400 )
	MessageList:setTopBottom( true, false, 25, 139 )
	MessageList:setDataSource( "CommsMessages" )
	MessageList:setWidgetType( CoD.EventMessage )
	MessageList:setVerticalCount( 5 )
	MessageList:setSpacing( 1 )
	self:addElement( MessageList )
	self.MessageList = MessageList
	
	local CommsHeader = CoD.CommsHeader.new( menu, controller )
	CommsHeader:setLeftRight( true, false, 75, 400 )
	CommsHeader:setTopBottom( true, false, 0, 25 )
	CommsHeader:setZoom( 5 )
	self:addElement( CommsHeader )
	self.CommsHeader = CommsHeader
	
	local CommsWidget = CoD.CommsWidget.new( menu, controller )
	CommsWidget:setLeftRight( true, false, -92, 400 )
	CommsWidget:setTopBottom( true, false, -11, 166 )
	CommsWidget:subscribeToGlobalModel( controller, "CommsWidget", nil, function ( model )
		CommsWidget:setModel( model, controller )
	end )
	self:addElement( CommsWidget )
	self.CommsWidget = CommsWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				MessageList:completeAnimation()
				self.MessageList:setLeftRight( true, false, 75, 400 )
				self.MessageList:setTopBottom( true, false, 30, 242 )
				self.MessageList:setAlpha( 1 )
				self.clipFinished( MessageList, {} )
				CommsWidget:completeAnimation()
				self.CommsWidget:setAlpha( 0 )
				self.clipFinished( CommsWidget, {} )
			end,
			OffsiteCommsActive = function ()
				self:setupElementClipCounter( 2 )
				local MessageListFrame2 = function ( MessageList, event )
					local MessageListFrame3 = function ( MessageList, event )
						local MessageListFrame4 = function ( MessageList, event )
							local MessageListFrame5 = function ( MessageList, event )
								local MessageListFrame6 = function ( MessageList, event )
									local MessageListFrame7 = function ( MessageList, event )
										local MessageListFrame8 = function ( MessageList, event )
											local MessageListFrame9 = function ( MessageList, event )
												local MessageListFrame10 = function ( MessageList, event )
													local MessageListFrame11 = function ( MessageList, event )
														local MessageListFrame12 = function ( MessageList, event )
															local MessageListFrame13 = function ( MessageList, event )
																if not event.interrupted then
																	MessageList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																end
																MessageList:setLeftRight( true, false, 75, 400 )
																MessageList:setTopBottom( true, false, 152, 364 )
																MessageList:setAlpha( 1 )
																if event.interrupted then
																	self.clipFinished( MessageList, event )
																else
																	MessageList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																MessageListFrame13( MessageList, event )
																return 
															else
																MessageList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																MessageList:setAlpha( 0.61 )
																MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame13 )
															end
														end
														
														if event.interrupted then
															MessageListFrame12( MessageList, event )
															return 
														else
															MessageList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															MessageList:setAlpha( 1 )
															MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame12 )
														end
													end
													
													if event.interrupted then
														MessageListFrame11( MessageList, event )
														return 
													else
														MessageList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame11 )
													end
												end
												
												if event.interrupted then
													MessageListFrame10( MessageList, event )
													return 
												else
													MessageList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													MessageList:setAlpha( 0 )
													MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame10 )
												end
											end
											
											if event.interrupted then
												MessageListFrame9( MessageList, event )
												return 
											else
												MessageList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame9 )
											end
										end
										
										if event.interrupted then
											MessageListFrame8( MessageList, event )
											return 
										else
											MessageList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MessageList:setAlpha( 0.6 )
											MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame8 )
										end
									end
									
									if event.interrupted then
										MessageListFrame7( MessageList, event )
										return 
									else
										MessageList:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame7 )
									end
								end
								
								if event.interrupted then
									MessageListFrame6( MessageList, event )
									return 
								else
									MessageList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MessageList:setAlpha( 0 )
									MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame6 )
								end
							end
							
							if event.interrupted then
								MessageListFrame5( MessageList, event )
								return 
							else
								MessageList:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Linear )
								MessageList:setTopBottom( true, false, 152, 364 )
								MessageList:setAlpha( 1 )
								MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame5 )
							end
						end
						
						if event.interrupted then
							MessageListFrame4( MessageList, event )
							return 
						else
							MessageList:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							MessageList:setTopBottom( true, false, 130.56, 342.56 )
							MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame4 )
						end
					end
					
					if event.interrupted then
						MessageListFrame3( MessageList, event )
						return 
					else
						MessageList:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						MessageList:setTopBottom( true, false, 49.36, 261.36 )
						MessageList:setAlpha( 0.6 )
						MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame3 )
					end
				end
				
				MessageList:completeAnimation()
				self.MessageList:setLeftRight( true, false, 75, 400 )
				self.MessageList:setTopBottom( true, false, 30, 242 )
				self.MessageList:setAlpha( 1 )
				MessageListFrame2( MessageList, {} )
				local CommsWidgetFrame2 = function ( CommsWidget, event )
					local CommsWidgetFrame3 = function ( CommsWidget, event )
						if not event.interrupted then
							CommsWidget:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						end
						CommsWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CommsWidget, event )
						else
							CommsWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CommsWidgetFrame3( CommsWidget, event )
						return 
					else
						CommsWidget:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						CommsWidget:setAlpha( 1 )
						CommsWidget:registerEventHandler( "transition_complete_keyframe", CommsWidgetFrame3 )
					end
				end
				
				CommsWidget:completeAnimation()
				self.CommsWidget:setAlpha( 0 )
				CommsWidgetFrame2( CommsWidget, {} )
			end
		},
		OffsiteCommsActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				MessageList:completeAnimation()
				self.MessageList:setLeftRight( true, false, 75, 400 )
				self.MessageList:setTopBottom( true, false, 152, 364 )
				self.MessageList:setAlpha( 1 )
				self.clipFinished( MessageList, {} )
				CommsWidget:completeAnimation()
				self.CommsWidget:setAlpha( 1 )
				self.clipFinished( CommsWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local f38_local0 = function ( f39_arg0, f39_arg1 )
					local f39_local0 = function ( f40_arg0, f40_arg1 )
						local f40_local0 = function ( f41_arg0, f41_arg1 )
							local f41_local0 = function ( f42_arg0, f42_arg1 )
								local f42_local0 = function ( f43_arg0, f43_arg1 )
									local f43_local0 = function ( f44_arg0, f44_arg1 )
										local f44_local0 = function ( f45_arg0, f45_arg1 )
											local f45_local0 = function ( f46_arg0, f46_arg1 )
												local f46_local0 = function ( f47_arg0, f47_arg1 )
													local f47_local0 = function ( f48_arg0, f48_arg1 )
														local f48_local0 = function ( f49_arg0, f49_arg1 )
															local f49_local0 = function ( f50_arg0, f50_arg1 )
																if not f50_arg1.interrupted then
																	f50_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																end
																f50_arg0:setLeftRight( true, false, 75, 400 )
																f50_arg0:setTopBottom( true, false, 30, 242 )
																f50_arg0:setAlpha( 1 )
																if f50_arg1.interrupted then
																	self.clipFinished( f50_arg0, f50_arg1 )
																else
																	f50_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if f49_arg1.interrupted then
																f49_local0( f49_arg0, f49_arg1 )
																return 
															else
																f49_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f49_arg0:setAlpha( 0.71 )
																f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
															end
														end
														
														if f48_arg1.interrupted then
															f48_local0( f48_arg0, f48_arg1 )
															return 
														else
															f48_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															f48_arg0:setAlpha( 1 )
															f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
														end
													end
													
													if f47_arg1.interrupted then
														f47_local0( f47_arg0, f47_arg1 )
														return 
													else
														f47_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
													end
												end
												
												if f46_arg1.interrupted then
													f46_local0( f46_arg0, f46_arg1 )
													return 
												else
													f46_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f46_arg0:setAlpha( 0 )
													f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
												end
											end
											
											if f45_arg1.interrupted then
												f45_local0( f45_arg0, f45_arg1 )
												return 
											else
												f45_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
											end
										end
										
										if f44_arg1.interrupted then
											f44_local0( f44_arg0, f44_arg1 )
											return 
										else
											f44_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f44_arg0:setAlpha( 0.5 )
											f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
										end
									end
									
									if f43_arg1.interrupted then
										f43_local0( f43_arg0, f43_arg1 )
										return 
									else
										f43_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
									end
								end
								
								if f42_arg1.interrupted then
									f42_local0( f42_arg0, f42_arg1 )
									return 
								else
									f42_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f42_arg0:setAlpha( 0 )
									f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
								end
							end
							
							if f41_arg1.interrupted then
								f41_local0( f41_arg0, f41_arg1 )
								return 
							else
								f41_arg0:beginAnimation( "keyframe", 180, true, true, CoD.TweenType.Linear )
								f41_arg0:setTopBottom( true, false, 30, 242 )
								f41_arg0:setAlpha( 1 )
								f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
							end
						end
						
						if f40_arg1.interrupted then
							f40_local0( f40_arg0, f40_arg1 )
							return 
						else
							f40_arg0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							f40_arg0:setTopBottom( true, false, 48.85, 260.85 )
							f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
						end
					end
					
					if f39_arg1.interrupted then
						f39_local0( f39_arg0, f39_arg1 )
						return 
					else
						f39_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						f39_arg0:setTopBottom( true, false, 138.69, 350.69 )
						f39_arg0:setAlpha( 0.6 )
						f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
					end
				end
				
				MessageList:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				MessageList:setLeftRight( true, false, 75, 400 )
				MessageList:setTopBottom( true, false, 152, 364 )
				MessageList:setAlpha( 1 )
				MessageList:registerEventHandler( "transition_complete_keyframe", f38_local0 )
				local CommsWidgetFrame2 = function ( CommsWidget, event )
					local CommsWidgetFrame3 = function ( CommsWidget, event )
						if not event.interrupted then
							CommsWidget:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						CommsWidget:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CommsWidget, event )
						else
							CommsWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CommsWidgetFrame3( CommsWidget, event )
						return 
					else
						CommsWidget:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						CommsWidget:registerEventHandler( "transition_complete_keyframe", CommsWidgetFrame3 )
					end
				end
				
				CommsWidget:completeAnimation()
				self.CommsWidget:setAlpha( 1 )
				CommsWidgetFrame2( CommsWidget, {} )
			end
		}
	}
	MessageList.id = "MessageList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MessageList:close()
		element.CommsHeader:close()
		element.CommsWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

