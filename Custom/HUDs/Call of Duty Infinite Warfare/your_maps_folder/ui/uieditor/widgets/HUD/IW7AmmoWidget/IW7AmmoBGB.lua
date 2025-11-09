require( "ui.uieditor.widgets.HUD.IW7AmmoWidget.IW7AmmoBGBCard" )

CoD.IW7AmmoBGB = InheritFrom( LUI.UIElement )
CoD.IW7AmmoBGB.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7AmmoBGB )
	self.id = "IW7AmmoBGB"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.Card4 = LUI.UIImage.new()
	self.Card4:setLeftRight( false, true, -158, -37 )
	self.Card4:setTopBottom( false, true, -163, 17 )
	self.Card4:setImage( RegisterImage( "zm_wc_fan" ) )
	self.Card4:setRGB( 0.66, 0.66, 0.66 )
	self.Card4:setScale( 0.92 )
	self.Card4:setZRot( -30 )
	self:addElement( self.Card4 )

	self.Card3 = LUI.UIImage.new()
	self.Card3:setLeftRight( false, true, -158, -37 )
	self.Card3:setTopBottom( false, true, -163, 17 )
	self.Card3:setImage( RegisterImage( "zm_wc_fan" ) )
	self.Card3:setRGB( 0.66, 0.66, 0.66 )
	self.Card3:setScale( 0.92 )
	self.Card3:setZRot( -22.5 )
	self:addElement( self.Card3 )

	self.Card2 = LUI.UIImage.new()
	self.Card2:setLeftRight( false, true, -158, -37 )
	self.Card2:setTopBottom( false, true, -163, 17 )
	self.Card2:setImage( RegisterImage( "zm_wc_fan" ) )
	self.Card2:setRGB( 0.66, 0.66, 0.66 )
	self.Card2:setScale( 0.92 )
	self.Card2:setZRot( -15 )
	self:addElement( self.Card2 )

	self.Card1 = LUI.UIImage.new()
	self.Card1:setLeftRight( false, true, -158, -37 )
	self.Card1:setTopBottom( false, true, -163, 17 )
	self.Card1:setImage( RegisterImage( "zm_wc_fan" ) )
	self.Card1:setRGB( 0.66, 0.66, 0.66 )
	self.Card1:setScale( 0.92 )
	self.Card1:setZRot( -7.5 )
	self:addElement( self.Card1 )

	self.MainCard = CoD.IW7AmmoBGBCard.new( menu, controller )
	self.MainCard:setLeftRight( true, true, 0, 0 )
	self.MainCard:setTopBottom( true, true, 0, 0 )
	self:addElement( self.MainCard )

	self.Triangle = LUI.UIImage.new()
	self.Triangle:setLeftRight( false, true, -195.5, 8 )
	self.Triangle:setTopBottom( false, true, -145, 15 )
	self.Triangle:setImage( RegisterImage( "zm_wc_triangle" ) )
	self.Triangle:setRGB( 0.1, 0.1, 0.1 )
	self.Triangle:setZRot( 180 )
	self:addElement( self.Triangle )

	self.MeterBG = LUI.UIImage.new()
	self.MeterBG:setLeftRight( false, true, -166.5, -27.5 )
	self.MeterBG:setTopBottom( false, true, -143, -25.5 )
	self.MeterBG:setImage( RegisterImage( "zm_wc_circle_bg" ) )
	self.MeterBG:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( self.MeterBG )

	self.Meter = LUI.UIImage.new()
	self.Meter:setLeftRight( false, true, -166.5, -27.5 )
	self.Meter:setTopBottom( false, true, -143, -25.5 )
	self.Meter:setImage( RegisterImage( "uie_t7_menu_aar_whiteringfore" ) )
	self.Meter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	self.Meter:setShaderVector( 0, 1, 0, 0, 0 )
	self.Meter:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.Meter:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.Meter:setShaderVector( 3, 0, 0, 0, 0 )
	self.Meter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_timer" ), function ( model )
		local bgb_timer = Engine.GetModelValue( model )

		if bgb_timer then
			if bgb_timer < 1 then
				self.Meter:setImage( RegisterImage( "uie_t7_menu_aar_whiteringfore" ) )
				self.Meter:setRGB( 0.94, 0.61, 0.18 )
				self.Meter:setScale( 0.88 )
			else
				self.Meter:setImage( RegisterImage( "zm_wc_card_glow_ring" ) )
				self.Meter:setRGB( 1, 1, 1 )
				self.Meter:setScale( 1 )
			end
			
			self.Meter:setShaderVector( 0, AdjustStartEnd( 0, 1,
				CoD.GetVectorComponentFromString( bgb_timer, 1 ),
				CoD.GetVectorComponentFromString( bgb_timer, 2 ),
				CoD.GetVectorComponentFromString( bgb_timer, 3 ),
				CoD.GetVectorComponentFromString( bgb_timer, 4 ) ) )
		end
	end )
	self:addElement( self.Meter )

	self.MeterOutline1 = LUI.UIImage.new()
	self.MeterOutline1:setLeftRight( false, true, -166.5, -27.5 )
	self.MeterOutline1:setTopBottom( false, true, -143, -25.5 )
	self.MeterOutline1:setImage( RegisterImage( "zm_wc_red_hoop" ) )
	self:addElement( self.MeterOutline1 )

	self.MeterOutline2 = LUI.UIImage.new()
	self.MeterOutline2:setLeftRight( false, true, -166.5, -27.5 )
	self.MeterOutline2:setTopBottom( false, true, -143, -25.5 )
	self.MeterOutline2:setImage( RegisterImage( "zm_wc_red_hoop" ) )
	self.MeterOutline2:setScale( 0.8 )
	self:addElement( self.MeterOutline2 )

	self.DevilBottom = LUI.UIImage.new()
	self.DevilBottom:setLeftRight( false, true, -154.5, -40.5 )
	self.DevilBottom:setTopBottom( false, true, -100.5, -2 )
	self.DevilBottom:setImage( RegisterImage( "zm_wc_devil_head_bottom" ) )
	self:addElement( self.DevilBottom )

	self.DevilTop = LUI.UIImage.new()
	self.DevilTop:setLeftRight( false, true, -156.5, -42.5 )
	self.DevilTop:setTopBottom( false, true, -141, -42.5 )
	self.DevilTop:setImage( RegisterImage( "zm_wc_devil_head_top" ) )
	self:addElement( self.DevilTop )

	self.DevilSad = LUI.UIImage.new()
	self.DevilSad:setLeftRight( false, true, -168, -28 )
	self.DevilSad:setTopBottom( false, true, -142, -13 )
	self.DevilSad:setImage( RegisterImage( "zm_wc_devil_head_sad" ) )
	self:addElement( self.DevilSad )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.DevilBottom:completeAnimation()
				self.DevilBottom:setAlpha( 1 )
				self.clipFinished( self.DevilBottom, {} )

				self.DevilTop:completeAnimation()
				self.DevilTop:setAlpha( 1 )
				self.clipFinished( self.DevilTop, {} )

				self.DevilSad:completeAnimation()
				self.DevilSad:setAlpha( 0 )
				self.clipFinished( self.DevilSad, {} )
			end,
			DevilAnim = function ()
				self:setupElementClipCounter( 1 )

				local DevilAnimationStage2 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end

					element:setTopBottom( false, true, -100.5, -2 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				local DevilAnimationStage1 = function ( element, event )
					if event.interrupted then
						DevilAnimationStage2( element, event )

						return 
					else
						element:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )

						element:setTopBottom( false, true, -93.5, 9 )

						element:registerEventHandler( "transition_complete_keyframe", DevilAnimationStage2 )
					end
				end

				self.DevilBottom:completeAnimation()
				self.DevilBottom:setTopBottom( false, true, -100.5, -2 )
				DevilAnimationStage1( self.DevilBottom, {} )
			end
		},
		NoPower = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.DevilBottom:completeAnimation()
				self.DevilBottom:setAlpha( 0 )
				self.clipFinished( self.DevilBottom, {} )

				self.DevilTop:completeAnimation()
				self.DevilTop:setAlpha( 0 )
				self.clipFinished( self.DevilTop, {} )

				self.DevilSad:completeAnimation()
				self.DevilSad:setAlpha( 1 )
				self.clipFinished( self.DevilSad, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoPower",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "bgb_timer", 0 )
			end
		}
	} )

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "bgb_timer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb_timer"
		} )

		PlayClip( self, "DevilAnim", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Card4:close()
		element.Card3:close()
		element.Card2:close()
		element.Card1:close()
		element.MainCard:close()
		element.Triangle:close()
		element.MeterBG:close()
		element.Meter:close()
		element.MeterOutline1:close()
		element.MeterOutline2:close()
		element.DevilBottom:close()
		element.DevilTop:close()
		element.DevilSad:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
