-- 34d3cf6cd249b033a29a3b284119a4ff
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.LoadingAnimation.StatsLoadingWidget" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" )
	if f1_local0 then
		Engine.SetModelValue( f1_local0, true )
	end
end

LUI.createMenu.Social_InspectPlayerPopupLoading = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Social_InspectPlayerPopupLoading" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopupLoading.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( f2_local1, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	VignetteBack:setAlpha( 0.75 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 0, 0 )
	darkbg:setTopBottom( true, true, 0, 0 )
	darkbg:setRGB( 0.12, 0.12, 0.12 )
	darkbg:setAlpha( 0.7 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0, 0 )
	Black:setTopBottom( true, true, 105, -107 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.9 )
	self:addElement( Black )
	self.Black = Black
	
	local TextureBackground = LUI.UIImage.new()
	TextureBackground:setLeftRight( true, false, 13.5, 1294 )
	TextureBackground:setTopBottom( true, false, 0, 720 )
	TextureBackground:setAlpha( 0.25 )
	TextureBackground:setImage( RegisterImage( "uie_t7_menu_welcome_bg2" ) )
	self:addElement( TextureBackground )
	self.TextureBackground = TextureBackground
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid:setTopBottom( false, false, -254, -246 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd:setTopBottom( false, false, -257, -249 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	local FEFocusBarSolid0 = LUI.UIImage.new()
	FEFocusBarSolid0:setLeftRight( true, true, -21, 25 )
	FEFocusBarSolid0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarSolid0:setRGB( 0, 0, 0 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	FEFocusBarSolid0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid0:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarSolid0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local FEFocusBarAdd0 = LUI.UIImage.new()
	FEFocusBarAdd0:setLeftRight( true, true, -24, 25 )
	FEFocusBarAdd0:setTopBottom( false, false, 248.5, 256.5 )
	FEFocusBarAdd0:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd0:setAlpha( 0.99 )
	FEFocusBarAdd0:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd0:setShaderVector( 0, 0, 0.5, 0, 0 )
	FEFocusBarAdd0:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarAdd0 )
	self.FEFocusBarAdd0 = FEFocusBarAdd0
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( false, true, -147.5, -111.5 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( f2_local1, controller )
	buttons:setLeftRight( true, false, 53, 485 )
	buttons:setTopBottom( false, true, -153.5, -121.5 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local StatsLoadingWidget = CoD.StatsLoadingWidget.new( f2_local1, controller )
	StatsLoadingWidget:setLeftRight( false, false, -100, 100 )
	StatsLoadingWidget:setTopBottom( false, false, -119, 50 )
	self:addElement( StatsLoadingWidget )
	self.StatsLoadingWidget = StatsLoadingWidget
	
	local ErrorMessage = LUI.UIText.new()
	ErrorMessage:setLeftRight( true, true, 64, -64 )
	ErrorMessage:setTopBottom( true, false, 346.5, 371.5 )
	ErrorMessage:setText( Engine.Localize( "MENU_ERROR_DOWNLOADING_STATS" ) )
	ErrorMessage:setTTF( "fonts/default.ttf" )
	ErrorMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ErrorMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ErrorMessage )
	self.ErrorMessage = ErrorMessage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StatsLoadingWidget:completeAnimation()
				self.StatsLoadingWidget:setAlpha( 1 )
				self.clipFinished( StatsLoadingWidget, {} )
				ErrorMessage:completeAnimation()
				self.ErrorMessage:setAlpha( 0 )
				self.clipFinished( ErrorMessage, {} )
			end
		},
		Error = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StatsLoadingWidget:completeAnimation()
				self.StatsLoadingWidget:setAlpha( 0 )
				self.clipFinished( StatsLoadingWidget, {} )
				ErrorMessage:completeAnimation()
				self.ErrorMessage:setAlpha( 1 )
				self.clipFinished( ErrorMessage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Error",
			condition = function ( menu, element, event )
				local f5_local0
				if not IsGlobalModelValueTrue( element, controller, "OtherPlayerStats.InProgress" ) then
					f5_local0 = not IsGlobalModelValueTrue( element, controller, "OtherPlayerStats.Success" )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		} )
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:subscribeToGlobalModel( controller, "OtherPlayerStats", "InProgress", function ( model )
		local f10_local0 = self
		if IsGlobalModelValueTrue( f10_local0, controller, "OtherPlayerStats.Success" ) and not IsGlobalModelValueTrue( f10_local0, controller, "OtherPlayerStats.InProgress" ) then
			CombatRecordGoBackAndOpenOverlayForPostStatsLoad( self, controller )
		end
	end )
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.buttons:close()
		element.StatsLoadingWidget:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social_InspectPlayerPopupLoading.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

