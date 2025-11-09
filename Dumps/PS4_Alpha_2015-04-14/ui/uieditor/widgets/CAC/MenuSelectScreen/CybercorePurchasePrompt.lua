CoD.CybercorePurchasePrompt = InheritFrom( LUI.UIElement )
CoD.CybercorePurchasePrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercorePurchasePrompt )
	self.id = "CybercorePurchasePrompt"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 20 )
	
	local actionBacking = LUI.UIImage.new()
	actionBacking:setLeftRight( true, true, 0, 0 )
	actionBacking:setTopBottom( true, true, 0, 0 )
	actionBacking:setRGB( 0, 0, 0 )
	actionBacking:setAlpha( 0.8 )
	actionBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( actionBacking )
	self.actionBacking = actionBacking
	
	local prompt = LUI.UIText.new()
	prompt:setLeftRight( true, true, 0, 0 )
	prompt:setTopBottom( false, false, -10, 10 )
	prompt:setRGB( 1, 1, 1 )
	prompt:setText( Engine.Localize( "" ) )
	prompt:setTTF( "fonts/default.ttf" )
	prompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	prompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( prompt )
	self.prompt = prompt
	
	local tokenImage = LUI.UIImage.new()
	tokenImage:setLeftRight( false, true, -20, 0 )
	tokenImage:setTopBottom( false, true, -20, 0 )
	tokenImage:setRGB( 1, 1, 1 )
	tokenImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge" ) )
	tokenImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( tokenImage )
	self.tokenImage = tokenImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

