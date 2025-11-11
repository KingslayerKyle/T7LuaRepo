CoD.ScoreboardPlayerDetails_Data = InheritFrom( LUI.UIElement )
CoD.ScoreboardPlayerDetails_Data.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPlayerDetails_Data )
	self.id = "ScoreboardPlayerDetails_Data"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 181 )
	self:setTopBottom( 0, 0, 0, 102 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.69, 0.74, 0.76 )
	Background:setAlpha( 0.05 )
	self:addElement( Background )
	self.Background = Background
	
	local Background2 = LUI.UIImage.new()
	Background2:setLeftRight( 0, 1, 0, 0 )
	Background2:setTopBottom( 0, 0.64, 0, 0 )
	Background2:setRGB( 0.69, 0.74, 0.76 )
	Background2:setAlpha( 0.05 )
	self:addElement( Background2 )
	self.Background2 = Background2
	
	local Data = LUI.UIText.new()
	Data:setLeftRight( 0, 1, 0, 0 )
	Data:setTopBottom( 0.14, 0.5, 0, 0 )
	Data:setText( Engine.Localize( "MENU_NEW" ) )
	Data:setTTF( "fonts/default.ttf" )
	Data:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Data:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Data )
	self.Data = Data
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( 0, 1, 0, 0 )
	Name:setTopBottom( 0.67, 0.99, 0, 0 )
	Name:setAlpha( 0.3 )
	Name:setText( Engine.Localize( "MENU_NEW" ) )
	Name:setTTF( "fonts/default.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Name )
	self.Name = Name
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

