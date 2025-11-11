require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubbleWidget" )

local PCSpecific = function ( self, controller, menu )
	self:registerEventHandler( "input_source_changed", function ( element, event )
		if event.source == 0 then
			if self.currentState == "Overview_KeyboardAndMouse" then
				self:setState( "Overview_Gamepad" )
			elseif self.currentState == "ChangedCharacter_KeyboardAndMouse" then
				self:setState( "ChangedCharacter_Gamepad" )
			elseif self.currentState == "ChooseItem_KeyboardAndMouse" then
				self:setState( "ChooseItem_Gamepad" )
			end
		elseif self.currentState == "Overview_Gamepad" then
			self:setState( "Overview_KeyboardAndMouse" )
		elseif self.currentState == "ChangedCharacter_Gamepad" then
			self:setState( "ChangedCharacter_KeyboardAndMouse" )
		elseif self.currentState == "ChooseItem_Gamepad" then
			self:setState( "ChooseItem_KeyboardAndMouse" )
		end
	end )
	self:registerEventHandler( "mouse_left_click", function ( element, event )
		local retVal = nil
		if self.currentState == "ChangedCharacter_KeyboardAndMouse" then
			SetState( self, "ChooseItem_KeyboardAndMouse" )
			SetGlobalModelValueFalse( "heroSelectionTutorial" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
end

local PreLoadFunc = function ( self, controller )
	local isFirstTime = IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	if isFirstTime and not CharacterDraftActive() then
		FirstTimeSetup_SetOverview( controller )
	else
		FirstTimeSetup_SetNone( controller )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		PCSpecific( self, controller, menu )
	end
end

CoD.ChooseCharacter_HelpBubble = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble )
	self.id = "ChooseCharacter_HelpBubble"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 225 )
	self:setTopBottom( 0, 0, 0, 750 )
	self.anyChildUsesUpdateState = true
	
	local Darken = LUI.UIImage.new()
	Darken:setLeftRight( 0, 0, -477, 2658 )
	Darken:setTopBottom( 0, 0, -303, 1401 )
	Darken:setRGB( 0, 0, 0 )
	Darken:setAlpha( 0 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local UnlockSound = LUI.UIElement.new()
	UnlockSound:setLeftRight( 0, 0, -98, -26 )
	UnlockSound:setTopBottom( 0, 0, 332, 404 )
	self:addElement( UnlockSound )
	self.UnlockSound = UnlockSound
	
	local ChooseCharacterHelpBubbleWidget = CoD.ChooseCharacter_HelpBubbleWidget.new( menu, controller )
	ChooseCharacterHelpBubbleWidget:setLeftRight( 0, 0, -0.5, 224.5 )
	ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 0, 243 )
	ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
	self:addElement( ChooseCharacterHelpBubbleWidget )
	self.ChooseCharacterHelpBubbleWidget = ChooseCharacterHelpBubbleWidget
	
	self.resetProperties = function ()
		ChooseCharacterHelpBubbleWidget:completeAnimation()
		Darken:completeAnimation()
		ChooseCharacterHelpBubbleWidget:setLeftRight( 0, 0, -0.5, 224.5 )
		ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 0, 243 )
		ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
		ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
		Darken:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ChooseCharacterHelpBubbleWidget:completeAnimation()
				self.ChooseCharacterHelpBubbleWidget:setAlpha( 0 )
				self.clipFinished( ChooseCharacterHelpBubbleWidget, {} )
			end
		},
		Overview = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Darken:completeAnimation()
				self.Darken:setAlpha( 0.5 )
				self.clipFinished( Darken, {} )
			end,
			ChangedCharacter = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local DarkenFrame2 = function ( Darken, event )
					if not event.interrupted then
						Darken:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Darken:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Darken, event )
					else
						Darken:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Darken:completeAnimation()
				self.Darken:setAlpha( 0.5 )
				DarkenFrame2( Darken, {} )
				local ChooseCharacterHelpBubbleWidgetFrame2 = function ( ChooseCharacterHelpBubbleWidget, event )
					local ChooseCharacterHelpBubbleWidgetFrame3 = function ( ChooseCharacterHelpBubbleWidget, event )
						local ChooseCharacterHelpBubbleWidgetFrame4 = function ( ChooseCharacterHelpBubbleWidget, event )
							local ChooseCharacterHelpBubbleWidgetFrame5 = function ( ChooseCharacterHelpBubbleWidget, event )
								local ChooseCharacterHelpBubbleWidgetFrame6 = function ( ChooseCharacterHelpBubbleWidget, event )
									local ChooseCharacterHelpBubbleWidgetFrame7 = function ( ChooseCharacterHelpBubbleWidget, event )
										local ChooseCharacterHelpBubbleWidgetFrame8 = function ( ChooseCharacterHelpBubbleWidget, event )
											local ChooseCharacterHelpBubbleWidgetFrame9 = function ( ChooseCharacterHelpBubbleWidget, event )
												local ChooseCharacterHelpBubbleWidgetFrame10 = function ( ChooseCharacterHelpBubbleWidget, event )
													local ChooseCharacterHelpBubbleWidgetFrame11 = function ( ChooseCharacterHelpBubbleWidget, event )
														local ChooseCharacterHelpBubbleWidgetFrame12 = function ( ChooseCharacterHelpBubbleWidget, event )
															local ChooseCharacterHelpBubbleWidgetFrame13 = function ( ChooseCharacterHelpBubbleWidget, event )
																if not event.interrupted then
																	ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																	ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																end
																ChooseCharacterHelpBubbleWidget:setLeftRight( 0, 0, -0.5, 224.5 )
																ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 357, 600 )
																ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
																ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_LOADOUT_DESC" ) )
																if event.interrupted then
																	self.clipFinished( ChooseCharacterHelpBubbleWidget, event )
																else
																	ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																ChooseCharacterHelpBubbleWidgetFrame13( ChooseCharacterHelpBubbleWidget, event )
																return 
															else
																ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																ChooseCharacterHelpBubbleWidget:setAlpha( 0.31 )
																ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame13 )
															end
														end
														
														if event.interrupted then
															ChooseCharacterHelpBubbleWidgetFrame12( ChooseCharacterHelpBubbleWidget, event )
															return 
														else
															ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
															ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame12 )
														end
													end
													
													if event.interrupted then
														ChooseCharacterHelpBubbleWidgetFrame11( ChooseCharacterHelpBubbleWidget, event )
														return 
													else
														ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame11 )
													end
												end
												
												if event.interrupted then
													ChooseCharacterHelpBubbleWidgetFrame10( ChooseCharacterHelpBubbleWidget, event )
													return 
												else
													ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 357, 600 )
													ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame10 )
												end
											end
											
											if event.interrupted then
												ChooseCharacterHelpBubbleWidgetFrame9( ChooseCharacterHelpBubbleWidget, event )
												return 
											else
												ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
												ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 342.72, 585.72 )
												ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame9 )
											end
										end
										
										if event.interrupted then
											ChooseCharacterHelpBubbleWidgetFrame8( ChooseCharacterHelpBubbleWidget, event )
											return 
										else
											ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
											ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 114.24, 357.24 )
											ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_LOADOUT_DESC" ) )
											ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame8 )
										end
									end
									
									if event.interrupted then
										ChooseCharacterHelpBubbleWidgetFrame7( ChooseCharacterHelpBubbleWidget, event )
										return 
									else
										ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										ChooseCharacterHelpBubbleWidget:setAlpha( 0 )
										ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame7 )
									end
								end
								
								if event.interrupted then
									ChooseCharacterHelpBubbleWidgetFrame6( ChooseCharacterHelpBubbleWidget, event )
									return 
								else
									ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
									ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								ChooseCharacterHelpBubbleWidgetFrame5( ChooseCharacterHelpBubbleWidget, event )
								return 
							else
								ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								ChooseCharacterHelpBubbleWidget:setAlpha( 0.26 )
								ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							ChooseCharacterHelpBubbleWidgetFrame4( ChooseCharacterHelpBubbleWidget, event )
							return 
						else
							ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
							ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						ChooseCharacterHelpBubbleWidgetFrame3( ChooseCharacterHelpBubbleWidget, event )
						return 
					else
						ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ChooseCharacterHelpBubbleWidget:setAlpha( 0.22 )
						ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", ChooseCharacterHelpBubbleWidgetFrame3 )
					end
				end
				
				ChooseCharacterHelpBubbleWidget:completeAnimation()
				ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:completeAnimation()
				self.ChooseCharacterHelpBubbleWidget:setLeftRight( 0, 0, -0.5, 224.5 )
				self.ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 0, 243 )
				self.ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
				self.ChooseCharacterHelpBubbleWidget.ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
				ChooseCharacterHelpBubbleWidgetFrame2( ChooseCharacterHelpBubbleWidget, {} )
			end
		},
		ChangedCharacter = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Complete = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local ChooseCharacterHelpBubbleWidgetFrame2 = function ( ChooseCharacterHelpBubbleWidget, event )
					if not event.interrupted then
						ChooseCharacterHelpBubbleWidget:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Bounce )
					end
					ChooseCharacterHelpBubbleWidget:setLeftRight( 0, 0, -0.5, 224.5 )
					ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 357, 600 )
					ChooseCharacterHelpBubbleWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ChooseCharacterHelpBubbleWidget, event )
					else
						ChooseCharacterHelpBubbleWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChooseCharacterHelpBubbleWidget:completeAnimation()
				self.ChooseCharacterHelpBubbleWidget:setLeftRight( 0, 0, -0.5, 224.5 )
				self.ChooseCharacterHelpBubbleWidget:setTopBottom( 0, 0, 357, 600 )
				self.ChooseCharacterHelpBubbleWidget:setAlpha( 1 )
				ChooseCharacterHelpBubbleWidgetFrame2( ChooseCharacterHelpBubbleWidget, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ChooseCharacterHelpBubbleWidget:completeAnimation()
				self.ChooseCharacterHelpBubbleWidget:setAlpha( 0 )
				self.clipFinished( ChooseCharacterHelpBubbleWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Overview",
			condition = function ( menu, element, event )
				return FirstTimeSetup_Overview( controller )
			end
		},
		{
			stateName = "ChangedCharacter",
			condition = function ( menu, element, event )
				return FirstTimeSetup_ChangedCharacter( controller )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return FirstTimeSetup_Complete( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChooseCharacterHelpBubbleWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

