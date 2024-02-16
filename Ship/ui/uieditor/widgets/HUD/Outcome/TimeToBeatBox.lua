-- e88c6d3ed2188732a8b92476c802d3e7
-- This hash is used for caching, delete to decompile the file again

CoD.TimeToBeatBox = InheritFrom( LUI.UIElement )
CoD.TimeToBeatBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TimeToBeatBox )
	self.id = "TimeToBeatBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 21 )
	
	local arrowTExt = LUI.UIImage.new()
	arrowTExt:setLeftRight( false, false, -10.13, 10.13 )
	arrowTExt:setTopBottom( true, false, 0, 7 )
	arrowTExt:setZRot( 180 )
	arrowTExt:setImage( RegisterImage( "uie_t7_hud_waypoints_white_arrow" ) )
	self:addElement( arrowTExt )
	self.arrowTExt = arrowTExt
	
	local WhiteBox = LUI.UIImage.new()
	WhiteBox:setLeftRight( true, true, 0, 0 )
	WhiteBox:setTopBottom( false, true, -15, -1 )
	self:addElement( WhiteBox )
	self.WhiteBox = WhiteBox
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -128, 128 )
	text:setTopBottom( false, false, -4.5, 9.5 )
	text:setRGB( 0, 0, 0 )
	text:setText( Engine.Localize( "MENU_OUTCOME_TIMETOBEAT" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	text:setShaderVector( 0, 0.06, 0, 0, 0 )
	text:setShaderVector( 1, 0.02, 0, 0, 0 )
	text:setShaderVector( 2, 1, 0, 0, 0 )
	text:setLetterSpacing( 1 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 4 )
	end )
	text:linkToElementModel( self, "isFarAway", true, function ( model )
		local f3_local0 = text
		if IsParamModelEqualTo( model, true ) then
			OverrideWidgetWidth( self, "40" )
		else
			RestoreWidgetWidth( self )
		end
	end )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				arrowTExt:completeAnimation()
				self.arrowTExt:setAlpha( 1 )
				self.clipFinished( arrowTExt, {} )

				WhiteBox:completeAnimation()
				self.WhiteBox:setAlpha( 1 )
				self.clipFinished( WhiteBox, {} )

				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		},
		NoText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				arrowTExt:completeAnimation()
				self.arrowTExt:setAlpha( 0 )
				self.clipFinished( arrowTExt, {} )

				WhiteBox:completeAnimation()
				self.WhiteBox:setAlpha( 0 )
				self.clipFinished( WhiteBox, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
