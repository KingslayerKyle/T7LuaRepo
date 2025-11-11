require( "ui.uieditor.widgets.colorSwatch" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local PostLoadFunc = function ( self, controller )
	local originalWidth, originalHeight = self:getLocalSize()
	self.getWidthInList = function ()
		if self.gridInfoTable then
			if self.gridInfoTable.parentGrid.activeWidget == self then
				return originalWidth
			else
				return originalWidth / 2
			end
		else
			
		end
	end
	
end

CoD.PersonalizeCharacter_ColorOption = InheritFrom( LUI.UIElement )
CoD.PersonalizeCharacter_ColorOption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeCharacter_ColorOption )
	self.id = "PersonalizeCharacter_ColorOption"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 75 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local colorSwatch = CoD.colorSwatch.new( menu, controller )
	colorSwatch:setLeftRight( 0, 1, 0, 0 )
	colorSwatch:setTopBottom( 0, 1, 19, -19 )
	colorSwatch:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorSwatch.background:setRGB( modelValue )
		end
	end )
	colorSwatch:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorSwatch.background:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( colorSwatch )
	self.colorSwatch = colorSwatch
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, 37, 63 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( 0, 0, -9, 1 )
	leftArrow:setTopBottom( 0.5, 0.5, -4, 6 )
	leftArrow:setAlpha( 0 )
	leftArrow:setZRot( 270 )
	leftArrow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( 1, 1, -1, 9 )
	rightArrow:setTopBottom( 0.5, 0.5, -4, 6 )
	rightArrow:setAlpha( 0 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local count = LUI.UITightText.new()
	count:setLeftRight( 0.5, 0.5, -37.5, 37.5 )
	count:setTopBottom( 1, 1, 2, 26 )
	count:setAlpha( 0 )
	count:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	count:linkToElementModel( self, "xOfY", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			count:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( count )
	self.count = count
	
	self.resetProperties = function ()
		colorSwatch:completeAnimation()
		rightArrow:completeAnimation()
		leftArrow:completeAnimation()
		count:completeAnimation()
		FETitleNumBrdr0:completeAnimation()
		colorSwatch:setLeftRight( 0, 1, 0, 0 )
		colorSwatch:setTopBottom( 0, 1, 19, -19 )
		colorSwatch.border:setAlpha( 0.45 )
		rightArrow:setAlpha( 0 )
		leftArrow:setAlpha( 0 )
		count:setLeftRight( 0.5, 0.5, -37.5, 37.5 )
		count:setTopBottom( 1, 1, 2, 26 )
		count:setAlpha( 0 )
		FETitleNumBrdr0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorSwatch:completeAnimation()
				colorSwatch.border:completeAnimation()
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				colorSwatch:completeAnimation()
				colorSwatch.border:completeAnimation()
				self.colorSwatch:setLeftRight( 0, 1, 0, 0 )
				self.colorSwatch:setTopBottom( 0, 1, 0, 0 )
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0.8 )
				self.clipFinished( leftArrow, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0.8 )
				self.clipFinished( rightArrow, {} )
				count:completeAnimation()
				self.count:setLeftRight( 0.5, 0.5, -38, 37 )
				self.count:setTopBottom( 1, 1, 2, 26 )
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		ListNotInFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorSwatch:completeAnimation()
				colorSwatch.border:completeAnimation()
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				colorSwatch:completeAnimation()
				colorSwatch.border:completeAnimation()
				self.colorSwatch:setLeftRight( 0, 1, 0, 0 )
				self.colorSwatch:setTopBottom( 0, 1, 0, 0 )
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ListNotInFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.colorSwatch:close()
		self.FETitleNumBrdr0:close()
		self.count:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

