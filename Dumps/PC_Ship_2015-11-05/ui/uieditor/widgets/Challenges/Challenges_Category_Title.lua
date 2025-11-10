require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )

CoD.Challenges_Category_Title = InheritFrom( LUI.UIElement )
CoD.Challenges_Category_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_Category_Title )
	self.id = "Challenges_Category_Title"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, true, 50, 0 )
	titleText:setTopBottom( false, false, -17, 17 )
	titleText:setText( Engine.Localize( "MPUI_TITLE_CAPS" ) )
	titleText:setTTF( "fonts/escom.ttf" )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titleText )
	self.titleText = titleText
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( true, false, -40, 40 )
	PercentCompleteWidget:setTopBottom( false, false, -40, 40 )
	PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	PercentCompleteWidget.percentText:setText( Engine.Localize( "50%" ) )
	LUI.OverrideFunction_CallOriginalFirst( PercentCompleteWidget, "setState", function ( element, controller )
		if IsElementInState( element, "Complete" ) then
			SetState( self, "Complete" )
		end
	end )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PercentCompleteWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

