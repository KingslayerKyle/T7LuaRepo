CoD.LobbyPrototypeModeTab = InheritFrom( LUI.UIElement )
CoD.LobbyPrototypeModeTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyPrototypeModeTab )
	self.id = "LobbyPrototypeModeTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 270 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( 0, 0, 108, 163 )
	GlowOrangeOver:setTopBottom( 0, 0, -52, 112 )
	GlowOrangeOver:setRGB( 0.33, 0.95, 0.71 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local GlowOrangeOver2 = LUI.UIImage.new()
	GlowOrangeOver2:setLeftRight( 0, 0, 112, 148 )
	GlowOrangeOver2:setTopBottom( 0, 0, -121, 180 )
	GlowOrangeOver2:setRGB( 0.33, 0.95, 0.71 )
	GlowOrangeOver2:setAlpha( 0.03 )
	GlowOrangeOver2:setZRot( 90 )
	GlowOrangeOver2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver2 )
	self.GlowOrangeOver2 = GlowOrangeOver2
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 1, 0, 0 )
	text:setTopBottom( 0, 0, 13, 46 )
	text:setAlpha( 0.8 )
	text:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "tabName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( 0, 1, 0, 0 )
	buttonText:setTopBottom( 0, 0, 16, 44 )
	buttonText:setAlpha( 0 )
	buttonText:setTTF( "fonts/default.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	buttonText:linkToElementModel( self, "tabIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	self.resetProperties = function ()
		text:completeAnimation()
		GlowOrangeOver2:completeAnimation()
		buttonText:completeAnimation()
		GlowOrangeOver:completeAnimation()
		text:setRGB( 1, 1, 1 )
		text:setAlpha( 0.8 )
		text:setScale( 1 )
		GlowOrangeOver2:setAlpha( 0.03 )
		buttonText:setAlpha( 0 )
		GlowOrangeOver:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GlowOrangeOver2:completeAnimation()
				self.GlowOrangeOver2:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver2, {} )
				text:completeAnimation()
				self.text:setRGB( 0.33, 0.95, 0.71 )
				self.text:setAlpha( 0.3 )
				self.text:setScale( 0.8 )
				self.clipFinished( text, {} )
			end
		},
		NavButton = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				GlowOrangeOver2:completeAnimation()
				self.GlowOrangeOver2:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 1 )
				self.clipFinished( buttonText, {} )
			end
		},
		ActiveLobby = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.15 )
				self.clipFinished( GlowOrangeOver, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.9 )
				self.clipFinished( text, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.15 )
				self.clipFinished( GlowOrangeOver, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.9 )
				self.clipFinished( text, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NavButton",
			condition = function ( menu, element, event )
				return ShouldDisplayButton( element, controller )
			end
		},
		{
			stateName = "ActiveLobby",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToSelfModelValue( element, controller, "lobbyRoot.lobbyNav", "lobbyNav" )
			end
		}
	} )
	self:linkToElementModel( self, "tabIcon", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tabIcon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:linkToElementModel( self, "lobbyNav", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.text:close()
		self.buttonText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

