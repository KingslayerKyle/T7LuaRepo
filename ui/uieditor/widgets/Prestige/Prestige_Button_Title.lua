-- 499422e57b6b8813f9135478276565a4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.Prestige_Button_Title = InheritFrom( LUI.UIElement )
CoD.Prestige_Button_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Prestige_Button_Title )
	self.id = "Prestige_Button_Title"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.7 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 7, -7 )
	ButtonTitle:setTopBottom( true, false, 2, 22 )
	ButtonTitle:setText( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setLetterSpacing( 0.5 )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( ButtonTitle, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

