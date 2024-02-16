require( "ui.uieditor.widgets.Border" )

CoD.StartMenu_Party_Search = InheritFrom( LUI.UIElement )
CoD.StartMenu_Party_Search.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Party_Search )
	self.id = "StartMenu_Party_Search"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 383 )
	self:setTopBottom( true, false, 0, 370 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 7, 116 )
	Icon:setTopBottom( true, false, 171.92, 280.92 )
	Icon:setAlpha( 0.49 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 383 )
	Background:setTopBottom( true, false, 0, 370.17 )
	Background:setAlpha( 0.2 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 20.04, 383 )
	Title:setTopBottom( true, false, 292.3, 328.3 )
	Title:setText( Engine.Localize( "Look for Party" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 20.04, 383 )
	Subtitle:setTopBottom( true, false, 333.3, 353.17 )
	Subtitle:setText( Engine.Localize( "Find a Party, Join them, and play together." ) )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( true, false, 124, 383 )
	Count:setTopBottom( true, false, 217.17, 239.04 )
	Count:setRGB( 1, 0.8, 0.4 )
	Count:setText( Engine.Localize( "1,250 Parties" ) )
	Count:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Count )
	self.Count = Count
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Border:completeAnimation()
				self.Border:setRGB( 1, 1, 1 )
				self.clipFinished( Border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				Border:completeAnimation()
				self.Border:setRGB( 1, 0.56, 0 )
				self.clipFinished( Border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

