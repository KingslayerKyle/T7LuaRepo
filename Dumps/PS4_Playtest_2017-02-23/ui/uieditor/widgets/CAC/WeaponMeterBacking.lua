CoD.WeaponMeterBacking = InheritFrom( LUI.UIElement )
CoD.WeaponMeterBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponMeterBacking )
	self.id = "WeaponMeterBacking"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 247 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local Meterbacking = LUI.UIImage.new()
	Meterbacking:setLeftRight( 0, 0, 0, 248 )
	Meterbacking:setTopBottom( 0, 0, 0, 33 )
	Meterbacking:setAlpha( 0.5 )
	self:addElement( Meterbacking )
	self.Meterbacking = Meterbacking
	
	local middleBar = LUI.UIImage.new()
	middleBar:setLeftRight( 0, 0, -8, 247 )
	middleBar:setTopBottom( 0, 0, 16, 18 )
	middleBar:setRGB( 0, 0, 0 )
	middleBar:setAlpha( 0 )
	self:addElement( middleBar )
	self.middleBar = middleBar
	
	self.resetProperties = function ()
		Meterbacking:completeAnimation()
		Meterbacking:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Meterbacking:completeAnimation()
				self.Meterbacking:setAlpha( 0.25 )
				self.clipFinished( Meterbacking, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DisplayLevel = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Meterbacking:completeAnimation()
				self.Meterbacking:setAlpha( 0.25 )
				self.clipFinished( Meterbacking, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		MaxLevel = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Meterbacking:completeAnimation()
				self.Meterbacking:setAlpha( 0 )
				self.clipFinished( Meterbacking, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisplayLevel",
			condition = function ( menu, element, event )
				local f8_local0 = IsCurrentMenuWeaponType( menu )
				if f8_local0 then
					f8_local0 = IsCACGunLevelExists( self, element, controller )
					if f8_local0 then
						f8_local0 = not IsCACGunLevelMax( self, element, controller )
					end
				end
				return f8_local0
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				local f9_local0 = IsCurrentMenuWeaponType( menu )
				if f9_local0 then
					f9_local0 = IsCACGunLevelExists( self, element, controller )
					if f9_local0 then
						f9_local0 = IsCACGunLevelMax( self, element, controller )
					end
				end
				return f9_local0
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

