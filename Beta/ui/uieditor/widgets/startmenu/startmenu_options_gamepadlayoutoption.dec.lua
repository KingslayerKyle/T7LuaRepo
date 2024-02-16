require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "options_refresh", function ( self, event )
		local model = self:getModel()
		if model then
			local optionInfo = CoD.PCUtil.GetOptionInfo( model, controller )
			local getLabelFn = optionInfo.getLabelFn
			if getLabelFn and type( getLabelFn ) == "function" then
				local value = getLabelFn( self, controller )
				if value then
					self.valueText:setText( Engine.Localize( value ) )
				end
			end
		end
	end )
	self:registerEventHandler( "button_action", function ( self, event )
		local model = self:getModel()
		if model then
			local menuModel = Engine.GetModel( model, "menu" )
			if menuModel then
				local menuName = Engine.GetModelValue( menuModel )
				OpenPopup( self, menuName, controller )
			end
		end
	end )
end

CoD.StartMenu_Options_GamepadLayoutOption = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_GamepadLayoutOption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_GamepadLayoutOption )
	self.id = "StartMenu_Options_GamepadLayoutOption"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 40 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 0, 0 )
	fullBacking:setTopBottom( true, true, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local fullBorder = CoD.StartMenu_frame_noBG.new( menu, controller )
	fullBorder:setLeftRight( true, true, 0, 0 )
	fullBorder:setTopBottom( true, true, 0, 0 )
	fullBorder:setRGB( 0.87, 0.37, 0 )
	fullBorder:setAlpha( 0 )
	self:addElement( fullBorder )
	self.fullBorder = fullBorder
	
	local actionText = LUI.UITightText.new()
	actionText:setLeftRight( true, false, 8, 198 )
	actionText:setTopBottom( true, false, 7.5, 32.5 )
	actionText:setTTF( "fonts/default.ttf" )
	actionText:linkToElementModel( self, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( actionText )
	self.actionText = actionText
	
	local valueBacking = LUI.UIImage.new()
	valueBacking:setLeftRight( false, true, -250, -60 )
	valueBacking:setTopBottom( true, true, 5, -5 )
	valueBacking:setRGB( 0.87, 0.37, 0 )
	valueBacking:setAlpha( 0 )
	self:addElement( valueBacking )
	self.valueBacking = valueBacking
	
	local valueText = LUI.UIText.new()
	valueText:setLeftRight( false, true, -250, -60 )
	valueText:setTopBottom( true, false, 7.5, 32.5 )
	valueText:setText( Engine.Localize( "MENU_NEW" ) )
	valueText:setTTF( "fonts/default.ttf" )
	valueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	valueText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( valueText )
	self.valueText = valueText
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, -3 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, -3 )
	FocusBarB:setTopBottom( false, true, -5.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 0 )
				self.clipFinished( fullBorder, {} )
				actionText:completeAnimation()
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
				valueBacking:completeAnimation()
				self.valueBacking:setRGB( 0.39, 0.39, 0.39 )
				self.clipFinished( valueBacking, {} )
				valueText:completeAnimation()
				self.valueText:setAlpha( 0.5 )
				self.clipFinished( valueText, {} )
				StartMenuframenoBG00:completeAnimation()
				self.StartMenuframenoBG00:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG00, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				actionText:completeAnimation()
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
				valueBacking:completeAnimation()
				self.valueBacking:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( valueBacking, {} )
				valueText:completeAnimation()
				self.valueText:setAlpha( 1 )
				self.clipFinished( valueText, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 0, 0 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 0, 0 )
				self.FocusBarB:setTopBottom( false, true, -5.5, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fullBorder:close()
		self.StartMenuframenoBG00:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.actionText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

