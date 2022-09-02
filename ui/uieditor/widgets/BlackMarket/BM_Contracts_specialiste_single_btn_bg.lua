-- 0b08e09b23156dcb8ba7e150e3fadb72
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_specialiste_single_btn_bg = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_specialiste_single_btn_bg.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_specialiste_single_btn_bg )
	self.id = "BM_Contracts_specialiste_single_btn_bg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 95 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( false, true, -15.84, -0.01 )
	Left:setTopBottom( true, false, 0, 40 )
	Left:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_bg_right" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Left0 = LUI.UIImage.new()
	Left0:setLeftRight( true, true, 63.33, -15.84 )
	Left0:setTopBottom( true, false, 0, 40 )
	Left0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_center" ) )
	self:addElement( Left0 )
	self.Left0 = Left0
	
	local Left00 = LUI.UIImage.new()
	Left00:setLeftRight( true, false, 0, 63.33 )
	Left00:setTopBottom( true, false, 0, 40 )
	Left00:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_bg_left" ) )
	self:addElement( Left00 )
	self.Left00 = Left00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

