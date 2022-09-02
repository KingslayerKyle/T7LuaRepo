-- bdd283d7c7eba3c1765eb7856ebd22ba
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Item_Arrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.GroupsSlider = InheritFrom( LUI.UIElement )
CoD.GroupsSlider.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsSlider )
	self.id = "GroupsSlider"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local left = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	left:setLeftRight( true, false, -15, 0 )
	left:setTopBottom( false, false, -6, 6 )
	left:setAlpha( 0.8 )
	left:setZRot( -90 )
	left:registerEventHandler( "button_action", function ( element, event )
		local f4_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LEFT )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( left )
	self.left = left
	
	local right = CoD.StartMenu_Options_Slider_Item_Arrow.new( menu, controller )
	right:setLeftRight( false, true, 0, 15 )
	right:setTopBottom( false, false, -6, 6 )
	right:setAlpha( 0.8 )
	right:setYRot( 180 )
	right:setZRot( -90 )
	right:registerEventHandler( "button_action", function ( element, event )
		local f5_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( right )
	self.right = right
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( false, false, -84, 84 )
	TextBox:setTopBottom( false, false, -11, 11 )
	TextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TextBox:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			TextBox:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				left:completeAnimation()
				self.left:setAlpha( 1 )
				self.clipFinished( left, {} )

				right:completeAnimation()
				self.right:setAlpha( 1 )
				self.clipFinished( right, {} )

				TextBox:completeAnimation()
				self.TextBox:setRGB( 1, 1, 1 )
				self.clipFinished( TextBox, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )

				TextBox:completeAnimation()
				self.TextBox:setRGB( 1, 0.59, 0 )
				self.clipFinished( TextBox, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		ArrowsHidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )

				right:completeAnimation()
				self.right:setAlpha( 0 )
				self.clipFinished( right, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			SetElementStateByElementName( self, "left", controller, "DefaultState" )
			SetElementStateByElementName( self, "right", controller, "DefaultState" )
		elseif IsElementInState( element, "ArrowsHidden" ) then
			SetElementStateByElementName( self, "left", controller, "Hidden" )
			SetElementStateByElementName( self, "right", controller, "Hidden" )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.left:close()
		element.right:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.TextBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

