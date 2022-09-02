-- f35081e9c6a0ac7c30b7d3cecd9b6f8b
-- This hash is used for caching, delete to decompile the file again

CoD.DniWipe_CenterAngledLines = InheritFrom( LUI.UIElement )
CoD.DniWipe_CenterAngledLines.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_CenterAngledLines )
	self.id = "DniWipe_CenterAngledLines"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local RGBangleLine = LUI.UIImage.new()
	RGBangleLine:setLeftRight( false, false, 147, 219 )
	RGBangleLine:setTopBottom( false, false, -191, -119 )
	RGBangleLine:setAlpha( 0.5 )
	RGBangleLine:setScale( 1.5 )
	RGBangleLine:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangleblur" ) )
	RGBangleLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RGBangleLine )
	self.RGBangleLine = RGBangleLine
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -219, -147 )
	Image0:setTopBottom( false, false, -191, -119 )
	Image0:setAlpha( 0.5 )
	Image0:setYRot( 180 )
	Image0:setScale( 1.5 )
	Image0:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangleblur" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, 147, 219 )
	Image1:setTopBottom( false, false, 120.44, 192.44 )
	Image1:setAlpha( 0.5 )
	Image1:setXRot( 180 )
	Image1:setScale( 1.5 )
	Image1:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangleblur" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -219, -147 )
	Image2:setTopBottom( false, false, 120.44, 192.44 )
	Image2:setAlpha( 0.5 )
	Image2:setScale( 1.5 )
	Image2:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgblineangleblur" ) )
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
							RGBangleLine:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						RGBangleLine:setLeftRight( false, false, 257, 329 )
						RGBangleLine:setTopBottom( false, false, -308, -236 )
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
						RGBangleLine:setAlpha( 0.5 )
						RGBangleLine:registerEventHandler( "transition_complete_keyframe", RGBangleLineFrame3 )
					end
				end
				
				RGBangleLine:completeAnimation()
				self.RGBangleLine:setLeftRight( false, false, 145, 217 )
				self.RGBangleLine:setTopBottom( false, false, -190, -118 )
				self.RGBangleLine:setAlpha( 0 )
				RGBangleLineFrame2( RGBangleLine, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( false, false, -327, -255 )
						Image0:setTopBottom( false, false, -308, -236 )
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
						Image0:setAlpha( 0.5 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -221, -149 )
				self.Image0:setTopBottom( false, false, -190, -118 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						Image1:setLeftRight( false, false, 257, 329 )
						Image1:setTopBottom( false, false, 223.44, 295.44 )
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
						Image1:setAlpha( 0.5 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 145, 217 )
				self.Image1:setTopBottom( false, false, 121.44, 193.44 )
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						Image2:setLeftRight( false, false, -335, -263 )
						Image2:setTopBottom( false, false, 231.44, 303.44 )
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
						Image2:setAlpha( 0.5 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -221, -149 )
				self.Image2:setTopBottom( false, false, 121.44, 193.44 )
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

