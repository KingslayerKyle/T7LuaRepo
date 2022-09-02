-- 62fbe5836368c098706a7e9fe8deb8aa
-- This hash is used for caching, delete to decompile the file again

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
	arrow:setImage( RegisterImage( "uie_ui_arrow_right" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local hintText = LUI.UIText.new()
	hintText:setLeftRight( true, true, 20, 0 )
	hintText:setTopBottom( true, false, 0, 20 )
	hintText:setTTF( "fonts/default.ttf" )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	hintText:subscribeToGlobalModel( controller, "PerController", "hintText", function ( model )
		local _hintText = Engine.GetModelValue( model )
		if _hintText then
			hintText:setText( Engine.Localize( _hintText ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

