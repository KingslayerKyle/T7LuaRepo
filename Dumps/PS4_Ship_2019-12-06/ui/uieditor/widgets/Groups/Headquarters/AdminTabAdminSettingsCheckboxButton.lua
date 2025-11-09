require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Groups.GroupsCheckbox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.AdminTabAdminSettingsCheckboxButton = InheritFrom( LUI.UIElement )
CoD.AdminTabAdminSettingsCheckboxButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabAdminSettingsCheckboxButton )
	self.id = "AdminTabAdminSettingsCheckboxButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, 0, 280 )
	BoxButtonLrgIdle:setTopBottom( true, false, 2, 30 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, -1, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, -0.5, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( true, false, 33, 273 )
	btnDisplayText:setTopBottom( true, false, 6.5, 25.25 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setAlpha( 0 )
	btnDisplayText:setText( Engine.Localize( "" ) )
	btnDisplayText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayText, "setText", function ( element, controller )
		
	end )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 33, 273 )
	btnDisplayTextStroke:setTopBottom( true, false, 6.5, 25.25 )
	btnDisplayTextStroke:setAlpha( 0.7 )
	btnDisplayTextStroke:setText( Engine.Localize( "BUTTON" ) )
	btnDisplayTextStroke:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	local GroupsCheckboxChecked = CoD.GroupsCheckbox.new( menu, controller )
	GroupsCheckboxChecked:setLeftRight( true, false, 11, 25 )
	GroupsCheckboxChecked:setTopBottom( true, false, 9, 23 )
	GroupsCheckboxChecked:setScale( 1.2 )
	GroupsCheckboxChecked:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( GroupsCheckboxChecked )
	self.GroupsCheckboxChecked = GroupsCheckboxChecked
	
	local GroupsCheckboxDefault = CoD.GroupsCheckbox.new( menu, controller )
	GroupsCheckboxDefault:setLeftRight( true, false, 11, 25 )
	GroupsCheckboxDefault:setTopBottom( true, false, 9, 23 )
	GroupsCheckboxDefault:setAlpha( 0 )
	GroupsCheckboxDefault:setScale( 1.2 )
	GroupsCheckboxDefault:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( GroupsCheckboxDefault )
	self.GroupsCheckboxDefault = GroupsCheckboxDefault
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, -1 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, -1 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setLeftRight( true, false, 33, 273 )
				self.btnDisplayTextStroke:setTopBottom( true, false, 6.5, 25.25 )
				self.btnDisplayTextStroke:setAlpha( 0.7 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				GroupsCheckboxChecked:completeAnimation()
				self.GroupsCheckboxChecked:setAlpha( 0 )
				self.clipFinished( GroupsCheckboxChecked, {} )
				GroupsCheckboxDefault:completeAnimation()
				self.GroupsCheckboxDefault:setLeftRight( true, false, 11, 25 )
				self.GroupsCheckboxDefault:setTopBottom( true, false, 9, 23 )
				self.GroupsCheckboxDefault:setAlpha( 1 )
				self.clipFinished( GroupsCheckboxDefault, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0.25 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				GroupsCheckboxChecked:completeAnimation()
				self.GroupsCheckboxChecked:setAlpha( 0 )
				self.clipFinished( GroupsCheckboxChecked, {} )
				GroupsCheckboxDefault:completeAnimation()
				self.GroupsCheckboxDefault:setAlpha( 1 )
				self.clipFinished( GroupsCheckboxDefault, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 0, -1 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 0, -1 )
				self.FocusBarB:setTopBottom( false, true, -4, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setAlpha( 1 )
					btnDisplayText:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					if not event.interrupted then
						btnDisplayTextStroke:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayTextStroke:setAlpha( 0 )
					btnDisplayTextStroke:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayTextStroke, event )
					else
						btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 0 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setAlpha( 0 )
					btnDisplayText:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					if not event.interrupted then
						btnDisplayTextStroke:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayTextStroke:setAlpha( 1 )
					btnDisplayTextStroke:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayTextStroke, event )
					else
						btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					local btnDisplayTextFrame3 = function ( btnDisplayText, event )
						if not event.interrupted then
							btnDisplayText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						btnDisplayText:setAlpha( 0.1 )
						btnDisplayText:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayText, event )
						else
							btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextFrame3( btnDisplayText, event )
						return 
					else
						btnDisplayText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", btnDisplayTextFrame3 )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		Fake = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		DisabledHelpItemsLabel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					local btnDisplayTextFrame3 = function ( btnDisplayText, event )
						if not event.interrupted then
							btnDisplayText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						btnDisplayText:setAlpha( 0.1 )
						btnDisplayText:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayText, event )
						else
							btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextFrame3( btnDisplayText, event )
						return 
					else
						btnDisplayText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", btnDisplayTextFrame3 )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				GroupsCheckboxChecked:completeAnimation()
				self.GroupsCheckboxChecked:setAlpha( 1 )
				self.clipFinished( GroupsCheckboxChecked, {} )
				GroupsCheckboxDefault:completeAnimation()
				self.GroupsCheckboxDefault:setAlpha( 1 )
				self.clipFinished( GroupsCheckboxDefault, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				GroupsCheckboxChecked:completeAnimation()
				self.GroupsCheckboxChecked:setAlpha( 1 )
				self.clipFinished( GroupsCheckboxChecked, {} )
				GroupsCheckboxDefault:completeAnimation()
				self.GroupsCheckboxDefault:setAlpha( 0 )
				self.clipFinished( GroupsCheckboxDefault, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					if not event.interrupted then
						FocusBarB:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					FocusBarB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarB, event )
					else
						FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Fake",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DisabledHelpItemsLabel",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	GroupsCheckboxChecked.id = "GroupsCheckboxChecked"
	GroupsCheckboxDefault.id = "GroupsCheckboxDefault"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupsCheckboxDefault:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG00:close()
		element.GroupsCheckboxChecked:close()
		element.GroupsCheckboxDefault:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

