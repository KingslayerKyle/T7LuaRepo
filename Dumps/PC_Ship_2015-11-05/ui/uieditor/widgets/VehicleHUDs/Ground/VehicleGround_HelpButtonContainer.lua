require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpButton" )

CoD.VehicleGround_HelpButtonContainer = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HelpButtonContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HelpButtonContainer )
	self.id = "VehicleGround_HelpButtonContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 295 )
	self:setTopBottom( true, false, 0, 109 )
	
	local ArrowT = LUI.UIImage.new()
	ArrowT:setLeftRight( true, false, 31, 55 )
	ArrowT:setTopBottom( true, false, 0, 24 )
	ArrowT:setRGB( 0.74, 0.94, 0.99 )
	ArrowT:setAlpha( 0.4 )
	ArrowT:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonarrow" ) )
	ArrowT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowT )
	self.ArrowT = ArrowT
	
	local ArrowL = LUI.UIImage.new()
	ArrowL:setLeftRight( true, false, 0, 24 )
	ArrowL:setTopBottom( true, false, 52, 76 )
	ArrowL:setRGB( 0.74, 0.94, 0.99 )
	ArrowL:setAlpha( 0.4 )
	ArrowL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonarrow" ) )
	ArrowL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowL )
	self.ArrowL = ArrowL
	
	local ArrowR = LUI.UIImage.new()
	ArrowR:setLeftRight( true, false, 62, 86 )
	ArrowR:setTopBottom( true, false, 52, 76 )
	ArrowR:setRGB( 0.74, 0.94, 0.99 )
	ArrowR:setAlpha( 0.4 )
	ArrowR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonarrow" ) )
	ArrowR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowR )
	self.ArrowR = ArrowR
	
	local Hex = LUI.UIImage.new()
	Hex:setLeftRight( true, false, 11, 75 )
	Hex:setTopBottom( true, false, 20, 76 )
	Hex:setRGB( 0.74, 0.94, 0.99 )
	Hex:setAlpha( 0.4 )
	Hex:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonthin" ) )
	Hex:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Hex )
	self.Hex = Hex
	
	local BracketB = LUI.UIImage.new()
	BracketB:setLeftRight( true, false, 19, 67 )
	BracketB:setTopBottom( true, false, 55, 79 )
	BracketB:setRGB( 0.74, 0.94, 0.99 )
	BracketB:setAlpha( 0.5 )
	BracketB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonbracketb" ) )
	BracketB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BracketB )
	self.BracketB = BracketB
	
	local BracketT = LUI.UIImage.new()
	BracketT:setLeftRight( true, false, 19, 67 )
	BracketT:setTopBottom( true, false, 22, 38 )
	BracketT:setRGB( 0.74, 0.94, 0.99 )
	BracketT:setAlpha( 0.5 )
	BracketT:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonbrackett" ) )
	BracketT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BracketT )
	self.BracketT = BracketT
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, 55, 71 )
	Pixel2:setTopBottom( true, false, 93, 109 )
	Pixel2:setRGB( 0.74, 0.94, 0.99 )
	Pixel2:setAlpha( 0.2 )
	Pixel2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonpixel" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel1 = LUI.UIImage.new()
	Pixel1:setLeftRight( true, false, 17, 33 )
	Pixel1:setTopBottom( true, false, 93, 109 )
	Pixel1:setRGB( 0.74, 0.94, 0.99 )
	Pixel1:setAlpha( 0.2 )
	Pixel1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_buttonpixel" ) )
	Pixel1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	local HelpButtonShader = CoD.VehicleGround_HelpButton.new( menu, controller )
	HelpButtonShader:setLeftRight( true, false, 19, 67 )
	HelpButtonShader:setTopBottom( true, false, 25, 73 )
	HelpButtonShader:setAlpha( 0.9 )
	HelpButtonShader:setZoom( 15 )
	HelpButtonShader:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	HelpButtonShader:setShaderVector( 0, 0, 0.5, 0, 0 )
	HelpButtonShader:setShaderVector( 1, 0, 0, 0, 0 )
	HelpButtonShader:setShaderVector( 2, 0, 0, 0, 0 )
	HelpButtonShader:setShaderVector( 3, 0, 0, 0, 0 )
	HelpButtonShader:setShaderVector( 4, 0, 0, 0, 0 )
	HelpButtonShader:linkToElementModel( self, "imageText", true, function ( model )
		local imageText = Engine.GetModelValue( model )
		if imageText then
			HelpButtonShader.buttonText:setText( Engine.Localize( imageText ) )
		end
	end )
	self:addElement( HelpButtonShader )
	self.HelpButtonShader = HelpButtonShader
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 22, 295 )
	text:setTopBottom( false, false, 24.5, 40.5 )
	text:setAlpha( 0.7 )
	text:setTTF( "fonts/escom.ttf" )
	text:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	text:setShaderVector( 0, 0, 1, 0, 0 )
	text:setShaderVector( 1, 0.5, 0, 0, 0 )
	text:setShaderVector( 2, -2, -2, 0, 0 )
	text:setShaderVector( 3, 0, 0, 0, 0 )
	text:setShaderVector( 4, 0, 0, 0, 0 )
	text:setLetterSpacing( 3 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "text", true, function ( model )
		local _text = Engine.GetModelValue( model )
		if _text then
			text:setText( Engine.Localize( _text ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 31, 55 )
				self.ArrowT:setTopBottom( true, false, 35, 59 )
				self.ArrowT:setAlpha( 0 )
				self.clipFinished( ArrowT, {} )
				ArrowL:completeAnimation()
				self.ArrowL:setLeftRight( true, false, 30, 54 )
				self.ArrowL:setTopBottom( true, false, 37, 61 )
				self.ArrowL:setAlpha( 0 )
				self.clipFinished( ArrowL, {} )
				ArrowR:completeAnimation()
				self.ArrowR:setLeftRight( true, false, 30, 54 )
				self.ArrowR:setTopBottom( true, false, 36, 60 )
				self.ArrowR:setAlpha( 0 )
				self.clipFinished( ArrowR, {} )
				Hex:completeAnimation()
				self.Hex:setAlpha( 0 )
				self.clipFinished( Hex, {} )
				BracketB:completeAnimation()
				self.BracketB:setLeftRight( true, false, 19, 67 )
				self.BracketB:setTopBottom( true, false, 37, 61 )
				self.BracketB:setAlpha( 0 )
				self.clipFinished( BracketB, {} )
				BracketT:completeAnimation()
				self.BracketT:setLeftRight( true, false, 19, 67 )
				self.BracketT:setTopBottom( true, false, 42, 58 )
				self.BracketT:setAlpha( 0 )
				self.clipFinished( BracketT, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 55, 71 )
				self.Pixel2:setTopBottom( true, false, 62, 78 )
				self.Pixel2:setAlpha( 0 )
				self.clipFinished( Pixel2, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 17, 33 )
				self.Pixel1:setTopBottom( true, false, 62, 78 )
				self.Pixel1:setAlpha( 0 )
				self.clipFinished( Pixel1, {} )
				HelpButtonShader:completeAnimation()
				self.HelpButtonShader:setAlpha( 0 )
				self.clipFinished( HelpButtonShader, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 10 )
				local ArrowTFrame2 = function ( ArrowT, event )
					local ArrowTFrame3 = function ( ArrowT, event )
						if not event.interrupted then
							ArrowT:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						ArrowT:setLeftRight( true, false, 31, 55 )
						ArrowT:setTopBottom( true, false, 0, 24 )
						ArrowT:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( ArrowT, event )
						else
							ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArrowTFrame3( ArrowT, event )
						return 
					else
						ArrowT:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ArrowT:registerEventHandler( "transition_complete_keyframe", ArrowTFrame3 )
					end
				end
				
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 31, 55 )
				self.ArrowT:setTopBottom( true, false, 35, 59 )
				self.ArrowT:setAlpha( 0 )
				ArrowTFrame2( ArrowT, {} )
				local ArrowLFrame2 = function ( ArrowL, event )
					local ArrowLFrame3 = function ( ArrowL, event )
						if not event.interrupted then
							ArrowL:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						ArrowL:setLeftRight( true, false, 0, 24 )
						ArrowL:setTopBottom( true, false, 52, 76 )
						ArrowL:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( ArrowL, event )
						else
							ArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArrowLFrame3( ArrowL, event )
						return 
					else
						ArrowL:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ArrowL:registerEventHandler( "transition_complete_keyframe", ArrowLFrame3 )
					end
				end
				
				ArrowL:completeAnimation()
				self.ArrowL:setLeftRight( true, false, 30, 54 )
				self.ArrowL:setTopBottom( true, false, 37, 61 )
				self.ArrowL:setAlpha( 0 )
				ArrowLFrame2( ArrowL, {} )
				local ArrowRFrame2 = function ( ArrowR, event )
					local ArrowRFrame3 = function ( ArrowR, event )
						if not event.interrupted then
							ArrowR:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						ArrowR:setLeftRight( true, false, 62, 86 )
						ArrowR:setTopBottom( true, false, 52, 76 )
						ArrowR:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( ArrowR, event )
						else
							ArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ArrowRFrame3( ArrowR, event )
						return 
					else
						ArrowR:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ArrowR:registerEventHandler( "transition_complete_keyframe", ArrowRFrame3 )
					end
				end
				
				ArrowR:completeAnimation()
				self.ArrowR:setLeftRight( true, false, 30, 54 )
				self.ArrowR:setTopBottom( true, false, 36, 60 )
				self.ArrowR:setAlpha( 0 )
				ArrowRFrame2( ArrowR, {} )
				local HexFrame2 = function ( Hex, event )
					local HexFrame3 = function ( Hex, event )
						if not event.interrupted then
							Hex:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						Hex:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( Hex, event )
						else
							Hex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HexFrame3( Hex, event )
						return 
					else
						Hex:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Hex:registerEventHandler( "transition_complete_keyframe", HexFrame3 )
					end
				end
				
				Hex:completeAnimation()
				self.Hex:setAlpha( 0 )
				HexFrame2( Hex, {} )
				local BracketBFrame2 = function ( BracketB, event )
					local BracketBFrame3 = function ( BracketB, event )
						if not event.interrupted then
							BracketB:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						BracketB:setLeftRight( true, false, 19, 67 )
						BracketB:setTopBottom( true, false, 55, 79 )
						BracketB:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( BracketB, event )
						else
							BracketB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BracketBFrame3( BracketB, event )
						return 
					else
						BracketB:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						BracketB:registerEventHandler( "transition_complete_keyframe", BracketBFrame3 )
					end
				end
				
				BracketB:completeAnimation()
				self.BracketB:setLeftRight( true, false, 19, 67 )
				self.BracketB:setTopBottom( true, false, 37, 61 )
				self.BracketB:setAlpha( 0 )
				BracketBFrame2( BracketB, {} )
				local BracketTFrame2 = function ( BracketT, event )
					local BracketTFrame3 = function ( BracketT, event )
						if not event.interrupted then
							BracketT:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						BracketT:setLeftRight( true, false, 19, 67 )
						BracketT:setTopBottom( true, false, 22, 38 )
						BracketT:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( BracketT, event )
						else
							BracketT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BracketTFrame3( BracketT, event )
						return 
					else
						BracketT:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						BracketT:registerEventHandler( "transition_complete_keyframe", BracketTFrame3 )
					end
				end
				
				BracketT:completeAnimation()
				self.BracketT:setLeftRight( true, false, 19, 67 )
				self.BracketT:setTopBottom( true, false, 42, 58 )
				self.BracketT:setAlpha( 0 )
				BracketTFrame2( BracketT, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					local Pixel2Frame3 = function ( Pixel2, event )
						if not event.interrupted then
							Pixel2:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						Pixel2:setLeftRight( true, false, 55, 71 )
						Pixel2:setTopBottom( true, false, 93, 109 )
						Pixel2:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Pixel2, event )
						else
							Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2Frame3( Pixel2, event )
						return 
					else
						Pixel2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Pixel2:registerEventHandler( "transition_complete_keyframe", Pixel2Frame3 )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 55, 71 )
				self.Pixel2:setTopBottom( true, false, 62, 78 )
				self.Pixel2:setAlpha( 0 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						if not event.interrupted then
							Pixel1:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						Pixel1:setLeftRight( true, false, 17, 33 )
						Pixel1:setTopBottom( true, false, 93, 109 )
						Pixel1:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Pixel1, event )
						else
							Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 17, 33 )
				self.Pixel1:setTopBottom( true, false, 62, 78 )
				self.Pixel1:setAlpha( 0 )
				Pixel1Frame2( Pixel1, {} )
				local HelpButtonShaderFrame2 = function ( HelpButtonShader, event )
					local HelpButtonShaderFrame3 = function ( HelpButtonShader, event )
						if not event.interrupted then
							HelpButtonShader:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						HelpButtonShader:setAlpha( 0.9 )
						if event.interrupted then
							self.clipFinished( HelpButtonShader, event )
						else
							HelpButtonShader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HelpButtonShaderFrame3( HelpButtonShader, event )
						return 
					else
						HelpButtonShader:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						HelpButtonShader:registerEventHandler( "transition_complete_keyframe", HelpButtonShaderFrame3 )
					end
				end
				
				HelpButtonShader:completeAnimation()
				self.HelpButtonShader:setAlpha( 0 )
				HelpButtonShaderFrame2( HelpButtonShader, {} )
				local textFrame2 = function ( text, event )
					local textFrame3 = function ( text, event )
						if not event.interrupted then
							text:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
						end
						text:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( text, event )
						else
							text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						textFrame3( text, event )
						return 
					else
						text:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						text:registerEventHandler( "transition_complete_keyframe", textFrame3 )
					end
				end
				
				text:completeAnimation()
				self.text:setAlpha( 0 )
				textFrame2( text, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 31, 55 )
				self.ArrowT:setTopBottom( true, false, 0, 24 )
				self.ArrowT:setAlpha( 0.4 )
				self.clipFinished( ArrowT, {} )
				ArrowL:completeAnimation()
				self.ArrowL:setLeftRight( true, false, 0, 24 )
				self.ArrowL:setTopBottom( true, false, 52, 76 )
				self.ArrowL:setAlpha( 0.4 )
				self.clipFinished( ArrowL, {} )
				ArrowR:completeAnimation()
				self.ArrowR:setLeftRight( true, false, 62, 86 )
				self.ArrowR:setTopBottom( true, false, 52, 76 )
				self.ArrowR:setAlpha( 0.4 )
				self.clipFinished( ArrowR, {} )
				Hex:completeAnimation()
				self.Hex:setAlpha( 0.4 )
				self.clipFinished( Hex, {} )
				BracketB:completeAnimation()
				self.BracketB:setLeftRight( true, false, 19, 67 )
				self.BracketB:setTopBottom( true, false, 55, 79 )
				self.BracketB:setAlpha( 0.5 )
				self.clipFinished( BracketB, {} )
				BracketT:completeAnimation()
				self.BracketT:setLeftRight( true, false, 19, 67 )
				self.BracketT:setTopBottom( true, false, 22, 38 )
				self.BracketT:setAlpha( 0.5 )
				self.clipFinished( BracketT, {} )
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 55, 71 )
				self.Pixel2:setTopBottom( true, false, 93, 109 )
				self.Pixel2:setAlpha( 0.2 )
				self.clipFinished( Pixel2, {} )
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 17, 33 )
				self.Pixel1:setTopBottom( true, false, 93, 109 )
				self.Pixel1:setAlpha( 0.2 )
				self.clipFinished( Pixel1, {} )
				HelpButtonShader:completeAnimation()
				self.HelpButtonShader:setAlpha( 0.9 )
				self.clipFinished( HelpButtonShader, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.7 )
				self.clipFinished( text, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 10 )
				local ArrowTFrame2 = function ( ArrowT, event )
					if not event.interrupted then
						ArrowT:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ArrowT:setLeftRight( true, false, 31, 55 )
					ArrowT:setTopBottom( true, false, 35, 59 )
					ArrowT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArrowT, event )
					else
						ArrowT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowT:completeAnimation()
				self.ArrowT:setLeftRight( true, false, 31, 55 )
				self.ArrowT:setTopBottom( true, false, 0, 24 )
				self.ArrowT:setAlpha( 0.4 )
				ArrowTFrame2( ArrowT, {} )
				local ArrowLFrame2 = function ( ArrowL, event )
					if not event.interrupted then
						ArrowL:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ArrowL:setLeftRight( true, false, 30, 54 )
					ArrowL:setTopBottom( true, false, 37, 61 )
					ArrowL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArrowL, event )
					else
						ArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowL:completeAnimation()
				self.ArrowL:setLeftRight( true, false, 0, 24 )
				self.ArrowL:setTopBottom( true, false, 52, 76 )
				self.ArrowL:setAlpha( 0.4 )
				ArrowLFrame2( ArrowL, {} )
				local ArrowRFrame2 = function ( ArrowR, event )
					if not event.interrupted then
						ArrowR:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ArrowR:setLeftRight( true, false, 30, 54 )
					ArrowR:setTopBottom( true, false, 36, 60 )
					ArrowR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ArrowR, event )
					else
						ArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowR:completeAnimation()
				self.ArrowR:setLeftRight( true, false, 62, 86 )
				self.ArrowR:setTopBottom( true, false, 52, 76 )
				self.ArrowR:setAlpha( 0.4 )
				ArrowRFrame2( ArrowR, {} )
				local HexFrame2 = function ( Hex, event )
					if not event.interrupted then
						Hex:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Hex:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Hex, event )
					else
						Hex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Hex:completeAnimation()
				self.Hex:setAlpha( 0.4 )
				HexFrame2( Hex, {} )
				local BracketBFrame2 = function ( BracketB, event )
					if not event.interrupted then
						BracketB:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					BracketB:setLeftRight( true, false, 19, 67 )
					BracketB:setTopBottom( true, false, 37, 61 )
					BracketB:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BracketB, event )
					else
						BracketB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BracketB:completeAnimation()
				self.BracketB:setLeftRight( true, false, 19, 67 )
				self.BracketB:setTopBottom( true, false, 55, 79 )
				self.BracketB:setAlpha( 0.5 )
				BracketBFrame2( BracketB, {} )
				local BracketTFrame2 = function ( BracketT, event )
					if not event.interrupted then
						BracketT:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					BracketT:setLeftRight( true, false, 19, 67 )
					BracketT:setTopBottom( true, false, 42, 58 )
					BracketT:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BracketT, event )
					else
						BracketT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BracketT:completeAnimation()
				self.BracketT:setLeftRight( true, false, 19, 67 )
				self.BracketT:setTopBottom( true, false, 22, 38 )
				self.BracketT:setAlpha( 0.5 )
				BracketTFrame2( BracketT, {} )
				local Pixel2Frame2 = function ( Pixel2, event )
					if not event.interrupted then
						Pixel2:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Pixel2:setLeftRight( true, false, 55, 71 )
					Pixel2:setTopBottom( true, false, 62, 78 )
					Pixel2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Pixel2, event )
					else
						Pixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel2:completeAnimation()
				self.Pixel2:setLeftRight( true, false, 55, 71 )
				self.Pixel2:setTopBottom( true, false, 93, 109 )
				self.Pixel2:setAlpha( 0.2 )
				Pixel2Frame2( Pixel2, {} )
				local Pixel1Frame2 = function ( Pixel1, event )
					if not event.interrupted then
						Pixel1:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Pixel1:setLeftRight( true, false, 17, 33 )
					Pixel1:setTopBottom( true, false, 62, 78 )
					Pixel1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Pixel1, event )
					else
						Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setLeftRight( true, false, 17, 33 )
				self.Pixel1:setTopBottom( true, false, 93, 109 )
				self.Pixel1:setAlpha( 0.2 )
				Pixel1Frame2( Pixel1, {} )
				local HelpButtonShaderFrame2 = function ( HelpButtonShader, event )
					if not event.interrupted then
						HelpButtonShader:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					HelpButtonShader:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HelpButtonShader, event )
					else
						HelpButtonShader:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HelpButtonShader:completeAnimation()
				self.HelpButtonShader:setAlpha( 0.9 )
				HelpButtonShaderFrame2( HelpButtonShader, {} )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setAlpha( 0.7 )
				textFrame2( text, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "text", "" )
			end
		}
	} )
	self:linkToElementModel( self, "text", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "text"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HelpButtonShader:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

