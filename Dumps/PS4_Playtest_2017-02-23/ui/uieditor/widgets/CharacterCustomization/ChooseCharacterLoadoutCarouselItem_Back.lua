require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_Bio" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadoutCarouselItem_BackListItem" )
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
	self:setLeftRight( 0, 0, 0, 1224 )
	self:setTopBottom( 0, 0, 0, 750 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 0, 12, 414 )
	BlackBox:setTopBottom( 0, 1, 9, -11 )
	BlackBox:setAlpha( 0.08 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( 0, 1, 0, 0 )
	Border0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local callsignLabel = LUI.UITightText.new()
	callsignLabel:setLeftRight( 0, 0, 30, 141 )
	callsignLabel:setTopBottom( 0, 0, 15, 45 )
	callsignLabel:setRGB( 0.82, 0.98, 1 )
	callsignLabel:setAlpha( 0.8 )
	callsignLabel:setText( LocalizeToUpperString( "HEROES_CALLSIGN" ) )
	callsignLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel )
	self.callsignLabel = callsignLabel
	
	local WeaponNameWidget0 = CoD.WeaponNameWidget.new( menu, controller )
	WeaponNameWidget0:setLeftRight( 0, 0, 29, 323 )
	WeaponNameWidget0:setTopBottom( 0, 0, 50.5, 101.5 )
	WeaponNameWidget0:setRGB( 0.82, 0.98, 1 )
	self:addElement( WeaponNameWidget0 )
	self.WeaponNameWidget0 = WeaponNameWidget0
	
	local iconBorder0 = CoD.Border.new( menu, controller )
	iconBorder0:setLeftRight( 0, 0, 12, 414 )
	iconBorder0:setTopBottom( 0, 1, 9, -11 )
	iconBorder0:setRGB( 0.87, 0.99, 1 )
	self:addElement( iconBorder0 )
	self.iconBorder0 = iconBorder0
	
	local selectionList = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 30, 397 )
	selectionList:setTopBottom( 0, 0, 128.5, 703.5 )
	selectionList:setWidgetType( CoD.ChooseCharacterLoadoutCarouselItem_BackListItem )
	selectionList:setVerticalCount( 11 )
	selectionList:setSpacing( 8 )
	selectionList:linkToElementModel( self, "cardBackDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionList:setDataSource( modelValue )
		end
	end )
	selectionList:linkToElementModel( selectionList, "alias", true, function ( model )
		local element = selectionList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "alias"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	selectionList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		if HasProperty( element, "transmissionIndex" ) and IsSelfModelValueTrue( element, controller, "isNew" ) then
			StopSpecialistTransmission( element, controller )
			MarkSpecialistTransmissionOld( self, element, controller )
		elseif HasProperty( element, "transmissionIndex" ) then
			StopSpecialistTransmission( element, controller )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			PlaySpecialistTransmission( element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local frame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frame:setLeftRight( 0, 0, 450, 1209 )
	frame:setTopBottom( 0, 0, 15, 684 )
	self:addElement( frame )
	self.frame = frame
	
	local ChooseCharacterLoadoutCardBackFrontOfCardFooter = CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter.new( menu, controller )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:setLeftRight( 1, 1, -125.5, -14.5 )
	ChooseCharacterLoadoutCardBackFrontOfCardFooter:setTopBottom( 1, 1, -58, -8 )
	self:addElement( ChooseCharacterLoadoutCardBackFrontOfCardFooter )
	self.ChooseCharacterLoadoutCardBackFrontOfCardFooter = ChooseCharacterLoadoutCardBackFrontOfCardFooter
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( 0, 1, 30, -826 )
	keyline1:setTopBottom( 0, 0, 116, 117 )
	keyline1:setRGB( 0.87, 0.99, 1 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	self.WeaponNameWidget0:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	frame:linkToElementModel( selectionList, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	frame:linkToElementModel( selectionList, "frameWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			frame:changeFrameWidget( modelValue )
		end
	end )
	selectionList.navigation = {
		right = frame
	}
	frame.navigation = {
		left = selectionList
	}
	self.resetProperties = function ()
		keyline1:completeAnimation()
		frame:completeAnimation()
		selectionList:completeAnimation()
		WeaponNameWidget0:completeAnimation()
		callsignLabel:completeAnimation()
		keyline1:setAlpha( 1 )
		frame:setAlpha( 1 )
		selectionList:setAlpha( 1 )
		WeaponNameWidget0:setAlpha( 1 )
		callsignLabel:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisabledFocus",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "heroSelectionTutorial" )
			end
		}
	} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border0:close()
		self.WeaponNameWidget0:close()
		self.iconBorder0:close()
		self.selectionList:close()
		self.ChooseCharacterLoadoutCardBackFrontOfCardFooter:close()
		self.frame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

