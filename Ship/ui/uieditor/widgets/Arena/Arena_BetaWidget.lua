-- 0fe7de9c781271b6b208c807833fdd3a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 63 )
	
	local White = CoD.cac_ItemTitleGlow.new( menu, controller )
	White:setLeftRight( true, false, 3, 77 )
	White:setTopBottom( true, false, 1, 61 )
	White:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( White )
	self.White = White
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -25.93, 119.07 )
	Glow:setTopBottom( true, false, -22, 85 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, true, 2, 0 )
	Border:setTopBottom( true, false, 2, 61 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.07, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, false, 85.77, 440.77 )
	Desc:setTopBottom( true, false, 10, 32 )
	Desc:setText( Engine.Localize( "MENU_BETA_DESC" ) )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Desc, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( Desc )
	self.Desc = Desc
	
	local BETA = LUI.UIText.new()
	BETA:setLeftRight( true, false, 2, 76 )
	BETA:setTopBottom( true, false, 20.5, 45.5 )
	BETA:setRGB( 0, 0, 0 )
	BETA:setText( Engine.Localize( "MENU_BETA" ) )
	BETA:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	BETA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BETA:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BETA )
	self.BETA = BETA
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 5 )

				White:completeAnimation()
				self.White:setAlpha( 1 )
				self.clipFinished( White, {} )
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

				Border:completeAnimation()
				self.Border:setAlpha( 0.43 )
				self.clipFinished( Border, {} )

				Desc:completeAnimation()
				self.Desc:setAlpha( 1 )
				self.clipFinished( Desc, {} )

				BETA:completeAnimation()
				self.BETA:setAlpha( 1 )
				self.clipFinished( BETA, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.White:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
