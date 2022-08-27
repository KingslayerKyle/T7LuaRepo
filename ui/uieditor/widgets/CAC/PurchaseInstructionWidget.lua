-- 1c5de362b5b7af6d4bb9553c34e73202
-- This hash is used for caching, delete to decompile the file again

CoD.PurchaseInstructionWidget = InheritFrom( LUI.UIElement )
CoD.PurchaseInstructionWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PurchaseInstructionWidget )
	self.id = "PurchaseInstructionWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 100 )
	
	local TokenImage = LUI.UIImage.new()
	TokenImage:setLeftRight( false, true, -44, 0 )
	TokenImage:setTopBottom( true, false, 0, 48 )
	TokenImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	TokenImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TokenImage )
	self.TokenImage = TokenImage
	
	local PurchaseInstruction = LUI.UIText.new()
	PurchaseInstruction:setLeftRight( false, true, -350, 0 )
	PurchaseInstruction:setTopBottom( true, false, 66, 88 )
	PurchaseInstruction:setText( Engine.Localize( "MENU_NEW" ) )
	PurchaseInstruction:setTTF( "fonts/escom.ttf" )
	PurchaseInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PurchaseInstruction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PurchaseInstruction )
	self.PurchaseInstruction = PurchaseInstruction
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

