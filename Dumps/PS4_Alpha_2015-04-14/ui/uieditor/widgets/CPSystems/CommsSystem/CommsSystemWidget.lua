require( "ui.uieditor.widgets.CPSystems.CommsSystem.EventMessage" )
require( "ui.uieditor.widgets.CPSystems.CommsSystem.CommsHeader" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget" )

local MessagePriority = {
	ProcessMessageOff = 1,
	OffsiteComms = 2,
	EventMessage = 3
}
local AddMessageToQueue = function ( self, event, priority, callback )
	local messageEvent = {
		priority = priority,
		callback = callback,
		event = event
	}
	table.insert( self.messageQueue, messageEvent )
	self:processEvent( {
		name = "pump_message_queue"
	} )
end

local OnMessageAdded = function ( self, event )
	self.messageQueueActive = false
	self:processEvent( {
		name = "pump_message_queue"
	} )
end

local OnMessageComplete = function ( self, event )
	local commsWidget = self
	local element = self.MessageList:findItem( nil, {
		messageIndex = self.messageQueueNextModelIndex - 1
	}, false, nil )
	element:registerEventHandler( "clip_over", function ( self, event )
		self:registerEventHandler( "clip_over", CoD.NullFunction )
		commsWidget.messageQueueNextModelIndex = commsWidget.messageQueueNextModelIndex - 1
		commsWidget:processEvent( {
			name = "process_message_added"
		} )
	end )
	element:playClip( "Off" )
	if self.messageQueueNextModelIndex == 2 and self.currentState == "DefaultState" then
		self.CommsHeader:playClip( "Off" )
	end
end

local OffsiteCommsComplete = function ( self, event )
	self:setState( "DefaultState" )
	self.CommsWidget:setState( "HudStop" )
	local f5_local0 = self:getParent()
	f5_local0.PanelVignetteRight:setState( "HudStop" )
	if self.messageQueueNextModelIndex == 1 and self.currentState == "DefaultState" then
		self.CommsHeader:playClip( "Off" )
	end
end

local UpdateMessageListLayout = function ( self )
	local nextModelIndex = self.messageQueueNextModelIndex
	local clipOverEventAdded = false
	if self.messageQueueNextModelIndex > 1 then
		for i = nextModelIndex, 2, -1 do
			local prevIndex = i - 1
			local nextIndex = i
			local prevElement = self.MessageList:findItem( nil, {
				messageIndex = prevIndex
			}, false, nil )
			local nextElement = self.MessageList:findItem( nil, {
				messageIndex = nextIndex
			}, false, nil )
			local commsWidget = self
			local prevMessageModel = prevElement:getModel()
			local nextMessageModel = nextElement:getModel()
			nextElement:setState( prevElement.currentState )
			nextElement:playClip( "Down" )
			prevElement:playClip( "DefaultClip" )
			if clipOverEventAdded == false then
				nextElement:registerEventHandler( "clip_over", function ( self, event )
					self:registerEventHandler( "clip_over", CoD.NullFunction )
					commsWidget:processEvent( {
						name = "update_list_layout_complete"
					} )
				end )
				clipOverEventAdded = true
			end
			Engine.SetModelValue( Engine.GetModel( nextMessageModel, "messageText" ), Engine.GetModelValue( Engine.GetModel( prevMessageModel, "messageText" ) ) )
			Engine.SetModelValue( Engine.GetModel( nextMessageModel, "icon" ), Engine.GetModelValue( Engine.GetModel( prevMessageModel, "icon" ) ) )
		end
		self.MessageList:updateLayout()
	else
		self:processEvent( {
			name = "update_list_layout_complete"
		} )
	end
end

local PumpMessageQueue = function ( self, event )
	if self.messageQueueActive == false and #self.messageQueue > 0 then
		local priority = -1
		local messageIndex = -1
		for index = 1, #self.messageQueue, 1 do
			if priority < self.messageQueue[index].priority then
				priority = self.messageQueue[index].priority
				messageIndex = index
			end
		end
		if priority < 0 or messageIndex < 1 then
			error( "Incorrect priority " .. priority .. " or messageIndex " .. messageIndex .. " in Comms System. " )
		else
			local index = self.messageQueue[messageIndex]
			self.messageQueueActive = true
			table.remove( self.messageQueue, messageIndex )
			self:registerEventHandler( "update_list_layout_complete", function ( self, event )
				if self.messageQueueNextModelIndex == 1 then
					self.CommsHeader:playClip( "Add" )
				end
				index.callback( self, index.event, priority )
			end )
			if priority == MessagePriority.EventMessage then
				UpdateMessageListLayout( self )
			else
				index.callback( self, index.event, priority )
			end
		end
	end
end

local DisplayOffsiteComms = function ( self, event )
	local controller = event.controller
	local characterName = Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" )
	local nameModel = Engine.GetModel( self.commsWidgetModel, "characterName" )
	local imageModel = Engine.GetModel( self.commsWidgetModel, "characterImage" )
	if characterName == "COOP_KAYNE_RACHEL" then
		Engine.SetModelValue( nameModel, "COOP_KAYNE_RACHEL" )
		Engine.SetModelValue( imageModel, "t7_cp_hud_commswidget_rachel" )
	elseif characterName == "COOP_EGYPTIAN_COMMAND" then
		Engine.SetModelValue( nameModel, "COOP_EGYPTIAN_COMMAND" )
		Engine.SetModelValue( imageModel, "t7_cp_hud_commswidget_egypt" )
	end
	self:registerEventHandler( "clip_over", function ( self, event )
		self:registerEventHandler( "clip_over", CoD.NullFunction )
		self.CommsWidget:setState( "HudStart" )
		local f11_local0 = self:getParent()
		f11_local0.PanelVignetteRight:setState( "HudStart" )
		self:processEvent( {
			name = "process_message_added"
		} )
	end )
	self:setState( "OffsiteCommsActive" )
end

local DisplayEventMessage = function ( self, event )
	local messageText = nil
	if type( event ) == "number" then
		messageText = Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) )
	else
		messageText = Engine.Localize( event.data[1] )
	end
	local icon = "t7_hud_mod_chain_32"
	local controller = event.controller
	local index = 1
	local element = self.MessageList:findItem( nil, {
		messageIndex = index
	}, false, nil )
	if element then
		element:playClip( "Add" )
		local messageModel = element:getModel()
		Engine.SetModelValue( Engine.GetModel( messageModel, "messageText" ), messageText )
		Engine.SetModelValue( Engine.GetModel( messageModel, "icon" ), icon )
		self:addElement( LUI.UITimer.new( 5000, {
			name = "message_off_event",
			controller = controller
		}, true, self ) )
	end
	self.messageQueueNextModelIndex = self.messageQueueNextModelIndex + 1
	self:processEvent( {
		name = "process_message_added"
	} )
