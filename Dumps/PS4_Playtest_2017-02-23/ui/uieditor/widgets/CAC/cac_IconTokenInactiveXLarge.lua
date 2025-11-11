CoD.cac_IconTokenInactiveXLarge = InheritFrom( LUI.UIElement )
CoD.cac_IconTokenInactiveXLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_IconTokenInactiveXLarge )
	self.id = "cac_IconTokenInactiveXLarge"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 396 )
	self:setTopBottom( 0, 0, 0, 387 )
	
	local tokenImage = LUI.UIImage.new()
	tokenImage:setLeftRight( 0, 1, 0, 0 )
	tokenImage:setTopBottom( 0, 1, 0, 0 )
	tokenImage:setImage( RegisterImage( "t7_menu_cac_icontokeninactive" ) )
	self:addElement( tokenImage )
	self.tokenImage = tokenImage
	
	local tokenImageCP = LUI.UIImage.new()
	tokenImageCP:setLeftRight( 0, 1, 0, 0 )
	tokenImageCP:setTopBottom( 0, 1, 0, 0 )
	tokenImageCP:setAlpha( 0 )
	tokenImageCP:setImage( RegisterImage( "uie_t7_menu_cacselection_icontokeninactivexl_cp" ) )
	self:addElement( tokenImageCP )
	self.tokenImageCP = tokenImageCP
	
	self.resetProperties = function ()
		tokenImage:completeAnimation()
		tokenImageCP:completeAnimation()
		tokenImage:setAlpha( 1 )
		tokenImageCP:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				tokenImage:completeAnimation()
				self.tokenImage:setAlpha( 0 )
				self.clipFinished( tokenImage, {} )
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
				tokenImage:completeAnimation()
				self.tokenImage:setAlpha( 0 )
				self.clipFinished( tokenImage, {} )
				tokenImageCP:completeAnimation()
				self.tokenImageCP:setAlpha( 1 )
				self.clipFinished( tokenImageCP, {} )
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

