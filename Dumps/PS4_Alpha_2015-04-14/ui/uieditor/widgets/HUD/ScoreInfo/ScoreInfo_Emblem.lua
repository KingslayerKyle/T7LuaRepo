CoD.ScoreInfo_Emblem = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_Emblem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_Emblem )
	self.id = "ScoreInfo_Emblem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 44 )
	
	local ImgEmblem = LUI.UIImage.new()
	ImgEmblem:setLeftRight( false, false, -36, 36 )
	ImgEmblem:setTopBottom( false, false, -22, 22 )
	ImgEmblem:setRGB( 1, 1, 1 )
	ImgEmblem:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_emblemtemp" ) )
	ImgEmblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgEmblem )
	self.ImgEmblem = ImgEmblem
	
	local SidemaskL = LUI.UIImage.new()
	SidemaskL:setLeftRight( false, false, -36, -20 )
	SidemaskL:setTopBottom( false, false, -22, 22 )
	SidemaskL:setRGB( 1, 1, 1 )
	SidemaskL:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_emblemmask" ) )
	SidemaskL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( SidemaskL )
	self.SidemaskL = SidemaskL
	
	local SidemaskR = LUI.UIImage.new()
	SidemaskR:setLeftRight( false, false, 20, 36 )
	SidemaskR:setTopBottom( false, false, -22, 22 )
	SidemaskR:setRGB( 1, 1, 1 )
	SidemaskR:setYRot( -180 )
	SidemaskR:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_emblemmask" ) )
	SidemaskR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( SidemaskR )
	self.SidemaskR = SidemaskR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

