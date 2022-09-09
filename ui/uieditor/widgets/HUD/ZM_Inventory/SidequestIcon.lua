-- a352c881a902290e54fc82420387e950
-- This hash is used for caching, delete to decompile the file again

CoD.SidequestIcon = InheritFrom( LUI.UIElement )
CoD.SidequestIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SidequestIcon )
	self.id = "SidequestIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 89 )
	self:setTopBottom( true, false, 0, 89 )
	
	local ClipGlowTop = LUI.UIImage.new()
	ClipGlowTop:setLeftRight( true, true, -5.1, 5.1 )
	ClipGlowTop:setTopBottom( true, true, -4, 7.75 )
	ClipGlowTop:setRGB( 0.33, 0.54, 1 )
	ClipGlowTop:setAlpha( 0.4 )
	ClipGlowTop:setZRot( -4 )
	ClipGlowTop:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ClipGlowTop )
	self.ClipGlowTop = ClipGlowTop
	
	local ClipGlow = LUI.UIImage.new()
	ClipGlow:setLeftRight( true, true, 2, -1.22 )
	ClipGlow:setTopBottom( true, true, 0.75, -0.75 )
	ClipGlow:setRGB( 0, 0.53, 0.82 )
	ClipGlow:setAlpha( 0 )
	ClipGlow:setZRot( -4 )
	ClipGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	ClipGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ClipGlow )
	self.ClipGlow = ClipGlow
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	self:addElement( image )
	self.image = image
	
	self.image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			image:setImage( RegisterImage( icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setAlpha( 0 )
				self.clipFinished( ClipGlowTop, {} )

				ClipGlow:completeAnimation()
				self.ClipGlow:setAlpha( 0 )
				self.clipFinished( ClipGlow, {} )

				image:completeAnimation()
				self.image:setAlpha( 0 )
				self.clipFinished( image, {} )
			end
		},
		NewIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setAlpha( 0.5 )
				self.clipFinished( ClipGlowTop, {} )

				ClipGlow:completeAnimation()
				self.ClipGlow:setAlpha( 0.1 )
				self.clipFinished( ClipGlow, {} )

				image:completeAnimation()
				self.image:setAlpha( 1 )
				self.clipFinished( image, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NewIcon",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "newIcon", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "newIcon", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "newIcon"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
