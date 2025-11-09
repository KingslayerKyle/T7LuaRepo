LUI.createMenu.SquadControlReticuleMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SquadControlReticuleMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local ImageScanline = LUI.UIImage.new()
	ImageScanline:setLeftRight( true, false, 401, 879 )
	ImageScanline:setTopBottom( true, false, 122.5, 130.5 )
	ImageScanline:setRGB( 1, 1, 1 )
	ImageScanline:setAlpha( 0 )
	ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
	ImageScanline:setShaderVector( 0, 0.25, 0, 0, 0 )
	ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( ImageScanline )
	self.ImageScanline = ImageScanline
	
	local SquadLabelText = LUI.UIText.new()
	SquadLabelText:setLeftRight( true, true, 1006, -64 )
	SquadLabelText:setTopBottom( true, true, 307, -395 )
	SquadLabelText:setRGB( 1, 1, 1 )
	SquadLabelText:setAlpha( 0.5 )
	SquadLabelText:setZRot( -2 )
	SquadLabelText:setTTF( "fonts/default.ttf" )
	SquadLabelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SquadLabelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SquadLabelText )
	self.SquadLabelText = SquadLabelText
	
	local EnemyScanText = LUI.UIText.new()
	EnemyScanText:setLeftRight( true, true, 401, -712 )
	EnemyScanText:setTopBottom( true, true, 97.5, -597.5 )
	EnemyScanText:setRGB( 1, 1, 1 )
	EnemyScanText:setAlpha( 0 )
	EnemyScanText:setText( Engine.Localize( "CP_MI_SING_BIODOMES_ENEMY_SCAN" ) )
	EnemyScanText:setTTF( "fonts/default.ttf" )
	EnemyScanText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EnemyScanText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EnemyScanText )
	self.EnemyScanText = EnemyScanText
	
	self.SquadLabelText:linkToElementModel( self, "squad_label_text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SquadLabelText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			SquadStartFadeIn = function ()
				self:setupElementClipCounter( 2 )
				local ImageScanlineFrame2 = function ( ImageScanline, event )
					local ImageScanlineFrame3 = function ( ImageScanline, event )
						if not event.interrupted then
							ImageScanline:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						end
						ImageScanline:setLeftRight( true, false, 401, 879 )
						ImageScanline:setTopBottom( true, false, 122.75, 130.75 )
						ImageScanline:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ImageScanline, event )
						else
							ImageScanline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ImageScanlineFrame3( ImageScanline, event )
						return 
					else
						ImageScanline:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ImageScanline:setLeftRight( true, false, 625, 656.96 )
						ImageScanline:setTopBottom( true, false, 326.38, 334.38 )
						ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame3 )
					end
				end
				
				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( true, false, 401, 879 )
				self.ImageScanline:setTopBottom( true, false, 124, 132 )
				self.ImageScanline:setAlpha( 0 )
				ImageScanlineFrame2( ImageScanline, {} )
				local SquadLabelTextFrame2 = function ( SquadLabelText, event )
					if not event.interrupted then
						SquadLabelText:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					SquadLabelText:setLeftRight( true, true, 1006, -64 )
					SquadLabelText:setTopBottom( true, true, 307, -395 )
					if event.interrupted then
						self.clipFinished( SquadLabelText, event )
					else
						SquadLabelText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SquadLabelText:completeAnimation()
				self.SquadLabelText:setLeftRight( true, true, 1216, 146 )
				self.SquadLabelText:setTopBottom( true, true, 307, -395 )
				SquadLabelTextFrame2( SquadLabelText, {} )
			end,
			SquadStartFlash = function ()
				self:setupElementClipCounter( 2 )
				local ImageScanlineFrame2 = function ( ImageScanline, event )
					if not event.interrupted then
						ImageScanline:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					ImageScanline:setLeftRight( true, false, 401, 879 )
					ImageScanline:setTopBottom( true, false, 591, 599 )
					ImageScanline:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImageScanline, event )
					else
						ImageScanline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( true, false, 401, 879 )
				self.ImageScanline:setTopBottom( true, false, 122.5, 130.5 )
				self.ImageScanline:setAlpha( 0.1 )
				ImageScanlineFrame2( ImageScanline, {} )
				local EnemyScanTextFrame2 = function ( EnemyScanText, event )
					local EnemyScanTextFrame3 = function ( EnemyScanText, event )
						local EnemyScanTextFrame4 = function ( EnemyScanText, event )
							local EnemyScanTextFrame5 = function ( EnemyScanText, event )
								local EnemyScanTextFrame6 = function ( EnemyScanText, event )
									local EnemyScanTextFrame7 = function ( EnemyScanText, event )
										if not event.interrupted then
											EnemyScanText:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										EnemyScanText:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( EnemyScanText, event )
										else
											EnemyScanText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										EnemyScanTextFrame7( EnemyScanText, event )
										return 
									else
										EnemyScanText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										EnemyScanText:setAlpha( 1 )
										EnemyScanText:registerEventHandler( "transition_complete_keyframe", EnemyScanTextFrame7 )
									end
								end
								
								if event.interrupted then
									EnemyScanTextFrame6( EnemyScanText, event )
									return 
								else
									EnemyScanText:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									EnemyScanText:setAlpha( 0.1 )
									EnemyScanText:registerEventHandler( "transition_complete_keyframe", EnemyScanTextFrame6 )
								end
							end
							
							if event.interrupted then
								EnemyScanTextFrame5( EnemyScanText, event )
								return 
							else
								EnemyScanText:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								EnemyScanText:setAlpha( 1 )
								EnemyScanText:registerEventHandler( "transition_complete_keyframe", EnemyScanTextFrame5 )
							end
						end
						
						if event.interrupted then
							EnemyScanTextFrame4( EnemyScanText, event )
							return 
						else
							EnemyScanText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							EnemyScanText:setAlpha( 0.1 )
							EnemyScanText:registerEventHandler( "transition_complete_keyframe", EnemyScanTextFrame4 )
						end
					end
					
					if event.interrupted then
						EnemyScanTextFrame3( EnemyScanText, event )
						return 
					else
						EnemyScanText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						EnemyScanText:setAlpha( 1 )
						EnemyScanText:registerEventHandler( "transition_complete_keyframe", EnemyScanTextFrame3 )
					end
				end
				
				EnemyScanText:completeAnimation()
				self.EnemyScanText:setAlpha( 0.1 )
				EnemyScanTextFrame2( EnemyScanText, {} )
			end,
			Scanline = function ()
				self:setupElementClipCounter( 2 )
				local ImageScanlineFrame2 = function ( ImageScanline, event )
					if not event.interrupted then
						ImageScanline:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					ImageScanline:setLeftRight( true, false, 401, 879 )
					ImageScanline:setTopBottom( true, false, 594, 600 )
					ImageScanline:setAlpha( 0 )
					ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
					ImageScanline:setShaderVector( 0, 0.25, 0, 0, 0 )
					ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ImageScanline, event )
					else
						ImageScanline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( true, false, 401, 879 )
				self.ImageScanline:setTopBottom( true, false, 124, 132 )
				self.ImageScanline:setAlpha( 0.2 )
				self.ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
				self.ImageScanline:setShaderVector( 0, 0.25, 0, 0, 0 )
				self.ImageScanline:setShaderVector( 1, 1, 0, 0, 0 )
				ImageScanlineFrame2( ImageScanline, {} )
				local EnemyScanTextFrame2 = function ( EnemyScanText, event )
					if not event.interrupted then
						EnemyScanText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					EnemyScanText:setRGB( 0.96, 0.95, 0.95 )
					EnemyScanText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EnemyScanText, event )
					else
						EnemyScanText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EnemyScanText:completeAnimation()
				self.EnemyScanText:setRGB( 1, 1, 1 )
				self.EnemyScanText:setAlpha( 0.5 )
				EnemyScanTextFrame2( EnemyScanText, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.SquadLabelText:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

