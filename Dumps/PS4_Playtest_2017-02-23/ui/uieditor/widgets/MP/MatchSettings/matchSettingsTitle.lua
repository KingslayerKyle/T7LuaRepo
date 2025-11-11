require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

CoD.matchSettingsTitle = InheritFrom( LUI.UIElement )
CoD.matchSettingsTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.matchSettingsTitle )
	self.id = "matchSettingsTitle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 673 )
	self:setTopBottom( 0, 0, 0, 52 )
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( menu, controller )
	TitleBox:setLeftRight( 0, 0, 0, 674 )
	TitleBox:setTopBottom( 0, 0, 0, 52 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

