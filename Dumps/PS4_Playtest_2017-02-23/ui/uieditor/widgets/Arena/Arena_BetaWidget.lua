require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.Arena_BetaWidget = InheritFrom( LUI.UIElement )
CoD.Arena_BetaWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Arena_BetaWidget )
	self.id = "Arena_BetaWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 94 )
	
	local White = CoD.cac_ItemTitleGlow.new( menu, controller )
	White:setLeftRight( 0, 0, 4, 115 )
	White:setTopBottom( 0, 0, 1, 91 )
	White:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( White )
	self.White = White
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, -39, 179 )
	Glow:setTopBottom( 0, 0, -33, 127 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 1, 4, 0 )
	Border:setTopBottom( 0, 0, 3, 91 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( 0, 0, 129, 661 )
	Desc:setTopBottom( 0, 0, 15, 48 )
	Desc:setText( Engine.Localize( "MENU_BETA_DESC" ) )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Desc, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	local BETA = LUI.UIText.new()
	BETA:setLeftRight( 0, 0, 3, 114 )
	BETA:setTopBottom( 0, 0, 31, 69 )
	BETA:setRGB( 0, 0, 0 )
	BETA:setText( Engine.Localize( "MENU_BETA" ) )
	BETA:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	BETA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BETA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BETA )
	self.BETA = BETA
	
	self.resetProperties = function ()
		White:completeAnimation()
		Glow:completeAnimation()
		Border:completeAnimation()
		Desc:completeAnimation()
		BETA:completeAnimation()
		White:setAlpha( 1 )
		Glow:setAlpha( 0.5 )
		Border:setAlpha( 0.43 )
		Desc:setAlpha( 1 )
		BETA:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				White:completeAnimation()
				self.White:setAlpha( 0 )
				self.clipFinished( White, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
				Desc:completeAnimation()
				self.Desc:setAlpha( 0 )
				self.clipFinished( Desc, {} )
				BETA:completeAnimation()
				self.BETA:setAlpha( 0 )
				self.clipFinished( BETA, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						end
						Glow:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.5 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				GlowFrame2( Glow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsBetaSeason()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.White:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

