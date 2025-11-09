require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CharacterCustomization.chooseCharacterLoadoutBumper" )

CoD.ChooseCharacter_TabBar = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_TabBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_TabBar )
	self.id = "ChooseCharacter_TabBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 43 )
	self.anyChildUsesUpdateState = true
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -408, 408 )
	CategoryListPanel:setTopBottom( false, false, -19.88, 20.13 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local FETabIdle1 = LUI.UIImage.new()
	FETabIdle1:setLeftRight( true, false, 762, 816 )
	FETabIdle1:setTopBottom( true, false, 0, 43.25 )
	FETabIdle1:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle1:setShaderVector( 0, 0.15, 0.18, 0, 0 )
	FETabIdle1:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle1 )
	self.FETabIdle1 = FETabIdle1
	
	local FETabIdle = LUI.UIImage.new()
	FETabIdle:setLeftRight( true, false, 0, 54 )
	FETabIdle:setTopBottom( true, false, 0, 43.25 )
	FETabIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle:setShaderVector( 0, 0.15, 0.18, 0, 0 )
	FETabIdle:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle )
	self.FETabIdle = FETabIdle
	
	local FETabIdle0 = LUI.UIImage.new()
	FETabIdle0:setLeftRight( true, true, 54, -54 )
	FETabIdle0:setTopBottom( false, false, -21.63, 21.63 )
	FETabIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle0:setShaderVector( 0, 0.01, 0.18, 0, 0 )
	FETabIdle0:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( false, false, -20.88, 20.13 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
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
		local leftBumper = rightBumper.m_eventHandlers.list_focus_changed
		rightBumper:registerEventHandler( "list_focus_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return leftBumper( element, event )
		end )
	else
		rightBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	local leftBumper = CoD.chooseCharacterLoadoutBumper.new( menu, controller )
	leftBumper:setLeftRight( true, false, 9, 45 )
	leftBumper:setTopBottom( true, false, 9.75, 34.75 )
	leftBumper:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			leftBumper.chooseCharacterLoadoutBumperInternal0.button:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	leftBumper:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsListAtStart( self, "characterCarousel", event )
			end
		}
	} )
	if leftBumper.m_eventHandlers.list_focus_changed then
		local TabBarLabel = leftBumper.m_eventHandlers.list_focus_changed
		leftBumper:registerEventHandler( "list_focus_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return TabBarLabel( element, event )
		end )
	else
		leftBumper:registerEventHandler( "list_focus_changed", LUI.UIElement.updateState )
	end
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local TabBarLabel = LUI.UIText.new()
	TabBarLabel:setLeftRight( true, false, 289, 529 )
	TabBarLabel:setTopBottom( true, false, 11.5, 31.5 )
	TabBarLabel:setRGB( 0.66, 0.73, 0.75 )
	TabBarLabel:setText( LocalizeToUpperString( "MENU_SPECIALISTS" ) )
	TabBarLabel:setTTF( "fonts/escom.ttf" )
	TabBarLabel:setLetterSpacing( 3.5 )
	TabBarLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TabBarLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TabBarLabel )
	self.TabBarLabel = TabBarLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 1 )
				self.clipFinished( CategoryListPanel, {} )
				FETabIdle1:completeAnimation()
				self.FETabIdle1:setAlpha( 1 )
				self.clipFinished( FETabIdle1, {} )
				FETabIdle:completeAnimation()
				self.FETabIdle:setAlpha( 1 )
				self.clipFinished( FETabIdle, {} )
				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 1 )
				self.clipFinished( FETabIdle0, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 1 )
				self.clipFinished( rightBumper, {} )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 1 )
				self.clipFinished( leftBumper, {} )
				TabBarLabel:completeAnimation()
				self.TabBarLabel:setAlpha( 1 )
				self.clipFinished( TabBarLabel, {} )
			end
		},
		invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CategoryListPanel:completeAnimation()
				self.CategoryListPanel:setAlpha( 0 )
				self.clipFinished( CategoryListPanel, {} )
				FETabIdle1:completeAnimation()
				self.FETabIdle1:setAlpha( 0 )
				self.clipFinished( FETabIdle1, {} )
				FETabIdle:completeAnimation()
				self.FETabIdle:setAlpha( 0 )
				self.clipFinished( FETabIdle, {} )
				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 0 )
				self.clipFinished( FETabIdle0, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
				rightBumper:completeAnimation()
				self.rightBumper:setAlpha( 0 )
				self.clipFinished( rightBumper, {} )
				leftBumper:completeAnimation()
				self.leftBumper:setAlpha( 0 )
				self.clipFinished( leftBumper, {} )
				TabBarLabel:completeAnimation()
				self.TabBarLabel:setAlpha( 0 )
				self.clipFinished( TabBarLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "invisible",
			condition = function ( menu, element, event )
				return IsCharacterBlackjack( controller, element )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
		element.rightBumper:close()
		element.leftBumper:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

