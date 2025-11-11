CoD.EscalationItemSelectButtons = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelectButtons.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelectButtons )
	self.id = "EscalationItemSelectButtons"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local glow1 = LUI.UIImage.new()
	glow1:setLeftRight( 0, 0, 0, 1920 )
	glow1:setTopBottom( 0, 0, -31, 545 )
	glow1:setRGB( 0.45, 0.95, 1 )
	glow1:setAlpha( 0.8 )
	glow1:setImage( RegisterImage( "uie_menu_loadout_screenglow" ) )
	glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow1 )
	self.glow1 = glow1
	
	local glow12 = LUI.UIImage.new()
	glow12:setLeftRight( 0, 0, 0, 1920 )
	glow12:setTopBottom( 0, 0, 547, 1123 )
	glow12:setRGB( 0.45, 0.95, 1 )
	glow12:setAlpha( 0.8 )
	glow12:setXRot( 180 )
	glow12:setImage( RegisterImage( "uie_menu_loadout_screenglow" ) )
	glow12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow12 )
	self.glow12 = glow12
	
	self.resetProperties = function ()
		glow12:completeAnimation()
		glow1:completeAnimation()
		glow12:setAlpha( 0.8 )
		glow1:setLeftRight( 0, 0, 0, 1920 )
		glow1:setTopBottom( 0, 0, -31, 545 )
		glow1:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Top = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local glow1Frame2 = function ( glow1, event )
					local glow1Frame3 = function ( glow1, event )
						local glow1Frame4 = function ( glow1, event )
							if not event.interrupted then
								glow1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							end
							glow1:setLeftRight( 0, 0, 0, 1920 )
							glow1:setTopBottom( 0, 0, -28, 548 )
							glow1:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( glow1, event )
							else
								glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							glow1Frame4( glow1, event )
							return 
						else
							glow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							glow1:setAlpha( 0.6 )
							glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame4 )
						end
					end
					
					if event.interrupted then
						glow1Frame3( glow1, event )
						return 
					else
						glow1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						glow1:setAlpha( 1.1 )
						glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame3 )
					end
				end
				
				glow1:completeAnimation()
				self.glow1:setLeftRight( 0, 0, 0, 1920 )
				self.glow1:setTopBottom( 0, 0, -28, 548 )
				self.glow1:setAlpha( 0 )
				glow1Frame2( glow1, {} )
				glow12:completeAnimation()
				self.glow12:setAlpha( 0 )
				self.clipFinished( glow12, {} )
			end
		},
		Bottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				glow1:completeAnimation()
				self.glow1:setAlpha( 0 )
				self.clipFinished( glow1, {} )
				local glow12Frame2 = function ( glow12, event )
					local glow12Frame3 = function ( glow12, event )
						local glow12Frame4 = function ( glow12, event )
							if not event.interrupted then
								glow12:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							end
							glow12:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( glow12, event )
							else
								glow12:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							glow12Frame4( glow12, event )
							return 
						else
							glow12:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							glow12:setAlpha( 0.6 )
							glow12:registerEventHandler( "transition_complete_keyframe", glow12Frame4 )
						end
					end
					
					if event.interrupted then
						glow12Frame3( glow12, event )
						return 
					else
						glow12:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						glow12:setAlpha( 1.1 )
						glow12:registerEventHandler( "transition_complete_keyframe", glow12Frame3 )
					end
				end
				
				glow12:completeAnimation()
				self.glow12:setAlpha( 0 )
				glow12Frame2( glow12, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

