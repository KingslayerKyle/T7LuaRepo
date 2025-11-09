CoD.AmmoWidget_ClipContainerValue = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipContainerValue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipContainerValue )
	self.id = "AmmoWidget_ClipContainerValue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 42 )
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( false, false, -54, 54 )
	Clip:setTopBottom( false, true, -43.5, 8.5 )
	Clip:setText( Engine.Localize( "33" ) )
	Clip:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Clip:setLetterSpacing( -3.5 )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Clip )
	self.Clip = Clip
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

