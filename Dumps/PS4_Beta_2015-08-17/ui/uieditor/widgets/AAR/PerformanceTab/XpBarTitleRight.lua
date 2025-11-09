require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.XpBarTitleRight = InheritFrom( LUI.UIElement )
CoD.XpBarTitleRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.XpBarTitleRight )
	self.id = "XpBarTitleRight"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 252 )
	self:setTopBottom( true, false, 0, 25 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, -3 )
	FEButtonPanel0:setTopBottom( true, true, 2, -1.95 )
	FEButtonPanel0:setRGB( 0.24, 0.24, 0.26 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( false, true, -252, -8 )
	SubTitle:setTopBottom( false, false, -10, 10 )
	SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 2 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

