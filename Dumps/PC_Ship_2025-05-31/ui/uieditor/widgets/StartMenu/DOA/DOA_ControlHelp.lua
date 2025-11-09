require( "ui.uieditor.widgets.StartMenu.DOA.DOA_ControlHelp_Lines" )
require( "ui.uieditor.widgets.StartMenu.DOA.DOA_ControlHelp_Text" )

CoD.DOA_ControlHelp = InheritFrom( LUI.UIElement )
CoD.DOA_ControlHelp.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DOA_ControlHelp )
	self.id = "DOA_ControlHelp"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 776 )
	self:setTopBottom( true, false, 0, 584 )
	self.anyChildUsesUpdateState = true
	
	local vitaControllerImage = LUI.UIImage.new()
	vitaControllerImage:setLeftRight( false, false, -508, 508 )
	vitaControllerImage:setTopBottom( false, false, -227, 227 )
	vitaControllerImage:setAlpha( 0 )
	vitaControllerImage:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_psvita" ) )
	self:addElement( vitaControllerImage )
	self.vitaControllerImage = vitaControllerImage
	
	local durangoControllerImage = LUI.UIImage.new()
	durangoControllerImage:setLeftRight( false, false, -225, 225 )
	durangoControllerImage:setTopBottom( false, false, -225, 225 )
	durangoControllerImage:setImage( RegisterImage( "uie_xenonone_controller_top" ) )
	self:addElement( durangoControllerImage )
	self.durangoControllerImage = durangoControllerImage
	
	local durangoLines = CoD.DOA_ControlHelp_Lines.new( menu, controller )
	durangoLines:setLeftRight( false, false, -275, 297.5 )
	durangoLines:setTopBottom( false, false, -171, 141.29 )
	durangoLines.defaultLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_durango_doa" ) )
	durangoLines.redinsRallyLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_durango_doa_redins" ) )
	durangoLines.DOAfpsLines:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_lines_durango_doa_fps" ) )
	self:addElement( durangoLines )
	self.durangoLines = durangoLines
	
	local orbisControllerImage = LUI.UIImage.new()
	orbisControllerImage:setLeftRight( false, false, -225, 225 )
	orbisControllerImage:setTopBottom( false, false, -225, 225 )
	orbisControllerImage:setAlpha( 0 )
	orbisControllerImage:setImage( RegisterImage( "uie_ps4_controller_top" ) )
	self:addElement( orbisControllerImage )
	self.orbisControllerImage = orbisControllerImage
	
	local orbisLines = CoD.DOA_ControlHelp_Lines.new( menu, controller )
	orbisLines:setLeftRight( false, false, -285, 287.5 )
	orbisLines:setTopBottom( false, false, -182.5, 129.79 )
	orbisLines:setAlpha( 0 )
	self:addElement( orbisLines )
	self.orbisLines = orbisLines
	
	local l2Text = CoD.DOA_ControlHelp_Text.new( menu, controller )
	l2Text:setLeftRight( false, false, -375.5, -175.5 )
	l2Text:setTopBottom( false, false, -174.5, -149.5 )
	l2Text.defaultText:setText( Engine.Localize( "" ) )
	l2Text.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	l2Text.drivingText:setText( Engine.Localize( "CP_DOA_BO3_REVERSE" ) )
	l2Text.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	l2Text.doaFPSText:setText( Engine.Localize( "MENU_AIM_DOWN_SIGHT" ) )
	l2Text.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self:addElement( l2Text )
	self.l2Text = l2Text
	
	local l1Text = CoD.DOA_ControlHelp_Text.new( menu, controller )
	l1Text:setLeftRight( false, false, -404.5, -204.5 )
	l1Text:setTopBottom( false, false, -146.5, -121.5 )
	l1Text.defaultText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST" ) )
	l1Text.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	l1Text.drivingText:setText( Engine.Localize( "" ) )
	l1Text.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	l1Text.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST" ) )
	l1Text.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self:addElement( l1Text )
	self.l1Text = l1Text
	
	local lstickText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	lstickText:setLeftRight( false, false, -165.5, 34.5 )
	lstickText:setTopBottom( false, false, 127.79, 152.79 )
	lstickText.defaultText:setText( Engine.Localize( "CP_DOA_BO3_MOVE" ) )
	lstickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lstickText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_STEER" ) )
	lstickText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lstickText.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_MOVE" ) )
	lstickText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( lstickText )
	self.lstickText = lstickText
	
	local r2Text = CoD.DOA_ControlHelp_Text.new( menu, controller )
	r2Text:setLeftRight( false, false, 173.5, 373.5 )
	r2Text:setTopBottom( false, false, -174.5, -149.5 )
	r2Text.defaultText:setText( Engine.Localize( "" ) )
	r2Text.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	r2Text.drivingText:setText( Engine.Localize( "CP_DOA_BO3_ACCELERATE" ) )
	r2Text.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	r2Text.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_FIRE" ) )
	r2Text.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( r2Text )
	self.r2Text = r2Text
	
	local r1Text = CoD.DOA_ControlHelp_Text.new( menu, controller )
	r1Text:setLeftRight( false, false, 196.5, 396.5 )
	r1Text:setTopBottom( false, false, -146.5, -121.5 )
	r1Text.defaultText:setText( Engine.Localize( "CP_DOA_BO3_DROP_BOMB" ) )
	r1Text.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	r1Text.drivingText:setText( Engine.Localize( "" ) )
	r1Text.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	r1Text.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_DROP_BOMB" ) )
	r1Text.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( r1Text )
	self.r1Text = r1Text
	
	local rstickText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	rstickText:setLeftRight( false, false, -33.5, 166.5 )
	rstickText:setTopBottom( false, false, 128.79, 153.79 )
	rstickText.defaultText:setText( Engine.Localize( "CP_DOA_BO3_FIRE" ) )
	rstickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rstickText.drivingText:setText( Engine.Localize( "" ) )
	rstickText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rstickText.doaFPSText:setText( Engine.Localize( "" ) )
	rstickText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( rstickText )
	self.rstickText = rstickText
	
	local triangleText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	triangleText:setLeftRight( false, false, 212.5, 412.5 )
	triangleText:setTopBottom( false, false, -85.5, -60.5 )
	triangleText.defaultText:setText( Engine.Localize( "CP_DOA_BO3_CAMERA" ) )
	triangleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	triangleText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_CAMERA" ) )
	triangleText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	triangleText.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_CAMERA" ) )
	triangleText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( triangleText )
	self.triangleText = triangleText
	
	local boxText2 = CoD.DOA_ControlHelp_Text.new( menu, controller )
	boxText2:setLeftRight( false, false, 212.5, 412.5 )
	boxText2:setTopBottom( false, false, -28.21, -3.21 )
	boxText2.defaultText:setText( Engine.Localize( "CP_DOA_BO3_EXIT_VEHICLE" ) )
	boxText2.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boxText2.drivingText:setText( Engine.Localize( "" ) )
	boxText2.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boxText2.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_EXIT_VEHICLE" ) )
	boxText2.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( boxText2 )
	self.boxText2 = boxText2
	
	local boxText1 = CoD.DOA_ControlHelp_Text.new( menu, controller )
	boxText1:setLeftRight( false, false, 212.5, 412.5 )
	boxText1:setTopBottom( false, false, -53.21, -28.21 )
	boxText1.defaultText:setText( Engine.Localize( "CP_DOA_BO3_DROP_WEAPON" ) )
	boxText1.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boxText1.drivingText:setText( Engine.Localize( "" ) )
	boxText1.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	boxText1.doaFPSText:setText( Engine.Localize( "CP_DOA_BO3_DROP_WEAPON" ) )
	boxText1.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( boxText1 )
	self.boxText1 = boxText1
	
	local circleText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	circleText:setLeftRight( false, false, 212.5, 412.5 )
	circleText:setTopBottom( false, false, -51.5, -26.5 )
	circleText.defaultText:setText( Engine.Localize( "" ) )
	circleText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	circleText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_POWER_SLIDE" ) )
	circleText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	circleText.doaFPSText:setText( Engine.Localize( "" ) )
	circleText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( circleText )
	self.circleText = circleText
	
	local xText = CoD.DOA_ControlHelp_Text.new( menu, controller )
	xText:setLeftRight( false, false, 212.5, 412.5 )
	xText:setTopBottom( false, false, -0.5, 24.5 )
	xText.defaultText:setText( Engine.Localize( "" ) )
	xText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	xText.drivingText:setText( Engine.Localize( "CP_DOA_BO3_SPEED_BOOST" ) )
	xText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	xText.doaFPSText:setText( Engine.Localize( "" ) )
	xText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( xText )
	self.xText = xText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Vita = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 1 )
				self.clipFinished( vitaControllerImage, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				durangoLines:completeAnimation()
				self.durangoLines:setAlpha( 0 )
				self.clipFinished( durangoLines, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				orbisLines:completeAnimation()
				self.orbisLines:setAlpha( 0 )
				self.clipFinished( orbisLines, {} )
			end
		},
		Orbis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 0 )
				self.clipFinished( durangoControllerImage, {} )
				durangoLines:completeAnimation()
				self.durangoLines:setAlpha( 0 )
				self.clipFinished( durangoLines, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 1 )
				self.clipFinished( orbisControllerImage, {} )
				orbisLines:completeAnimation()
				self.orbisLines:setAlpha( 1 )
				self.clipFinished( orbisLines, {} )
				l2Text:completeAnimation()
				self.l2Text:setLeftRight( false, false, -376.5, -176.5 )
				self.l2Text:setTopBottom( false, false, -177.5, -152.5 )
				self.clipFinished( l2Text, {} )
				lstickText:completeAnimation()
				self.lstickText:setLeftRight( false, false, -164.75, 35.25 )
				self.lstickText:setTopBottom( false, false, 128.79, 153.79 )
				self.clipFinished( lstickText, {} )
				r2Text:completeAnimation()
				self.r2Text:setLeftRight( false, false, 175.5, 375.5 )
				self.r2Text:setTopBottom( false, false, -177.5, -152.5 )
				self.clipFinished( r2Text, {} )
				rstickText:completeAnimation()
				self.rstickText:setLeftRight( false, false, -34.75, 165.25 )
				self.rstickText:setTopBottom( false, false, 130.79, 155.79 )
				self.clipFinished( rstickText, {} )
				triangleText:completeAnimation()
				self.triangleText:setLeftRight( false, false, 213.5, 413.5 )
				self.triangleText:setTopBottom( false, false, -84.21, -59.21 )
				self.clipFinished( triangleText, {} )
				boxText2:completeAnimation()
				self.boxText2:setLeftRight( false, false, 213.5, 413.5 )
				self.boxText2:setTopBottom( false, false, -28.21, -3.21 )
				self.clipFinished( boxText2, {} )
				boxText1:completeAnimation()
				self.boxText1:setLeftRight( false, false, 213.5, 413.5 )
				self.boxText1:setTopBottom( false, false, -53.21, -28.21 )
				self.clipFinished( boxText1, {} )
				xText:completeAnimation()
				self.xText:setLeftRight( false, false, 212.5, 412.5 )
				self.xText:setTopBottom( false, false, -2.5, 22.5 )
				self.clipFinished( xText, {} )
			end
		},
		Durango = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				vitaControllerImage:completeAnimation()
				self.vitaControllerImage:setAlpha( 0 )
				self.clipFinished( vitaControllerImage, {} )
				durangoControllerImage:completeAnimation()
				self.durangoControllerImage:setAlpha( 1 )
				self.clipFinished( durangoControllerImage, {} )
				durangoLines:completeAnimation()
				self.durangoLines:setAlpha( 1 )
				self.clipFinished( durangoLines, {} )
				orbisControllerImage:completeAnimation()
				self.orbisControllerImage:setAlpha( 0 )
				self.clipFinished( orbisControllerImage, {} )
				orbisLines:completeAnimation()
				self.orbisLines:setAlpha( 0 )
				self.clipFinished( orbisLines, {} )
				l2Text:completeAnimation()
				self.l2Text:setLeftRight( false, false, -395.5, -195.5 )
				self.l2Text:setTopBottom( false, false, -178.5, -153.5 )
				self.clipFinished( l2Text, {} )
				lstickText:completeAnimation()
				lstickText.defaultText:completeAnimation()
				lstickText.drivingText:completeAnimation()
				lstickText.doaFPSText:completeAnimation()
				self.lstickText:setLeftRight( false, false, -426.75, -226.75 )
				self.lstickText:setTopBottom( false, false, -51.21, -26.21 )
				self.lstickText.defaultText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.lstickText.drivingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.lstickText.doaFPSText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( lstickText, {} )
				r2Text:completeAnimation()
				self.r2Text:setLeftRight( false, false, 194.5, 394.5 )
				self.r2Text:setTopBottom( false, false, -178.5, -153.5 )
				self.clipFinished( r2Text, {} )
				rstickText:completeAnimation()
				self.rstickText:setLeftRight( false, false, -41.75, 158.25 )
				self.rstickText:setTopBottom( false, false, 127.79, 152.79 )
				self.clipFinished( rstickText, {} )
				triangleText:completeAnimation()
				self.triangleText:setLeftRight( false, false, 225, 425 )
				self.triangleText:setTopBottom( false, false, -78.21, -53.21 )
				self.clipFinished( triangleText, {} )
				boxText2:completeAnimation()
				self.boxText2:setLeftRight( false, false, 225, 425 )
				self.boxText2:setTopBottom( false, false, -28.21, -3.21 )
				self.clipFinished( boxText2, {} )
				boxText1:completeAnimation()
				self.boxText1:setLeftRight( false, false, 225, 425 )
				self.boxText1:setTopBottom( false, false, -53.21, -28.21 )
				self.clipFinished( boxText1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Vita",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Orbis",
			condition = function ( menu, element, event )
				return IsOrbisGamepad( controller )
			end
		},
		{
			stateName = "Durango",
			condition = function ( menu, element, event )
				return IsDurangoGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local17 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f1_local17( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.durangoLines:close()
		element.orbisLines:close()
		element.l2Text:close()
		element.l1Text:close()
		element.lstickText:close()
		element.r2Text:close()
		element.r1Text:close()
		element.rstickText:close()
		element.triangleText:close()
		element.boxText2:close()
		element.boxText1:close()
		element.circleText:close()
		element.xText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