end

local PostLoadFunc = function ( self, controller, menu )
	local controllerModel = Engine.GetModelForController( controller )
	local commsModel = Engine.GetModel( controllerModel, "CommsMessages" )
	self:setModel( commsModel )
	self.commsWidgetModel = Engine.GetModel( controllerModel, "CommsWidget" )
	self.CommsWidget:setModel( self.commsWidgetModel )
	self.messageQueue = {}
	self.messageQueueNextModelIndex = 1
	self.messageQueueActive = false
	self:registerEventHandler( "pump_message_queue", PumpMessageQueue )
	self:registerEventHandler( "process_message_added", OnMessageAdded )
	self:registerEventHandler( "offsite_comms_complete", OffsiteCommsComplete )
	self:registerEventHandler( "offsite_comms_message", function ( self, event )
		AddMessageToQueue( self, event, MessagePriority.OffsiteComms, DisplayOffsiteComms )
	end )
	self:registerEventHandler( "comms_event_message", function ( self, event )
		AddMessageToQueue( self, event, MessagePriority.EventMessage, DisplayEventMessage )
	end )
	self:registerEventHandler( "message_off_event", function ( self, event )
		AddMessageToQueue( self, event, MessagePriority.ProcessMessageOff, OnMessageComplete )
	end )
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
	MessageList:setRGB( 1, 1, 1 )
	MessageList:setDataSource( "CommsMessages" )
	MessageList:setWidgetType( CoD.EventMessage )
	MessageList:setVerticalCount( 5 )
	MessageList:setSpacing( 1 )
	self:addElement( MessageList )
	self.MessageList = MessageList
	
	local CommsHeader = CoD.CommsHeader.new( menu, controller )
	CommsHeader:setLeftRight( true, false, 75, 400 )
	CommsHeader:setTopBottom( true, false, 0, 25 )
	CommsHeader:setRGB( 1, 1, 1 )
	CommsHeader:setZoom( 5 )
	self:addElement( CommsHeader )
	self.CommsHeader = CommsHeader
	
	local CommsWidget = CoD.CommsWidget.new( menu, controller )
	CommsWidget:setLeftRight( true, false, -92, 400 )
	CommsWidget:setTopBottom( true, false, -11, 166 )
	CommsWidget:setRGB( 1, 1, 1 )
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
																	MessageList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																end
																MessageList:setLeftRight( true, false, 75, 400 )
																MessageList:setTopBottom( true, false, 30, 242 )
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
																MessageList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																MessageList:setAlpha( 0.71 )
																MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame13 )
															end
														end
														
														if event.interrupted then
															MessageListFrame12( MessageList, event )
															return 
														else
															MessageList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															MessageList:setAlpha( 1 )
															MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame12 )
														end
													end
													
													if event.interrupted then
														MessageListFrame11( MessageList, event )
														return 
													else
														MessageList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
											MessageList:setAlpha( 0.5 )
											MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame8 )
										end
									end
									
									if event.interrupted then
										MessageListFrame7( MessageList, event )
										return 
									else
										MessageList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
								MessageList:beginAnimation( "keyframe", 180, true, true, CoD.TweenType.Linear )
								MessageList:setTopBottom( true, false, 30, 242 )
								MessageList:setAlpha( 1 )
								MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame5 )
							end
						end
						
						if event.interrupted then
							MessageListFrame4( MessageList, event )
							return 
						else
							MessageList:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							MessageList:setTopBottom( true, false, 48.85, 260.85 )
							MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame4 )
						end
					end
					
					if event.interrupted then
						MessageListFrame3( MessageList, event )
						return 
					else
						MessageList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						MessageList:setTopBottom( true, false, 138.69, 350.69 )
						MessageList:setAlpha( 0.6 )
						MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame3 )
					end
				end
				
				MessageList:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				MessageList:setLeftRight( true, false, 75, 400 )
				MessageList:setTopBottom( true, false, 152, 364 )
				MessageList:setAlpha( 1 )
				MessageList:registerEventHandler( "transition_complete_keyframe", MessageListFrame2 )
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
	self.close = function ( self )
		self.MessageList:close()
		self.CommsHeader:close()
		self.CommsWidget:close()
		CoD.CommsSystemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

