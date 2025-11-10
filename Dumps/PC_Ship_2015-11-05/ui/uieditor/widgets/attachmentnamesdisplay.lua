CoD.AttachmentNamesDisplay = InheritFrom( LUI.UIElement )
CoD.AttachmentNamesDisplay.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.AttachmentNamesDisplay )
	self.id = "AttachmentNamesDisplay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 30 )
	
	local attachmentName1 = LUI.UITightText.new()
	attachmentName1:setLeftRight( false, true, -137, 0 )
	attachmentName1:setTopBottom( true, false, 2.5, 27.5 )
	attachmentName1:setText( Engine.Localize( "WEAPON_GRENADELAUNCHER" ) )
	attachmentName1:setTTF( "fonts/default.ttf" )
	self:addElement( attachmentName1 )
	self.attachmentName1 = attachmentName1
	
	local attachmentName2 = LUI.UITightText.new()
	attachmentName2:setLeftRight( false, true, -231, -142 )
	attachmentName2:setTopBottom( true, false, 2.5, 27.5 )
	attachmentName2:setText( Engine.Localize( "WEAPON_SILENCER" ) )
	attachmentName2:setTTF( "fonts/default.ttf" )
	self:addElement( attachmentName2 )
	self.attachmentName2 = attachmentName2
	
	local attachmentName3 = LUI.UITightText.new()
	attachmentName3:setLeftRight( false, true, -335, -236 )
	attachmentName3:setTopBottom( true, false, 2.5, 27.5 )
	attachmentName3:setText( Engine.Localize( "WEAPON_RANGEFINDER" ) )
	attachmentName3:setTTF( "fonts/default.ttf" )
	self:addElement( attachmentName3 )
	self.attachmentName3 = attachmentName3
	
	local attachmentName4 = LUI.UITightText.new()
	attachmentName4:setLeftRight( false, true, -438, -340 )
	attachmentName4:setTopBottom( true, false, 2.5, 27.5 )
	attachmentName4:setText( Engine.Localize( "WEAPON_EXTCLIP" ) )
	attachmentName4:setTTF( "fonts/default.ttf" )
	self:addElement( attachmentName4 )
	self.attachmentName4 = attachmentName4
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

