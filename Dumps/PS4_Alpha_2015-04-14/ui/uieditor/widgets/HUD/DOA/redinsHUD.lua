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
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 364.5 )
	title:setTopBottom( true, false, -35, 31 )
	title:setRGB( 1, 0.56, 0.15 )
	title:setText( Engine.Localize( "CP_DOA_BO3_TITLE_ROOM_REDINS" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local driver = LUI.UITightText.new()
	driver:setLeftRight( true, false, 0, 48 )
	driver:setTopBottom( true, false, 26.86, 51.86 )
	driver:setRGB( 1, 1, 1 )
	driver:setText( Engine.Localize( "CP_DOA_BO3_DRIVER" ) )
	driver:setTTF( "fonts/default.ttf" )
	self:addElement( driver )
	self.driver = driver
	
	local laps = LUI.UITightText.new()
	laps:setLeftRight( true, false, 246, 316 )
	laps:setTopBottom( true, false, 29.36, 49.36 )
	laps:setRGB( 1, 1, 1 )
	laps:setText( Engine.Localize( "CP_DOA_BO3_LAPS_LEFT" ) )
	laps:setTTF( "fonts/default.ttf" )
	self:addElement( laps )
	self.laps = laps
	
	local nitro = LUI.UITightText.new()
	nitro:setLeftRight( true, false, 316, 413 )
	nitro:setTopBottom( true, false, 29.36, 49.36 )
	nitro:setRGB( 1, 1, 1 )
	nitro:setText( Engine.Localize( "CP_DOA_BO3_NITRO_AVAIL" ) )
	nitro:setTTF( "fonts/default.ttf" )
	self:addElement( nitro )
	self.nitro = nitro
	
	local zombies = LUI.UITightText.new()
	zombies:setLeftRight( true, false, 389.5, 511.5 )
	zombies:setTopBottom( true, false, 29.36, 49.36 )
	zombies:setRGB( 1, 1, 1 )
	zombies:setText( Engine.Localize( "CP_DOA_BO3_ZOMBIES_CRUSHED" ) )
	zombies:setTTF( "fonts/default.ttf" )
	self:addElement( zombies )
	self.zombies = zombies
	
	local redinsPlayerLine0 = CoD.redinsPlayerLine.new( menu, controller )
	redinsPlayerLine0:setLeftRight( true, false, 0, 316 )
	redinsPlayerLine0:setTopBottom( true, false, 44.86, 75.86 )
	redinsPlayerLine0:setRGB( 1, 1, 1 )
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
	redinsPlayerLine1:setLeftRight( true, false, 0, 316 )
	redinsPlayerLine1:setTopBottom( true, false, 60.8, 91.8 )
	redinsPlayerLine1:setRGB( 1, 1, 1 )
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
	redinsPlayerLine2:setLeftRight( true, false, 0, 316 )
	redinsPlayerLine2:setTopBottom( true, false, 77.49, 108.49 )
	redinsPlayerLine2:setRGB( 1, 1, 1 )
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
	redinsPlayerLine3:setLeftRight( true, false, 0, 316 )
	redinsPlayerLine3:setTopBottom( true, false, 93.99, 124.99 )
	redinsPlayerLine3:setRGB( 1, 1, 1 )
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
	
	local timeleftlabel = LUI.UITightText.new()
	timeleftlabel:setLeftRight( true, false, 380.27, 469.27 )
	timeleftlabel:setTopBottom( true, false, -25.79, -11.79 )
	timeleftlabel:setRGB( 0.94, 0.75, 0 )
	timeleftlabel:setText( Engine.Localize( "CP_DOA_BO3_TIEMLEFT" ) )
	timeleftlabel:setTTF( "fonts/default.ttf" )
	self:addElement( timeleftlabel )
	self.timeleftlabel = timeleftlabel
	
	local timeleft = LUI.UIText.new()
	timeleft:setLeftRight( true, false, 389.5, 457.91 )
	timeleft:setTopBottom( true, false, -11.79, 31.21 )
	timeleft:setRGB( 1, 1, 1 )
	timeleft:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	timeleft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	timeleft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timeleft:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", "gpr0", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			timeleft:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( timeleft )
	self.timeleft = timeleft
	
	local seconds = LUI.UITightText.new()
	seconds:setLeftRight( true, false, 450.5, 498.5 )
	seconds:setTopBottom( true, false, 9.06, 21.94 )
	seconds:setRGB( 1, 1, 1 )
	seconds:setText( Engine.Localize( "CP_DOA_BO3_SECONDS" ) )
	seconds:setTTF( "fonts/default.ttf" )
	self:addElement( seconds )
	self.seconds = seconds
	
	local secondsbonus = LUI.UIText.new()
	secondsbonus:setLeftRight( true, false, 463.27, 505.27 )
	secondsbonus:setTopBottom( true, false, -9.79, 15.21 )
	secondsbonus:setRGB( 0.11, 1, 0.66 )
	secondsbonus:setTTF( "fonts/default.ttf" )
	secondsbonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	secondsbonus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	secondsbonus:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", "gtxt0", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			secondsbonus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( secondsbonus )
	self.secondsbonus = secondsbonus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )
				driver:completeAnimation()
				self.driver:setAlpha( 1 )
				self.clipFinished( driver, {} )
				laps:completeAnimation()
				self.laps:setAlpha( 1 )
				self.clipFinished( laps, {} )
				nitro:completeAnimation()
				self.nitro:setAlpha( 1 )
				self.clipFinished( nitro, {} )
				zombies:completeAnimation()
				self.zombies:setAlpha( 1 )
				self.clipFinished( zombies, {} )
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
				timeleftlabel:completeAnimation()
				self.timeleftlabel:setAlpha( 1 )
				self.clipFinished( timeleftlabel, {} )
				timeleft:completeAnimation()
				self.timeleft:setAlpha( 1 )
				self.clipFinished( timeleft, {} )
				seconds:completeAnimation()
				self.seconds:setAlpha( 1 )
				self.clipFinished( seconds, {} )
				secondsbonus:completeAnimation()
				self.secondsbonus:setAlpha( 1 )
				self.clipFinished( secondsbonus, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
				driver:completeAnimation()
				self.driver:setAlpha( 0 )
				self.clipFinished( driver, {} )
				laps:completeAnimation()
				self.laps:setAlpha( 0 )
				self.clipFinished( laps, {} )
				nitro:completeAnimation()
				self.nitro:setAlpha( 0 )
				self.clipFinished( nitro, {} )
				zombies:completeAnimation()
				self.zombies:setAlpha( 0 )
				self.clipFinished( zombies, {} )
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
				timeleftlabel:completeAnimation()
				self.timeleftlabel:setAlpha( 0 )
				self.clipFinished( timeleftlabel, {} )
				timeleft:completeAnimation()
				self.timeleft:setAlpha( 0 )
				self.clipFinished( timeleft, {} )
				seconds:completeAnimation()
				self.seconds:setAlpha( 0 )
				self.clipFinished( seconds, {} )
				secondsbonus:completeAnimation()
				self.secondsbonus:setAlpha( 0 )
				self.clipFinished( secondsbonus, {} )
			end
		}
	}
	self.close = function ( self )
		self.redinsPlayerLine0:close()
		self.redinsPlayerLine1:close()
		self.redinsPlayerLine2:close()
		self.redinsPlayerLine3:close()
		self.timeleft:close()
		self.secondsbonus:close()
		CoD.redinsHUD.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

