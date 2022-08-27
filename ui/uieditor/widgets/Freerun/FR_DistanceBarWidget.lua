-- 2bf0393947d88303d59607b6c97fc06b
-- This hash is used for caching, delete to decompile the file again

CoD.FR_DistanceBarWidget = InheritFrom( LUI.UIElement )
CoD.FR_DistanceBarWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FR_DistanceBarWidget )
	self.id = "FR_DistanceBarWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 547 )
	self:setTopBottom( true, false, 0, 61 )
	
	local DistanceBar = LUI.UIImage.new()
	DistanceBar:setLeftRight( true, false, 0, 546.61 )
	DistanceBar:setTopBottom( true, false, 0, 60.73 )
	DistanceBar:setImage( RegisterImage( "uie_t7_freerun_hud_distancebar" ) )
	self:addElement( DistanceBar )
	self.DistanceBar = DistanceBar
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 6, 45.76 )
	Image0:setTopBottom( true, false, 17.34, 57.1 )
	Image0:setImage( RegisterImage( "uie_t7_freerun_hud_distancebar_self" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 50, 89.76 )
	Image1:setTopBottom( true, false, 17.34, 57.1 )
	Image1:setImage( RegisterImage( "uie_t7_freerun_hud_distancebar_ghost" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Penalty = function ()
				self:setupElementClipCounter( 0 )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			RetryAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			SetCheckpointDelta = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

