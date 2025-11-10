CoD.ShockCharge = InheritFrom( LUI.UIElement )
CoD.ShockCharge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ShockCharge )
	self.id = "ShockCharge"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local shockImageBottom = LUI.UIImage.new()
	shockImageBottom:setLeftRight( false, false, -640, 640 )
	shockImageBottom:setTopBottom( false, false, 0, 360 )
	shockImageBottom:setAlpha( 0 )
	shockImageBottom:subscribeToGlobalModel( controller, "HUDItems", "shockImageBottom", function ( model )
		local _shockImageBottom = Engine.GetModelValue( model )
		if _shockImageBottom then
			shockImageBottom:setImage( RegisterImage( _shockImageBottom ) )
		end
	end )
	self:addElement( shockImageBottom )
	self.shockImageBottom = shockImageBottom
	
	local shockImageRight = LUI.UIImage.new()
	shockImageRight:setLeftRight( false, false, 0, 640 )
	shockImageRight:setTopBottom( false, false, -360, 360 )
	shockImageRight:setAlpha( 0 )
	shockImageRight:subscribeToGlobalModel( controller, "HUDItems", "shockImageRight", function ( model )
		local _shockImageRight = Engine.GetModelValue( model )
		if _shockImageRight then
			shockImageRight:setImage( RegisterImage( _shockImageRight ) )
		end
	end )
	self:addElement( shockImageRight )
	self.shockImageRight = shockImageRight
	
	local shockImageLeft = LUI.UIImage.new()
	shockImageLeft:setLeftRight( false, false, -640, 0 )
	shockImageLeft:setTopBottom( false, false, -360, 360 )
	shockImageLeft:setAlpha( 0 )
	shockImageLeft:setYRot( 180 )
	shockImageLeft:subscribeToGlobalModel( controller, "HUDItems", "shockImageLeft", function ( model )
		local _shockImageLeft = Engine.GetModelValue( model )
		if _shockImageLeft then
			shockImageLeft:setImage( RegisterImage( _shockImageLeft ) )
		end
	end )
	self:addElement( shockImageLeft )
	self.shockImageLeft = shockImageLeft
	
	local shockImageTop = LUI.UIImage.new()
	shockImageTop:setLeftRight( false, false, -640, 640 )
	shockImageTop:setTopBottom( false, false, -360, 0 )
	shockImageTop:setAlpha( 0 )
	shockImageTop:setYRot( 180 )
	shockImageTop:setZRot( 180 )
	shockImageTop:subscribeToGlobalModel( controller, "HUDItems", "shockImageTop", function ( model )
		local _shockImageTop = Engine.GetModelValue( model )
		if _shockImageTop then
			shockImageTop:setImage( RegisterImage( _shockImageTop ) )
		end
	end )
	self:addElement( shockImageTop )
	self.shockImageTop = shockImageTop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				shockImageBottom:completeAnimation()
				self.shockImageBottom:setAlpha( 0 )
				self.clipFinished( shockImageBottom, {} )
				shockImageRight:completeAnimation()
				self.shockImageRight:setAlpha( 0 )
				self.clipFinished( shockImageRight, {} )
				shockImageLeft:completeAnimation()
				self.shockImageLeft:setAlpha( 0 )
				self.clipFinished( shockImageLeft, {} )
				shockImageTop:completeAnimation()
				self.shockImageTop:setAlpha( 0 )
				self.clipFinished( shockImageTop, {} )
			end
		},
		ShockTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local shockImageTopFrame2 = function ( shockImageTop, event )
					local shockImageTopFrame3 = function ( shockImageTop, event )
						if not event.interrupted then
							shockImageTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						shockImageTop:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( shockImageTop, event )
						else
							shockImageTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shockImageTopFrame3( shockImageTop, event )
						return 
					else
						shockImageTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						shockImageTop:setAlpha( 0.91 )
						shockImageTop:registerEventHandler( "transition_complete_keyframe", shockImageTopFrame3 )
					end
				end
				
				shockImageTop:completeAnimation()
				self.shockImageTop:setAlpha( 0 )
				shockImageTopFrame2( shockImageTop, {} )
				self.nextClip = "DefaultClip"
			end
		},
		ShockLeft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local shockImageLeftFrame2 = function ( shockImageLeft, event )
					local shockImageLeftFrame3 = function ( shockImageLeft, event )
						if not event.interrupted then
							shockImageLeft:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						shockImageLeft:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( shockImageLeft, event )
						else
							shockImageLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shockImageLeftFrame3( shockImageLeft, event )
						return 
					else
						shockImageLeft:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						shockImageLeft:setAlpha( 0.91 )
						shockImageLeft:registerEventHandler( "transition_complete_keyframe", shockImageLeftFrame3 )
					end
				end
				
				shockImageLeft:completeAnimation()
				self.shockImageLeft:setAlpha( 0 )
				shockImageLeftFrame2( shockImageLeft, {} )
				self.nextClip = "DefaultClip"
			end
		},
		ShockRight = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local shockImageRightFrame2 = function ( shockImageRight, event )
					local shockImageRightFrame3 = function ( shockImageRight, event )
						if not event.interrupted then
							shockImageRight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						shockImageRight:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( shockImageRight, event )
						else
							shockImageRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shockImageRightFrame3( shockImageRight, event )
						return 
					else
						shockImageRight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						shockImageRight:setAlpha( 0.91 )
						shockImageRight:registerEventHandler( "transition_complete_keyframe", shockImageRightFrame3 )
					end
				end
				
				shockImageRight:completeAnimation()
				self.shockImageRight:setAlpha( 0 )
				shockImageRightFrame2( shockImageRight, {} )
				self.nextClip = "DefaultClip"
			end
		},
		ShockBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local shockImageBottomFrame2 = function ( shockImageBottom, event )
					local shockImageBottomFrame3 = function ( shockImageBottom, event )
						if not event.interrupted then
							shockImageBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						shockImageBottom:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( shockImageBottom, event )
						else
							shockImageBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shockImageBottomFrame3( shockImageBottom, event )
						return 
					else
						shockImageBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						shockImageBottom:setAlpha( 0.91 )
						shockImageBottom:registerEventHandler( "transition_complete_keyframe", shockImageBottomFrame3 )
					end
				end
				
				shockImageBottom:completeAnimation()
				self.shockImageBottom:setAlpha( 0 )
				shockImageBottomFrame2( shockImageBottom, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.shockImageBottom:close()
		element.shockImageRight:close()
		element.shockImageLeft:close()
		element.shockImageTop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

