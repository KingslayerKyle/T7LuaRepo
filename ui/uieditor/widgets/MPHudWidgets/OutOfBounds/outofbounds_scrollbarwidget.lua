-- aa0b5bf591e96b05cbc187e0cd637d07
-- This hash is used for caching, delete to decompile the file again

CoD.outofbounds_scrollbarwidget = InheritFrom( LUI.UIElement )
CoD.outofbounds_scrollbarwidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_scrollbarwidget )
	self.id = "outofbounds_scrollbarwidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, 0, 248.38 )
	Image8:setTopBottom( true, false, 0, 40.06 )
	Image8:setRGB( 0.73, 0, 0 )
	Image8:setImage( RegisterImage( "uie_t7_hud_outofbounds_scrollunderbar" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, 0, 248.38 )
	Image9:setTopBottom( true, false, 0, 40.06 )
	Image9:setRGB( 0.73, 0, 0 )
	Image9:setImage( RegisterImage( "uie_t7_hud_outofbounds_scrollbar" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Image8Frame2 = function ( Image8, event )
					local Image8Frame3 = function ( Image8, event )
						if not event.interrupted then
							Image8:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Image8:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image8, event )
						else
							Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image8Frame3( Image8, event )
						return 
					else
						Image8:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Image8:setAlpha( 0.5 )
						Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame3 )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setAlpha( 0.1 )
				Image8Frame2( Image8, {} )
				local Image9Frame2 = function ( Image9, event )
					local Image9Frame3 = function ( Image9, event )
						if not event.interrupted then
							Image9:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Image9:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image9, event )
						else
							Image9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image9Frame3( Image9, event )
						return 
					else
						Image9:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Image9:setAlpha( 0 )
						Image9:registerEventHandler( "transition_complete_keyframe", Image9Frame3 )
					end
				end
				
				Image9:completeAnimation()
				self.Image9:setAlpha( 1 )
				Image9Frame2( Image9, {} )

				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
