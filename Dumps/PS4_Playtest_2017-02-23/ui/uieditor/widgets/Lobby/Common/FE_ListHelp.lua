require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" )
end

local PostLoadFunc = function ( self )
	self.Text:setText( self.Text:getText() )
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
	self:setLeftRight( 0, 0, 0, 447 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Background = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 8, -8 )
	Background:setRGB( 1, 0, 0 )
	Background:setAlpha( 0.75 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 1, 44, 0 )
	Text:setTopBottom( 0, 0, 9, 39 )
	Text:setText( Engine.Localize( "MENU_SPLITSCREEN_NOT_ALLOWED_SHORT" ) )
	Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Text:setLetterSpacing( 0.5 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, -15 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 5, 37 )
	Image:setTopBottom( 0, 0, 9, 41 )
	Image:setImage( RegisterImage( "t7_icon_error_overlays" ) )
	self:addElement( Image )
	self.Image = Image
	
	self.resetProperties = function ()
		Text:completeAnimation()
		Image:completeAnimation()
		Background:completeAnimation()
		Text:setAlpha( 1 )
		Image:setAlpha( 1 )
		Background:setAlpha( 0.75 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Background:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

