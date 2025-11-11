require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.Leaderboard_StatWidget = InheritFrom( LUI.UIElement )
CoD.Leaderboard_StatWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_StatWidget )
	self.id = "Leaderboard_StatWidget"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 127 )
	
	local ImageBorder0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder0:setLeftRight( 0, 0, 8, 143 )
	ImageBorder0:setTopBottom( 1, 1, -72, -4 )
	self:addElement( ImageBorder0 )
	self.ImageBorder0 = ImageBorder0
	
	local StatText = LUI.UIText.new()
	StatText:setLeftRight( 0, 0, 14, 137 )
	StatText:setTopBottom( 1, 1, -60, -22 )
	StatText:setRGB( 0.58, 0.64, 0.65 )
	StatText:setText( Engine.Localize( "888888" ) )
	StatText:setTTF( "fonts/escom.ttf" )
	StatText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatText )
	self.StatText = StatText
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( 0, 0, 8, 143 )
	FEListHeaderGlow0:setTopBottom( 0, 0, 5, 51 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( 0, 0, 8, 143 )
	btnDisplayTextStroke:setTopBottom( 0, 0, 17, 38 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, text )
		if not IsSelfInState( self, "Hidden" ) and IsTextWrapping( self, element ) then
			SetState( self, "TitleWrapping" )
		elseif not IsSelfInState( self, "Hidden" ) and not IsTextWrapping( self, element ) then
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	self.resetProperties = function ()
		btnDisplayTextStroke:completeAnimation()
		FEListHeaderGlow0:completeAnimation()
		StatText:completeAnimation()
		ImageBorder0:completeAnimation()
		btnDisplayTextStroke:setLeftRight( 0, 0, 8, 143 )
		btnDisplayTextStroke:setTopBottom( 0, 0, 17, 38 )
		btnDisplayTextStroke:setAlpha( 1 )
		FEListHeaderGlow0:setAlpha( 1 )
		StatText:setAlpha( 1 )
		ImageBorder0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		TitleWrapping = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setLeftRight( 0, 0, 8, 143 )
				self.btnDisplayTextStroke:setTopBottom( 0, 0, 7, 28 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				ImageBorder0:completeAnimation()
				self.ImageBorder0:setAlpha( 0 )
				self.clipFinished( ImageBorder0, {} )
				StatText:completeAnimation()
				self.StatText:setAlpha( 0 )
				self.clipFinished( StatText, {} )
				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListHeaderGlow0, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "TitleWrapping",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ImageBorder0:close()
		self.FEListHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

