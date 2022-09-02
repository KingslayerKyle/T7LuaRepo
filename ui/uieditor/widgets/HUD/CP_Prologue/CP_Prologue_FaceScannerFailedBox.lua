-- 11364cfb6201b55793c2af87d5c71751
-- This hash is used for caching, delete to decompile the file again

CoD.CP_Prologue_FaceScannerFailedBox = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScannerFailedBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScannerFailedBox )
	self.id = "CP_Prologue_FaceScannerFailedBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 191 )
	self:setTopBottom( true, false, 0, 238 )
	
	local FailedBox = LUI.UIImage.new()
	FailedBox:setLeftRight( true, false, 0, 190.5 )
	FailedBox:setTopBottom( true, false, 0, 238 )
	FailedBox:setRGB( 1, 0, 0 )
	FailedBox:setAlpha( 0.15 )
	FailedBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FailedBox )
	self.FailedBox = FailedBox
	
	local targetSmall2 = LUI.UIImage.new()
	targetSmall2:setLeftRight( true, false, -53.05, 243.55 )
	targetSmall2:setTopBottom( true, false, -49.21, 247.38 )
	targetSmall2:setScale( 0.8 )
	targetSmall2:setImage( RegisterImage( "uie_t7_hud_target_mortararea_planted" ) )
	targetSmall2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( targetSmall2 )
	self.targetSmall2 = targetSmall2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local FailedBoxFrame2 = function ( FailedBox, event )
					local FailedBoxFrame3 = function ( FailedBox, event )
						if not event.interrupted then
							FailedBox:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						FailedBox:setAlpha( 0.15 )
						if event.interrupted then
							self.clipFinished( FailedBox, event )
						else
							FailedBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FailedBoxFrame3( FailedBox, event )
						return 
					else
						FailedBox:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FailedBox:setAlpha( 0.05 )
						FailedBox:registerEventHandler( "transition_complete_keyframe", FailedBoxFrame3 )
					end
				end
				
				FailedBox:completeAnimation()
				self.FailedBox:setAlpha( 0.15 )
				FailedBoxFrame2( FailedBox, {} )
				local targetSmall2Frame2 = function ( targetSmall2, event )
					local targetSmall2Frame3 = function ( targetSmall2, event )
						local targetSmall2Frame4 = function ( targetSmall2, event )
							local targetSmall2Frame5 = function ( targetSmall2, event )
								local targetSmall2Frame6 = function ( targetSmall2, event )
									if not event.interrupted then
										targetSmall2:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
									end
									targetSmall2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( targetSmall2, event )
									else
										targetSmall2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									targetSmall2Frame6( targetSmall2, event )
									return 
								else
									targetSmall2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									targetSmall2:setAlpha( 0 )
									targetSmall2:registerEventHandler( "transition_complete_keyframe", targetSmall2Frame6 )
								end
							end
							
							if event.interrupted then
								targetSmall2Frame5( targetSmall2, event )
								return 
							else
								targetSmall2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								targetSmall2:setAlpha( 0.5 )
								targetSmall2:registerEventHandler( "transition_complete_keyframe", targetSmall2Frame5 )
							end
						end
						
						if event.interrupted then
							targetSmall2Frame4( targetSmall2, event )
							return 
						else
							targetSmall2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							targetSmall2:setAlpha( 0 )
							targetSmall2:registerEventHandler( "transition_complete_keyframe", targetSmall2Frame4 )
						end
					end
					
					if event.interrupted then
						targetSmall2Frame3( targetSmall2, event )
						return 
					else
						targetSmall2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						targetSmall2:setAlpha( 0.5 )
						targetSmall2:registerEventHandler( "transition_complete_keyframe", targetSmall2Frame3 )
					end
				end
				
				targetSmall2:completeAnimation()
				self.targetSmall2:setAlpha( 0 )
				targetSmall2Frame2( targetSmall2, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Failed = {
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

