require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.overCapacityScorestreakInfo = InheritFrom( LUI.UIElement )
CoD.overCapacityScorestreakInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.overCapacityScorestreakInfo )
	self.id = "overCapacityScorestreakInfo"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( 0, 0, 0, 498 )
	self:setTopBottom( 0, 0, 0, 133 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, -4, -204 )
	TitleGlow1:setTopBottom( 0, 1, 8, -80 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0.7 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local cacButtonBoxLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke:setLeftRight( 0, 1, -2, -206 )
	cacButtonBoxLrgInactiveStroke:setTopBottom( 0, 0, 48, 122 )
	self:addElement( cacButtonBoxLrgInactiveStroke )
	self.cacButtonBoxLrgInactiveStroke = cacButtonBoxLrgInactiveStroke
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( 0, 1, 14, 0 )
	descText:setTopBottom( 0.5, 0.5, -9, 15 )
	descText:setTTF( "fonts/escom.ttf" )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	descText:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descText:setText( LocalizeIntoString( "MENU_SCORE_REQUIRED", GetScorestreakMomentumFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( descText )
	self.descText = descText
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( 0, 0, 14, 197 )
	nameLabel:setTopBottom( 0, 0, 12, 50 )
	nameLabel:setRGB( 0, 0, 0 )
	nameLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nameLabel:setLetterSpacing( 0.5 )
	nameLabel:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	self.resetProperties = function ()
		descText:completeAnimation()
		descText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NameOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				descText:completeAnimation()
				self.descText:setAlpha( 0 )
				self.clipFinished( descText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
		self.cacButtonBoxLrgInactiveStroke:close()
		self.descText:close()
		self.nameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

