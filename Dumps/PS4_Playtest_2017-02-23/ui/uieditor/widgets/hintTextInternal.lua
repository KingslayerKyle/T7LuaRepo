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
	self:setLeftRight( 0, 0, 0, 900 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( 0, 0, 0, 30 )
	arrow:setTopBottom( 0, 1, 0, 0 )
	arrow:setImage( RegisterImage( "uie_ui_arrow_right" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local hintText = LUI.UIText.new()
	hintText:setLeftRight( 0, 1, 30, 0 )
	hintText:setTopBottom( 0, 0, 0, 30 )
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
	
	self.resetProperties = function ()
		arrow:completeAnimation()
		hintText:completeAnimation()
		arrow:setAlpha( 1 )
		hintText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoHintText = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.hintText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

