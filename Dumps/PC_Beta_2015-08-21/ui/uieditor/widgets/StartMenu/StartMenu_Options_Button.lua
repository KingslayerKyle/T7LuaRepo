require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		local f2_local0 = element:getModel()
		if f2_local0 then
			local f2_local1 = Engine.GetModel( f2_local0, "onPressFn" )
			if f2_local1 then
				local f2_local2 = Engine.GetModelValue( f2_local1 )
				f2_local2( element, f1_arg1 )
			end
		end
	end )
end

CoD.StartMenu_Options_Button = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Button )
	self.id = "StartMenu_Options_Button"
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
		local label = Engine.GetModelValue( model )
		if label then
			actionText:setText( Engine.Localize( label ) )
		end
	end )
	self:addElement( actionText )
	self.actionText = actionText
	
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
				self:setupElementClipCounter( 5 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 0 )
				self.clipFinished( fullBorder, {} )
				actionText:completeAnimation()
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
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
				self:setupElementClipCounter( 4 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				actionText:completeAnimation()
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
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
		element.fullBorder:close()
		element.StartMenuframenoBG00:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.actionText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

