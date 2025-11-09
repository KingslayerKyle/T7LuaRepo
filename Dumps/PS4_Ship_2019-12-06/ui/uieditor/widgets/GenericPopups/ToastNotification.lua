require( "ui.uieditor.widgets.GenericPopups.Toast_Container" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "FrontendToast" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "notify" ), false )
	Engine.CreateModel( f1_local0, "state" )
	Engine.CreateModel( f1_local0, "kicker" )
	Engine.CreateModel( f1_local0, "description" )
	Engine.CreateModel( f1_local0, "contentIcon" )
	Engine.CreateModel( f1_local0, "functionIcon" )
	Engine.CreateModel( f1_local0, "emblemDecal" )
	Engine.CreateModel( f1_local0, "backgroundId" )
end

local PostLoadFunc = function ( self, controller, menu )
	self.ToastContainer.playNotification = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0:getParent()
		if f3_local0 then
			f3_local0:playClip( "Show" )
		end
		f3_arg0:setState( f3_arg1.state )
		f3_arg0.currentNotification = f3_arg1
		f3_arg0.EmblemDecal:setupDrawDecalById( f3_arg1.emblemDecal )
		f3_arg0.ContentIcon:setImage( RegisterImage( f3_arg1.contentIcon ) )
		f3_arg0.Description:setText( f3_arg1.description )
		if f3_arg1.backgroundId ~= nil then
			local f3_local1 = f3_arg0.CallingCardsFrameWidget.CardIconFrame
			CoD.ChallengesUtility.SetCallingCardForWidget( f3_local1, f3_arg1.backgroundId, menu.id )
			if f3_local1.framedWidget then
				f3_local1.framedWidget:playClip( "DefaultClip" )
			end
		end
		f3_arg0.Kicker:setText( f3_arg1.kicker )
		f3_arg0.FunctionIcon:setImage( RegisterImage( f3_arg1.functionIcon ) )
		f3_arg0.ToastHeaderWidget.textBox:setText( f3_arg1.description )
	end
	
	self.ToastContainer.appendNotification = function ( f4_arg0, f4_arg1 )
		if f4_arg1 == nil then
			return 
		elseif f4_arg0.currentNotification ~= nil and f4_arg0.currentNotification.state ~= "NewMusicTrack" and f4_arg1.state ~= "NewMusicTrack" then
			local f4_local0 = f4_arg0.nextNotification
			if f4_local0 == nil then
				f4_arg0.nextNotification = f4_arg1
			end
			while f4_local0 and f4_local0.next ~= nil do
				f4_local0 = f4_local0.next
			end
			f4_local0.next = f4_arg1
		else
			f4_arg0:playNotification( f4_arg1 )
		end
	end
	
	self.ToastContainer.getModelValueTable = function ( f5_arg0, f5_arg1 )
		return {
			state = Engine.GetModelValue( Engine.GetModel( f5_arg1, "state" ) ),
			kicker = Engine.GetModelValue( Engine.GetModel( f5_arg1, "kicker" ) ),
			description = Engine.GetModelValue( Engine.GetModel( f5_arg1, "description" ) ),
			contentIcon = Engine.GetModelValue( Engine.GetModel( f5_arg1, "contentIcon" ) ),
			emblemDecal = Engine.GetModelValue( Engine.GetModel( f5_arg1, "emblemDecal" ) ),
			backgroundId = Engine.GetModelValue( Engine.GetModel( f5_arg1, "backgroundId" ) ),
			functionIcon = Engine.GetModelValue( Engine.GetModel( f5_arg1, "functionIcon" ) )
		}
	end
	
	self.ToastContainer.currentNotification = nil
	self.ToastContainer.nextNotification = nil
	local f2_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "FrontendToast" )
	local f2_local1 = Engine.GetModel( f2_local0, "notify" )
	self.ToastContainer:subscribeToModel( f2_local1, function ( model )
		if Engine.GetModelValue( model ) == true or Engine.GetModelValue( model ) == 1 then
			Engine.SetModelValue( f2_local1, false )
			self.ToastContainer:appendNotification( self.ToastContainer:getModelValueTable( f2_local0 ) )
		end
	end )
	self:registerEventHandler( "clip_over", function ( element, event )
		local f7_local0 = element.ToastContainer
		f7_local0.currentNotification = nil
		if f7_local0.nextNotification ~= nil then
			f7_local0:playNotification( f7_local0.nextNotification )
			f7_local0.nextNotification = f7_local0.nextNotification.next
		end
	end )
