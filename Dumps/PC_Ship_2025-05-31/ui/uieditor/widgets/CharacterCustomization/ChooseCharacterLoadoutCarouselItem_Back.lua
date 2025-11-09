require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_BackListItem" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_Bio" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_CardBack_FrontOfCardFooter" )

CoD.ChooseCharacterLoadoutCarouselItem_Back = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_Back.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_Back )
	self.id = "ChooseCharacterLoadoutCarouselItem_Back"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, false, 8, 276 )
	BlackBox:setTopBottom( true, true, 6, -7.5 )
	BlackBox:setAlpha( 0.08 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( true, true, 0, 0 )
	Border0:setTopBottom( true, true, 0, 0 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( true, false, 20, 94 )
	callsignLabel:setTopBottom( true, false, 10, 30 )
	callsignLabel:setRGB( 0.82, 0.98, 1 )
	callsignLabel:setAlpha( 0.8 )
	callsignLabel:setText( LocalizeToUpperString( "HEROES_CALLSIGN" ) )
	callsignLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( true, false, 19, 215 )
	WeaponNameWidget0:setTopBottom( true, false, 34, 68 )
	WeaponNameWidget0:setRGB( 0.82, 0.98, 1 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local iconBorder0 = CoD.Border.new( menu, controller )
	iconBorder0:setLeftRight( true, false, 8, 276 )
	iconBorder0:setTopBottom( true, true, 6, -7.5 )
	iconBorder0:setRGB( 0.87, 0.99, 1 )
	self:addElement( iconBorder0 )
	self.iconBorder0 = iconBorder0
	
	local selectionList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 20, 265 )
	selectionList:setTopBottom( true, false, 87.5, 467.5 )
	selectionList:setWidgetType( CoD.ChooseCharacterLoadoutCarouselItem_BackListItem )
	selectionList:setVerticalCount( 11 )
	selectionList:setSpacing( 5 )
	selectionList:linkToElementModel( self, "cardBackDatasource", true, function ( model )
		local cardBackDatasource = Engine.GetModelValue( model )
		if cardBackDatasource then
			selectionList:setDataSource( cardBackDatasource )
		end
	end )
	selectionList:linkToElementModel( selectionList, "alias", true, function ( model )
		local f3_local0 = selectionList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "alias"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	selectionList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f4_local0 = nil
		if HasProperty( element, "transmissionIndex" ) and IsSelfModelValueTrue( element, controller, "isNew" ) then
			StopSpecialistTransmission( element, controller )
			MarkSpecialistTransmissionOld( self, element, controller )
		elseif HasProperty( element, "transmissionIndex" ) then
			StopSpecialistTransmission( element, controller )
		end
		return f4_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f5_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			PlaySpecialistTransmission( element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frame:setLeftRight( true, false, 300, 806 )
	frame:setTopBottom( true, false, 7, 439.75 )
	self:addElement( frame )
	self.frame = frame
	
	local ChooseCharacterLoadoutCardBackFrontOfCardFooter = CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter.new( menu, controller )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:setLeftRight( false, true, -87, -13 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:setTopBottom( false, true, -49.25, -15.75 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.text:setText( Engine.Localize( "MENU_FRONT_OF_CARD" ) )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter.clickableButton.label:setText( Engine.Localize( "MENU_FRONT_OF_CARD" ) )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ChooseCharacterLoadoutCardBackFrontOfCardFooter.Button2:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ChooseCharacterLoadoutCardBackFrontOfCardFooter )
	self.ChooseCharacterLoadoutCardBackFrontOfCardFooter = ChooseCharacterLoadoutCardBackFrontOfCardFooter
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( true, true, 20, -551 )
	keyline1:setTopBottom( true, false, 77.25, 78 )
	keyline1:setRGB( 0.87, 0.99, 1 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	self.WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	frame:linkToElementModel( selectionList, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	frame:linkToElementModel( selectionList, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			frame:changeFrameWidget( frameWidget )
		end
	end )
	selectionList.navigation = {
		right = frame
	}
	frame.navigation = {
		left = selectionList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local callsignLabelFrame2 = function ( callsignLabel, event )
					local callsignLabelFrame3 = function ( callsignLabel, event )
						local callsignLabelFrame4 = function ( callsignLabel, event )
							local callsignLabelFrame5 = function ( callsignLabel, event )
								if not event.interrupted then
									callsignLabel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								callsignLabel:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( callsignLabel, event )
								else
									callsignLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								callsignLabelFrame5( callsignLabel, event )
								return 
							else
								callsignLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								callsignLabel:setAlpha( 0.4 )
								callsignLabel:registerEventHandler( "transition_complete_keyframe", callsignLabelFrame5 )
							end
						end
						
						if event.interrupted then
							callsignLabelFrame4( callsignLabel, event )
							return 
						else
							callsignLabel:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
							callsignLabel:setAlpha( 1 )
							callsignLabel:registerEventHandler( "transition_complete_keyframe", callsignLabelFrame4 )
						end
					end
					
					if event.interrupted then
						callsignLabelFrame3( callsignLabel, event )
						return 
					else
						callsignLabel:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						callsignLabel:registerEventHandler( "transition_complete_keyframe", callsignLabelFrame3 )
					end
				end
				
				callsignLabel:completeAnimation()
				self.callsignLabel:setAlpha( 0 )
				callsignLabelFrame2( callsignLabel, {} )
				local WeaponNameWidget0Frame2 = function ( WeaponNameWidget0, event )
					local WeaponNameWidget0Frame3 = function ( WeaponNameWidget0, event )
						local WeaponNameWidget0Frame4 = function ( WeaponNameWidget0, event )
							local WeaponNameWidget0Frame5 = function ( WeaponNameWidget0, event )
								if not event.interrupted then
									WeaponNameWidget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								WeaponNameWidget0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( WeaponNameWidget0, event )
								else
									WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponNameWidget0Frame5( WeaponNameWidget0, event )
								return 
							else
								WeaponNameWidget0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								WeaponNameWidget0:setAlpha( 0.4 )
								WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", WeaponNameWidget0Frame5 )
							end
						end
						
						if event.interrupted then
							WeaponNameWidget0Frame4( WeaponNameWidget0, event )
							return 
						else
							WeaponNameWidget0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
							WeaponNameWidget0:setAlpha( 1 )
							WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", WeaponNameWidget0Frame4 )
						end
					end
					
					if event.interrupted then
						WeaponNameWidget0Frame3( WeaponNameWidget0, event )
						return 
					else
						WeaponNameWidget0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", WeaponNameWidget0Frame3 )
					end
				end
				
				WeaponNameWidget0:completeAnimation()
				self.WeaponNameWidget0:setAlpha( 0 )
				WeaponNameWidget0Frame2( WeaponNameWidget0, {} )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						local selectionListFrame4 = function ( selectionList, event )
							local selectionListFrame5 = function ( selectionList, event )
								if not event.interrupted then
									selectionList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								selectionList:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( selectionList, event )
								else
									selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								selectionListFrame5( selectionList, event )
								return 
							else
								selectionList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								selectionList:setAlpha( 0.4 )
								selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame5 )
							end
						end
						
						if event.interrupted then
							selectionListFrame4( selectionList, event )
							return 
						else
							selectionList:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
							selectionList:setAlpha( 1 )
							selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame4 )
						end
					end
					
					if event.interrupted then
						selectionListFrame3( selectionList, event )
						return 
					else
						selectionList:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				selectionListFrame2( selectionList, {} )
				local frameFrame2 = function ( frame, event )
					local frameFrame3 = function ( frame, event )
						local frameFrame4 = function ( frame, event )
							local frameFrame5 = function ( frame, event )
								if not event.interrupted then
									frame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								frame:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( frame, event )
								else
									frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								frameFrame5( frame, event )
								return 
							else
								frame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								frame:setAlpha( 0.4 )
								frame:registerEventHandler( "transition_complete_keyframe", frameFrame5 )
							end
						end
						
						if event.interrupted then
							frameFrame4( frame, event )
							return 
						else
							frame:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
							frame:setAlpha( 1 )
							frame:registerEventHandler( "transition_complete_keyframe", frameFrame4 )
						end
					end
					
					if event.interrupted then
						frameFrame3( frame, event )
						return 
					else
						frame:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						frame:registerEventHandler( "transition_complete_keyframe", frameFrame3 )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				frameFrame2( frame, {} )
				ChooseCharacterLoadoutCardBackFrontOfCardFooter:completeAnimation()
				self.ChooseCharacterLoadoutCardBackFrontOfCardFooter:setLeftRight( false, true, -87, -13 )
				self.ChooseCharacterLoadoutCardBackFrontOfCardFooter:setTopBottom( false, true, -40.25, -6.75 )
				self.clipFinished( ChooseCharacterLoadoutCardBackFrontOfCardFooter, {} )
				local keyline1Frame2 = function ( keyline1, event )
					local keyline1Frame3 = function ( keyline1, event )
						local keyline1Frame4 = function ( keyline1, event )
							local keyline1Frame5 = function ( keyline1, event )
								if not event.interrupted then
									keyline1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								keyline1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( keyline1, event )
								else
									keyline1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								keyline1Frame5( keyline1, event )
								return 
							else
								keyline1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								keyline1:setAlpha( 0.4 )
								keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame5 )
							end
						end
						
						if event.interrupted then
							keyline1Frame4( keyline1, event )
							return 
						else
							keyline1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
							keyline1:setAlpha( 1 )
							keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame4 )
						end
					end
					
					if event.interrupted then
						keyline1Frame3( keyline1, event )
						return 
					else
						keyline1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame3 )
					end
				end
				
				keyline1:completeAnimation()
				self.keyline1:setAlpha( 0 )
				keyline1Frame2( keyline1, {} )
			end
		},
		Blackjack = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local callsignLabelFrame2 = function ( callsignLabel, event )
					local callsignLabelFrame3 = function ( callsignLabel, event )
						local callsignLabelFrame4 = function ( callsignLabel, event )
							local callsignLabelFrame5 = function ( callsignLabel, event )
								if not event.interrupted then
									callsignLabel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								callsignLabel:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( callsignLabel, event )
								else
									callsignLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								callsignLabelFrame5( callsignLabel, event )
								return 
							else
								callsignLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								callsignLabel:setAlpha( 0.4 )
								callsignLabel:registerEventHandler( "transition_complete_keyframe", callsignLabelFrame5 )
							end
						end
						
						if event.interrupted then
							callsignLabelFrame4( callsignLabel, event )
							return 
						else
							callsignLabel:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
							callsignLabel:setAlpha( 1 )
							callsignLabel:registerEventHandler( "transition_complete_keyframe", callsignLabelFrame4 )
						end
					end
					
					if event.interrupted then
						callsignLabelFrame3( callsignLabel, event )
						return 
					else
						callsignLabel:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						callsignLabel:registerEventHandler( "transition_complete_keyframe", callsignLabelFrame3 )
					end
				end
				
				callsignLabel:completeAnimation()
				self.callsignLabel:setAlpha( 0 )
				callsignLabelFrame2( callsignLabel, {} )
				local WeaponNameWidget0Frame2 = function ( WeaponNameWidget0, event )
					local WeaponNameWidget0Frame3 = function ( WeaponNameWidget0, event )
						local WeaponNameWidget0Frame4 = function ( WeaponNameWidget0, event )
							local WeaponNameWidget0Frame5 = function ( WeaponNameWidget0, event )
								if not event.interrupted then
									WeaponNameWidget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								WeaponNameWidget0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( WeaponNameWidget0, event )
								else
									WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponNameWidget0Frame5( WeaponNameWidget0, event )
								return 
							else
								WeaponNameWidget0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								WeaponNameWidget0:setAlpha( 0.4 )
								WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", WeaponNameWidget0Frame5 )
							end
						end
						
						if event.interrupted then
							WeaponNameWidget0Frame4( WeaponNameWidget0, event )
							return 
						else
							WeaponNameWidget0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Bounce )
							WeaponNameWidget0:setAlpha( 1 )
							WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", WeaponNameWidget0Frame4 )
						end
					end
					
					if event.interrupted then
						WeaponNameWidget0Frame3( WeaponNameWidget0, event )
						return 
					else
						WeaponNameWidget0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						WeaponNameWidget0:registerEventHandler( "transition_complete_keyframe", WeaponNameWidget0Frame3 )
					end
				end
				
				WeaponNameWidget0:completeAnimation()
				self.WeaponNameWidget0:setAlpha( 0 )
				WeaponNameWidget0Frame2( WeaponNameWidget0, {} )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						local selectionListFrame4 = function ( selectionList, event )
							local selectionListFrame5 = function ( selectionList, event )
								if not event.interrupted then
									selectionList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								selectionList:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( selectionList, event )
								else
									selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								selectionListFrame5( selectionList, event )
								return 
							else
								selectionList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								selectionList:setAlpha( 0.4 )
								selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame5 )
							end
						end
						
						if event.interrupted then
							selectionListFrame4( selectionList, event )
							return 
						else
							selectionList:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
							selectionList:setAlpha( 1 )
							selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame4 )
						end
					end
					
					if event.interrupted then
						selectionListFrame3( selectionList, event )
						return 
					else
						selectionList:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				selectionListFrame2( selectionList, {} )
				local frameFrame2 = function ( frame, event )
					local frameFrame3 = function ( frame, event )
						local frameFrame4 = function ( frame, event )
							local frameFrame5 = function ( frame, event )
								if not event.interrupted then
									frame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								frame:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( frame, event )
								else
									frame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								frameFrame5( frame, event )
								return 
							else
								frame:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								frame:setAlpha( 0.4 )
								frame:registerEventHandler( "transition_complete_keyframe", frameFrame5 )
							end
						end
						
						if event.interrupted then
							frameFrame4( frame, event )
							return 
						else
							frame:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
							frame:setAlpha( 1 )
							frame:registerEventHandler( "transition_complete_keyframe", frameFrame4 )
						end
					end
					
					if event.interrupted then
						frameFrame3( frame, event )
						return 
					else
						frame:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						frame:registerEventHandler( "transition_complete_keyframe", frameFrame3 )
					end
				end
				
				frame:completeAnimation()
				self.frame:setAlpha( 0 )
				frameFrame2( frame, {} )
				ChooseCharacterLoadoutCardBackFrontOfCardFooter:completeAnimation()
				self.ChooseCharacterLoadoutCardBackFrontOfCardFooter:setLeftRight( false, true, -87, -13 )
				self.ChooseCharacterLoadoutCardBackFrontOfCardFooter:setTopBottom( false, true, -53.25, -19.75 )
				self.clipFinished( ChooseCharacterLoadoutCardBackFrontOfCardFooter, {} )
				local keyline1Frame2 = function ( keyline1, event )
					local keyline1Frame3 = function ( keyline1, event )
						local keyline1Frame4 = function ( keyline1, event )
							local keyline1Frame5 = function ( keyline1, event )
								if not event.interrupted then
									keyline1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								keyline1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( keyline1, event )
								else
									keyline1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								keyline1Frame5( keyline1, event )
								return 
							else
								keyline1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								keyline1:setAlpha( 0.4 )
								keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame5 )
							end
						end
						
						if event.interrupted then
							keyline1Frame4( keyline1, event )
							return 
						else
							keyline1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
							keyline1:setAlpha( 1 )
							keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame4 )
						end
					end
					
					if event.interrupted then
						keyline1Frame3( keyline1, event )
						return 
					else
						keyline1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame3 )
					end
				end
				
				keyline1:completeAnimation()
				self.keyline1:setAlpha( 0 )
				keyline1Frame2( keyline1, {} )
			end
		},
		DisabledFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Blackjack",
			condition = function ( menu, element, event )
				return IsCharacterBlackjack( controller, element )
			end
		},
		{
			stateName = "DisabledFocus",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "heroSelectionTutorial" )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroSelectionTutorial"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	selectionList.id = "selectionList"
	frame.id = "frame"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border0:close()
		element.WeaponNameWidget0:close()
		element.iconBorder0:close()
		element.selectionList:close()
		element.ChooseCharacterLoadoutCardBackFrontOfCardFooter:close()
		element.frame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

