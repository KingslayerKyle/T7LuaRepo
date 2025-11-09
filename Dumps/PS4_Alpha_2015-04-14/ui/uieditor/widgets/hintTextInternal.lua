CoD.hintTextInternal = InheritFrom( LUI.UIElement )
CoD.hintTextInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.hintTextInternal )
	self.id = "hintTextInternal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 20 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, 0, 20 )
	arrow:setTopBottom( true, true, 0, 0 )
	arrow:setRGB( 1, 1, 1 )
	arrow:setImage( RegisterImage( "uie_ui_arrow_right" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local hintText = LUI.UIText.new()
	hintText:setLeftRight( true, true, 20, 0 )
	hintText:setTopBottom( true, false, 0, 20 )
	hintText:setRGB( 1, 1, 1 )
	hintText:setTTF( "fonts/default.ttf" )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	hintText:subscribeToGlobalModel( controller, "PerController", "hintText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			hintText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( hintText )
	self.hintText = hintText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
				hintText:completeAnimation()
				self.hintText:setAlpha( 1 )
				self.clipFinished( hintText, {} )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
				hintText:completeAnimation()
				self.hintText:setAlpha( 0 )
				self.clipFinished( hintText, {} )
			end
		}
	}
	self.close = function ( self )
		self.hintText:close()
		CoD.hintTextInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

