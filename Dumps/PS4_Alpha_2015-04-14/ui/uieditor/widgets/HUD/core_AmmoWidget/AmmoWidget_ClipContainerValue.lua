CoD.AmmoWidget_ClipContainerValue = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipContainerValue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipContainerValue )
	self.id = "AmmoWidget_ClipContainerValue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 42 )
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( false, false, -54, 54 )
	Clip:setTopBottom( false, true, -43.5, 8.5 )
	Clip:setRGB( 1, 1, 1 )
	Clip:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Clip:setLetterSpacing( -3.5 )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Clip:setText( modelValue )
		end
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 1, 1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
			end
		}
	}
	self.close = function ( self )
		self.Clip:close()
		CoD.AmmoWidget_ClipContainerValue.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

