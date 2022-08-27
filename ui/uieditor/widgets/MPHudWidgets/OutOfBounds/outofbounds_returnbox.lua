-- 85b5d65cff38c0e8b700d8111bf2f262
-- This hash is used for caching, delete to decompile the file again

CoD.outofbounds_returnbox = InheritFrom( LUI.UIElement )
CoD.outofbounds_returnbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_returnbox )
	self.id = "outofbounds_returnbox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 563 )
	self:setTopBottom( true, false, 0, 30 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 0, 0 )
	BlackBox:setTopBottom( true, true, -1, 1 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.7 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local ReturnText = LUI.UIText.new()
	ReturnText:setLeftRight( false, false, -281.5, 281.5 )
	ReturnText:setTopBottom( true, false, 4, 28 )
	ReturnText:setAlpha( 0.95 )
	ReturnText:setText( Engine.Localize( "MPUI_OUT_OF_BOUNDS_RETURN_TO_COMBAT_ZONE" ) )
	ReturnText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	ReturnText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ReturnText:setShaderVector( 0, 0.1, 0, 0, 0 )
	ReturnText:setShaderVector( 1, 0.15, 0, 0, 0 )
	ReturnText:setShaderVector( 2, 1, 0, 0, 0 )
	ReturnText:setLetterSpacing( 3.9 )
	ReturnText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ReturnText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ReturnText )
	self.ReturnText = ReturnText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.8 )
				self.clipFinished( BlackBox, {} )
				ReturnText:completeAnimation()
				self.ReturnText:setAlpha( 0.9 )
				self.clipFinished( ReturnText, {} )
				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BlackBox:completeAnimation()
				self.BlackBox:setLeftRight( false, false, -217.5, 217.5 )
				self.BlackBox:setTopBottom( false, false, 21, 53 )
				self.BlackBox:setAlpha( 0.7 )
				self.clipFinished( BlackBox, {} )
				ReturnText:completeAnimation()
				self.ReturnText:setLeftRight( false, false, -217.5, 217.5 )
				self.ReturnText:setTopBottom( false, false, 23, 53 )
				self.ReturnText:setAlpha( 0.95 )
				self.ReturnText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.ReturnText:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.ReturnText:setShaderVector( 1, 0.15, 0, 0, 0 )
				self.ReturnText:setShaderVector( 2, 1, 0, 0, 0 )
				self.ReturnText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( ReturnText, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

