-- 97883b325b00d6f61b0e4f5fc277cf30
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1112 )
	self:setTopBottom( true, false, 0, 450 )
	self.anyChildUsesUpdateState = true
	
	local PregameBanProtectFrame0000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000:setLeftRight( true, false, 408, 731 )
	PregameBanProtectFrame0000:setTopBottom( true, false, 0, 190 )
	PregameBanProtectFrame0000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000 )
	self.PregameBanProtectFrame0000 = PregameBanProtectFrame0000
	
	local PregameBanProtectFrame00000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00000:setLeftRight( true, false, 408, 731 )
	PregameBanProtectFrame00000:setTopBottom( true, false, 195, 275 )
	PregameBanProtectFrame00000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00000 )
	self.PregameBanProtectFrame00000 = PregameBanProtectFrame00000
	
	local PregameBanProtectFrame00001 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00001:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame00001:setTopBottom( true, false, 0, 60 )
	PregameBanProtectFrame00001:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00001 )
	self.PregameBanProtectFrame00001 = PregameBanProtectFrame00001
	
	local PregameBanProtectFrame000010 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000010:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame000010:setTopBottom( true, false, 65, 125 )
	PregameBanProtectFrame000010:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000010 )
	self.PregameBanProtectFrame000010 = PregameBanProtectFrame000010
	
	local PregameBanProtectFrame000011 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000011:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame000011:setTopBottom( true, false, 130, 190 )
	PregameBanProtectFrame000011:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000011 )
	self.PregameBanProtectFrame000011 = PregameBanProtectFrame000011
	
	local PregameBanProtectFrame0000100 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000100:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame0000100:setTopBottom( true, false, 195, 255 )
	PregameBanProtectFrame0000100:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000100 )
	self.PregameBanProtectFrame0000100 = PregameBanProtectFrame0000100
	
	local PregameBanProtectFrame000012 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000012:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame000012:setTopBottom( true, false, 260, 320 )
	PregameBanProtectFrame000012:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000012 )
	self.PregameBanProtectFrame000012 = PregameBanProtectFrame000012
	
	local PregameBanProtectFrame0000101 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000101:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame0000101:setTopBottom( true, false, 325, 385 )
	PregameBanProtectFrame0000101:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000101 )
	self.PregameBanProtectFrame0000101 = PregameBanProtectFrame0000101
	
	local PregameBanProtectFrame0000110 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000110:setLeftRight( true, false, 0, 374 )
	PregameBanProtectFrame0000110:setTopBottom( true, false, 390, 450 )
	PregameBanProtectFrame0000110:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000110 )
	self.PregameBanProtectFrame0000110 = PregameBanProtectFrame0000110
	
	local PregameBanProtectFrame00002 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00002:setLeftRight( true, false, 765, 1052 )
	PregameBanProtectFrame00002:setTopBottom( true, false, 0, 190 )
	PregameBanProtectFrame00002:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00002 )
	self.PregameBanProtectFrame00002 = PregameBanProtectFrame00002
	
	local PregameBanProtectFrame000020 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000020:setLeftRight( true, false, 765, 1052 )
	PregameBanProtectFrame000020:setTopBottom( true, false, 195, 450 )
	PregameBanProtectFrame000020:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000020 )
	self.PregameBanProtectFrame000020 = PregameBanProtectFrame000020
	
	local PregameBanProtectFrame0000200 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000200:setLeftRight( true, false, 408, 488 )
	PregameBanProtectFrame0000200:setTopBottom( true, false, 334, 450 )
	PregameBanProtectFrame0000200:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000200 )
	self.PregameBanProtectFrame0000200 = PregameBanProtectFrame0000200
	
	local PregameBanProtectFrame00002000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00002000:setLeftRight( true, false, 529.5, 609.5 )
	PregameBanProtectFrame00002000:setTopBottom( true, false, 334, 450 )
	PregameBanProtectFrame00002000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00002000 )
	self.PregameBanProtectFrame00002000 = PregameBanProtectFrame00002000
	
	local PregameBanProtectFrame000020000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000020000:setLeftRight( true, false, 651, 731 )
	PregameBanProtectFrame000020000:setTopBottom( true, false, 334, 450 )
	PregameBanProtectFrame000020000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000020000 )
	self.PregameBanProtectFrame000020000 = PregameBanProtectFrame000020000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PregameBanProtectFrame0000:close()
		element.PregameBanProtectFrame00000:close()
		element.PregameBanProtectFrame00001:close()
		element.PregameBanProtectFrame000010:close()
		element.PregameBanProtectFrame000011:close()
		element.PregameBanProtectFrame0000100:close()
		element.PregameBanProtectFrame000012:close()
		element.PregameBanProtectFrame0000101:close()
		element.PregameBanProtectFrame0000110:close()
		element.PregameBanProtectFrame00002:close()
		element.PregameBanProtectFrame000020:close()
		element.PregameBanProtectFrame0000200:close()
		element.PregameBanProtectFrame00002000:close()
		element.PregameBanProtectFrame000020000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

