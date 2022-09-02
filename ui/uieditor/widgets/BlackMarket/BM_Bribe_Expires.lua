-- 6a14b65e5b5a908e4023e1132a851029
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Bribe_Expires = InheritFrom( LUI.UIElement )
CoD.BM_Bribe_Expires.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Bribe_Expires )
	self.id = "BM_Bribe_Expires"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 56 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -72.78, 38.89 )
	Image0:setTopBottom( false, false, -27.92, 27.92 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_bribe_expires_left_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 38.89, -34.25 )
	Image00:setTopBottom( false, false, -27.92, 27.92 )
	Image00:setImage( RegisterImage( "uie_t7_blackmarket_bribe_expires_center_bg" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( false, true, -34.25, 13.61 )
	Image000:setTopBottom( false, false, -27.92, 27.92 )
	Image000:setImage( RegisterImage( "uie_t7_blackmarket_bribe_expires_right_bg" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 15.5, -15.5 )
	Text:setTopBottom( false, false, -7.5, 9.5 )
	Text:setRGB( 0.69, 1, 0.83 )
	Text:setText( Engine.Localize( "MPUI_BM_PROMO_EXPIRES" ) )
	Text:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Text:setLetterSpacing( -1 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAlignedNoReverse( self, element, 0 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Text:completeAnimation()
				self.Text:setRGB( 0.69, 1, 0.83 )
				self.clipFinished( Text, {} )
			end
		},
		NearExpiryTime = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Text:completeAnimation()
				self.Text:setRGB( 0.77, 0.08, 0.08 )
				self.clipFinished( Text, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NearExpiryTime",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

