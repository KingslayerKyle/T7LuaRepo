CoD.PartyList_ClanBox = InheritFrom( LUI.UIElement )
CoD.PartyList_ClanBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList_ClanBox )
	self.id = "PartyList_ClanBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 35 )
	self:setTopBottom( true, false, 0, 15 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 2.67, -3 )
	Image1:setTopBottom( false, true, -3, -0.33 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxlm" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 2.67 )
	Image2:setTopBottom( false, true, -3, -0.33 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxll" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -3, -0.33 )
	Image3:setTopBottom( false, true, -3, -0.33 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxlr" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 2.67 )
	Image4:setTopBottom( true, true, 2.67, -3 )
	Image4:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxml" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, true, -3, -0.33 )
	Image5:setTopBottom( true, true, 2.67, -3 )
	Image5:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxmr" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 0, 2.67 )
	Image6:setTopBottom( true, false, 0, 2.67 )
	Image6:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxul" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, true, 2.67, -3 )
	Image7:setTopBottom( true, false, 0, 2.67 )
	Image7:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxum" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, true, -3, -0.33 )
	Image8:setTopBottom( true, false, 0, 2.67 )
	Image8:setImage( RegisterImage( "uie_t7_cp_hud_partylist_boxur" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

