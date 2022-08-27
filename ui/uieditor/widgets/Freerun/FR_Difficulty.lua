-- 5350deda7efa8e4d1f67df02187af022
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG00 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG00:setLeftRight( true, true, -7, 8 )
	StartMenuIdentitySubtitleBG00:setTopBottom( true, true, -2, 2 )
	StartMenuIdentitySubtitleBG00:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG00 )
	self.StartMenuIdentitySubtitleBG00 = StartMenuIdentitySubtitleBG00
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( true, false, 6, 350 )
	SubTitle:setTopBottom( true, false, 1, 21 )
	SubTitle:setText( Engine.Localize( "" ) )
	SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )
				StartMenuIdentitySubtitleBG00:completeAnimation()
				self.StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
				self.clipFinished( StartMenuIdentitySubtitleBG00, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 1 )
				self.clipFinished( SubTitle, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuIdentitySubtitleBG00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

