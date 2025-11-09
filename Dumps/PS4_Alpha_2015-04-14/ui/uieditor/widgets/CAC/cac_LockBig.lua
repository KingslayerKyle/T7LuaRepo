require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.cac_LockBig = InheritFrom( LUI.UIElement )
CoD.cac_LockBig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_LockBig )
	self.id = "cac_LockBig"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 670 )
	self.anyChildUsesUpdateState = true
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 50, 58 )
	LineSide:setTopBottom( true, false, 0, 670 )
	LineSide:setRGB( 1, 1, 1 )
	LineSide:setZRot( 90 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local circles = LUI.UIImage.new()
	circles:setLeftRight( true, false, 0, 96 )
	circles:setTopBottom( true, false, 288.33, 381.67 )
	circles:setRGB( 1, 1, 1 )
	circles:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles )
	self.circles = circles
	
	local lockedIcon0 = CoD.cac_lock.new( menu, controller )
	lockedIcon0:setLeftRight( true, false, 36, 60 )
	lockedIcon0:setTopBottom( false, false, -17, 15 )
	lockedIcon0:setRGB( 1, 1, 1 )
	lockedIcon0.lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon0 )
	self.lockedIcon0 = lockedIcon0
	
	local lockedIcon00 = CoD.cac_lock.new( menu, controller )
	lockedIcon00:setLeftRight( true, false, 18.38, 77.63 )
	lockedIcon00:setTopBottom( false, false, -39.5, 39.5 )
	lockedIcon00:setRGB( 1, 1, 1 )
	lockedIcon00:setAlpha( 0.24 )
	lockedIcon00.lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon00 )
	self.lockedIcon00 = lockedIcon00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local lockedIcon00Frame2 = function ( lockedIcon00, event )
					local lockedIcon00Frame3 = function ( lockedIcon00, event )
						local lockedIcon00Frame4 = function ( lockedIcon00, event )
							local lockedIcon00Frame5 = function ( lockedIcon00, event )
								local lockedIcon00Frame6 = function ( lockedIcon00, event )
									if not event.interrupted then
										lockedIcon00:beginAnimation( "keyframe", 1899, false, false, CoD.TweenType.Linear )
									end
									lockedIcon00:setAlpha( 0 )
									lockedIcon00:setXRot( 360 )
									lockedIcon00:setYRot( 360 )
									lockedIcon00:setZRot( 360 )
									if event.interrupted then
										self.clipFinished( lockedIcon00, event )
									else
										lockedIcon00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									lockedIcon00Frame6( lockedIcon00, event )
									return 
								else
									lockedIcon00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									lockedIcon00:setAlpha( 0 )
									lockedIcon00:registerEventHandler( "transition_complete_keyframe", lockedIcon00Frame6 )
								end
							end
							
							if event.interrupted then
								lockedIcon00Frame5( lockedIcon00, event )
								return 
							else
								lockedIcon00:beginAnimation( "keyframe", 389, true, true, CoD.TweenType.Linear )
								lockedIcon00:setAlpha( 0.05 )
								lockedIcon00:setXRot( 360 )
								lockedIcon00:setYRot( 360 )
								lockedIcon00:setZRot( 360 )
								lockedIcon00:registerEventHandler( "transition_complete_keyframe", lockedIcon00Frame5 )
							end
						end
						
						if event.interrupted then
							lockedIcon00Frame4( lockedIcon00, event )
							return 
						else
							lockedIcon00:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							lockedIcon00:setXRot( 240.97 )
							lockedIcon00:setYRot( 240.97 )
							lockedIcon00:setZRot( 240.97 )
							lockedIcon00:registerEventHandler( "transition_complete_keyframe", lockedIcon00Frame4 )
						end
					end
					
					if event.interrupted then
						lockedIcon00Frame3( lockedIcon00, event )
						return 
					else
						lockedIcon00:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						lockedIcon00:setAlpha( 0.24 )
						lockedIcon00:setXRot( 69.68 )
						lockedIcon00:setYRot( 69.68 )
						lockedIcon00:setZRot( 69.68 )
						lockedIcon00:registerEventHandler( "transition_complete_keyframe", lockedIcon00Frame3 )
					end
				end
				
				lockedIcon00:completeAnimation()
				self.lockedIcon00:setAlpha( 0 )
				self.lockedIcon00:setXRot( 0 )
				self.lockedIcon00:setYRot( 0 )
				self.lockedIcon00:setZRot( 0 )
				lockedIcon00Frame2( lockedIcon00, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.lockedIcon0:close()
		self.lockedIcon00:close()
		CoD.cac_LockBig.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

