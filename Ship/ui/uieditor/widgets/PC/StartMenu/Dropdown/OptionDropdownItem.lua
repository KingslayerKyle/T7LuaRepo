-- 719bd5745cba215489236449940a9a32
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	CoD.Menu.AddButtonCallbackFunction( f1_arg2, f1_arg0, f1_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		f1_arg0:processEvent( {
			name = "lose_focus",
			controller = f2_arg2
		} )
		return f1_arg0:dispatchEventToParent( {
			name = "dropdown_item_cancelled",
			element = f1_arg0
		} )
	end )
	CoD.Menu.AddButtonCallbackFunction( f1_arg2, f1_arg0, f1_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		if not f3_arg1.m_disableNavigation and f3_arg1:AcceptGamePadButtonInputFromModelCallback( f3_arg2 ) then
			f1_arg0:processEvent( {
				name = "lose_focus",
				controller = f3_arg2
			} )
			return f1_arg0:dispatchEventToParent( {
				name = "dropdown_item_selected",
				element = f1_arg0
			} )
		else
			
		end
	end )
	f1_arg0.m_dropdownItem = true
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.OptionDropdownItem = InheritFrom( LUI.UIElement )
CoD.OptionDropdownItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.OptionDropdownItem )
	self.id = "OptionDropdownItem"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 24 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullbacking = LUI.UIImage.new()
	fullbacking:setLeftRight( true, true, 0, 0 )
	fullbacking:setTopBottom( true, true, 0, 0 )
	fullbacking:setRGB( 0, 0, 0 )
	self:addElement( fullbacking )
	self.fullbacking = fullbacking
	
	local labelText = LUI.UIText.new()
	labelText:setLeftRight( true, false, 6.2, 243 )
	labelText:setTopBottom( true, false, 0, 24 )
	labelText:setTTF( "fonts/default.ttf" )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	labelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	labelText:linkToElementModel( self, "valueDisplay", true, function ( model )
		local valueDisplay = Engine.GetModelValue( model )
		if valueDisplay then
			labelText:setText( Engine.Localize( valueDisplay ) )
		end
	end )
	self:addElement( labelText )
	self.labelText = labelText
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -2, 2 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				labelText:completeAnimation()
				self.labelText:setLeftRight( true, false, 6.2, 243 )
				self.labelText:setTopBottom( true, false, 0, 24 )
				self.labelText:setRGB( 0.87, 0.37, 0 )
				self.labelText:setAlpha( 0.75 )
				self.clipFinished( labelText, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				fullbacking:completeAnimation()
				self.fullbacking:setRGB( 0, 0, 0 )
				self.fullbacking:setAlpha( 1 )
				self.clipFinished( fullbacking, {} )

				labelText:completeAnimation()
				self.labelText:setLeftRight( true, false, 6.2, 240 )
				self.labelText:setTopBottom( true, false, 0, 24 )
				self.labelText:setRGB( 1, 1, 1 )
				self.labelText:setAlpha( 1 )
				self.clipFinished( labelText, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.labelText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
