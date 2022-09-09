-- 2a5b2bd4d1be363281c29965e181cc0e
-- This hash is used for caching, delete to decompile the file again

CoD.Waypoint_TextBG = InheritFrom( LUI.UIElement )
CoD.Waypoint_TextBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Waypoint_TextBG )
	self.id = "Waypoint_TextBG"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 21 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, true, 0, 0 )
	left:setTopBottom( true, false, 1, 15 )
	left:setImage( RegisterImage( "uie_t7_hud_waypoints_namebg_left_mp" ) )
	self:addElement( left )
	self.left = left
	
	local arrowTExt = LUI.UIImage.new()
	arrowTExt:setLeftRight( false, false, -10, 10 )
	arrowTExt:setTopBottom( false, true, -6, 0 )
	arrowTExt:setImage( RegisterImage( "uie_t7_hud_waypoints_bg_arrow" ) )
	self:addElement( arrowTExt )
	self.arrowTExt = arrowTExt
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -128, 128 )
	text:setTopBottom( false, false, -9.5, 4.5 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
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

				left:completeAnimation()
				self.left:setAlpha( 1 )
				self.clipFinished( left, {} )

				arrowTExt:completeAnimation()
				self.arrowTExt:setAlpha( 1 )
				self.clipFinished( arrowTExt, {} )

				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		},
		NoText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )

				arrowTExt:completeAnimation()
				self.arrowTExt:setAlpha( 0 )
				self.clipFinished( arrowTExt, {} )

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
