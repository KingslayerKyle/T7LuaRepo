CoD.ClipContainerPressProto = InheritFrom( LUI.UIElement )
CoD.ClipContainerPressProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClipContainerPressProto )
	self.id = "ClipContainerPressProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( false, false, -52.5, 55.5 )
	Clip:setTopBottom( false, true, -59.35, 47.05 )
	Clip:setRGB( 0.85, 0.15, 0.15 )
	Clip:setAlpha( 0 )
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
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )
			end
		},
		NoAmmoPress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					Clip:setLeftRight( false, false, -52.5, 55.5 )
					Clip:setTopBottom( false, true, -59.35, 47.05 )
					Clip:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -52.5, 55.5 )
				self.Clip:setTopBottom( false, true, -38, 4 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
			end
		}
	}
	self.close = function ( self )
		self.Clip:close()
		CoD.ClipContainerPressProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

