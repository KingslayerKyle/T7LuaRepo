CoD.FE_3dTitleBoxOverlay = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleBoxOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleBoxOverlay )
	self.id = "FE_3dTitleBoxOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 739 )
	self:setTopBottom( true, false, 0, 128 )
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 0, 738.62 )
	Image10:setTopBottom( true, false, 0, 128 )
	Image10:setRGB( 0, 0, 0 )
	Image10:setAlpha( 0 )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image10:completeAnimation()
				self.Image10:setLeftRight( true, false, 0, 738.62 )
				self.Image10:setTopBottom( true, false, 0, 128 )
				self.Image10:setAlpha( 0 )
				self.clipFinished( Image10, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 1 )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						if not event.interrupted then
							Image10:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						end
						Image10:setLeftRight( true, false, 2698, 3436.62 )
						Image10:setTopBottom( true, false, 0, 128 )
						Image10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image10, event )
						else
							Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						Image10:setLeftRight( true, false, 0, 738.62 )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setLeftRight( true, false, 0, 738.62 )
				self.Image10:setTopBottom( true, false, 0, 128 )
				self.Image10:setAlpha( 1 )
				Image10Frame2( Image10, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

