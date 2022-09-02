-- 4f0e90bbffa5d9206618f136f2b889c4
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 60 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 2, -2 )
	bg:setTopBottom( true, true, 2, -2 )
	bg:setRGB( 0, 0, 0 )
	bg:setAlpha( 0.8 )
	self:addElement( bg )
	self.bg = bg
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( false, true, -7, 29 )
	pixelU:setTopBottom( true, false, -0.75, 2.75 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelB = LUI.UIImage.new()
	pixelB:setLeftRight( false, true, -7, 29 )
	pixelB:setTopBottom( false, true, -1.75, 1.75 )
	pixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelB )
	self.pixelB = pixelB
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( true, false, -29, 7 )
	pixelU0:setTopBottom( true, false, -0.75, 2.75 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local pixelB0 = LUI.UIImage.new()
	pixelB0:setLeftRight( true, false, -29, 7 )
	pixelB0:setTopBottom( false, true, -1.75, 1.75 )
	pixelB0:setZRot( 180 )
	pixelB0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelB0 )
	self.pixelB0 = pixelB0
	
	local FETitleLineSingle = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle:setTopBottom( false, true, -1.75, 2.25 )
	self:addElement( FETitleLineSingle )
	self.FETitleLineSingle = FETitleLineSingle
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle0:setTopBottom( true, false, -2, 2 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	local TextState = LUI.UIText.new()
	TextState:setLeftRight( true, true, 6, -7 )
	TextState:setTopBottom( true, false, 2, 22 )
	TextState:setRGB( 0.93, 0.13, 0.13 )
	TextState:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextState:linkToElementModel( self, "dlcBits", true, function ( model )
		local dlcBits = Engine.GetModelValue( model )
		if dlcBits then
			TextState:setText( Engine.Localize( GetMissingMapsList( dlcBits ) ) )
		end
	end )
	self:addElement( TextState )
	self.TextState = TextState
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 8 )

				bg:completeAnimation()
				self.bg:setAlpha( 0.8 )
				self.clipFinished( bg, {} )

				pixelU:completeAnimation()
				self.pixelU:setAlpha( 1 )
				self.clipFinished( pixelU, {} )

				pixelB:completeAnimation()
				self.pixelB:setAlpha( 1 )
				self.clipFinished( pixelB, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 1 )
				self.clipFinished( pixelU0, {} )

				pixelB0:completeAnimation()
				self.pixelB0:setAlpha( 1 )
				self.clipFinished( pixelB0, {} )

				FETitleLineSingle:completeAnimation()
				self.FETitleLineSingle:setAlpha( 1 )
				self.clipFinished( FETitleLineSingle, {} )

				FETitleLineSingle0:completeAnimation()
				self.FETitleLineSingle0:setAlpha( 1 )
				self.clipFinished( FETitleLineSingle0, {} )

				TextState:completeAnimation()
				self.TextState:setAlpha( 1 )
				self.clipFinished( TextState, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleLineSingle:close()
		element.FETitleLineSingle0:close()
		element.TextState:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

