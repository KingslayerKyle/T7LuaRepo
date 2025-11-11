CoD.SystemOverlaySpinner = InheritFrom( LUI.UIElement )
CoD.SystemOverlaySpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SystemOverlaySpinner )
	self.id = "SystemOverlaySpinner"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 448 )
	self:setTopBottom( 0, 0, 0, 21 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0.32, 0, 0 )
	Image1:setTopBottom( 0, 1, 0, 0 )
	Image1:setRGB( 1, 0.68, 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0.34, 0.66, 0, 0 )
	Image10:setTopBottom( 0, 1, 0, 0 )
	Image10:setRGB( 1, 0.68, 0 )
	Image10:setAlpha( 0.5 )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( 0.68, 1, 0, 0 )
	Image100:setTopBottom( 0, 1, 0, 0 )
	Image100:setRGB( 1, 0.68, 0 )
	Image100:setAlpha( 0.25 )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	self.resetProperties = function ()
		Image1:completeAnimation()
		Image10:completeAnimation()
		Image100:completeAnimation()
		Image1:setAlpha( 1 )
		Image10:setAlpha( 0.5 )
		Image100:setAlpha( 0.25 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								if not event.interrupted then
									Image1:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								end
								Image1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image1, event )
								else
									Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 100, true, false, CoD.TweenType.Linear )
							Image1:setAlpha( 0.7 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Linear )
						Image1:setAlpha( 0.07 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						local Image10Frame4 = function ( Image10, event )
							local Image10Frame5 = function ( Image10, event )
								if not event.interrupted then
									Image10:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								end
								Image10:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image10, event )
								else
									Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image10Frame5( Image10, event )
								return 
							else
								Image10:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame5 )
							end
						end
						
						if event.interrupted then
							Image10Frame4( Image10, event )
							return 
						else
							Image10:beginAnimation( "keyframe", 110, true, false, CoD.TweenType.Linear )
							Image10:setAlpha( 0.5 )
							Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame4 )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 0 )
				Image10Frame2( Image10, {} )
				local Image100Frame2 = function ( Image100, event )
					local Image100Frame3 = function ( Image100, event )
						local Image100Frame4 = function ( Image100, event )
							local Image100Frame5 = function ( Image100, event )
								if not event.interrupted then
									Image100:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								end
								Image100:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image100, event )
								else
									Image100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image100Frame5( Image100, event )
								return 
							else
								Image100:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								Image100:registerEventHandler( "transition_complete_keyframe", Image100Frame5 )
							end
						end
						
						if event.interrupted then
							Image100Frame4( Image100, event )
							return 
						else
							Image100:beginAnimation( "keyframe", 89, true, false, CoD.TweenType.Linear )
							Image100:setAlpha( 0.25 )
							Image100:registerEventHandler( "transition_complete_keyframe", Image100Frame4 )
						end
					end
					
					if event.interrupted then
						Image100Frame3( Image100, event )
						return 
					else
						Image100:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						Image100:registerEventHandler( "transition_complete_keyframe", Image100Frame3 )
					end
				end
				
				Image100:completeAnimation()
				self.Image100:setAlpha( 0 )
				Image100Frame2( Image100, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

