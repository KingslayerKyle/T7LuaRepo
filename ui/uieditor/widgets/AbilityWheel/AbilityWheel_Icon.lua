-- 134d66514523f77b2718fd0c94a8a72f
-- This hash is used for caching, delete to decompile the file again

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
	IconImage:setAlpha( RandomAddPercent( -10, 1 ) )
	IconImage:setupUIStreamedImage( 0 )
	IconImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			IconImage:setImage( RegisterImage( image ) )
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
					IconImage:setAlpha( RandomAddPercent( -10, 1 ) )
					if event.interrupted then
						self.clipFinished( IconImage, event )
					else
						IconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconImage:completeAnimation()
				self.IconImage:setAlpha( RandomAddPercent( -10, 1 ) )
				IconImageFrame2( IconImage, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.IconImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

