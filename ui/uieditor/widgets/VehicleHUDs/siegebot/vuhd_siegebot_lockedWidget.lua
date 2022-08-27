-- ab95c44f23c47c8049bef8148132ec92
-- This hash is used for caching, delete to decompile the file again

CoD.vuhd_siegebot_lockedWidget = InheritFrom( LUI.UIElement )
CoD.vuhd_siegebot_lockedWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vuhd_siegebot_lockedWidget )
	self.id = "vuhd_siegebot_lockedWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 67 )
	self:setTopBottom( true, false, 0, 64 )
	
	local LockedIcon0 = LUI.UIImage.new()
	LockedIcon0:setLeftRight( false, false, -33.5, 33.5 )
	LockedIcon0:setTopBottom( false, false, -32, 32 )
	LockedIcon0:setAlpha( 0.8 )
	LockedIcon0:setScale( 0.7 )
	LockedIcon0:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_lockedicon" ) )
	LockedIcon0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( LockedIcon0 )
	self.LockedIcon0 = LockedIcon0
	
	local LockedIcon = LUI.UIImage.new()
	LockedIcon:setLeftRight( false, false, -33.5, 33.5 )
	LockedIcon:setTopBottom( false, false, -32, 32 )
	LockedIcon:setScale( 0.7 )
	LockedIcon:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_lockedicon" ) )
	LockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LockedIcon0:completeAnimation()
				self.LockedIcon0:setAlpha( 0 )
				self.clipFinished( LockedIcon0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local LockedIcon0Frame2 = function ( LockedIcon0, event )
					local LockedIcon0Frame3 = function ( LockedIcon0, event )
						if not event.interrupted then
							LockedIcon0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						end
						LockedIcon0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LockedIcon0, event )
						else
							LockedIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LockedIcon0Frame3( LockedIcon0, event )
						return 
					else
						LockedIcon0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						LockedIcon0:setAlpha( 0.8 )
						LockedIcon0:registerEventHandler( "transition_complete_keyframe", LockedIcon0Frame3 )
					end
				end
				
				LockedIcon0:completeAnimation()
				self.LockedIcon0:setAlpha( 0 )
				LockedIcon0Frame2( LockedIcon0, {} )
				local LockedIconFrame2 = function ( LockedIcon, event )
					local LockedIconFrame3 = function ( LockedIcon, event )
						if not event.interrupted then
							LockedIcon:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						end
						LockedIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LockedIcon, event )
						else
							LockedIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LockedIconFrame3( LockedIcon, event )
						return 
					else
						LockedIcon:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						LockedIcon:setAlpha( 1 )
						LockedIcon:registerEventHandler( "transition_complete_keyframe", LockedIconFrame3 )
					end
				end
				
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				LockedIconFrame2( LockedIcon, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

