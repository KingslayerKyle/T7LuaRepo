-- d956efdd2bf913e78efe84625fd42325
-- This hash is used for caching, delete to decompile the file again

CoD.FileshareSelectedItemPublishedTime = InheritFrom( LUI.UIElement )
CoD.FileshareSelectedItemPublishedTime.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectedItemPublishedTime )
	self.id = "FileshareSelectedItemPublishedTime"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 18 )
	
	local LblPublished = LUI.UITightText.new()
	LblPublished:setLeftRight( true, false, 0, 57 )
	LblPublished:setTopBottom( true, false, 0, 18 )
	LblPublished:setRGB( 0.48, 0.49, 0.52 )
	LblPublished:setText( Engine.Localize( "MENU_FILESHARE_PUBLISHED" ) )
	LblPublished:setTTF( "fonts/default.ttf" )
	self:addElement( LblPublished )
	self.LblPublished = LblPublished
	
	local PublishTime = LUI.UIText.new()
	PublishTime:setLeftRight( true, false, 59, 297 )
	PublishTime:setTopBottom( true, false, 0, 18 )
	PublishTime:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
	PublishTime:setTTF( "fonts/default.ttf" )
	PublishTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PublishTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublishTime )
	self.PublishTime = PublishTime
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

