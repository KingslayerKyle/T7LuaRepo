-- 3fc0dae3711d7d5ccee99111555d4d28
-- This hash is used for caching, delete to decompile the file again

CoD.outofbounds_timerwidget = InheritFrom( LUI.UIElement )
CoD.outofbounds_timerwidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_timerwidget )
	self.id = "outofbounds_timerwidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 107 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Timer0 = LUI.UITightText.new()
	Timer0:setLeftRight( false, false, -53.5, 53.5 )
	Timer0:setTopBottom( false, false, -24, 24 )
	Timer0:setAlpha( 0.9 )
	Timer0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Timer0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Timer0:setShaderVector( 0, 0.1, 0, 0, 0 )
	Timer0:setShaderVector( 1, 0, 0, 0, 0 )
	Timer0:setShaderVector( 2, 0, 0, 0, 0 )
	Timer0:setShaderVector( 3, 0, 0, 0, 0 )
	Timer0:setShaderVector( 4, 0, 0, 0, 0 )
	Timer0:subscribeToGlobalModel( controller, "HUDItems", "outOfBoundsEndTime", function ( model )
		local outOfBoundsEndTime = Engine.GetModelValue( model )
		if outOfBoundsEndTime then
			Timer0:setupEndTimer( outOfBoundsEndTime )
		end
	end )
	self:addElement( Timer0 )
	self.Timer0 = Timer0
	
	local Timer00 = LUI.UITightText.new()
	Timer00:setLeftRight( false, false, -53.5, 53.5 )
	Timer00:setTopBottom( false, false, -24, 24 )
	Timer00:setRGB( 0.65, 0, 0 )
	Timer00:setAlpha( 0 )
	Timer00:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Timer00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Timer00:setShaderVector( 0, 0.1, 0, 0, 0 )
	Timer00:setShaderVector( 1, 0, 0, 0, 0 )
	Timer00:setShaderVector( 2, 0, 0, 0, 0 )
	Timer00:setShaderVector( 3, 0, 0, 0, 0 )
	Timer00:setShaderVector( 4, 0, 0, 0, 0 )
	Timer00:subscribeToGlobalModel( controller, "HUDItems", "outOfBoundsEndTime", function ( model )
		local outOfBoundsEndTime = Engine.GetModelValue( model )
		if outOfBoundsEndTime then
			Timer00:setupEndTimer( outOfBoundsEndTime )
		end
	end )
	self:addElement( Timer00 )
	self.Timer00 = Timer00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Timer0:completeAnimation()
				self.Timer0:setLeftRight( false, false, -53.5, 53.5 )
				self.Timer0:setTopBottom( false, false, -24, 24 )
				self.Timer0:setAlpha( 1 )
				self.clipFinished( Timer0, {} )
				local Timer00Frame2 = function ( Timer00, event )
					local Timer00Frame3 = function ( Timer00, event )
						local Timer00Frame4 = function ( Timer00, event )
							if not event.interrupted then
								Timer00:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							Timer00:setRGB( 0.65, 0, 0 )
							Timer00:setAlpha( 1 )
							Timer00:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Timer00, event )
							else
								Timer00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Timer00Frame4( Timer00, event )
							return 
						else
							Timer00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							Timer00:setScale( 1 )
							Timer00:registerEventHandler( "transition_complete_keyframe", Timer00Frame4 )
						end
					end
					
					if event.interrupted then
						Timer00Frame3( Timer00, event )
						return 
					else
						Timer00:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						Timer00:setAlpha( 0 )
						Timer00:setScale( 2 )
						Timer00:registerEventHandler( "transition_complete_keyframe", Timer00Frame3 )
					end
				end
				
				Timer00:completeAnimation()
				self.Timer00:setRGB( 0.65, 0, 0 )
				self.Timer00:setAlpha( 1 )
				self.Timer00:setScale( 1 )
				Timer00Frame2( Timer00, {} )
				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Timer0:close()
		element.Timer00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

