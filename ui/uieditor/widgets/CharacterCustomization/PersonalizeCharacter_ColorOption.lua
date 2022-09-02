-- 1055a713781a97c40231f5ffc1d7cad0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.colorSwatch" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1 = f1_arg0:getLocalSize()
	f1_arg0.getWidthInList = function ()
		if f1_arg0.gridInfoTable then
			if f1_arg0.gridInfoTable.parentGrid.activeWidget == f1_arg0 then
				return f1_local0
			else
				return f1_local0 / 2
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
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local colorSwatch = CoD.colorSwatch.new( menu, controller )
	colorSwatch:setLeftRight( true, true, 0, 0 )
	colorSwatch:setTopBottom( true, true, 12.5, -12.5 )
	colorSwatch:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			colorSwatch.background:setRGB( color )
		end
	end )
	colorSwatch:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			colorSwatch.background:setImage( RegisterImage( icon ) )
		end
	end )
	self:addElement( colorSwatch )
	self.colorSwatch = colorSwatch
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( false, false, 25, 42 )
	FETitleNumBrdr0:setAlpha( 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( true, false, -6, 1 )
	leftArrow:setTopBottom( false, false, -3, 4 )
	leftArrow:setAlpha( 0 )
	leftArrow:setZRot( 270 )
	leftArrow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, true, -1, 6 )
	rightArrow:setTopBottom( false, false, -3, 4 )
	rightArrow:setAlpha( 0 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local count = LUI.UITightText.new()
	count:setLeftRight( false, false, -25, 25 )
	count:setTopBottom( false, true, 1, 17 )
	count:setAlpha( 0 )
	count:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	count:linkToElementModel( self, "xOfY", true, function ( model )
		local xOfY = Engine.GetModelValue( model )
		if xOfY then
			count:setText( Engine.Localize( xOfY ) )
		end
	end )
	self:addElement( count )
	self.count = count
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				colorSwatch:completeAnimation()

				colorSwatch.border:completeAnimation()
				self.colorSwatch:setLeftRight( true, true, 0, 0 )
				self.colorSwatch:setTopBottom( true, true, 12.5, -12.5 )
				self.colorSwatch.border:setRGB( 1, 1, 1 )
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )

				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0 )
				self.clipFinished( leftArrow, {} )

				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0 )
				self.clipFinished( rightArrow, {} )

				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )

				colorSwatch:completeAnimation()

				colorSwatch.border:completeAnimation()
				self.colorSwatch:setLeftRight( true, true, 0, 0 )
				self.colorSwatch:setTopBottom( true, true, 0, 0 )
				self.colorSwatch.border:setRGB( 1, 1, 1 )
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
				self.FETitleNumBrdr0:setTopBottom( false, false, 25, 42 )
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )

				leftArrow:completeAnimation()
				self.leftArrow:setLeftRight( true, false, -6, 1 )
				self.leftArrow:setTopBottom( false, false, -3, 4 )
				self.leftArrow:setRGB( 1, 1, 1 )
				self.leftArrow:setAlpha( 0.8 )
				self.clipFinished( leftArrow, {} )

				rightArrow:completeAnimation()
				self.rightArrow:setLeftRight( false, true, -1, 6 )
				self.rightArrow:setTopBottom( false, false, -3, 4 )
				self.rightArrow:setRGB( 1, 1, 1 )
				self.rightArrow:setAlpha( 0.8 )
				self.clipFinished( rightArrow, {} )

				count:completeAnimation()
				self.count:setLeftRight( false, false, -25, 25 )
				self.count:setTopBottom( false, true, 1, 17 )
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		ListNotInFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				colorSwatch:completeAnimation()

				colorSwatch.border:completeAnimation()
				self.colorSwatch.border:setRGB( 1, 1, 1 )
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )

				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )

				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0 )
				self.clipFinished( leftArrow, {} )

				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0 )
				self.clipFinished( rightArrow, {} )

				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 4 )

				colorSwatch:completeAnimation()

				colorSwatch.border:completeAnimation()
				self.colorSwatch:setLeftRight( true, true, 0, 0 )
				self.colorSwatch:setTopBottom( true, true, 0, 0 )
				self.colorSwatch.border:setRGB( 1, 1, 1 )
				self.colorSwatch.border:setAlpha( 1 )
				self.clipFinished( colorSwatch, {} )

				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0 )
				self.clipFinished( leftArrow, {} )

				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0 )
				self.clipFinished( rightArrow, {} )

				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.colorSwatch:close()
		element.FETitleNumBrdr0:close()
		element.count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

