require( "ui.uieditor.widgets.Border" )

CoD.StartMenu_Party_Button_LG = InheritFrom( LUI.UIElement )
CoD.StartMenu_Party_Button_LG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Party_Button_LG )
	self.id = "StartMenu_Party_Button_LG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 523 )
	self:setTopBottom( 0, 0, 0, 195 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Option = LUI.UIText.new()
	Option:setLeftRight( 0, 1, 12, 0 )
	Option:setTopBottom( 1, 1, -45, -13 )
	Option:setText( Engine.Localize( "MPUI_LOBBY_PRIVACY" ) )
	Option:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Option:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Option:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Option )
	self.Option = Option
	
	local SelectedOption = LUI.UIText.new()
	SelectedOption:setLeftRight( 0, 1, 0, 0 )
	SelectedOption:setTopBottom( 0, 0, 62, 116 )
	SelectedOption:setRGB( 1, 0.8, 0.4 )
	SelectedOption:setText( Engine.Localize( "MENU_PARTY_PRIVACY_FRIENDS_ONLY" ) )
	SelectedOption:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	SelectedOption:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SelectedOption:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SelectedOption )
	self.SelectedOption = SelectedOption
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( 0, 1, 0, 0 )
	Border0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	self.resetProperties = function ()
		Border0:completeAnimation()
		Border0:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Border0:completeAnimation()
				self.Border0:setRGB( 1, 0.66, 0 )
				self.clipFinished( Border0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

