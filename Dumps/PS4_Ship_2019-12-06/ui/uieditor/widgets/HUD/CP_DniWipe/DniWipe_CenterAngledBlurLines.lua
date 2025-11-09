CoD.DniWipe_CenterAngledBlurLines = InheritFrom( LUI.UIElement )
CoD.DniWipe_CenterAngledBlurLines.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_CenterAngledBlurLines )
	self.id = "DniWipe_CenterAngledBlurLines"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local RGBangleLine = LUI.UIImage.new()
	RGBangleLine:setLeftRight( false, false, 95, 167 )
	RGBangleLine:setTopBottom( false, false, -167, -95 )
	RGBangleLine:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangle" ) )
	RGBangleLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RGBangleLine )
	self.RGBangleLine = RGBangleLine
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -199, -127 )
	Image0:setTopBottom( false, false, -167, -95 )
	Image0:setYRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangle" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, 95, 167 )
	Image1:setTopBottom( false, false, 105.44, 177.44 )
	Image1:setXRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangle" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -199, -127 )
	Image2:setTopBottom( false, false, 105.44, 177.44 )
	Image2:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangle" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local RGBangleLineFrame2 = function ( RGBangleLine, event )
					local RGBangleLineFrame3 = function ( RGBangleLine, event )
						if not event.interrupted then
							RGBangleLine:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
						end
						RGBangleLine:setLeftRight( false, false, 254, 326 )
						RGBangleLine:setTopBottom( false, false, -317, -245 )
						RGBangleLine:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RGBangleLine, event )
						else
							RGBangleLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RGBangleLineFrame3( RGBangleLine, event )
						return 
					else
						RGBangleLine:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RGBangleLine:setAlpha( 1 )
						RGBangleLine:registerEventHandler( "transition_complete_keyframe", RGBangleLineFrame3 )
					end
				end
				
				RGBangleLine:completeAnimation()
				self.RGBangleLine:setLeftRight( false, false, 97, 169 )
				self.RGBangleLine:setTopBottom( false, false, -166, -94 )
				self.RGBangleLine:setAlpha( 0 )
				RGBangleLineFrame2( RGBangleLine, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( false, false, -328, -256 )
						Image0:setTopBottom( false, false, -317, -245 )
						Image0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 1 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -197, -125 )
				self.Image0:setTopBottom( false, false, -166, -94 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
						end
						Image1:setLeftRight( false, false, 254, 326 )
						Image1:setTopBottom( false, false, 243, 315 )
						Image1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image1:setAlpha( 1 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 97, 169 )
				self.Image1:setTopBottom( false, false, 106.44, 178.44 )
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
						end
						Image2:setLeftRight( false, false, -328, -256 )
						Image2:setTopBottom( false, false, 243, 315 )
						Image2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image2:setAlpha( 1 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -197, -125 )
				self.Image2:setTopBottom( false, false, 106.44, 178.44 )
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

