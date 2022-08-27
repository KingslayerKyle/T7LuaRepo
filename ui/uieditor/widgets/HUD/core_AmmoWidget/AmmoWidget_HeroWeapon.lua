-- 7640b30f986fa176051c091118a0b164
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_HeroWeapon = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroWeapon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroWeapon )
	self.id = "AmmoWidget_HeroWeapon"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 88 )
	
	local Unavailable = LUI.UIImage.new()
	Unavailable:setLeftRight( false, false, -44, 44 )
	Unavailable:setTopBottom( false, false, -44, 44 )
	Unavailable:setAlpha( 0 )
	Unavailable:subscribeToGlobalModel( controller, "HeroWeapon", "image", function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Unavailable:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Unavailable )
	self.Unavailable = Unavailable
	
	local Available = LUI.UIImage.new()
	Available:setLeftRight( false, false, -44, 44 )
	Available:setTopBottom( false, false, -44, 44 )
	Available:subscribeToGlobalModel( controller, "HeroWeapon", "imageAvailable", function ( model )
		local imageAvailable = Engine.GetModelValue( model )
		if imageAvailable then
			Available:setImage( RegisterImage( imageAvailable ) )
		end
	end )
	self:addElement( Available )
	self.Available = Available
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 1 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 0 )
				self.clipFinished( Available, {} )
			end,
			WheelHide = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 0 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 1 )
				self.clipFinished( Available, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 1 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 0 )
				self.clipFinished( Available, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Unavailable:completeAnimation()
				self.Unavailable:setAlpha( 0 )
				self.clipFinished( Unavailable, {} )
				Available:completeAnimation()
				self.Available:setAlpha( 1 )
				self.clipFinished( Available, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Unavailable:close()
		element.Available:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

