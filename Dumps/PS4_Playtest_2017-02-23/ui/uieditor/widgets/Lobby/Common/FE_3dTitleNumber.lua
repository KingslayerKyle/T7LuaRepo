require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleNumberGames" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingA" )

CoD.FE_3dTitleNumber = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleNumber.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 7
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleNumber )
	self.id = "FE_3dTitleNumber"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 564 )
	self:setTopBottom( 0, 0, 0, 43 )
	
	local FELabelSubHeadingA0 = CoD.FE_LabelSubHeadingA.new( menu, controller )
	FELabelSubHeadingA0:setLeftRight( 0, 0, 0.5, 111.5 )
	FELabelSubHeadingA0:setTopBottom( 0, 0, 4, 48 )
	FELabelSubHeadingA0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FELabelSubHeadingA0:setShaderVector( 0, 0.05, 0, 0, 0 )
	FELabelSubHeadingA0:setShaderVector( 1, 0, 0, 0, 0 )
	FELabelSubHeadingA0:setShaderVector( 2, 0, 0, 0, 0 )
	FELabelSubHeadingA0:setShaderVector( 3, 0, 0, 0, 0 )
	FELabelSubHeadingA0:setShaderVector( 4, 0, 0, 0, 0 )
	FELabelSubHeadingA0.Label0:setRGB( 0.71, 0.76, 0.77 )
	FELabelSubHeadingA0.Label0:setText( Engine.Localize( "48,151" ) )
	FELabelSubHeadingA0.Label0:setTTF( "fonts/default.ttf" )
	self:addElement( FELabelSubHeadingA0 )
	self.FELabelSubHeadingA0 = FELabelSubHeadingA0
	
	local FE3dTitleNumberGames0 = CoD.FE_3dTitleNumberGames.new( menu, controller )
	FE3dTitleNumberGames0:setLeftRight( 0, 0, 122, 228 )
	FE3dTitleNumberGames0:setTopBottom( 0, 0, 3, 47 )
	FE3dTitleNumberGames0.Label1:setText( Engine.Localize( "MENU_ONLINE_CAPS" ) )
	FE3dTitleNumberGames0.Label1:setTTF( "fonts/default.ttf" )
	self:addElement( FE3dTitleNumberGames0 )
	self.FE3dTitleNumberGames0 = FE3dTitleNumberGames0
	
	self.resetProperties = function ()
		FELabelSubHeadingA0:completeAnimation()
		FE3dTitleNumberGames0:completeAnimation()
		FELabelSubHeadingA0:setAlpha( 1 )
		FE3dTitleNumberGames0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FELabelSubHeadingA0:completeAnimation()
				self.FELabelSubHeadingA0:setAlpha( 0 )
				self.clipFinished( FELabelSubHeadingA0, {} )
				FE3dTitleNumberGames0:completeAnimation()
				self.FE3dTitleNumberGames0:setAlpha( 0 )
				self.clipFinished( FE3dTitleNumberGames0, {} )
			end
		},
		Hidden2 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FELabelSubHeadingA0:completeAnimation()
				self.FELabelSubHeadingA0:setAlpha( 0 )
				self.clipFinished( FELabelSubHeadingA0, {} )
				FE3dTitleNumberGames0:completeAnimation()
				self.FE3dTitleNumberGames0:setAlpha( 0 )
				self.clipFinished( FE3dTitleNumberGames0, {} )
			end
		},
		Hidden3 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FELabelSubHeadingA0:completeAnimation()
				self.FELabelSubHeadingA0:setAlpha( 0 )
				self.clipFinished( FELabelSubHeadingA0, {} )
				FE3dTitleNumberGames0:completeAnimation()
				self.FE3dTitleNumberGames0:setAlpha( 0 )
				self.clipFinished( FE3dTitleNumberGames0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGameLobby()
			end
		},
		{
			stateName = "Hidden2",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		},
		{
			stateName = "Hidden3",
			condition = function ( menu, element, event )
				return not IsBooleanDvarSet( "groupCountsVisible" )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FELabelSubHeadingA0:close()
		self.FE3dTitleNumberGames0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

