CoD.AbilityWheel_Icon = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Icon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Icon )
	self.id = "AbilityWheel_Icon"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 62 )
	
	local IconImage = LUI.UIImage.new()
	IconImage:setLeftRight( true, true, 6, -6 )
	IconImage:setTopBottom( true, true, 6, -6 )
	IconImage:setRGB( 1, 1, 1 )
	IconImage:setAlpha( RandomAddPercent( 1, -10 ) )
	IconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	IconImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( IconImage )
	self.IconImage = IconImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local IconImageFrame2 = function ( IconImage, event )
					if not event.interrupted then
						IconImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					IconImage:setAlpha( RandomAddPercent( 1, -10 ) )
					if event.interrupted then
						self.clipFinished( IconImage, event )
					else
						IconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconImage:completeAnimation()
				self.IconImage:setAlpha( RandomAddPercent( 1, -10 ) )
				IconImageFrame2( IconImage, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.IconImage:close()
		CoD.AbilityWheel_Icon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

