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
	self:setLeftRight( 0, 0, 0, 315 )
	self:setTopBottom( 0, 0, 0, 315 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( 0, 1, 0, 0 )
	backgroundImage:setTopBottom( 0, 1, 0, 0 )
	backgroundImage:setRGB( 0.16, 0.16, 0.16 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( 0, 1, 8, -8 )
	iconImage:setTopBottom( 0, 1, 8, -8 )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	self.iconImage:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			iconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		iconImage:completeAnimation()
		backgroundImage:completeAnimation()
		iconImage:setLeftRight( 0, 1, 8, -8 )
		iconImage:setTopBottom( 0, 1, 8, -8 )
		backgroundImage:setRGB( 0.16, 0.16, 0.16 )
		backgroundImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local backgroundImageFrame2 = function ( backgroundImage, event )
					if not event.interrupted then
						backgroundImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					backgroundImage:setRGB( 0.16, 0.16, 0.16 )
					if event.interrupted then
						self.clipFinished( backgroundImage, event )
					else
						backgroundImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backgroundImage:completeAnimation()
				self.backgroundImage:setRGB( 0.16, 0.16, 0.16 )
				backgroundImageFrame2( backgroundImage, {} )
				local iconImageFrame2 = function ( iconImage, event )
					if not event.interrupted then
						iconImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					iconImage:setLeftRight( 0, 1, 8, -8 )
					iconImage:setTopBottom( 0, 1, 8, -8 )
					if event.interrupted then
						self.clipFinished( iconImage, event )
					else
						iconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconImage:completeAnimation()
				self.iconImage:setLeftRight( 0, 1, 8, -8 )
				self.iconImage:setTopBottom( 0, 1, -60, -76 )
				iconImageFrame2( iconImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
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
				self.nextClip = "Focus"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.iconImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

