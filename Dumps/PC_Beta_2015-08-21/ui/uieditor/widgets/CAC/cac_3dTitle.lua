require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleInternal" )

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
	self:setLeftRight( true, false, 0, 931 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( true, true, 1, -31 )
	FETitleLineL:setTopBottom( false, false, 23, 27 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local TextBox1 = CoD.FE_3dTitleInternal.new( menu, controller )
	TextBox1:setLeftRight( true, false, -7.38, 931 )
	TextBox1:setTopBottom( true, false, 0, 56 )
	TextBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox1:setShaderVector( 0, 0.07, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	LUI.OverrideFunction_CallOriginalFirst( TextBox1, "setText", function ( element, controller )
		ScaleParentWidgetToLabel( self, element, 2 )
	end )
	TextBox1:mergeStateConditions( {
		{
			stateName = "LogoVisible",
			condition = function ( menu, element, event )
				local f3_local0
				if not IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyTitle" ) then
					f3_local0 = IsCurrentMenu( menu, "ModeSelect" )
				else
					f3_local0 = false
				end
				return f3_local0
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
		local FETitleLineU = TextBox1.m_eventHandlers.menu_loaded
		TextBox1:registerEventHandler( "menu_loaded", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return FETitleLineU( element, event )
		end )
	else
		TextBox1:registerEventHandler( "menu_loaded", LUI.UIElement.updateState )
	end
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local FETitleLineU = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineU:setLeftRight( true, true, 1, -31 )
	FETitleLineU:setTopBottom( false, false, -25, -21 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleLineL:close()
		element.TextBox1:close()
		element.FETitleLineU:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

