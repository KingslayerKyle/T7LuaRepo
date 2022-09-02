-- 88229c19a0970089d289eaee5aad1002
-- This hash is used for caching, delete to decompile the file again

CoD.FE_TitleElemForeC = InheritFrom( LUI.UIElement )
CoD.FE_TitleElemForeC.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleElemForeC )
	self.id = "FE_TitleElemForeC"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 65 )
	
	local forec = LUI.UIImage.new()
	forec:setLeftRight( true, false, -6, 10 )
	forec:setTopBottom( true, false, 0, 65.33 )
	forec:setZoom( 10 )
	forec:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthicka" ) )
	forec:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( forec )
	self.forec = forec
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local forecFrame2 = function ( forec, event )
					local forecFrame3 = function ( forec, event )
						local forecFrame4 = function ( forec, event )
							local forecFrame5 = function ( forec, event )
								if not event.interrupted then
									forec:beginAnimation( "keyframe", 4720, true, true, CoD.TweenType.Linear )
								end
								forec:setLeftRight( true, false, 0, 16 )
								forec:setTopBottom( true, false, 0, 65.33 )
								if event.interrupted then
									self.clipFinished( forec, event )
								else
									forec:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								forecFrame5( forec, event )
								return 
							else
								forec:beginAnimation( "keyframe", 2279, false, false, CoD.TweenType.Linear )
								forec:registerEventHandler( "transition_complete_keyframe", forecFrame5 )
							end
						end
						
						if event.interrupted then
							forecFrame4( forec, event )
							return 
						else
							forec:beginAnimation( "keyframe", 3280, true, true, CoD.TweenType.Linear )
							forec:setLeftRight( true, false, -6, 10 )
							forec:registerEventHandler( "transition_complete_keyframe", forecFrame4 )
						end
					end
					
					if event.interrupted then
						forecFrame3( forec, event )
						return 
					else
						forec:beginAnimation( "keyframe", 3059, false, false, CoD.TweenType.Linear )
						forec:registerEventHandler( "transition_complete_keyframe", forecFrame3 )
					end
				end
				
				forec:completeAnimation()
				self.forec:setLeftRight( true, false, 0, 16 )
				self.forec:setTopBottom( true, false, 0, 65.33 )
				forecFrame2( forec, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

