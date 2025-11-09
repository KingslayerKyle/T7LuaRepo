CoD.ClipContainerValueProto = InheritFrom( LUI.UIElement )
CoD.ClipContainerValueProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipContainerValueProto )
	self.id = "ClipContainerValueProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 42 )
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( false, false, -52.5, 55.5 )
	Clip:setTopBottom( false, true, -38, 4 )
	Clip:setRGB( 0.85, 0.15, 0.15 )
	Clip:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Clip:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -52.5, 55.5 )
				self.Clip:setTopBottom( false, true, -38, 4 )
				self.Clip:setRGB( 1, 1, 1 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0.85, 0 )
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Clip:completeAnimation()
				self.Clip:setRGB( 0.85, 0.15, 0.15 )
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
			end
		}
	}
	self.close = function ( self )
		self.Clip:close()
		CoD.ClipContainerValueProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

