-- f7b8d1fb5ee9de7b8a269f2760d666fd
-- This hash is used for caching, delete to decompile the file again

CoD.lmgInfiniteReticle_Status = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle_Status.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle_Status )
	self.id = "lmgInfiniteReticle_Status"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 133 )
	self:setTopBottom( true, false, 0, 22 )
	
	local FrameTop = LUI.UIImage.new()
	FrameTop:setLeftRight( true, true, 0, 0 )
	FrameTop:setTopBottom( true, false, -1, 7.6 )
	FrameTop:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_frame" ) )
	FrameTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameTop )
	self.FrameTop = FrameTop
	
	local FrameBottom = LUI.UIImage.new()
	FrameBottom:setLeftRight( true, true, 0, 0 )
	FrameBottom:setTopBottom( true, false, 15, 23.6 )
	FrameBottom:setXRot( 180 )
	FrameBottom:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_frame" ) )
	FrameBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameBottom )
	self.FrameBottom = FrameBottom
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( true, false, 8.87, 121.87 )
	Status:setTopBottom( true, false, 3.59, 18.59 )
	Status:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	Status:setTTF( "fonts/default.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	self.clipsPerState = {
		DefaultState = {
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

