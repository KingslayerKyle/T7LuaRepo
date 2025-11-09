CoD.RewardsListWidget = InheritFrom( LUI.UIElement )
CoD.RewardsListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RewardsListWidget )
	self.id = "RewardsListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 210 )
	self:setTopBottom( true, false, 0, 210 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( true, true, 0, 0 )
	backgroundImage:setTopBottom( true, true, 0, 0 )
	backgroundImage:setRGB( 0.16, 0.16, 0.16 )
	backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( true, true, 5, -5 )
	iconImage:setTopBottom( true, true, 5, -5 )
	iconImage:setRGB( 1, 1, 1 )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	self.iconImage:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			iconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				backgroundImage:completeAnimation()
				self.backgroundImage:setRGB( 0.16, 0.16, 0.16 )
				self.backgroundImage:setAlpha( 1 )
				self.clipFinished( backgroundImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setLeftRight( true, true, 5, -5 )
				self.iconImage:setTopBottom( true, true, 5, -5 )
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					if not event.interrupted then
						backgroundImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					backgroundImage:setRGB( 0.16, 0.16, 0.16 )
					backgroundImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( backgroundImage, event )
					else
						backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backgroundImage:completeAnimation()
				self.backgroundImage:setRGB( 0.16, 0.16, 0.16 )
				self.backgroundImage:setAlpha( 1 )
				backgroundImageFrame2( backgroundImage, {} )
				local iconImageFrame2 = function ( iconImage, event )
					if not event.interrupted then
						iconImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					iconImage:setLeftRight( true, true, 5, -5 )
					iconImage:setTopBottom( true, true, 5, -5 )
					iconImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( iconImage, event )
					else
						iconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconImage:completeAnimation()
				self.iconImage:setLeftRight( true, true, 5, -5 )
				self.iconImage:setTopBottom( true, true, -40, -50 )
				self.iconImage:setAlpha( 1 )
				iconImageFrame2( iconImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					local backgroundImageFrame3 = function ( backgroundImage, event )
						if not event.interrupted then
							backgroundImage:beginAnimation( "keyframe", 501, false, false, CoD.TweenType.Linear )
						end
						backgroundImage:setRGB( 1, 0.64, 0 )
						backgroundImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( backgroundImage, event )
						else
							backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						backgroundImageFrame3( backgroundImage, event )
						return 
					else
						backgroundImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						backgroundImage:setAlpha( 0.5 )
						backgroundImage:registerEventHandler( "transition_complete_keyframe", backgroundImageFrame3 )
					end
				end
				
				backgroundImage:completeAnimation()
				self.backgroundImage:setRGB( 1, 0.64, 0 )
				self.backgroundImage:setAlpha( 1 )
				backgroundImageFrame2( backgroundImage, {} )
				iconImage:completeAnimation()
				self.iconImage:setLeftRight( true, true, 5, -5 )
				self.iconImage:setTopBottom( true, true, 5, -5 )
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )
				self.nextClip = "Focus"
			end
		}
	}
	self.close = function ( self )
		self.iconImage:close()
		CoD.RewardsListWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

