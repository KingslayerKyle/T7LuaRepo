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
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local TokenImage = LUI.UIImage.new()
	TokenImage:setLeftRight( 1, 1, -66, 0 )
	TokenImage:setTopBottom( 0, 0, 0, 72 )
	TokenImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	TokenImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TokenImage )
	self.TokenImage = TokenImage
	
	local PurchaseInstruction = LUI.UIText.new()
	PurchaseInstruction:setLeftRight( 1, 1, -525, 0 )
	PurchaseInstruction:setTopBottom( 0, 0, 99, 132 )
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

