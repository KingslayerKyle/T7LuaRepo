require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.LoadingAnimation.StatsLoadingWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

local PreLoadFunc = function ( self, controller )
	local inProgressModel = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" )
	if inProgressModel then
		Engine.SetModelValue( inProgressModel, true )
	end
end

LUI.createMenu.Social_InspectPlayerPopupLoading = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_InspectPlayerPopupLoading" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopupLoading.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Frame0 = LUI.UIFrame.new( self, controller, 0, 0, false )
	Frame0:setLeftRight( 0, 0, 467, 659 )
	Frame0:setTopBottom( 0, 0, 313, 505 )
	Frame0:changeFrameWidget( CoD.StatsLoadingWidget )
	self:addElement( Frame0 )
	self.Frame0 = Frame0
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( self, controller )
	VignetteBack:setLeftRight( 0, 1, 0, 0 )
	VignetteBack:setTopBottom( 0, 1, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 0, 0 )
	darkbg:setTopBottom( 0, 1, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.7 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 1, 0, 0 )
	Black:setTopBottom( 0, 1, 157, -161 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( 0, 0, 20, 1941 )
	TextureBackground:setTopBottom( 0, 0, 0, 1080 )
	TextureBackground:setAlpha( 0.25 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid:setTopBottom( 0.5, 0.5, -381, -369 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd:setTopBottom( 0.5, 0.5, -386, -374 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( 0, 1, -31, 37 )
	FEFocusBarSolid0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( 0, 1, -36, 38 )
	FEFocusBarAdd0:setTopBottom( 0.5, 0.5, 373, 385 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 6, 6 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( 0, 1, 0, 0 )
	buttonBacking:setTopBottom( 1, 1, -221, -167 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0, 0, 80, 728 )
	buttons:setTopBottom( 1, 1, -230, -182 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local StatsLoadingWidget = CoD.StatsLoadingWidget.new( self, controller )
	StatsLoadingWidget:setLeftRight( 0.5, 0.5, -150, 150 )
	StatsLoadingWidget:setTopBottom( 0.5, 0.5, -179, 75 )
	self:addElement( StatsLoadingWidget )
	self.StatsLoadingWidget = StatsLoadingWidget
	
	local ErrorMessage = LUI.UIText.new()
	ErrorMessage:setLeftRight( 0, 1, 96, -96 )
	ErrorMessage:setTopBottom( 0, 0, 519, 557 )
	ErrorMessage:setText( Engine.Localize( "MENU_ERROR_DOWNLOADING_STATS" ) )
	ErrorMessage:setTTF( "fonts/default.ttf" )
	ErrorMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ErrorMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ErrorMessage )
	self.ErrorMessage = ErrorMessage
	
	self.resetProperties = function ()
		ErrorMessage:completeAnimation()
		StatsLoadingWidget:completeAnimation()
		ErrorMessage:setAlpha( 1 )
		StatsLoadingWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ErrorMessage:completeAnimation()
				self.ErrorMessage:setAlpha( 0 )
				self.clipFinished( ErrorMessage, {} )
			end
		},
		Error = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StatsLoadingWidget:completeAnimation()
				self.StatsLoadingWidget:setAlpha( 0 )
				self.clipFinished( StatsLoadingWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Error",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsGlobalModelValueTrue( element, controller, "OtherPlayerStats.InProgress" ) then
					f6_local0 = not IsGlobalModelValueTrue( element, controller, "OtherPlayerStats.Success" )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		} )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		local element = self
		if IsGlobalModelValueTrue( element, controller, "OtherPlayerStats.Success" ) and not IsGlobalModelValueTrue( element, controller, "OtherPlayerStats.InProgress" ) then
			CombatRecordGoBackAndOpenOverlayForPostStatsLoad( self, controller )
		end
	end )
	Frame0.id = "Frame0"
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Frame0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
		self.buttons:close()
		self.StatsLoadingWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopupLoading.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

