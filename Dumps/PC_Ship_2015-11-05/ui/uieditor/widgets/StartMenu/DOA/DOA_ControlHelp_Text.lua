local PostLoadFunc = function ( f1_arg0 )
	local f1_local0 = f1_arg0.defaultText.setAlignment
	f1_arg0.defaultText.setAlignment = function ( f2_arg0, f2_arg1 )
		if IsCurrentLanguageReversed() then
			if f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				f2_arg1 = f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				f2_arg1 = f2_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		f1_local0( f2_arg0, f2_arg1 )
	end
	
	local f1_local1 = f1_arg0.drivingText.setAlignment
	f1_arg0.drivingText.setAlignment = function ( f3_arg0, f3_arg1 )
		if IsCurrentLanguageReversed() then
			if f3_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				f3_arg1 = f3_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif f3_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				f3_arg1 = f3_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		f1_local1( f3_arg0, f3_arg1 )
	end
	
end

CoD.DOA_ControlHelp_Text = InheritFrom( LUI.UIElement )
CoD.DOA_ControlHelp_Text.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DOA_ControlHelp_Text )
	self.id = "DOA_ControlHelp_Text"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local defaultText = LUI.UIText.new()
	defaultText:setLeftRight( true, true, 0, 0 )
	defaultText:setTopBottom( true, true, 0, 0 )
	defaultText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST" ) )
	defaultText:setTTF( "fonts/default.ttf" )
	defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( defaultText )
	self.defaultText = defaultText
	
	local drivingText = LUI.UIText.new()
	drivingText:setLeftRight( true, true, 0, 0 )
	drivingText:setTopBottom( true, true, 0, 0 )
	drivingText:setAlpha( 0 )
	drivingText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST" ) )
	drivingText:setTTF( "fonts/default.ttf" )
	drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( drivingText )
	self.drivingText = drivingText
	
	local doaFPSText = LUI.UIText.new()
	doaFPSText:setLeftRight( true, true, 0, 0 )
	doaFPSText:setTopBottom( true, true, 0, 0 )
	doaFPSText:setAlpha( 0 )
	doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST" ) )
	doaFPSText:setTTF( "fonts/default.ttf" )
	doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( doaFPSText )
	self.doaFPSText = doaFPSText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				defaultText:completeAnimation()
				self.defaultText:setAlpha( 1 )
				self.clipFinished( defaultText, {} )
				drivingText:completeAnimation()
				self.drivingText:setAlpha( 0 )
				self.clipFinished( drivingText, {} )
				doaFPSText:completeAnimation()
				self.doaFPSText:setAlpha( 0 )
				self.clipFinished( doaFPSText, {} )
			end
		},
		Driving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				defaultText:completeAnimation()
				self.defaultText:setAlpha( 0 )
				self.clipFinished( defaultText, {} )
				drivingText:completeAnimation()
				self.drivingText:setAlpha( 1 )
				self.clipFinished( drivingText, {} )
				doaFPSText:completeAnimation()
				self.doaFPSText:setAlpha( 0 )
				self.clipFinished( doaFPSText, {} )
			end
		},
		DOAFPS = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				defaultText:completeAnimation()
				self.defaultText:setAlpha( 0 )
				self.clipFinished( defaultText, {} )
				drivingText:completeAnimation()
				self.drivingText:setAlpha( 0 )
				self.clipFinished( drivingText, {} )
				doaFPSText:completeAnimation()
				self.doaFPSText:setAlpha( 1 )
				self.clipFinished( doaFPSText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Driving",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.driving", 1 )
			end
		},
		{
			stateName = "DOAFPS",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.doafps", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.driving" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.driving"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.doafps" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.doafps"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

