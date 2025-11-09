require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeader" )

CoD.Pregame_PlayerName = InheritFrom( LUI.UIElement )
CoD.Pregame_PlayerName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_PlayerName )
	self.id = "Pregame_PlayerName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 22 )
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 0, 248 )
	Name:setTopBottom( true, false, -4, 22 )
	Name:setAlpha( 0 )
	Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Name:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			Name:setText( Engine.Localize( gamertag ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local ListHeader = CoD.FE_ListHeader.new( menu, controller )
	ListHeader:setLeftRight( true, false, 0, 110 )
	ListHeader:setTopBottom( true, false, 0, 22 )
	ListHeader:setAlpha( 0 )
	ListHeader.btnDisplayTextStroke:setRGB( 1, 1, 1 )
	ListHeader:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			ListHeader.btnDisplayTextStroke:setText( Engine.Localize( gamertag ) )
		end
	end )
	self:addElement( ListHeader )
	self.ListHeader = ListHeader
	
	local btnDisplayTextStroke = LUI.UITightText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 5, 116 )
	btnDisplayTextStroke:setTopBottom( false, false, -9, 11 )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.03, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 2.5 )
	btnDisplayTextStroke:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			btnDisplayTextStroke:setText( Engine.Localize( gamertag ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 15 )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Name:completeAnimation()
				self.Name:setRGB( 1, 1, 1 )
				self.clipFinished( Name, {} )
				ListHeader:completeAnimation()
				ListHeader.btnDisplayTextStroke:completeAnimation()
				self.ListHeader.btnDisplayTextStroke:setRGB( 1, 1, 1 )
				self.clipFinished( ListHeader, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setRGB( 1, 1, 1 )
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Name:completeAnimation()
				self.Name:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.Name:setAlpha( 0 )
				self.clipFinished( Name, {} )
				ListHeader:completeAnimation()
				ListHeader.btnDisplayTextStroke:completeAnimation()
				self.ListHeader:setAlpha( 0 )
				self.ListHeader.btnDisplayTextStroke:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( ListHeader, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setRGB( 1, 0.84, 0.04 )
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
				self.btnDisplayTextStroke:setShaderVector( 1, 0.03, 0, 0, 0 )
				self.btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
				self.btnDisplayTextStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfModelValueMyXuid( element, controller, "xuid" )
			end
		}
	} )
	self:linkToElementModel( self, "xuid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "xuid"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ListHeader:close()
		element.Name:close()
		element.btnDisplayTextStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

