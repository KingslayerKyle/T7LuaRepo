CoD.Notification_Bonus = InheritFrom( LUI.UIElement )
CoD.Notification_Bonus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_Bonus )
	self.id = "Notification_Bonus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 45 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, false, 0, 45 )
	Background:setRGB( 0, 0, 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, true, 0, 0 )
	Desc:setTopBottom( true, false, 25, 45 )
	Desc:setRGB( 1, 1, 1 )
	Desc:setText( Engine.Localize( "Beacon Must Not Take Damage." ) )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local TitleActive = LUI.UIText.new()
	TitleActive:setLeftRight( false, true, -65.5, 0 )
	TitleActive:setTopBottom( true, false, 0, 25 )
	TitleActive:setRGB( 1, 1, 1 )
	TitleActive:setText( Engine.Localize( "SM_BONUS_OBJ" ) )
	TitleActive:setTTF( "fonts/default.ttf" )
	TitleActive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TitleActive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleActive )
	self.TitleActive = TitleActive
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( false, true, -90.5, -65.5 )
	Icon:setTopBottom( true, false, 0, 25 )
	Icon:setRGB( 1, 1, 1 )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local TitleFail = LUI.UIText.new()
	TitleFail:setLeftRight( false, true, -65.5, 0 )
	TitleFail:setTopBottom( true, false, 0, 25 )
	TitleFail:setRGB( 1, 1, 1 )
	TitleFail:setText( Engine.Localize( "EM_FAIL" ) )
	TitleFail:setTTF( "fonts/default.ttf" )
	TitleFail:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TitleFail:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TitleFail )
	self.TitleFail = TitleFail
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

