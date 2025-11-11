CoD.cac_IconTokenXLarge = InheritFrom( LUI.UIElement )
CoD.cac_IconTokenXLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_IconTokenXLarge )
	self.id = "cac_IconTokenXLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 97 )
	
	local Token = LUI.UIImage.new()
	Token:setLeftRight( 0, 1, 0, 0 )
	Token:setTopBottom( 0, 1, 0, 0 )
	Token:setImage( RegisterImage( "uie_img_t7_menu_welcome_icontokenxlarge" ) )
	self:addElement( Token )
	self.Token = Token
	
	local TokenCP = LUI.UIImage.new()
	TokenCP:setLeftRight( 0, 1, 0, 0 )
	TokenCP:setTopBottom( 0, 1, 0, 0 )
	TokenCP:setAlpha( 0 )
	TokenCP:setImage( RegisterImage( "uie_img_t7_menu_welcome_icontokenxlarge_cp" ) )
	self:addElement( TokenCP )
	self.TokenCP = TokenCP
	
	self.resetProperties = function ()
		Token:completeAnimation()
		TokenCP:completeAnimation()
		Token:setAlpha( 1 )
		TokenCP:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Token:completeAnimation()
				self.Token:setAlpha( 0 )
				self.clipFinished( Token, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		VisibleCP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Token:completeAnimation()
				self.Token:setAlpha( 0 )
				self.clipFinished( Token, {} )
				TokenCP:completeAnimation()
				self.TokenCP:setAlpha( 1 )
				self.clipFinished( TokenCP, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsCampaign()
			end
		},
		{
			stateName = "VisibleCP",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

