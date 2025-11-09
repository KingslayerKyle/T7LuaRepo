require( "ui.uieditor.widgets.FittedText" )
require( "ui.uieditor.widgets.CharacterCustomization.PersonalizedColorsList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.PersonalizeCharacter_ListButton = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_ListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_ListButton )
	self.id = "PersonalizeCharacter_ListButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 100 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local sizeElement = LUI.UIFrame.new( menu, controller, 0, 0 )
	sizeElement:setLeftRight( true, false, 0, 300 )
	sizeElement:setTopBottom( true, false, 0, 100 )
	sizeElement:setRGB( 1, 1, 1 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.6 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local categoryImage = LUI.UIImage.new()
	categoryImage:setLeftRight( false, false, -150, 150 )
	categoryImage:setTopBottom( false, false, -50, 50 )
	categoryImage:setRGB( 0.34, 0.34, 0.34 )
	categoryImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	categoryImage:linkToElementModel( self, "categoryImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( categoryImage )
	self.categoryImage = categoryImage
	
	local text = CoD.FittedText.new( menu, controller )
	text:setLeftRight( true, false, 5, 65 )
	text:setTopBottom( false, true, -34, -6 )
	text:setRGB( 1, 1, 1 )
	text.nameBacking:setRGB( 0.05, 0.05, 0.05 )
	text.nameBacking:setAlpha( 0.6 )
	text.text:setRGB( 1, 1, 1 )
	text.text:setTTF( "fonts/Entovo.ttf" )
	text:linkToElementModel( self, "categoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local colorList = CoD.PersonalizedColorsList.new( menu, controller )
	colorList:setLeftRight( false, true, -100, -7 )
	colorList:setTopBottom( false, false, -15, 15 )
	colorList:setRGB( 1, 1, 1 )
	colorList:setAlpha( 0 )
	colorList:linkToElementModel( self, "colorListDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorList.colors:setDataSource( modelValue )
		end
	end )
	self:addElement( colorList )
	self.colorList = colorList
	
	local FETitleNumBrdr1 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr1:setTopBottom( true, true, 0, 0 )
	FETitleNumBrdr1:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr1 )
	self.FETitleNumBrdr1 = FETitleNumBrdr1
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -3, 0 )
	FocusBarB:setRGB( 1, 1, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	sizeElement.navigation = {
		left = text,
		down = text
	}
	text.navigation = {
		up = sizeElement,
		right = sizeElement
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 300 )
				self.sizeElement:setTopBottom( true, false, 0, 100 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setRGB( 0, 0, 0 )
				self.background:setAlpha( 0.6 )
				self.clipFinished( background, {} )
				categoryImage:completeAnimation()
				self.categoryImage:setAlpha( 1 )
				self.clipFinished( categoryImage, {} )
				text:completeAnimation()
				text.text:completeAnimation()
				self.text.text:setRGB( 1, 1, 1 )
				self.clipFinished( text, {} )
				colorList:completeAnimation()
				self.colorList:setAlpha( 0 )
				self.clipFinished( colorList, {} )
				FETitleNumBrdr1:completeAnimation()
				self.FETitleNumBrdr1:setLeftRight( true, true, 0, 0 )
				self.FETitleNumBrdr1:setTopBottom( true, true, 0, 0 )
				self.FETitleNumBrdr1:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr1, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 300 )
				self.sizeElement:setTopBottom( true, false, 0, 100 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setAlpha( 0.6 )
				self.clipFinished( background, {} )
				categoryImage:completeAnimation()
				self.categoryImage:setAlpha( 1 )
				self.clipFinished( categoryImage, {} )
				colorList:completeAnimation()
				self.colorList:setAlpha( 0 )
				self.clipFinished( colorList, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		ColorList = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 300 )
				self.sizeElement:setTopBottom( true, false, 0, 38 )
				self.clipFinished( sizeElement, {} )
				categoryImage:completeAnimation()
				self.categoryImage:setAlpha( 0 )
				self.clipFinished( categoryImage, {} )
				text:completeAnimation()
				text.text:completeAnimation()
				self.text.text:setRGB( 1, 1, 1 )
				self.clipFinished( text, {} )
				colorList:completeAnimation()
				self.colorList:setAlpha( 1 )
				self.clipFinished( colorList, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 300 )
				self.sizeElement:setTopBottom( true, false, 0, 38 )
				self.clipFinished( sizeElement, {} )
				categoryImage:completeAnimation()
				self.categoryImage:setAlpha( 0 )
				self.clipFinished( categoryImage, {} )
				text:completeAnimation()
				text.text:completeAnimation()
				self.text.text:setRGB( 1, 1, 1 )
				self.clipFinished( text, {} )
				colorList:completeAnimation()
				self.colorList:setAlpha( 1 )
				self.clipFinished( colorList, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 300 )
				self.sizeElement:setTopBottom( true, false, 0, 100 )
				self.clipFinished( sizeElement, {} )
				categoryImage:completeAnimation()
				self.categoryImage:setRGB( 0.34, 0.34, 0.34 )
				self.categoryImage:setAlpha( 1 )
				self.clipFinished( categoryImage, {} )
				text:completeAnimation()
				text.text:completeAnimation()
				self.text.text:setRGB( 0.34, 0.34, 0.34 )
				self.clipFinished( text, {} )
				colorList:completeAnimation()
				self.colorList:setAlpha( 0 )
				self.clipFinished( colorList, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 300 )
				self.sizeElement:setTopBottom( true, false, 0, 100 )
				self.clipFinished( sizeElement, {} )
				categoryImage:completeAnimation()
				self.categoryImage:setRGB( 0.34, 0.34, 0.34 )
				self.categoryImage:setAlpha( 1 )
				self.clipFinished( categoryImage, {} )
				text:completeAnimation()
				text.text:completeAnimation()
				self.text.text:setRGB( 0.64, 0.64, 0.64 )
				self.clipFinished( text, {} )
				colorList:completeAnimation()
				self.colorList:setAlpha( 0 )
				self.clipFinished( colorList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ColorList",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "colorListDatasource" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "colorListDatasource", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "colorListDatasource"
		} )
	end )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	sizeElement.id = "sizeElement"
	text.id = "text"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.sizeElement:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.text:close()
		self.colorList:close()
		self.FETitleNumBrdr1:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.categoryImage:close()
		CoD.PersonalizeCharacter_ListButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

