require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )

CoD.cac_3dTitle = InheritFrom( LUI.UIElement )
CoD.cac_3dTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_3dTitle )
	self.id = "cac_3dTitle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1396 )
	self:setTopBottom( 0, 0, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( 0, 1, 2, -46 )
	FETitleLineL:setTopBottom( 0.5, 0.5, 35, 41 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local TextBox1 = CoD.FE_3dTitleInternal.new( menu, controller )
	TextBox1:mergeStateConditions( {
		{
			stateName = "LogoVisible",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyTitle" ) then
					f2_local0 = IsCurrentMenu( menu, "ModeSelect" )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "Playlist",
			condition = function ( menu, element, event )
				return ShouldShowPlaylistName() and IsCurrentMenu( menu, "ModeSelect" )
			end
		}
	} )
	TextBox1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTitle" ), function ( model )
		menu:updateElementState( TextBox1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTitle"
		} )
	end )
	TextBox1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( TextBox1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	if TextBox1.m_eventHandlers.menu_loaded then
		local currentEv = TextBox1.m_eventHandlers.menu_loaded
		TextBox1:registerEventHandler( "menu_loaded", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		TextBox1:registerEventHandler( "menu_loaded", LUI.UIElement.updateState )
	end
	TextBox1:setLeftRight( 0, 0, -11, 1397 )
	TextBox1:setTopBottom( 0, 0, 0, 84 )
	TextBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox1:setShaderVector( 0, 0.07, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	LUI.OverrideFunction_CallOriginalFirst( TextBox1, "setText", function ( element, text )
		ScaleParentWidgetToLabel( self, element, 2 )
	end )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local currentEv = CoD.FE_TitleLine.new( menu, controller )
	currentEv:setLeftRight( 0, 1, 2, -46 )
	currentEv:setTopBottom( 0.5, 0.5, -37, -31 )
	self:addElement( currentEv )
	self.FETitleLineU = currentEv
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleLineL:close()
		self.TextBox1:close()
		self.FETitleLineU:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

