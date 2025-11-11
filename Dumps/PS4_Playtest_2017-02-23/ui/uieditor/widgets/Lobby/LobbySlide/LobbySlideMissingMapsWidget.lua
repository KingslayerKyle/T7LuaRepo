require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )

CoD.LobbySlideMissingMapsWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideMissingMapsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideMissingMapsWidget )
	self.id = "LobbySlideMissingMapsWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 1, 3, -3 )
	bg:setTopBottom( 0, 1, 3, -3 )
	bg:setRGB( 0, 0, 0 )
	bg:setAlpha( 0.8 )
	self:addElement( bg )
	self.bg = bg
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( 1, 1, -11, 43 )
	pixelU:setTopBottom( 0, 0, -1, 4 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelB = LUI.UIImage.new()
	pixelB:setLeftRight( 1, 1, -11, 43 )
	pixelB:setTopBottom( 1, 1, -2.5, 2.5 )
	pixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelB )
	self.pixelB = pixelB
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( 0, 0, -43, 11 )
	pixelU0:setTopBottom( 0, 0, -1, 4 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local pixelB0 = LUI.UIImage.new()
	pixelB0:setLeftRight( 0, 0, -43, 11 )
	pixelB0:setTopBottom( 1, 1, -2.5, 2.5 )
	pixelB0:setZRot( 180 )
	pixelB0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelB0 )
	self.pixelB0 = pixelB0
	
	local FETitleLineSingle = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle:setLeftRight( 0, 0, 0, 486 )
	FETitleLineSingle:setTopBottom( 1, 1, -3, 3 )
	self:addElement( FETitleLineSingle )
	self.FETitleLineSingle = FETitleLineSingle
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( 0, 0, 0, 486 )
	FETitleLineSingle0:setTopBottom( 0, 0, -3, 3 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	local TextState = LUI.UIText.new()
	TextState:setLeftRight( 0, 1, 9, -11 )
	TextState:setTopBottom( 0, 0, 3, 33 )
	TextState:setRGB( 0.93, 0.13, 0.13 )
	TextState:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextState:linkToElementModel( self, "dlcBits", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextState:setText( Engine.Localize( GetMissingMapsList( modelValue ) ) )
		end
	end )
	self:addElement( TextState )
	self.TextState = TextState
	
	self.resetProperties = function ()
		TextState:completeAnimation()
		FETitleLineSingle0:completeAnimation()
		FETitleLineSingle:completeAnimation()
		pixelB0:completeAnimation()
		pixelU0:completeAnimation()
		pixelB:completeAnimation()
		pixelU:completeAnimation()
		bg:completeAnimation()
		TextState:setAlpha( 1 )
		FETitleLineSingle0:setAlpha( 1 )
		FETitleLineSingle:setAlpha( 1 )
		pixelB0:setAlpha( 1 )
		pixelU0:setAlpha( 1 )
		pixelB:setAlpha( 1 )
		pixelU:setAlpha( 1 )
		bg:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				pixelU:completeAnimation()
				self.pixelU:setAlpha( 0 )
				self.clipFinished( pixelU, {} )
				pixelB:completeAnimation()
				self.pixelB:setAlpha( 0 )
				self.clipFinished( pixelB, {} )
				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 0 )
				self.clipFinished( pixelU0, {} )
				pixelB0:completeAnimation()
				self.pixelB0:setAlpha( 0 )
				self.clipFinished( pixelB0, {} )
				FETitleLineSingle:completeAnimation()
				self.FETitleLineSingle:setAlpha( 0 )
				self.clipFinished( FETitleLineSingle, {} )
				FETitleLineSingle0:completeAnimation()
				self.FETitleLineSingle0:setAlpha( 0 )
				self.clipFinished( FETitleLineSingle0, {} )
				TextState:completeAnimation()
				self.TextState:setAlpha( 0 )
				self.clipFinished( TextState, {} )
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
				return ShowMissingMapsListInLobbySlide( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "dlcBits", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "dlcBits"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.mapVoteMapNext"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleLineSingle:close()
		self.FETitleLineSingle0:close()
		self.TextState:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

