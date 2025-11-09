require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

CoD.KillcamWidgetTitleStatus = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetTitleStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetTitleStatus )
	self.id = "KillcamWidgetTitleStatus"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG0 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG0:setLeftRight( true, true, -8, 8 )
	StartMenuIdentitySubtitleBG0:setTopBottom( true, true, -2, 2 )
	StartMenuIdentitySubtitleBG0:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG0:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG0 )
	self.StartMenuIdentitySubtitleBG0 = StartMenuIdentitySubtitleBG0
	
	local SubTitle = LUI.UITightText.new()
	SubTitle:setLeftRight( true, false, 8, 82 )
	SubTitle:setTopBottom( true, false, 4, 25 )
	SubTitle:setRGB( 1, 1, 1 )
	SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	SubTitle:setTTF( "fonts/Entovo.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuIdentitySubtitleBG0:completeAnimation()
				self.StartMenuIdentitySubtitleBG0:setAlpha( 0.55 )
				self.clipFinished( StartMenuIdentitySubtitleBG0, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 1 )
				self.clipFinished( SubTitle, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuIdentitySubtitleBG0:completeAnimation()
				self.StartMenuIdentitySubtitleBG0:setAlpha( 0 )
				self.clipFinished( StartMenuIdentitySubtitleBG0, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return HideWinnersLabelsAndInfo( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.isRoundEnd" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.isRoundEnd"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.draw" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.draw"
		} )
	end )
	self.close = function ( self )
		self.StartMenuIdentitySubtitleBG0:close()
		CoD.KillcamWidgetTitleStatus.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

