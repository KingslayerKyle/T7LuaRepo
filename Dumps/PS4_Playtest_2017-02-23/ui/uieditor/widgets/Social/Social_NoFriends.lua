require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectFrame" )

CoD.Social_NoFriends = InheritFrom( LUI.UIElement )
CoD.Social_NoFriends.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_NoFriends )
	self.id = "Social_NoFriends"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1668 )
	self:setTopBottom( 0, 0, 0, 675 )
	
	local PregameBanProtectFrame0000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000:setLeftRight( 0, 0, 612, 1096 )
	PregameBanProtectFrame0000:setTopBottom( 0, 0, 0, 285 )
	PregameBanProtectFrame0000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000 )
	self.PregameBanProtectFrame0000 = PregameBanProtectFrame0000
	
	local PregameBanProtectFrame00000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00000:setLeftRight( 0, 0, 612, 1096 )
	PregameBanProtectFrame00000:setTopBottom( 0, 0, 292, 412 )
	PregameBanProtectFrame00000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00000 )
	self.PregameBanProtectFrame00000 = PregameBanProtectFrame00000
	
	local PregameBanProtectFrame00001 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00001:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame00001:setTopBottom( 0, 0, 0, 90 )
	PregameBanProtectFrame00001:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00001 )
	self.PregameBanProtectFrame00001 = PregameBanProtectFrame00001
	
	local PregameBanProtectFrame000010 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000010:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame000010:setTopBottom( 0, 0, 97, 187 )
	PregameBanProtectFrame000010:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000010 )
	self.PregameBanProtectFrame000010 = PregameBanProtectFrame000010
	
	local PregameBanProtectFrame000011 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000011:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame000011:setTopBottom( 0, 0, 195, 285 )
	PregameBanProtectFrame000011:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000011 )
	self.PregameBanProtectFrame000011 = PregameBanProtectFrame000011
	
	local PregameBanProtectFrame0000100 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000100:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame0000100:setTopBottom( 0, 0, 293, 383 )
	PregameBanProtectFrame0000100:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000100 )
	self.PregameBanProtectFrame0000100 = PregameBanProtectFrame0000100
	
	local PregameBanProtectFrame000012 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000012:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame000012:setTopBottom( 0, 0, 390, 480 )
	PregameBanProtectFrame000012:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000012 )
	self.PregameBanProtectFrame000012 = PregameBanProtectFrame000012
	
	local PregameBanProtectFrame0000101 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000101:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame0000101:setTopBottom( 0, 0, 487, 577 )
	PregameBanProtectFrame0000101:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000101 )
	self.PregameBanProtectFrame0000101 = PregameBanProtectFrame0000101
	
	local PregameBanProtectFrame0000110 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000110:setLeftRight( 0, 0, 0, 561 )
	PregameBanProtectFrame0000110:setTopBottom( 0, 0, 585, 675 )
	PregameBanProtectFrame0000110:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000110 )
	self.PregameBanProtectFrame0000110 = PregameBanProtectFrame0000110
	
	local PregameBanProtectFrame00002 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00002:setLeftRight( 0, 0, 1148, 1578 )
	PregameBanProtectFrame00002:setTopBottom( 0, 0, 0, 285 )
	PregameBanProtectFrame00002:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00002 )
	self.PregameBanProtectFrame00002 = PregameBanProtectFrame00002
	
	local PregameBanProtectFrame000020 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000020:setLeftRight( 0, 0, 1148, 1578 )
	PregameBanProtectFrame000020:setTopBottom( 0, 0, 293, 675 )
	PregameBanProtectFrame000020:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000020 )
	self.PregameBanProtectFrame000020 = PregameBanProtectFrame000020
	
	local PregameBanProtectFrame0000200 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000200:setLeftRight( 0, 0, 612, 732 )
	PregameBanProtectFrame0000200:setTopBottom( 0, 0, 501, 675 )
	PregameBanProtectFrame0000200:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000200 )
	self.PregameBanProtectFrame0000200 = PregameBanProtectFrame0000200
	
	local PregameBanProtectFrame00002000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00002000:setLeftRight( 0, 0, 794, 914 )
	PregameBanProtectFrame00002000:setTopBottom( 0, 0, 501, 675 )
	PregameBanProtectFrame00002000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00002000 )
	self.PregameBanProtectFrame00002000 = PregameBanProtectFrame00002000
	
	local PregameBanProtectFrame000020000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000020000:setLeftRight( 0, 0, 976, 1096 )
	PregameBanProtectFrame000020000:setTopBottom( 0, 0, 501, 675 )
	PregameBanProtectFrame000020000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000020000 )
	self.PregameBanProtectFrame000020000 = PregameBanProtectFrame000020000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PregameBanProtectFrame0000:close()
		self.PregameBanProtectFrame00000:close()
		self.PregameBanProtectFrame00001:close()
		self.PregameBanProtectFrame000010:close()
		self.PregameBanProtectFrame000011:close()
		self.PregameBanProtectFrame0000100:close()
		self.PregameBanProtectFrame000012:close()
		self.PregameBanProtectFrame0000101:close()
		self.PregameBanProtectFrame0000110:close()
		self.PregameBanProtectFrame00002:close()
		self.PregameBanProtectFrame000020:close()
		self.PregameBanProtectFrame0000200:close()
		self.PregameBanProtectFrame00002000:close()
		self.PregameBanProtectFrame000020000:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

