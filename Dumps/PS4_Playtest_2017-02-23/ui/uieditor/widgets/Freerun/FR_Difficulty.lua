require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

CoD.FR_Difficulty = InheritFrom( LUI.UIElement )
CoD.FR_Difficulty.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FR_Difficulty )
	self.id = "FR_Difficulty"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 225 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local StartMenuIdentitySubtitleBG00 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG00:setLeftRight( 0, 1, -10, 12 )
	StartMenuIdentitySubtitleBG00:setTopBottom( 0, 1, -3, 3 )
	StartMenuIdentitySubtitleBG00:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG00 )
	self.StartMenuIdentitySubtitleBG00 = StartMenuIdentitySubtitleBG00
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( 0, 0, 9, 525 )
	SubTitle:setTopBottom( 0, 0, 1, 31 )
	SubTitle:setText( Engine.Localize( "" ) )
	SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	self.resetProperties = function ()
		SubTitle:completeAnimation()
		StartMenuIdentitySubtitleBG00:completeAnimation()
		SubTitle:setAlpha( 1 )
		StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				StartMenuIdentitySubtitleBG00:completeAnimation()
				self.StartMenuIdentitySubtitleBG00:setAlpha( 0 )
				self.clipFinished( StartMenuIdentitySubtitleBG00, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
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
				return IsFreeRunLobby()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuIdentitySubtitleBG00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

