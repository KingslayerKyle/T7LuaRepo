require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" )
end

local PostLoadFunc = function ( f2_arg0 )
	f2_arg0.Text:setText( f2_arg0.Text:getText() )
end

CoD.FE_ListHelp = InheritFrom( LUI.UIElement )
CoD.FE_ListHelp.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHelp )
	self.id = "FE_ListHelp"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 298 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Background = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 5, -5 )
	Background:setRGB( 1, 0, 0 )
	Background:setAlpha( 0.75 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 29, 0 )
	Text:setTopBottom( true, false, 6, 26 )
	Text:setText( Engine.Localize( "MENU_SPLITSCREEN_NOT_ALLOWED_SHORT" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setLetterSpacing( 0.5 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -15 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 3.5, 24.5 )
	Image:setTopBottom( true, false, 6, 27 )
	Image:setImage( RegisterImage( "uie_t7_icon_error_overlays" ) )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CompetitiveSettingsEnabled( controller )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyButtonUpdate"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

