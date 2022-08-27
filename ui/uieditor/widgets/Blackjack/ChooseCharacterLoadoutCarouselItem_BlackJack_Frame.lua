-- 216a0df97e9958f48c2e3c1f9c23e449
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CharacterCustomization.chooseCharacterLoadoutBumper" )

CoD.ChooseCharacterLoadoutCarouselItem_BlackJack_Frame = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadoutCarouselItem_BlackJack_Frame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadoutCarouselItem_BlackJack_Frame )
	self.id = "ChooseCharacterLoadoutCarouselItem_BlackJack_Frame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 825 )
	self:setTopBottom( true, false, 0, 554 )
	self.anyChildUsesUpdateState = true
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, 0, 825 )
	frame:setTopBottom( true, false, 0, 554 )
	frame:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_frame" ) )
	self:addElement( frame )
	self.frame = frame
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 4, 819 )
	text:setTopBottom( true, false, 9.02, 31.02 )
	text:setRGB( 0.77, 0.87, 0.87 )
	text:setText( Engine.Localize( "MPUI_BM_MERCENARY" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setLetterSpacing( 5.9 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	local Flippedtext = LUI.UIText.new()
	Flippedtext:setLeftRight( true, false, 4, 819 )
	Flippedtext:setTopBottom( true, false, 9.02, 31.02 )
	Flippedtext:setRGB( 0.77, 0.87, 0.87 )
	Flippedtext:setAlpha( 0 )
	Flippedtext:setYRot( 180 )
	Flippedtext:setText( Engine.Localize( "MPUI_BM_MERCENARY" ) )
	Flippedtext:setTTF( "fonts/escom.ttf" )
	Flippedtext:setLetterSpacing( 5.9 )
	Flippedtext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Flippedtext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Flippedtext )
	self.Flippedtext = Flippedtext
	
	local rightBumper = CoD.chooseCharacterLoadoutBumper.new( menu, controller )
	rightBumper:setLeftRight( true, false, 771, 807 )
	rightBumper:setTopBottom( true, false, 9.75, 34.75 )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			rightBumper.chooseCharacterLoadoutBumperInternal0.button:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	rightBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtEnd( self, "characterCarousel", event )
			end
		}
	} )
	if rightBumper.m_eventHandlers.list_focus_changed then
		local FlippedrightBumper = rightBumper.m_eventHandlers.list_focus_changed
		rightBumper:registerEventHandler( "list_focus_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return FlippedrightBumper( element, event )
		end )
	else
		rightBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	local FlippedrightBumper = CoD.chooseCharacterLoadoutBumper.new( menu, controller )
	FlippedrightBumper:setLeftRight( true, false, 17, 53 )
	FlippedrightBumper:setTopBottom( true, false, 9.75, 34.75 )
	FlippedrightBumper:setAlpha( 0 )
	FlippedrightBumper:setYRot( 180 )
	FlippedrightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			FlippedrightBumper.chooseCharacterLoadoutBumperInternal0.button:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	FlippedrightBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtEnd( self, "characterCarousel", event )
			end
		}
	} )
	if FlippedrightBumper.m_eventHandlers.list_focus_changed then
		local f1_local6 = FlippedrightBumper.m_eventHandlers.list_focus_changed
		FlippedrightBumper:registerEventHandler( "list_focus_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local6( element, event )
		end )
	else
		FlippedrightBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	self:addElement( FlippedrightBumper )
	self.FlippedrightBumper = FlippedrightBumper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.rightBumper:close()
		element.FlippedrightBumper:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

