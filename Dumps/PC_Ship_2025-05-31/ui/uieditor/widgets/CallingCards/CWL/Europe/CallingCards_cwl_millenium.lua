require( "ui.uieditor.widgets.CallingCards.CWL.CallingCards_cwl_worldmap_widget" )

CoD.CallingCards_cwl_millenium = InheritFrom( LUI.UIElement )
CoD.CallingCards_cwl_millenium.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_cwl_millenium )
	self.id = "CallingCards_cwl_millenium"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG5Empty = LUI.UIImage.new()
	BG5Empty:setLeftRight( true, false, 0, 480 )
	BG5Empty:setTopBottom( true, false, 0, 120 )
	BG5Empty:setImage( RegisterImage( "uie_callingcards_cwl_purple_01" ) )
	self:addElement( BG5Empty )
	self.BG5Empty = BG5Empty
	
	local BG1 = LUI.UIImage.new()
	BG1:setLeftRight( true, false, 0, 480 )
	BG1:setTopBottom( true, false, 0, 120 )
	BG1:setAlpha( 0 )
	BG1:setImage( RegisterImage( "uie_callingcards_cwl_purple_bg0b" ) )
	self:addElement( BG1 )
	self.BG1 = BG1
	
	local BG2 = LUI.UIImage.new()
	BG2:setLeftRight( true, false, 0, 480 )
	BG2:setTopBottom( true, false, 0, 120 )
	BG2:setAlpha( 0 )
	BG2:setImage( RegisterImage( "uie_callingcards_cwl_purple_bg0c" ) )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local BG5Glow = LUI.UIImage.new()
	BG5Glow:setLeftRight( true, false, 0, 480 )
	BG5Glow:setTopBottom( true, false, 0, 120 )
	BG5Glow:setImage( RegisterImage( "uie_callingcards_cwl_purple_02c" ) )
	self:addElement( BG5Glow )
	self.BG5Glow = BG5Glow
	
	local EMBER2c = LUI.UIImage.new()
	EMBER2c:setLeftRight( true, false, 240, 720 )
	EMBER2c:setTopBottom( true, false, -238, 422 )
	EMBER2c:setAlpha( 0.3 )
	EMBER2c:setYRot( 1 )
	EMBER2c:setZRot( 53 )
	EMBER2c:setScale( 0.7 )
	EMBER2c:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c:setShaderVector( 1, 0, 0.04, 0, 0 )
	self:addElement( EMBER2c )
	self.EMBER2c = EMBER2c
	
	local EMBER2b = LUI.UIImage.new()
	EMBER2b:setLeftRight( true, false, -141, 339 )
	EMBER2b:setTopBottom( true, false, -238, 422 )
	EMBER2b:setAlpha( 0.4 )
	EMBER2b:setYRot( 1 )
	EMBER2b:setZRot( 53 )
	EMBER2b:setScale( 0.7 )
	EMBER2b:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2b:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2b:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2b:setShaderVector( 1, 0, 0.03, 0, 0 )
	self:addElement( EMBER2b )
	self.EMBER2b = EMBER2b
	
	local EMBER2 = LUI.UIImage.new()
	EMBER2:setLeftRight( true, false, 0, 480 )
	EMBER2:setTopBottom( true, false, -251, 409 )
	EMBER2:setYRot( 1 )
	EMBER2:setZRot( 53 )
	EMBER2:setImage( RegisterImage( "uie_callingcards_cwl_ember2" ) )
	EMBER2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2:setShaderVector( 1, 0, 0.05, 0, 0 )
	self:addElement( EMBER2 )
	self.EMBER2 = EMBER2
	
	local CallingCardscwlworldmapwidget0 = CoD.CallingCards_cwl_worldmap_widget.new( menu, controller )
	CallingCardscwlworldmapwidget0:setLeftRight( true, false, 0, 480 )
	CallingCardscwlworldmapwidget0:setTopBottom( true, false, -1.93, 118.07 )
	CallingCardscwlworldmapwidget0:setRGB( 0.22, 0.22, 0.22 )
	CallingCardscwlworldmapwidget0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CallingCardscwlworldmapwidget0 )
	self.CallingCardscwlworldmapwidget0 = CallingCardscwlworldmapwidget0
	
	local LOGO = LUI.UIImage.new()
	LOGO:setLeftRight( true, false, 3, 480 )
	LOGO:setTopBottom( true, false, 0.54, 122.7 )
	LOGO:setImage( RegisterImage( "uie_callingcards_cwl_millenium" ) )
	self:addElement( LOGO )
	self.LOGO = LOGO
	
	local GLOWBALL = LUI.UIImage.new()
	GLOWBALL:setLeftRight( true, false, 146, 184 )
	GLOWBALL:setTopBottom( true, false, 75.22, 160.92 )
	GLOWBALL:setRGB( 0, 0.05, 1 )
	GLOWBALL:setZRot( -54 )
	GLOWBALL:setScale( 1.4 )
	GLOWBALL:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GLOWBALL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GLOWBALL )
	self.GLOWBALL = GLOWBALL
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BG5Empty:completeAnimation()
				self.BG5Empty:setAlpha( 1 )
				self.clipFinished( BG5Empty, {} )
				local BG1Frame2 = function ( BG1, event )
					local BG1Frame3 = function ( BG1, event )
						local BG1Frame4 = function ( BG1, event )
							if not event.interrupted then
								BG1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							end
							BG1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BG1, event )
							else
								BG1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BG1Frame4( BG1, event )
							return 
						else
							BG1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							BG1:registerEventHandler( "transition_complete_keyframe", BG1Frame4 )
						end
					end
					
					if event.interrupted then
						BG1Frame3( BG1, event )
						return 
					else
						BG1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BG1:setAlpha( 1 )
						BG1:registerEventHandler( "transition_complete_keyframe", BG1Frame3 )
					end
				end
				
				BG1:completeAnimation()
				self.BG1:setAlpha( 0 )
				BG1Frame2( BG1, {} )
				local BG2Frame2 = function ( BG2, event )
					local BG2Frame3 = function ( BG2, event )
						local BG2Frame4 = function ( BG2, event )
							if not event.interrupted then
								BG2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							end
							BG2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BG2, event )
							else
								BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BG2Frame4( BG2, event )
							return 
						else
							BG2:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							BG2:setAlpha( 1 )
							BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame4 )
						end
					end
					
					if event.interrupted then
						BG2Frame3( BG2, event )
						return 
					else
						BG2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame3 )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0 )
				BG2Frame2( BG2, {} )
				local BG5GlowFrame2 = function ( BG5Glow, event )
					local BG5GlowFrame3 = function ( BG5Glow, event )
						local BG5GlowFrame4 = function ( BG5Glow, event )
							local BG5GlowFrame5 = function ( BG5Glow, event )
								local BG5GlowFrame6 = function ( BG5Glow, event )
									if not event.interrupted then
										BG5Glow:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
									end
									BG5Glow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( BG5Glow, event )
									else
										BG5Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BG5GlowFrame6( BG5Glow, event )
									return 
								else
									BG5Glow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
									BG5Glow:setAlpha( 1 )
									BG5Glow:registerEventHandler( "transition_complete_keyframe", BG5GlowFrame6 )
								end
							end
							
							if event.interrupted then
								BG5GlowFrame5( BG5Glow, event )
								return 
							else
								BG5Glow:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
								BG5Glow:registerEventHandler( "transition_complete_keyframe", BG5GlowFrame5 )
							end
						end
						
						if event.interrupted then
							BG5GlowFrame4( BG5Glow, event )
							return 
						else
							BG5Glow:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							BG5Glow:registerEventHandler( "transition_complete_keyframe", BG5GlowFrame4 )
						end
					end
					
					if event.interrupted then
						BG5GlowFrame3( BG5Glow, event )
						return 
					else
						BG5Glow:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						BG5Glow:registerEventHandler( "transition_complete_keyframe", BG5GlowFrame3 )
					end
				end
				
				BG5Glow:completeAnimation()
				self.BG5Glow:setAlpha( 0 )
				BG5GlowFrame2( BG5Glow, {} )
				local GLOWBALLFrame2 = function ( GLOWBALL, event )
					local GLOWBALLFrame3 = function ( GLOWBALL, event )
						local GLOWBALLFrame4 = function ( GLOWBALL, event )
							local GLOWBALLFrame5 = function ( GLOWBALL, event )
								if not event.interrupted then
									GLOWBALL:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								GLOWBALL:setLeftRight( true, false, 284, 322 )
								GLOWBALL:setTopBottom( true, false, -71.85, 13.85 )
								GLOWBALL:setAlpha( 0 )
								GLOWBALL:setXRot( 0 )
								GLOWBALL:setYRot( 0 )
								GLOWBALL:setZRot( -27 )
								GLOWBALL:setScale( 1.6 )
								if event.interrupted then
									self.clipFinished( GLOWBALL, event )
								else
									GLOWBALL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GLOWBALLFrame5( GLOWBALL, event )
								return 
							else
								GLOWBALL:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								GLOWBALL:setLeftRight( true, false, 270, 308 )
								GLOWBALL:setTopBottom( true, false, -42.85, 42.85 )
								GLOWBALL:setAlpha( 1 )
								GLOWBALL:setZRot( -27 )
								GLOWBALL:setScale( 1.41 )
								GLOWBALL:registerEventHandler( "transition_complete_keyframe", GLOWBALLFrame5 )
							end
						end
						
						if event.interrupted then
							GLOWBALLFrame4( GLOWBALL, event )
							return 
						else
							GLOWBALL:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							GLOWBALL:setLeftRight( true, false, 221, 259 )
							GLOWBALL:setTopBottom( true, false, 22.22, 107.92 )
							GLOWBALL:setAlpha( 0.65 )
							GLOWBALL:setZRot( -39 )
							GLOWBALL:setScale( 1.25 )
							GLOWBALL:registerEventHandler( "transition_complete_keyframe", GLOWBALLFrame4 )
						end
					end
					
					if event.interrupted then
						GLOWBALLFrame3( GLOWBALL, event )
						return 
					else
						GLOWBALL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						GLOWBALL:setLeftRight( true, false, 154, 192 )
						GLOWBALL:setTopBottom( true, false, 69.22, 154.92 )
						GLOWBALL:setAlpha( 0.3 )
						GLOWBALL:setScale( 1.1 )
						GLOWBALL:registerEventHandler( "transition_complete_keyframe", GLOWBALLFrame3 )
					end
				end
				
				GLOWBALL:completeAnimation()
				self.GLOWBALL:setLeftRight( true, false, 111, 149 )
				self.GLOWBALL:setTopBottom( true, false, 96.22, 181.92 )
				self.GLOWBALL:setAlpha( 0 )
				self.GLOWBALL:setXRot( 0 )
				self.GLOWBALL:setYRot( 0 )
				self.GLOWBALL:setZRot( -63 )
				self.GLOWBALL:setScale( 0.8 )
				GLOWBALLFrame2( GLOWBALL, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardscwlworldmapwidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

