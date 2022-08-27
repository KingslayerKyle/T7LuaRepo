-- b8f6a925be5acbed8ce2e8209728c938
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_Specialist_btn_bg = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_Specialist_btn_bg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_Specialist_btn_bg )
	self.id = "BM_Contracts_Specialist_btn_bg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 40 )
	
	local center = LUI.UIImage.new()
	center:setLeftRight( true, true, 0, -16 )
	center:setTopBottom( true, false, 0, 40 )
	center:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_center" ) )
	self:addElement( center )
	self.center = center
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -16, 0 )
	right:setTopBottom( true, false, 0, 40 )
	right:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_bg_right" ) )
	self:addElement( right )
	self.right = right
	
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

