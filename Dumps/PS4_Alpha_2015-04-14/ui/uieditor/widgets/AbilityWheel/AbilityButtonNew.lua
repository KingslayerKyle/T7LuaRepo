require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Bracket" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_IconHex" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_IconSections2" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Icon" )

CoD.AbilityButtonNew = InheritFrom( LUI.UIElement )
CoD.AbilityButtonNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityButtonNew )
	self.id = "AbilityButtonNew"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Shadow = LUI.UIImage.new()
	Shadow:setLeftRight( true, false, 98.08, 288.12 )
	Shadow:setTopBottom( true, false, -5.05, 185 )
	Shadow:setRGB( 0, 0, 0 )
	Shadow:setAlpha( 0 )
	Shadow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Shadow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Shadow )
	self.Shadow = Shadow
	
	local GradBracketR = LUI.UIImage.new()
	GradBracketR:setLeftRight( false, false, -52.9, 187.1 )
	GradBracketR:setTopBottom( false, false, -154, -50 )
	GradBracketR:setRGB( 1, 1, 1 )
	GradBracketR:setYRot( -180 )
	GradBracketR:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradbracket" ) )
	GradBracketR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GradBracketR )
	self.GradBracketR = GradBracketR
	
	local GrabBrakcetL = LUI.UIImage.new()
	GrabBrakcetL:setLeftRight( false, false, -188.9, 51.1 )
	GrabBrakcetL:setTopBottom( false, false, -154, -50 )
	GrabBrakcetL:setRGB( 1, 1, 1 )
	GrabBrakcetL:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradbracket" ) )
	GrabBrakcetL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( GrabBrakcetL )
	self.GrabBrakcetL = GrabBrakcetL
	
	local Bracket = CoD.AbilityWheel_Bracket.new( menu, controller )
	Bracket:setLeftRight( false, false, -95.9, 92.1 )
	Bracket:setTopBottom( false, false, -86, -34 )
	Bracket:setRGB( 1, 1, 1 )
	Bracket:setAlpha( 0.45 )
	self:addElement( Bracket )
	self.Bracket = Bracket
	
	local Semi = LUI.UIImage.new()
	Semi:setLeftRight( false, false, -46.73, 46.93 )
	Semi:setTopBottom( false, false, 41.97, 58.03 )
	Semi:setRGB( 0.6, 0.6, 0.6 )
	Semi:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconsemi" ) )
	Semi:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Semi )
	self.Semi = Semi
	
	local IconHex = CoD.AbilityWheel_IconHex.new( menu, controller )
	IconHex:setLeftRight( false, false, -41.17, 41.17 )
	IconHex:setTopBottom( false, false, -52, 43 )
	IconHex:setRGB( 1, 1, 1 )
	IconHex:setAlpha( 0.36 )
	self:addElement( IconHex )
	self.IconHex = IconHex
	
	local IconHexLine = LUI.UIImage.new()
	IconHexLine:setLeftRight( true, false, 56.1, 64.1 )
	IconHexLine:setTopBottom( true, false, 100, 112 )
	IconHexLine:setRGB( 1, 1, 1 )
	IconHexLine:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhexlower" ) )
	IconHexLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IconHexLine )
	self.IconHexLine = IconHexLine
	
	local IconSections1 = CoD.AbilityWheel_IconSections2.new( menu, controller )
	IconSections1:setLeftRight( false, false, -61.9, 62.1 )
	IconSections1:setTopBottom( false, false, -43, 38 )
	IconSections1:setRGB( 1, 1, 1 )
	IconSections1:setAlpha( 0.2 )
	IconSections1:setZoom( -20 )
	IconSections1:mergeStateConditions( {
		{
			stateName = "Unused",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( IconSections1 )
	self.IconSections1 = IconSections1
	
	local Pixel1 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel1:setLeftRight( false, false, 50.1, 58.1 )
	Pixel1:setTopBottom( false, false, -35, -27 )
	Pixel1:setRGB( 0, 0.56, 1 )
	Pixel1:setAlpha( 0.6 )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local Pixel2 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel2:setLeftRight( false, false, -57.9, -49.9 )
	Pixel2:setTopBottom( false, false, -35, -27 )
	Pixel2:setRGB( 0, 0.56, 1 )
	Pixel2:setAlpha( 0.6 )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel3 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel3:setLeftRight( false, false, 45.1, 53.1 )
	Pixel3:setTopBottom( false, false, 19, 27 )
	Pixel3:setRGB( 0, 0.56, 1 )
	Pixel3:setAlpha( 0.6 )
	self:addElement( Pixel3 )
	self.Pixel3 = Pixel3
	
	local Pixel4 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel4:setLeftRight( false, false, -52.9, -44.9 )
	Pixel4:setTopBottom( false, false, 19, 27 )
	Pixel4:setRGB( 0, 0.56, 1 )
	Pixel4:setAlpha( 0.6 )
	self:addElement( Pixel4 )
	self.Pixel4 = Pixel4
	
	local Pixel5 = CoD.AbilityWheel_Pixel.new( menu, controller )
	Pixel5:setLeftRight( false, false, -2.9, 5.1 )
	Pixel5:setTopBottom( false, false, -71, -63 )
	Pixel5:setRGB( 0, 0.56, 1 )
	self:addElement( Pixel5 )
	self.Pixel5 = Pixel5
	
	local PixelHex = LUI.UIImage.new()
	PixelHex:setLeftRight( true, false, 53.1, 69.1 )
	PixelHex:setTopBottom( true, false, -19, 1 )
	PixelHex:setRGB( 0, 0.56, 1 )
	PixelHex:setAlpha( 0 )
	PixelHex:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_icontophex" ) )
	PixelHex:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PixelHex )
	self.PixelHex = PixelHex
	
	local AbilitylIcon = CoD.AbilityWheel_Icon.new( menu, controller )
	AbilitylIcon:setLeftRight( false, false, -35.9, 36.1 )
	AbilitylIcon:setTopBottom( false, false, -39, 33 )
	AbilitylIcon:setRGB( 0.52, 0.73, 0.78 )
	AbilitylIcon:setAlpha( 0 )
	AbilitylIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilitylIcon:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilitylIcon:setShaderVector( 1, 0, 0, 0, 0 )
	AbilitylIcon:setShaderVector( 2, 0, 0, 0, 0 )
	AbilitylIcon:setShaderVector( 3, 0, 0, 0, 0 )
	AbilitylIcon:setShaderVector( 4, 0, 0, 0, 0 )
	AbilitylIcon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilitylIcon.IconImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( AbilitylIcon )
	self.AbilitylIcon = AbilitylIcon
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -95.9, 122.15 )
	Glow:setTopBottom( false, false, -154, 139 )
	Glow:setRGB( 0.26, 0.45, 0 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0 )
				self.clipFinished( Shadow, {} )
				GradBracketR:completeAnimation()
				self.GradBracketR:setLeftRight( false, false, -52, 188 )
				self.GradBracketR:setTopBottom( false, false, -106, -2 )
				self.clipFinished( GradBracketR, {} )
				GrabBrakcetL:completeAnimation()
				self.GrabBrakcetL:setLeftRight( false, false, -188, 52 )
				self.GrabBrakcetL:setTopBottom( false, false, -106, -2 )
				self.clipFinished( GrabBrakcetL, {} )
				Bracket:completeAnimation()
				self.Bracket:setLeftRight( false, false, -95, 93 )
				self.Bracket:setTopBottom( false, false, -38, 14 )
				self.Bracket:setRGB( 1, 1, 1 )
				self.clipFinished( Bracket, {} )
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -45.83, 47.83 )
				self.Semi:setTopBottom( false, false, 89.97, 106.03 )
				self.Semi:setRGB( 0.6, 0.6, 0.6 )
				self.clipFinished( Semi, {} )
				IconHex:completeAnimation()
				self.IconHex:setLeftRight( false, false, -40.27, 42.07 )
				self.IconHex:setTopBottom( false, false, -4, 91 )
				self.IconHex:setRGB( 1, 1, 1 )
				self.IconHex:setAlpha( 0.9 )
				self.clipFinished( IconHex, {} )
				IconHexLine:completeAnimation()
				self.IconHexLine:setLeftRight( true, false, 185, 193 )
				self.IconHexLine:setTopBottom( true, false, 194, 206 )
				self.IconHexLine:setRGB( 1, 1, 1 )
				self.IconHexLine:setAlpha( 1 )
				self.clipFinished( IconHexLine, {} )
				IconSections1:completeAnimation()
				self.IconSections1:setRGB( 1, 1, 1 )
				self.IconSections1:setAlpha( 0.2 )
				self.clipFinished( IconSections1, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( false, false, 51, 59 )
				self.Pixel1:setTopBottom( false, false, 13, 21 )
				self.Pixel1:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( false, false, -57, -49 )
				self.Pixel2:setTopBottom( false, false, 13, 21 )
				self.Pixel2:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( false, false, 46, 54 )
				self.Pixel3:setTopBottom( false, false, 67, 75 )
				self.Pixel3:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( false, false, -52, -44 )
				self.Pixel4:setTopBottom( false, false, 67, 75 )
				self.Pixel4:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( false, false, -2, 6 )
				self.Pixel5:setTopBottom( false, false, -23, -15 )
				self.Pixel5:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel5, {} )
				PixelHex:completeAnimation()
				self.PixelHex:setRGB( 0, 0.56, 1 )
				self.PixelHex:setAlpha( 0 )
				self.clipFinished( PixelHex, {} )
				AbilitylIcon:completeAnimation()
				self.AbilitylIcon:setLeftRight( false, false, -35, 37 )
				self.AbilitylIcon:setTopBottom( false, false, 9, 81 )
				self.AbilitylIcon:setRGB( 0.52, 0.73, 0.78 )
				self.AbilitylIcon:setAlpha( 1 )
				self.AbilitylIcon:setZoom( 0 )
				self.clipFinished( AbilitylIcon, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 16 )
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0.2 )
				self.clipFinished( Shadow, {} )
				GradBracketR:completeAnimation()
				self.GradBracketR:setLeftRight( false, false, -52, 188 )
				self.GradBracketR:setTopBottom( false, false, -128, -24 )
				self.clipFinished( GradBracketR, {} )
				GrabBrakcetL:completeAnimation()
				self.GrabBrakcetL:setLeftRight( false, false, -188, 52 )
				self.GrabBrakcetL:setTopBottom( false, false, -128, -24 )
				self.clipFinished( GrabBrakcetL, {} )
				Bracket:completeAnimation()
				self.Bracket:setLeftRight( false, false, -95, 93 )
				self.Bracket:setTopBottom( false, false, -60, -8 )
				self.Bracket:setRGB( 1, 0.76, 0.24 )
				self.clipFinished( Bracket, {} )
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -45.83, 47.83 )
				self.Semi:setTopBottom( false, false, 84.97, 101.03 )
				self.Semi:setRGB( 0.33, 0.33, 0.33 )
				self.clipFinished( Semi, {} )
				local IconHexFrame2 = function ( IconHex, event )
					local IconHexFrame3 = function ( IconHex, event )
						local IconHexFrame4 = function ( IconHex, event )
							local IconHexFrame5 = function ( IconHex, event )
								local IconHexFrame6 = function ( IconHex, event )
									local IconHexFrame7 = function ( IconHex, event )
										local IconHexFrame8 = function ( IconHex, event )
											local IconHexFrame9 = function ( IconHex, event )
												if not event.interrupted then
													IconHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												IconHex:setLeftRight( false, false, -51, 53 )
												IconHex:setTopBottom( false, false, -27, 93 )
												IconHex:setRGB( 1, 0.76, 0.24 )
												IconHex:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( IconHex, event )
												else
													IconHex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												IconHexFrame9( IconHex, event )
												return 
											else
												IconHex:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame9 )
											end
										end
										
										if event.interrupted then
											IconHexFrame8( IconHex, event )
											return 
										else
											IconHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											IconHex:setAlpha( 0.9 )
											IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame8 )
										end
									end
									
									if event.interrupted then
										IconHexFrame7( IconHex, event )
										return 
									else
										IconHex:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame7 )
									end
								end
								
								if event.interrupted then
									IconHexFrame6( IconHex, event )
									return 
								else
									IconHex:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									IconHex:setAlpha( 1 )
									IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame6 )
								end
							end
							
							if event.interrupted then
								IconHexFrame5( IconHex, event )
								return 
							else
								IconHex:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame5 )
							end
						end
						
						if event.interrupted then
							IconHexFrame4( IconHex, event )
							return 
						else
							IconHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							IconHex:setAlpha( 0.6 )
							IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame4 )
						end
					end
					
					if event.interrupted then
						IconHexFrame3( IconHex, event )
						return 
					else
						IconHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						IconHex:registerEventHandler( "transition_complete_keyframe", IconHexFrame3 )
					end
				end
				
				IconHex:completeAnimation()
				self.IconHex:setLeftRight( false, false, -51, 53 )
				self.IconHex:setTopBottom( false, false, -27, 93 )
				self.IconHex:setRGB( 1, 0.76, 0.24 )
				self.IconHex:setAlpha( 1 )
				IconHexFrame2( IconHex, {} )
				IconHexLine:completeAnimation()
				self.IconHexLine:setLeftRight( true, false, 185, 193 )
				self.IconHexLine:setTopBottom( true, false, 199, 211 )
				self.IconHexLine:setRGB( 0, 0, 0 )
				self.IconHexLine:setAlpha( 1 )
				self.clipFinished( IconHexLine, {} )
				IconSections1:completeAnimation()
				self.IconSections1:setRGB( 0, 0, 0 )
				self.IconSections1:setAlpha( 0 )
				self.clipFinished( IconSections1, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( false, false, 56, 64 )
				self.Pixel1:setTopBottom( false, false, -1, 7 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( false, false, -62, -54 )
				self.Pixel2:setTopBottom( false, false, -1, 7 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( false, false, 56, 64 )
				self.Pixel3:setTopBottom( false, false, 67, 75 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( false, false, -62, -54 )
				self.Pixel4:setTopBottom( false, false, 67, 75 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( false, false, -2, 6 )
				self.Pixel5:setTopBottom( false, false, -47, -39 )
				self.clipFinished( Pixel5, {} )
				PixelHex:completeAnimation()
				self.PixelHex:setLeftRight( true, false, 182, 198 )
				self.PixelHex:setTopBottom( true, false, 51, 71 )
				self.PixelHex:setAlpha( 1 )
				self.clipFinished( PixelHex, {} )
				AbilitylIcon:completeAnimation()
				self.AbilitylIcon:setLeftRight( false, false, -41, 45 )
				self.AbilitylIcon:setTopBottom( false, false, -8, 78 )
				self.AbilitylIcon:setRGB( 0.65, 0.67, 0.19 )
				self.AbilitylIcon:setAlpha( 1 )
				self.AbilitylIcon:setZoom( 50 )
				self.clipFinished( AbilitylIcon, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 1 )
				self.clipFinished( Glow, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 16 )
				local ShadowFrame2 = function ( Shadow, event )
					if not event.interrupted then
						Shadow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Shadow:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( Shadow, event )
					else
						Shadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0 )
				ShadowFrame2( Shadow, {} )
				local GradBracketRFrame2 = function ( GradBracketR, event )
					if not event.interrupted then
						GradBracketR:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					GradBracketR:setLeftRight( false, false, -52, 188 )
					GradBracketR:setTopBottom( false, false, -128, -24 )
					if event.interrupted then
						self.clipFinished( GradBracketR, event )
					else
						GradBracketR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GradBracketR:completeAnimation()
				self.GradBracketR:setLeftRight( false, false, -52, 188 )
				self.GradBracketR:setTopBottom( false, false, -106, -2 )
				GradBracketRFrame2( GradBracketR, {} )
				local GrabBrakcetLFrame2 = function ( GrabBrakcetL, event )
					if not event.interrupted then
						GrabBrakcetL:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					GrabBrakcetL:setLeftRight( false, false, -188, 52 )
					GrabBrakcetL:setTopBottom( false, false, -128, -24 )
					if event.interrupted then
						self.clipFinished( GrabBrakcetL, event )
					else
						GrabBrakcetL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GrabBrakcetL:completeAnimation()
				self.GrabBrakcetL:setLeftRight( false, false, -188, 52 )
				self.GrabBrakcetL:setTopBottom( false, false, -106, -2 )
				GrabBrakcetLFrame2( GrabBrakcetL, {} )
				local BracketFrame2 = function ( Bracket, event )
					if not event.interrupted then
						Bracket:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Bracket:setLeftRight( false, false, -95, 93 )
					Bracket:setTopBottom( false, false, -60, -8 )
					Bracket:setRGB( 1, 0.76, 0.24 )
					if event.interrupted then
						self.clipFinished( Bracket, event )
					else
						Bracket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Bracket:completeAnimation()
				self.Bracket:setLeftRight( false, false, -95, 93 )
				self.Bracket:setTopBottom( false, false, -38, 14 )
				self.Bracket:setRGB( 1, 1, 1 )
				BracketFrame2( Bracket, {} )
				local SemiFrame2 = function ( Semi, event )
					if not event.interrupted then
						Semi:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Semi:setLeftRight( false, false, -45.83, 47.83 )
					Semi:setTopBottom( false, false, 84.97, 101.03 )
					Semi:setRGB( 0.33, 0.33, 0.33 )
					if event.interrupted then
						self.clipFinished( Semi, event )
					else
						Semi:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -45.83, 47.83 )
				self.Semi:setTopBottom( false, false, 89.97, 106.03 )
				self.Semi:setRGB( 0.6, 0.6, 0.6 )
				SemiFrame2( Semi, {} )
				local IconHexFrame2 = function ( IconHex, event )
					if not event.interrupted then
						IconHex:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					IconHex:setLeftRight( false, false, -51, 53 )
					IconHex:setTopBottom( false, false, -27, 93 )
					IconHex:setRGB( 1, 0.76, 0.24 )
					IconHex:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( IconHex, event )
					else
						IconHex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHex:completeAnimation()
				self.IconHex:setLeftRight( false, false, -40.27, 42.07 )
				self.IconHex:setTopBottom( false, false, -4, 91 )
				self.IconHex:setRGB( 1, 1, 1 )
				self.IconHex:setAlpha( 0.9 )
				IconHexFrame2( IconHex, {} )
				local IconHexLineFrame2 = function ( IconHexLine, event )
					if not event.interrupted then
						IconHexLine:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					IconHexLine:setLeftRight( true, false, 185, 193 )
					IconHexLine:setTopBottom( true, false, 199, 211 )
					IconHexLine:setRGB( 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( IconHexLine, event )
					else
						IconHexLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHexLine:completeAnimation()
				self.IconHexLine:setLeftRight( true, false, 185, 193 )
				self.IconHexLine:setTopBottom( true, false, 194, 206 )
				self.IconHexLine:setRGB( 1, 1, 1 )
				IconHexLineFrame2( IconHexLine, {} )
				local IconSections1Frame2 = function ( IconSections1, event )
					if not event.interrupted then
						IconSections1:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					IconSections1:setRGB( 0, 0, 0 )
					IconSections1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( IconSections1, event )
					else
						IconSections1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconSections1:completeAnimation()
				self.IconSections1:setRGB( 1, 1, 1 )
				self.IconSections1:setAlpha( 0.2 )
				IconSections1Frame2( IconSections1, {} )
				local Pixel1Frame2 = function ( Pixel1, event )
					if not event.interrupted then
						Pixel1:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel1:setLeftRight( false, false, 56, 64 )
					Pixel1:setTopBottom( false, false, -1, 7 )
					Pixel1:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel1, event )
					else
						Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( false, false, 51, 59 )
				self.Pixel1:setTopBottom( false, false, 13, 21 )
				self.Pixel1:setRGB( 0, 0.56, 1 )
				Pixel1Frame2( Pixel1, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					if not event.interrupted then
						Pixel2:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel2:setLeftRight( false, false, -62, -54 )
					Pixel2:setTopBottom( false, false, -1, 7 )
					Pixel2:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel2, event )
					else
						Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( false, false, -57, -49 )
				self.Pixel2:setTopBottom( false, false, 13, 21 )
				self.Pixel2:setRGB( 0, 0.56, 1 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel3Frame2 = function ( Pixel3, event )
					if not event.interrupted then
						Pixel3:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel3:setLeftRight( false, false, 56, 64 )
					Pixel3:setTopBottom( false, false, 67, 75 )
					Pixel3:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel3, event )
					else
						Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( false, false, 46, 54 )
				self.Pixel3:setTopBottom( false, false, 67, 75 )
				self.Pixel3:setRGB( 0, 0.56, 1 )
				Pixel3Frame2( Pixel3, {} )
				local Pixel4Frame2 = function ( Pixel4, event )
					if not event.interrupted then
						Pixel4:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel4:setLeftRight( false, false, -62, -54 )
					Pixel4:setTopBottom( false, false, 67, 75 )
					Pixel4:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel4, event )
					else
						Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( false, false, -52, -44 )
				self.Pixel4:setTopBottom( false, false, 67, 75 )
				self.Pixel4:setRGB( 0, 0.56, 1 )
				Pixel4Frame2( Pixel4, {} )
				local Pixel5Frame2 = function ( Pixel5, event )
					if not event.interrupted then
						Pixel5:beginAnimation( "keyframe", 119, false, true, CoD.TweenType.Linear )
					end
					Pixel5:setLeftRight( false, false, -2, 6 )
					Pixel5:setTopBottom( false, false, -47, -39 )
					Pixel5:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel5, event )
					else
						Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( false, false, -2, 6 )
				self.Pixel5:setTopBottom( false, false, -23, -15 )
				self.Pixel5:setRGB( 0, 0.56, 1 )
				Pixel5Frame2( Pixel5, {} )
				local PixelHexFrame2 = function ( PixelHex, event )
					local PixelHexFrame3 = function ( PixelHex, event )
						local PixelHexFrame4 = function ( PixelHex, event )
							local PixelHexFrame5 = function ( PixelHex, event )
								local PixelHexFrame6 = function ( PixelHex, event )
									local PixelHexFrame7 = function ( PixelHex, event )
										local PixelHexFrame8 = function ( PixelHex, event )
											local PixelHexFrame9 = function ( PixelHex, event )
												local PixelHexFrame10 = function ( PixelHex, event )
													if not event.interrupted then
														PixelHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													PixelHex:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( PixelHex, event )
													else
														PixelHex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PixelHexFrame10( PixelHex, event )
													return 
												else
													PixelHex:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame10 )
												end
											end
											
											if event.interrupted then
												PixelHexFrame9( PixelHex, event )
												return 
											else
												PixelHex:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												PixelHex:setAlpha( 0.6 )
												PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame9 )
											end
										end
										
										if event.interrupted then
											PixelHexFrame8( PixelHex, event )
											return 
										else
											PixelHex:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame8 )
										end
									end
									
									if event.interrupted then
										PixelHexFrame7( PixelHex, event )
										return 
									else
										PixelHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										PixelHex:setAlpha( 1 )
										PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame7 )
									end
								end
								
								if event.interrupted then
									PixelHexFrame6( PixelHex, event )
									return 
								else
									PixelHex:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									PixelHex:setAlpha( 0 )
									PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame6 )
								end
							end
							
							if event.interrupted then
								PixelHexFrame5( PixelHex, event )
								return 
							else
								PixelHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PixelHex:setAlpha( 1 )
								PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame5 )
							end
						end
						
						if event.interrupted then
							PixelHexFrame4( PixelHex, event )
							return 
						else
							PixelHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PixelHex:setAlpha( 0.71 )
							PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame4 )
						end
					end
					
					if event.interrupted then
						PixelHexFrame3( PixelHex, event )
						return 
					else
						PixelHex:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PixelHex:setAlpha( 0.69 )
						PixelHex:registerEventHandler( "transition_complete_keyframe", PixelHexFrame3 )
					end
				end
				
				PixelHex:completeAnimation()
				self.PixelHex:setAlpha( 0 )
				PixelHexFrame2( PixelHex, {} )
				local AbilitylIconFrame2 = function ( AbilitylIcon, event )
					if not event.interrupted then
						AbilitylIcon:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					AbilitylIcon:setLeftRight( false, false, -41, 45 )
					AbilitylIcon:setTopBottom( false, false, -8, 78 )
					AbilitylIcon:setRGB( 0.65, 0.67, 0.19 )
					AbilitylIcon:setAlpha( 1 )
					AbilitylIcon:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( AbilitylIcon, event )
					else
						AbilitylIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitylIcon:completeAnimation()
				self.AbilitylIcon:setLeftRight( false, false, -35, 37 )
				self.AbilitylIcon:setTopBottom( false, false, 9, 81 )
				self.AbilitylIcon:setRGB( 0.52, 0.73, 0.78 )
				self.AbilitylIcon:setAlpha( 1 )
				self.AbilitylIcon:setZoom( 0 )
				AbilitylIconFrame2( AbilitylIcon, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 16 )
				local ShadowFrame2 = function ( Shadow, event )
					if not event.interrupted then
						Shadow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Shadow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Shadow, event )
					else
						Shadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0.2 )
				ShadowFrame2( Shadow, {} )
				local GradBracketRFrame2 = function ( GradBracketR, event )
					if not event.interrupted then
						GradBracketR:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					GradBracketR:setLeftRight( false, false, -52, 188 )
					GradBracketR:setTopBottom( false, false, -106, -2 )
					if event.interrupted then
						self.clipFinished( GradBracketR, event )
					else
						GradBracketR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GradBracketR:completeAnimation()
				self.GradBracketR:setLeftRight( false, false, -52, 188 )
				self.GradBracketR:setTopBottom( false, false, -128, -24 )
				GradBracketRFrame2( GradBracketR, {} )
				local GrabBrakcetLFrame2 = function ( GrabBrakcetL, event )
					if not event.interrupted then
						GrabBrakcetL:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					GrabBrakcetL:setLeftRight( false, false, -188, 52 )
					GrabBrakcetL:setTopBottom( false, false, -106, -2 )
					if event.interrupted then
						self.clipFinished( GrabBrakcetL, event )
					else
						GrabBrakcetL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GrabBrakcetL:completeAnimation()
				self.GrabBrakcetL:setLeftRight( false, false, -188, 52 )
				self.GrabBrakcetL:setTopBottom( false, false, -128, -24 )
				GrabBrakcetLFrame2( GrabBrakcetL, {} )
				local BracketFrame2 = function ( Bracket, event )
					if not event.interrupted then
						Bracket:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Bracket:setLeftRight( false, false, -95, 93 )
					Bracket:setTopBottom( false, false, -38, 14 )
					Bracket:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( Bracket, event )
					else
						Bracket:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Bracket:completeAnimation()
				self.Bracket:setLeftRight( false, false, -95, 93 )
				self.Bracket:setTopBottom( false, false, -60, -8 )
				self.Bracket:setRGB( 1, 0.76, 0.24 )
				BracketFrame2( Bracket, {} )
				local SemiFrame2 = function ( Semi, event )
					if not event.interrupted then
						Semi:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Semi:setLeftRight( false, false, -45.83, 47.83 )
					Semi:setTopBottom( false, false, 89.97, 106.03 )
					Semi:setRGB( 0.6, 0.6, 0.6 )
					if event.interrupted then
						self.clipFinished( Semi, event )
					else
						Semi:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -45.83, 47.83 )
				self.Semi:setTopBottom( false, false, 84.97, 101.03 )
				self.Semi:setRGB( 0.33, 0.33, 0.33 )
				SemiFrame2( Semi, {} )
				local IconHexFrame2 = function ( IconHex, event )
					if not event.interrupted then
						IconHex:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					IconHex:setLeftRight( false, false, -40.27, 42.07 )
					IconHex:setTopBottom( false, false, -4, 91 )
					IconHex:setRGB( 1, 1, 1 )
					IconHex:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( IconHex, event )
					else
						IconHex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHex:completeAnimation()
				self.IconHex:setLeftRight( false, false, -51, 53 )
				self.IconHex:setTopBottom( false, false, -27, 93 )
				self.IconHex:setRGB( 1, 0.76, 0.24 )
				self.IconHex:setAlpha( 0.9 )
				IconHexFrame2( IconHex, {} )
				local IconHexLineFrame2 = function ( IconHexLine, event )
					if not event.interrupted then
						IconHexLine:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					IconHexLine:setLeftRight( true, false, 185, 193 )
					IconHexLine:setTopBottom( true, false, 194, 206 )
					IconHexLine:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( IconHexLine, event )
					else
						IconHexLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconHexLine:completeAnimation()
				self.IconHexLine:setLeftRight( true, false, 185, 193 )
				self.IconHexLine:setTopBottom( true, false, 199, 211 )
				self.IconHexLine:setRGB( 0, 0, 0 )
				IconHexLineFrame2( IconHexLine, {} )
				local IconSections1Frame2 = function ( IconSections1, event )
					if not event.interrupted then
						IconSections1:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					IconSections1:setRGB( 1, 1, 1 )
					IconSections1:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( IconSections1, event )
					else
						IconSections1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IconSections1:completeAnimation()
				self.IconSections1:setRGB( 0, 0, 0 )
				self.IconSections1:setAlpha( 0 )
				IconSections1Frame2( IconSections1, {} )
				local Pixel1Frame2 = function ( Pixel1, event )
					if not event.interrupted then
						Pixel1:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel1:setLeftRight( false, false, 51, 59 )
					Pixel1:setTopBottom( false, false, 13, 21 )
					Pixel1:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel1, event )
					else
						Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( false, false, 56, 64 )
				self.Pixel1:setTopBottom( false, false, -1, 7 )
				self.Pixel1:setRGB( 0, 0.56, 1 )
				Pixel1Frame2( Pixel1, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					if not event.interrupted then
						Pixel2:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel2:setLeftRight( false, false, -57, -49 )
					Pixel2:setTopBottom( false, false, 13, 21 )
					Pixel2:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel2, event )
					else
						Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( false, false, -62, -54 )
				self.Pixel2:setTopBottom( false, false, -1, 7 )
				self.Pixel2:setRGB( 0, 0.56, 1 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel3Frame2 = function ( Pixel3, event )
					if not event.interrupted then
						Pixel3:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel3:setLeftRight( false, false, 46, 54 )
					Pixel3:setTopBottom( false, false, 67, 75 )
					Pixel3:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel3, event )
					else
						Pixel3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( false, false, 56, 64 )
				self.Pixel3:setTopBottom( false, false, 67, 75 )
				self.Pixel3:setRGB( 0, 0.56, 1 )
				Pixel3Frame2( Pixel3, {} )
				local Pixel4Frame2 = function ( Pixel4, event )
					if not event.interrupted then
						Pixel4:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel4:setLeftRight( false, false, -52, -44 )
					Pixel4:setTopBottom( false, false, 67, 75 )
					Pixel4:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel4, event )
					else
						Pixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( false, false, -62, -54 )
				self.Pixel4:setTopBottom( false, false, 67, 75 )
				self.Pixel4:setRGB( 0, 0.56, 1 )
				Pixel4Frame2( Pixel4, {} )
				local Pixel5Frame2 = function ( Pixel5, event )
					if not event.interrupted then
						Pixel5:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					Pixel5:setLeftRight( false, false, -2, 6 )
					Pixel5:setTopBottom( false, false, -23, -15 )
					Pixel5:setRGB( 0, 0.56, 1 )
					if event.interrupted then
						self.clipFinished( Pixel5, event )
					else
						Pixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( false, false, -2, 6 )
				self.Pixel5:setTopBottom( false, false, -47, -39 )
				self.Pixel5:setRGB( 0, 0.56, 1 )
				Pixel5Frame2( Pixel5, {} )
				local PixelHexFrame2 = function ( PixelHex, event )
					if not event.interrupted then
						PixelHex:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					PixelHex:setRGB( 0, 0.56, 1 )
					PixelHex:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PixelHex, event )
					else
						PixelHex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PixelHex:completeAnimation()
				self.PixelHex:setRGB( 0, 0.56, 1 )
				self.PixelHex:setAlpha( 1 )
				PixelHexFrame2( PixelHex, {} )
				local AbilitylIconFrame2 = function ( AbilitylIcon, event )
					if not event.interrupted then
						AbilitylIcon:beginAnimation( "keyframe", 119, true, true, CoD.TweenType.Linear )
					end
					AbilitylIcon:setLeftRight( false, false, -35, 37 )
					AbilitylIcon:setTopBottom( false, false, 9, 81 )
					AbilitylIcon:setRGB( 0.52, 0.73, 0.78 )
					AbilitylIcon:setAlpha( 1 )
					AbilitylIcon:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilitylIcon, event )
					else
						AbilitylIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitylIcon:completeAnimation()
				self.AbilitylIcon:setLeftRight( false, false, -41, 45 )
				self.AbilitylIcon:setTopBottom( false, false, -8, 78 )
				self.AbilitylIcon:setRGB( 0.65, 0.67, 0.19 )
				self.AbilitylIcon:setAlpha( 1 )
				self.AbilitylIcon:setZoom( 50 )
				AbilitylIconFrame2( AbilitylIcon, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 1 )
				GlowFrame2( Glow, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0 )
				self.clipFinished( Shadow, {} )
				GradBracketR:completeAnimation()
				self.GradBracketR:setLeftRight( false, false, -52, 188 )
				self.GradBracketR:setTopBottom( false, false, -106, -2 )
				self.clipFinished( GradBracketR, {} )
				GrabBrakcetL:completeAnimation()
				self.GrabBrakcetL:setLeftRight( false, false, -188, 52 )
				self.GrabBrakcetL:setTopBottom( false, false, -106, -2 )
				self.clipFinished( GrabBrakcetL, {} )
				Bracket:completeAnimation()
				self.Bracket:setLeftRight( false, false, -95, 93 )
				self.Bracket:setTopBottom( false, false, -38, 14 )
				self.Bracket:setRGB( 1, 1, 1 )
				self.Bracket:setAlpha( 0.45 )
				self.clipFinished( Bracket, {} )
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -45.83, 47.83 )
				self.Semi:setTopBottom( false, false, 89.97, 106.03 )
				self.Semi:setRGB( 0.6, 0.6, 0.6 )
				self.clipFinished( Semi, {} )
				IconHex:completeAnimation()
				self.IconHex:setLeftRight( false, false, -40.27, 42.07 )
				self.IconHex:setTopBottom( false, false, -4, 91 )
				self.IconHex:setRGB( 1, 1, 1 )
				self.IconHex:setAlpha( 0.36 )
				self.clipFinished( IconHex, {} )
				IconHexLine:completeAnimation()
				self.IconHexLine:setLeftRight( true, false, 185, 193 )
				self.IconHexLine:setTopBottom( true, false, 194, 206 )
				self.IconHexLine:setRGB( 1, 1, 1 )
				self.IconHexLine:setAlpha( 0 )
				self.clipFinished( IconHexLine, {} )
				IconSections1:completeAnimation()
				self.IconSections1:setRGB( 1, 1, 1 )
				self.IconSections1:setAlpha( 0.2 )
				self.clipFinished( IconSections1, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( false, false, 51, 59 )
				self.Pixel1:setTopBottom( false, false, 13, 21 )
				self.Pixel1:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel1, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( false, false, -57, -49 )
				self.Pixel2:setTopBottom( false, false, 13, 21 )
				self.Pixel2:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel2, {} )
				Pixel3:completeAnimation()
				self.Pixel3:setLeftRight( false, false, 46, 54 )
				self.Pixel3:setTopBottom( false, false, 67, 75 )
				self.Pixel3:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel3, {} )
				Pixel4:completeAnimation()
				self.Pixel4:setLeftRight( false, false, -52, -44 )
				self.Pixel4:setTopBottom( false, false, 67, 75 )
				self.Pixel4:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel4, {} )
				Pixel5:completeAnimation()
				self.Pixel5:setLeftRight( false, false, -2, 6 )
				self.Pixel5:setTopBottom( false, false, -23, -15 )
				self.Pixel5:setRGB( 0, 0.56, 1 )
				self.clipFinished( Pixel5, {} )
				PixelHex:completeAnimation()
				self.PixelHex:setRGB( 0, 0.56, 1 )
				self.PixelHex:setAlpha( 0 )
				self.clipFinished( PixelHex, {} )
				AbilitylIcon:completeAnimation()
				self.AbilitylIcon:setLeftRight( false, false, -35, 37 )
				self.AbilitylIcon:setTopBottom( false, false, 9, 81 )
				self.AbilitylIcon:setRGB( 0.52, 0.73, 0.78 )
				self.AbilitylIcon:setAlpha( 0 )
				self.AbilitylIcon:setZoom( 0 )
				self.clipFinished( AbilitylIcon, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		}
	}
	self.close = function ( self )
		self.Bracket:close()
		self.IconHex:close()
		self.IconSections1:close()
		self.Pixel1:close()
		self.Pixel2:close()
		self.Pixel3:close()
		self.Pixel4:close()
		self.Pixel5:close()
		self.AbilitylIcon:close()
		CoD.AbilityButtonNew.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

