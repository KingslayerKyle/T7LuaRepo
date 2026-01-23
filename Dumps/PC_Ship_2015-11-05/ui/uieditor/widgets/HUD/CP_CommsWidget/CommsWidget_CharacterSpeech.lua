CoD.CommsWidget_CharacterSpeech = InheritFrom( LUI.UIElement )
CoD.CommsWidget_CharacterSpeech.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_CharacterSpeech )
	self.id = "CommsWidget_CharacterSpeech"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 21 )
	self:setTopBottom( true, false, 0, 21 )
	
	local ImgComms = LUI.UIImage.new()
	ImgComms:setLeftRight( true, false, 0, 21 )
	ImgComms:setTopBottom( true, false, 0, 21 )
	ImgComms:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_icon_speech" ) )
	ImgComms:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ImgComms )
	self.ImgComms = ImgComms
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

