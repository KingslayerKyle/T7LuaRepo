-- 722882b4da6851a0586a387fcdceb26c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 165 )
	self:setTopBottom( true, false, 0, 22 )
	
	local Meterbacking = LUI.UIImage.new()
	Meterbacking:setLeftRight( true, false, 0, 165 )
	Meterbacking:setTopBottom( true, false, 0, 22 )
	Meterbacking:setAlpha( 0.5 )
	self:addElement( Meterbacking )
	self.Meterbacking = Meterbacking
	
	local middleBar = LUI.UIImage.new()
	middleBar:setLeftRight( true, false, -5.31, 165 )
	middleBar:setTopBottom( true, false, 11, 12 )
	middleBar:setRGB( 0, 0, 0 )
	middleBar:setAlpha( 0 )
	self:addElement( middleBar )
	self.middleBar = middleBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Meterbacking:completeAnimation()
				self.Meterbacking:setAlpha( 0.25 )
				self.clipFinished( Meterbacking, {} )
				middleBar:completeAnimation()
				self.middleBar:setAlpha( 0 )
				self.clipFinished( middleBar, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DisplayLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Meterbacking:completeAnimation()
				self.Meterbacking:setAlpha( 0.25 )
				self.clipFinished( Meterbacking, {} )
				middleBar:completeAnimation()
				self.middleBar:setAlpha( 0 )
				self.clipFinished( middleBar, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MaxLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Meterbacking:completeAnimation()
				self.Meterbacking:setAlpha( 0 )
				self.clipFinished( Meterbacking, {} )
				middleBar:completeAnimation()
				self.middleBar:setAlpha( 0 )
				self.clipFinished( middleBar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisplayLevel",
			condition = function ( menu, element, event )
				local f7_local0 = IsCurrentMenuWeaponType( menu )
				if f7_local0 then
					f7_local0 = IsCACGunLevelExists( self, element, controller )
					if f7_local0 then
						f7_local0 = not IsCACGunLevelMax( self, element, controller )
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				local f8_local0 = IsCurrentMenuWeaponType( menu )
				if f8_local0 then
					f8_local0 = IsCACGunLevelExists( self, element, controller )
					if f8_local0 then
						f8_local0 = IsCACGunLevelMax( self, element, controller )
					end
				end
				return f8_local0
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

