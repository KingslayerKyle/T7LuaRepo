CoD.LobbyMemberBacking = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberBacking )
	self.id = "LobbyMemberBacking"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -3, 13 )
	Image0:setTopBottom( true, false, -2, 9 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidul" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -3, 13 )
	Image2:setTopBottom( false, true, -9, 2 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidll" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -12, 4 )
	Image1:setTopBottom( true, false, -2, 9 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidur" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -12, 4 )
	Image3:setTopBottom( false, true, -9, 2 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidlr" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 13, -12 )
	Image4:setTopBottom( false, true, -9, 2 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidlm" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 13, -12 )
	Image5:setTopBottom( true, false, -2, 9 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidum" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, -3, 13 )
	Image6:setTopBottom( true, true, 9, -9 )
	Image6:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidml" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( false, true, -12, 4 )
	Image7:setTopBottom( true, true, 9, -9 )
	Image7:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidmr" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 13, -12 )
	Image8:setTopBottom( true, true, 9, -9 )
	Image8:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxsolidmm" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				self.clipFinished( Image4, {} )
				Image5:completeAnimation()
				self.Image5:setAlpha( 0 )
				self.clipFinished( Image5, {} )
				Image6:completeAnimation()
				self.Image6:setAlpha( 0 )
				self.clipFinished( Image6, {} )
				Image7:completeAnimation()
				self.Image7:setAlpha( 0 )
				self.clipFinished( Image7, {} )
				Image8:completeAnimation()
				self.Image8:setAlpha( 0 )
				self.clipFinished( Image8, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

