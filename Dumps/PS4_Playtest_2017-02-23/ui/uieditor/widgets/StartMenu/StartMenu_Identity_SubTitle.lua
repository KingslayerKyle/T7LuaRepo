require( "ui.uieditor.widgets.CAC.NewBreadcrumb" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.StartMenu_Identity_SubTitle = InheritFrom( LUI.UIElement )
CoD.StartMenu_Identity_SubTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Identity_SubTitle )
	self.id = "StartMenu_Identity_SubTitle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 672 )
	self:setTopBottom( 0, 0, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel0:setTopBottom( 0, 1, 3, -3 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local SubTitle = LUI.UIText.new()
	SubTitle:setLeftRight( 0, 1, 10, -10 )
	SubTitle:setTopBottom( 0, 0, 3, 33 )
	SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:setLetterSpacing( 0.5 )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SubTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	local newIcon = CoD.NewBreadcrumb.new( menu, controller )
	newIcon:setLeftRight( 1, 1, 0, 18 )
	newIcon:setTopBottom( 0.5, 0.5, -9, 9 )
	newIcon:setAlpha( 0 )
	self:addElement( newIcon )
	self.newIcon = newIcon
	
	self.resetProperties = function ()
		newIcon:completeAnimation()
		FEButtonPanel0:completeAnimation()
		newIcon:setAlpha( 0 )
		FEButtonPanel0:setLeftRight( 0, 1, 0, 0 )
		FEButtonPanel0:setTopBottom( 0, 1, 3, -3 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		HasNew = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( 0, 1, 0, 20 )
				self.FEButtonPanel0:setTopBottom( 0, 1, 3, -3 )
				self.clipFinished( FEButtonPanel0, {} )
				newIcon:completeAnimation()
				self.newIcon:setAlpha( 1 )
				self.clipFinished( newIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HasNew",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
		self.newIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

