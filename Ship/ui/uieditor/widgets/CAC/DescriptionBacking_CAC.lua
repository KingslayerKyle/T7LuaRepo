-- 9e143d23b9b16a1af68022406bd95b02
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GenericPopups.Generic_Frame_Pop_up" )

CoD.DescriptionBacking_CAC = InheritFrom( LUI.UIElement )
CoD.DescriptionBacking_CAC.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DescriptionBacking_CAC )
	self.id = "DescriptionBacking_CAC"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 278 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local descriptionBacking = LUI.UIImage.new()
	descriptionBacking:setLeftRight( true, true, 0, 0 )
	descriptionBacking:setTopBottom( true, true, 0, 0 )
	descriptionBacking:setRGB( 0.59, 0.59, 0.59 )
	descriptionBacking:setAlpha( 0.62 )
	descriptionBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( descriptionBacking )
	self.descriptionBacking = descriptionBacking
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( true, true, 0.45, 0 )
	Black:setTopBottom( true, true, 0, 0 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.8 )
	self:addElement( Black )
	self.Black = Black
	
	local GenericFramePopup0 = CoD.Generic_Frame_Pop_up.new( menu, controller )
	GenericFramePopup0:setLeftRight( true, true, 0, 0 )
	GenericFramePopup0:setTopBottom( true, true, 0, 0 )
	self:addElement( GenericFramePopup0 )
	self.GenericFramePopup0 = GenericFramePopup0
	
	GenericFramePopup0.id = "GenericFramePopup0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GenericFramePopup0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericFramePopup0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