end

CoD.ToastNotification = InheritFrom( LUI.UIElement )
CoD.ToastNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ToastNotification )
	self.id = "ToastNotification"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local ToastContainer = CoD.Toast_Container.new( menu, controller )
	ToastContainer:setLeftRight( false, false, -150, 150 )
	ToastContainer:setTopBottom( false, true, 5, 70 )
	ToastContainer:setAlpha( 0 )
	ToastContainer.Kicker:setText( Engine.Localize( "MENU_NEW" ) )
	ToastContainer.ToastHeaderWidget.textBox:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	self:addElement( ToastContainer )
	self.ToastContainer = ToastContainer
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( true, false, -242.11, -194.11 )
	Sound:setTopBottom( true, false, 329.84, 377.84 )
	Sound:setPlaySoundDirect( true )
	self:addElement( Sound )
	self.Sound = Sound
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ToastContainer:completeAnimation()
				self.ToastContainer:setAlpha( 0 )
				self.clipFinished( ToastContainer, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 2 )
				local ToastContainerFrame2 = function ( ToastContainer, event )
					local ToastContainerFrame3 = function ( ToastContainer, event )
						local ToastContainerFrame4 = function ( ToastContainer, event )
							local ToastContainerFrame5 = function ( ToastContainer, event )
								local ToastContainerFrame6 = function ( ToastContainer, event )
									local ToastContainerFrame7 = function ( ToastContainer, event )
										if not event.interrupted then
											ToastContainer:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										ToastContainer:setLeftRight( false, false, -150, 150 )
										ToastContainer:setTopBottom( false, true, 5, 70 )
										ToastContainer:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ToastContainer, event )
										else
											ToastContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ToastContainerFrame7( ToastContainer, event )
										return 
									else
										ToastContainer:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
										ToastContainer:setTopBottom( false, true, -115.15, -50.15 )
										ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame7 )
									end
								end
								
								if event.interrupted then
									ToastContainerFrame6( ToastContainer, event )
									return 
								else
									ToastContainer:beginAnimation( "keyframe", 2809, false, false, CoD.TweenType.Linear )
									ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame6 )
								end
							end
							
							if event.interrupted then
								ToastContainerFrame5( ToastContainer, event )
								return 
							else
								ToastContainer:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
								ToastContainer:setTopBottom( false, true, -94, -29 )
								ToastContainer:setAlpha( 1 )
								ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame5 )
							end
						end
						
						if event.interrupted then
							ToastContainerFrame4( ToastContainer, event )
							return 
						else
							ToastContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ToastContainer:setTopBottom( false, true, -90.69, -25.69 )
							ToastContainer:setAlpha( 0.98 )
							ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame4 )
						end
					end
					
					if event.interrupted then
						ToastContainerFrame3( ToastContainer, event )
						return 
					else
						ToastContainer:beginAnimation( "keyframe", 230, false, true, CoD.TweenType.Linear )
						ToastContainer:setTopBottom( false, true, -108.63, -43.63 )
						ToastContainer:setAlpha( 0.87 )
						ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame3 )
					end
				end
				
				ToastContainer:completeAnimation()
				self.ToastContainer:setLeftRight( false, false, -150, 150 )
				self.ToastContainer:setTopBottom( false, true, 65, 130 )
				self.ToastContainer:setAlpha( 0 )
				ToastContainerFrame2( ToastContainer, {} )
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_popup", controller )
				self.clipFinished( Sound, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ToastContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

