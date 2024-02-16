require( "ui.uieditor.widgets.FileShare.FileshareSlotsAvailable" )

CoD.FilesharePublishDetails = InheritFrom( LUI.UIElement )
CoD.FilesharePublishDetails.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FilesharePublishDetails )
	self.id = "FilesharePublishDetails"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 326 )
	self:setTopBottom( true, false, 0, 474 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 326 )
	BG:setTopBottom( true, false, 0, 474 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local PublishImage = LUI.UIImage.new()
	PublishImage:setLeftRight( true, false, 54.25, 271.75 )
	PublishImage:setTopBottom( true, false, 19, 205 )
	PublishImage:setAlpha( 0.8 )
	self:addElement( PublishImage )
	self.PublishImage = PublishImage
	
	local PublishBG = LUI.UIImage.new()
	PublishBG:setLeftRight( true, false, 12.5, 313.5 )
	PublishBG:setTopBottom( true, false, 217, 265 )
	PublishBG:setRGB( 0.52, 0.52, 0.52 )
	PublishBG:setAlpha( 0.65 )
	self:addElement( PublishBG )
	self.PublishBG = PublishBG
	
	local PublishSmallIcon = LUI.UIImage.new()
	PublishSmallIcon:setLeftRight( true, false, 16.5, 58.5 )
	PublishSmallIcon:setTopBottom( true, false, 221, 261 )
	self:addElement( PublishSmallIcon )
	self.PublishSmallIcon = PublishSmallIcon
	
	local PublishLabel = LUI.UITightText.new()
	PublishLabel:setLeftRight( true, false, 63.98, 313.5 )
	PublishLabel:setTopBottom( true, false, 217, 265 )
	PublishLabel:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH" ) )
	PublishLabel:setTTF( "fonts/default.ttf" )
	self:addElement( PublishLabel )
	self.PublishLabel = PublishLabel
	
	local PublishInstruction = LUI.UIText.new()
	PublishInstruction:setLeftRight( true, false, 12.5, 313.5 )
	PublishInstruction:setTopBottom( true, false, 273.41, 298.41 )
	PublishInstruction:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	PublishInstruction:setTTF( "fonts/default.ttf" )
	PublishInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PublishInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublishInstruction )
	self.PublishInstruction = PublishInstruction
	
	local FileshareSlotsAvailable0 = CoD.FileshareSlotsAvailable.new( menu, controller )
	FileshareSlotsAvailable0:setLeftRight( true, false, 12.5, 249.5 )
	FileshareSlotsAvailable0:setTopBottom( true, false, 419.26, 449.26 )
	self:addElement( FileshareSlotsAvailable0 )
	self.FileshareSlotsAvailable0 = FileshareSlotsAvailable0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareSlotsAvailable0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

