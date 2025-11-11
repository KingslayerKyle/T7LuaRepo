require( "ui.uieditor.widgets.GenericPopups.Toast_Container" )

local PreLoadFunc = function ( self, controller )
	local frontendToastModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FrontendToast" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "notify" ), false )
	Engine.CreateModel( frontendToastModel, "state" )
	Engine.CreateModel( frontendToastModel, "kicker" )
	Engine.CreateModel( frontendToastModel, "description" )
	Engine.CreateModel( frontendToastModel, "contentIcon" )
	Engine.CreateModel( frontendToastModel, "functionIcon" )
	Engine.CreateModel( frontendToastModel, "emblemDecal" )
	Engine.CreateModel( frontendToastModel, "backgroundId" )
end

local PostLoadFunc = function ( self, controller, menu )
	self.ToastContainer.playNotification = function ( self, modelValueTable )
		local parent = self:getParent()
		if parent then
			parent:playClip( "Show" )
		end
		self:setState( modelValueTable.state )
		self.currentNotification = modelValueTable
		self.EmblemDecal:setupDrawDecalById( modelValueTable.emblemDecal )
		self.ContentIcon:setImage( RegisterImage( modelValueTable.contentIcon ) )
		self.Description:setText( modelValueTable.description )
		if modelValueTable.backgroundId ~= nil then
			local cardFrame = self.CallingCardsFrameWidget.CardIconFrame
			CoD.ChallengesUtility.SetCallingCardForWidget( cardFrame, modelValueTable.backgroundId, menu.id )
			if cardFrame.framedWidget then
				cardFrame.framedWidget:playClip( "DefaultClip" )
			end
		end
		self.Kicker:setText( modelValueTable.kicker )
		self.FunctionIcon:setImage( RegisterImage( modelValueTable.functionIcon ) )
		self.ToastHeaderWidget.textBox:setText( modelValueTable.description )
	end
	
	self.ToastContainer.appendNotification = function ( self, modelValueTable )
		if modelValueTable == nil then
			return 
		elseif self.currentNotification ~= nil then
			local finalNotification = self.nextNotification
			if finalNotification == nil then
				self.nextNotification = modelValueTable
			end
			while finalNotification and finalNotification.next ~= nil do
				finalNotification = finalNotification.next
			end
			finalNotification.next = modelValueTable
		else
			self:playNotification( modelValueTable )
		end
	end
	
	self.ToastContainer.getModelValueTable = function ( self, model )
		local modelValueTable = {
			state = Engine.GetModelValue( Engine.GetModel( model, "state" ) ),
			kicker = Engine.GetModelValue( Engine.GetModel( model, "kicker" ) ),
			description = Engine.GetModelValue( Engine.GetModel( model, "description" ) ),
			contentIcon = Engine.GetModelValue( Engine.GetModel( model, "contentIcon" ) ),
			emblemDecal = Engine.GetModelValue( Engine.GetModel( model, "emblemDecal" ) ),
			backgroundId = Engine.GetModelValue( Engine.GetModel( model, "backgroundId" ) ),
			functionIcon = Engine.GetModelValue( Engine.GetModel( model, "functionIcon" ) )
		}
		return modelValueTable
	end
	
	self.ToastContainer.currentNotification = nil
	self.ToastContainer.nextNotification = nil
	local frontendToastModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FrontendToast" )
	local notifyModel = Engine.GetModel( frontendToastModel, "notify" )
	self.ToastContainer:subscribeToModel( notifyModel, function ( model )
		if Engine.GetModelValue( model ) == true or Engine.GetModelValue( model ) == 1 then
			Engine.SetModelValue( notifyModel, false )
			local modelValueTable = self.ToastContainer:getModelValueTable( frontendToastModel )
			self.ToastContainer:appendNotification( modelValueTable )
		end
	end )
	self:registerEventHandler( "clip_over", function ( self, event )
		local toastContainer = self.ToastContainer
		toastContainer.currentNotification = nil
		if toastContainer.nextNotification ~= nil then
			toastContainer:playNotification( toastContainer.nextNotification )
			toastContainer.nextNotification = toastContainer.nextNotification.next
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local ToastContainer = CoD.Toast_Container.new( menu, controller )
	ToastContainer:setLeftRight( 0.5, 0.5, -225, 225 )
	ToastContainer:setTopBottom( 1, 1, -141, -54 )
	ToastContainer:setAlpha( 0 )
	ToastContainer.Kicker:setText( Engine.Localize( "MENU_NEW" ) )
	ToastContainer.ToastHeaderWidget.textBox:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	self:addElement( ToastContainer )
	self.ToastContainer = ToastContainer
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( 0, 0, -363, -291 )
	Sound:setTopBottom( 0, 0, 495, 567 )
	self:addElement( Sound )
	self.Sound = Sound
	
	self.resetProperties = function ()
		ToastContainer:completeAnimation()
		Sound:completeAnimation()
		ToastContainer:setLeftRight( 0.5, 0.5, -225, 225 )
		ToastContainer:setTopBottom( 1, 1, -141, -54 )
		ToastContainer:setAlpha( 0 )
		Sound:setPlaySoundDirect( false )
		Sound:playSound( "", controller )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Show = function ()
				self.resetProperties()
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
										ToastContainer:setLeftRight( 0.5, 0.5, -225, 225 )
										ToastContainer:setTopBottom( 1, 1, 8, 95 )
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
										ToastContainer:setTopBottom( 1, 1, -173, -86 )
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
								ToastContainer:setTopBottom( 1, 1, -141, -54 )
								ToastContainer:setAlpha( 1 )
								ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame5 )
							end
						end
						
						if event.interrupted then
							ToastContainerFrame4( ToastContainer, event )
							return 
						else
							ToastContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ToastContainer:setTopBottom( 1, 1, -136, -49 )
							ToastContainer:setAlpha( 0.98 )
							ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame4 )
						end
					end
					
					if event.interrupted then
						ToastContainerFrame3( ToastContainer, event )
						return 
					else
						ToastContainer:beginAnimation( "keyframe", 230, false, true, CoD.TweenType.Linear )
						ToastContainer:setTopBottom( 1, 1, -163, -76 )
						ToastContainer:setAlpha( 0.87 )
						ToastContainer:registerEventHandler( "transition_complete_keyframe", ToastContainerFrame3 )
					end
				end
				
				ToastContainer:completeAnimation()
				self.ToastContainer:setLeftRight( 0.5, 0.5, -225, 225 )
				self.ToastContainer:setTopBottom( 1, 1, 98, 185 )
				self.ToastContainer:setAlpha( 0 )
				ToastContainerFrame2( ToastContainer, {} )
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_popup", controller )
				self.clipFinished( Sound, {} )
			end
		}
	}
	ToastContainer.id = "ToastContainer"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ToastContainer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

