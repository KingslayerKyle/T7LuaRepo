-- 0a3c04826f7c3a08956cd23eb7c77ae4
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0.m_preventFromBeingActive = true
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		if element.m_button then
			CoD.PCUtil.SimulateButtonPress( f1_arg1, element.m_button )
		end
		return true
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.ChooseCharacter_CardClickButton = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_CardClickButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_CardClickButton )
	self.id = "ChooseCharacter_CardClickButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 25 )
	
	local label = LUI.UIText.new()
	label:setLeftRight( true, true, 20, 0 )
	label:setTopBottom( true, false, 2.5, 22.5 )
	label:setText( Engine.Localize( "MENU_NEW" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	local keyshortcut = LUI.UIText.new()
	keyshortcut:setLeftRight( true, false, 0, 20 )
	keyshortcut:setTopBottom( true, false, 2.5, 22.5 )
	keyshortcut:setText( Engine.Localize( "" ) )
	keyshortcut:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	keyshortcut:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	keyshortcut:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keyshortcut )
	self.keyshortcut = keyshortcut
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.clipFinished( label, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				label:completeAnimation()
				self.label:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( label, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

