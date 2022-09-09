-- 3bf48d66be03adfdb3fd64413609d22a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.DOA.redinsPlayerLine" )

CoD.redinsHUD = InheritFrom( LUI.UIElement )
CoD.redinsHUD.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.redinsHUD )
	self.id = "redinsHUD"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 31 )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, false, 83.78, 368 )
	Bg:setTopBottom( true, false, 0, 50.1 )
	Bg:setRGB( 0, 0, 0 )
	Bg:setAlpha( 0.35 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 83.78, 368 )
	Image5:setTopBottom( true, false, 31, 50.1 )
	Image5:setRGB( 0, 0, 0 )
	Image5:setAlpha( 0.45 )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 268.78, 269.78 )
	Image3:setTopBottom( true, false, 1, 29.36 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setAlpha( 0.35 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local redinsPlayerLine0 = CoD.redinsPlayerLine.new( menu, controller )
	redinsPlayerLine0:setLeftRight( true, false, 43, 359 )
	redinsPlayerLine0:setTopBottom( true, false, 44, 75.86 )
	redinsPlayerLine0:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player1", function ( model )
		redinsPlayerLine0:setModel( model, controller )
	end )
	redinsPlayerLine0:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "generic_txt" )
			end
		}
	} )
	redinsPlayerLine0:linkToElementModel( redinsPlayerLine0, "generic_txt", true, function ( model )
		menu:updateElementState( redinsPlayerLine0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "generic_txt"
		} )
	end )
	self:addElement( redinsPlayerLine0 )
	self.redinsPlayerLine0 = redinsPlayerLine0
	
	local redinsPlayerLine1 = CoD.redinsPlayerLine.new( menu, controller )
	redinsPlayerLine1:setLeftRight( true, false, 43, 359 )
	redinsPlayerLine1:setTopBottom( true, false, 60.8, 91.8 )
	redinsPlayerLine1:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player2", function ( model )
		redinsPlayerLine1:setModel( model, controller )
	end )
	redinsPlayerLine1:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "generic_txt" )
			end
		}
	} )
	redinsPlayerLine1:linkToElementModel( redinsPlayerLine1, "generic_txt", true, function ( model )
		menu:updateElementState( redinsPlayerLine1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "generic_txt"
		} )
	end )
	self:addElement( redinsPlayerLine1 )
	self.redinsPlayerLine1 = redinsPlayerLine1
	
	local redinsPlayerLine2 = CoD.redinsPlayerLine.new( menu, controller )
	redinsPlayerLine2:setLeftRight( true, false, 43, 359 )
	redinsPlayerLine2:setTopBottom( true, false, 77.49, 108.49 )
	redinsPlayerLine2:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player3", function ( model )
		redinsPlayerLine2:setModel( model, controller )
	end )
	redinsPlayerLine2:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "generic_txt" )
			end
		}
	} )
	redinsPlayerLine2:linkToElementModel( redinsPlayerLine2, "generic_txt", true, function ( model )
		menu:updateElementState( redinsPlayerLine2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "generic_txt"
		} )
	end )
	self:addElement( redinsPlayerLine2 )
	self.redinsPlayerLine2 = redinsPlayerLine2
	
	local redinsPlayerLine3 = CoD.redinsPlayerLine.new( menu, controller )
	redinsPlayerLine3:setLeftRight( true, false, 43, 359 )
	redinsPlayerLine3:setTopBottom( true, false, 94, 124.99 )
	redinsPlayerLine3:subscribeToGlobalModel( controller, "DeadOpsArcadePlayers", "player4", function ( model )
		redinsPlayerLine3:setModel( model, controller )
	end )
	redinsPlayerLine3:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "generic_txt" )
			end
		}
	} )
	redinsPlayerLine3:linkToElementModel( redinsPlayerLine3, "generic_txt", true, function ( model )
		menu:updateElementState( redinsPlayerLine3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "generic_txt"
		} )
	end )
	self:addElement( redinsPlayerLine3 )
	self.redinsPlayerLine3 = redinsPlayerLine3
	
	local timeleft = LUI.UIText.new()
	timeleft:setLeftRight( true, false, 266.78, 321.19 )
	timeleft:setTopBottom( true, false, 0, 32.61 )
	timeleft:setRGB( 1, 0.97, 0 )
	timeleft:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	timeleft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timeleft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timeleft:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", "gpr0", function ( model )
		local gpr0 = Engine.GetModelValue( model )
		if gpr0 then
			timeleft:setText( Engine.Localize( gpr0 ) )
		end
	end )
	self:addElement( timeleft )
	self.timeleft = timeleft
	
	local seconds = LUI.UITightText.new()
	seconds:setLeftRight( true, false, 316.04, 366.54 )
	seconds:setTopBottom( true, false, 11.48, 26.36 )
	seconds:setRGB( 1, 0.97, 0 )
	seconds:setText( Engine.Localize( "CP_DOA_BO3_SECONDS" ) )
	seconds:setTTF( "fonts/default.ttf" )
	self:addElement( seconds )
	self.seconds = seconds
	
	local secondsbonus = LUI.UIText.new()
	secondsbonus:setLeftRight( true, false, 316.04, 342.92 )
	secondsbonus:setTopBottom( true, false, -1.5, 14.5 )
	secondsbonus:setRGB( 0.11, 1, 0.66 )
	secondsbonus:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	secondsbonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	secondsbonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	secondsbonus:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", "gtxt0", function ( model )
		local gtxt0 = Engine.GetModelValue( model )
		if gtxt0 then
			secondsbonus:setText( Engine.Localize( gtxt0 ) )
		end
	end )
	self:addElement( secondsbonus )
	self.secondsbonus = secondsbonus
	
	local boost = LUI.UIImage.new()
	boost:setLeftRight( true, false, 292.71, 316.84 )
	boost:setTopBottom( true, false, 30, 50.94 )
	boost:setImage( RegisterImage( "uie_t7_icon_redinsrally_bottle" ) )
	self:addElement( boost )
	self.boost = boost
	
	local zomHead = LUI.UIImage.new()
	zomHead:setLeftRight( true, false, 316.84, 340.92 )
	zomHead:setTopBottom( true, false, 30, 50.94 )
	zomHead:setImage( RegisterImage( "uie_t7_icon_redinsrally_zombie" ) )
	self:addElement( zomHead )
	self.zomHead = zomHead
	
	local laps = LUI.UIImage.new()
	laps:setLeftRight( true, false, 266.78, 292.71 )
	laps:setTopBottom( true, false, 30, 50.94 )
	laps:setImage( RegisterImage( "uie_t7_icon_redinsrally_flag" ) )
	self:addElement( laps )
	self.laps = laps
	
	local Gem = LUI.UIImage.new()
	Gem:setLeftRight( true, false, 340.92, 364.92 )
	Gem:setTopBottom( true, false, 30, 50.94 )
	Gem:setImage( RegisterImage( "uie_t7_icon_redinsrally_diamond" ) )
	self:addElement( Gem )
	self.Gem = Gem
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 90, 255.78 )
	title:setTopBottom( true, false, 5.5, 25.5 )
	title:setRGB( 1, 0.67, 0 )
	title:setText( Engine.Localize( "CP_DOA_BO3_TITLE_ROOM_REDINS" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setLetterSpacing( 2 )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local driver = LUI.UITightText.new()
	driver:setLeftRight( true, false, 89, 137 )
	driver:setTopBottom( true, false, 31.94, 50.94 )
	driver:setText( Engine.Localize( "CP_DOA_BO3_DRIVER" ) )
	driver:setTTF( "fonts/default.ttf" )
	self:addElement( driver )
	self.driver = driver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Bg:completeAnimation()
				self.Bg:setLeftRight( true, false, 83.78, 368 )
				self.Bg:setTopBottom( true, false, 0, 50.1 )
				self.Bg:setRGB( 0, 0, 0 )
				self.Bg:setAlpha( 0.35 )
				self.clipFinished( Bg, {} )

				Image5:completeAnimation()
				self.Image5:setLeftRight( true, false, 83.78, 368 )
				self.Image5:setTopBottom( true, false, 31, 50.1 )
				self.Image5:setRGB( 0, 0, 0 )
				self.Image5:setAlpha( 0.45 )
				self.clipFinished( Image5, {} )

				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, 268.78, 269.78 )
				self.Image3:setTopBottom( true, false, 1, 29.36 )
				self.Image3:setRGB( 0, 0, 0 )
				self.Image3:setAlpha( 0.35 )
				self.clipFinished( Image3, {} )

				redinsPlayerLine0:completeAnimation()
				self.redinsPlayerLine0:setAlpha( 1 )
				self.clipFinished( redinsPlayerLine0, {} )

				redinsPlayerLine1:completeAnimation()
				self.redinsPlayerLine1:setAlpha( 1 )
				self.clipFinished( redinsPlayerLine1, {} )

				redinsPlayerLine2:completeAnimation()
				self.redinsPlayerLine2:setAlpha( 1 )
				self.clipFinished( redinsPlayerLine2, {} )

				redinsPlayerLine3:completeAnimation()
				self.redinsPlayerLine3:setAlpha( 1 )
				self.clipFinished( redinsPlayerLine3, {} )

				timeleft:completeAnimation()
				self.timeleft:setAlpha( 1 )
				self.clipFinished( timeleft, {} )

				seconds:completeAnimation()
				self.seconds:setAlpha( 1 )
				self.clipFinished( seconds, {} )

				secondsbonus:completeAnimation()
				self.secondsbonus:setAlpha( 1 )
				self.clipFinished( secondsbonus, {} )

				boost:completeAnimation()
				self.boost:setLeftRight( true, false, 292.71, 316.84 )
				self.boost:setTopBottom( true, false, 30, 50.94 )
				self.boost:setAlpha( 1 )
				self.clipFinished( boost, {} )

				zomHead:completeAnimation()
				self.zomHead:setLeftRight( true, false, 316.84, 340.92 )
				self.zomHead:setTopBottom( true, false, 30, 50.94 )
				self.zomHead:setAlpha( 1 )
				self.clipFinished( zomHead, {} )

				laps:completeAnimation()
				self.laps:setLeftRight( true, false, 266.78, 292.71 )
				self.laps:setTopBottom( true, false, 30, 50.94 )
				self.laps:setAlpha( 1 )
				self.clipFinished( laps, {} )

				Gem:completeAnimation()
				self.Gem:setLeftRight( true, false, 340.92, 364.92 )
				self.Gem:setTopBottom( true, false, 30, 50.94 )
				self.Gem:setAlpha( 1 )
				self.clipFinished( Gem, {} )

				title:completeAnimation()
				self.title:setRGB( 1, 0.67, 0 )
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )

				driver:completeAnimation()
				self.driver:setRGB( 1, 1, 1 )
				self.driver:setAlpha( 1 )
				self.clipFinished( driver, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				Bg:completeAnimation()
				self.Bg:setAlpha( 0 )
				self.clipFinished( Bg, {} )

				Image5:completeAnimation()
				self.Image5:setAlpha( 0 )
				self.clipFinished( Image5, {} )

				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )

				redinsPlayerLine0:completeAnimation()
				self.redinsPlayerLine0:setAlpha( 0 )
				self.clipFinished( redinsPlayerLine0, {} )

				redinsPlayerLine1:completeAnimation()
				self.redinsPlayerLine1:setAlpha( 0 )
				self.clipFinished( redinsPlayerLine1, {} )

				redinsPlayerLine2:completeAnimation()
				self.redinsPlayerLine2:setAlpha( 0 )
				self.clipFinished( redinsPlayerLine2, {} )

				redinsPlayerLine3:completeAnimation()
				self.redinsPlayerLine3:setAlpha( 0 )
				self.clipFinished( redinsPlayerLine3, {} )

				timeleft:completeAnimation()
				self.timeleft:setAlpha( 0 )
				self.clipFinished( timeleft, {} )

				seconds:completeAnimation()
				self.seconds:setAlpha( 0 )
				self.clipFinished( seconds, {} )

				secondsbonus:completeAnimation()
				self.secondsbonus:setAlpha( 0 )
				self.clipFinished( secondsbonus, {} )

				boost:completeAnimation()
				self.boost:setAlpha( 0 )
				self.clipFinished( boost, {} )

				zomHead:completeAnimation()
				self.zomHead:setAlpha( 0 )
				self.clipFinished( zomHead, {} )

				laps:completeAnimation()
				self.laps:setAlpha( 0 )
				self.clipFinished( laps, {} )

				Gem:completeAnimation()
				self.Gem:setAlpha( 0 )
				self.clipFinished( Gem, {} )

				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )

				driver:completeAnimation()
				self.driver:setAlpha( 0 )
				self.clipFinished( driver, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.redinsPlayerLine0:close()
		element.redinsPlayerLine1:close()
		element.redinsPlayerLine2:close()
		element.redinsPlayerLine3:close()
		element.timeleft:close()
		element.secondsbonus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
