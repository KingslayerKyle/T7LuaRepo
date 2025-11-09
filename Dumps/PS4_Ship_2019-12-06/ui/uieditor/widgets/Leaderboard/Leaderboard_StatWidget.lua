require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

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
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 85 )
	
	local ImageBorder0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder0:setLeftRight( true, false, 5, 95 )
	ImageBorder0:setTopBottom( false, true, -48, -3 )
	self:addElement( ImageBorder0 )
	self.ImageBorder0 = ImageBorder0
	
	local StatText = LUI.UIText.new()
	StatText:setLeftRight( true, false, 9, 91 )
	StatText:setTopBottom( false, true, -40, -15 )
	StatText:setRGB( 0.58, 0.64, 0.65 )
	StatText:setText( "" )
	StatText:setTTF( "fonts/escom.ttf" )
	StatText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatText )
	self.StatText = StatText
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, false, 5, 95 )
	FEListHeaderGlow0:setTopBottom( true, false, 3, 34 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 5, 95 )
	btnDisplayTextStroke:setTopBottom( true, false, 11.5, 25.5 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( "" )
	btnDisplayTextStroke:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		if not IsSelfInState( self, "Hidden" ) and IsTextWrapping( self, element ) then
			SetState( self, "TitleWrapping" )
		elseif not IsSelfInState( self, "Hidden" ) and not IsTextWrapping( self, element ) then
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ImageBorder0:completeAnimation()
				self.ImageBorder0:setAlpha( 1 )
				self.clipFinished( ImageBorder0, {} )
				StatText:completeAnimation()
				self.StatText:setAlpha( 1 )
				self.clipFinished( StatText, {} )
				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 1 )
				self.clipFinished( FEListHeaderGlow0, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setLeftRight( true, false, 5, 95 )
				self.btnDisplayTextStroke:setTopBottom( true, false, 11.5, 25.5 )
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		TitleWrapping = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setLeftRight( true, false, 5, 95 )
				self.btnDisplayTextStroke:setTopBottom( true, false, 4.5, 18.5 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImageBorder0:close()
		element.FEListHeaderGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

