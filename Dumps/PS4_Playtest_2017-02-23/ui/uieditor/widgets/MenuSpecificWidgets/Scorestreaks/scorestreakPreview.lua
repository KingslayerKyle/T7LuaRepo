require( "ui.uieditor.widgets.CAC.cac_LockBig" )

CoD.scorestreakPreview = InheritFrom( LUI.UIElement )
CoD.scorestreakPreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreakPreview )
	self.id = "scorestreakPreview"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 483 )
	self:setTopBottom( 0, 0, 0, 705 )
	self.anyChildUsesUpdateState = true
	
	local highlightedImage = LUI.UIImage.new()
	highlightedImage:setLeftRight( 0.5, 0.5, -241.5, 241.5 )
	highlightedImage:setTopBottom( 1, 1, -516, -32 )
	highlightedImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			highlightedImage:setImage( RegisterImage( AppendString( "_menu_large", GetItemImageFromIndexByMode( 1, modelValue ) ) ) )
		end
	end )
	self:addElement( highlightedImage )
	self.highlightedImage = highlightedImage
	
	local lockedIcon = CoD.cac_LockBig.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -72, 72 )
	lockedIcon:setTopBottom( 0, 1, 0, 0 )
	lockedIcon.circles:setRGB( 0.26, 0.89, 1 )
	lockedIcon:linkToElementModel( self, nil, false, function ( model )
		lockedIcon:setModel( model, controller )
	end )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		highlightedImage:completeAnimation()
		lockedIcon:setAlpha( 1 )
		highlightedImage:setRGB( 1, 1, 1 )
		highlightedImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local highlightedImageFrame2 = function ( highlightedImage, event )
					if not event.interrupted then
						highlightedImage:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Bounce )
					end
					highlightedImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( highlightedImage, event )
					else
						highlightedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlightedImage:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				self.highlightedImage:setAlpha( 0 )
				highlightedImage:registerEventHandler( "transition_complete_keyframe", highlightedImageFrame2 )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				highlightedImage:completeAnimation()
				self.highlightedImage:setAlpha( 0 )
				self.clipFinished( highlightedImage, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				highlightedImage:completeAnimation()
				self.highlightedImage:setRGB( 0.26, 0.89, 1 )
				self.highlightedImage:setAlpha( 0.4 )
				self.clipFinished( highlightedImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsCACItemPurchased( element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lockedIcon:close()
		self.highlightedImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

