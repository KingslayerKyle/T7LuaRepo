CoD.LobbyMemberBackingMask = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBackingMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LobbyMemberBackingMask )
	self.id = "LobbyMemberBackingMask"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -5, 11 )
	Image0:setTopBottom( true, false, -3, 8 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskul" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -5, 11 )
	Image2:setTopBottom( false, true, -8, 3 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskll" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -11, 5 )
	Image1:setTopBottom( true, false, -3, 8 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskur" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -11, 5 )
	Image3:setTopBottom( false, true, -8, 3 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmasklr" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 11, -11 )
	Image4:setTopBottom( false, true, -8, 3 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmasklm" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 11, -11 )
	Image5:setTopBottom( true, false, -3, 8 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskum" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, -5, 11 )
	Image6:setTopBottom( true, true, 8, -8 )
	Image6:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskml" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( false, true, -11, 5 )
	Image7:setTopBottom( true, true, 8, -8 )
	Image7:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskmr" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 11, -11 )
	Image8:setTopBottom( true, true, 8, -8 )
	Image8:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskmm" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 1 )
				self.clipFinished( Image4, {} )
				Image5:completeAnimation()
				self.Image5:setAlpha( 1 )
				self.clipFinished( Image5, {} )
				Image6:completeAnimation()
				self.Image6:setAlpha( 1 )
				self.clipFinished( Image6, {} )
				Image7:completeAnimation()
				self.Image7:setAlpha( 1 )
				self.clipFinished( Image7, {} )
				Image8:completeAnimation()
				self.Image8:setAlpha( 1 )
				self.clipFinished( Image8, {} )
			end
		},
		PlayerCountState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		AddControllerState = {
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
	self:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return IsPlayerCountItem( element )
			end
		},
		{
			stateName = "AddControllerState",
			condition = function ( menu, element, event )
				return IsAddControllerTextItem( element )
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

