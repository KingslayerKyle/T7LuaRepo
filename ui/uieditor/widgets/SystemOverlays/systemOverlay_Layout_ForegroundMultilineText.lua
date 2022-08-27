-- 9fd1a63fea55ec7ebde4f6b3738cd0a1
-- This hash is used for caching, delete to decompile the file again

CoD.systemOverlay_Layout_ForegroundMultilineText = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Layout_ForegroundMultilineText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Layout_ForegroundMultilineText )
	self.id = "systemOverlay_Layout_ForegroundMultilineText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 748 )
	self:setTopBottom( true, false, 0, 24 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 0, 748 )
	text:setTopBottom( true, false, 2, 22 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		UpdateWidgetHeightToMultilineTextWithMinimum( self, element, 0, 60 )
	end )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

