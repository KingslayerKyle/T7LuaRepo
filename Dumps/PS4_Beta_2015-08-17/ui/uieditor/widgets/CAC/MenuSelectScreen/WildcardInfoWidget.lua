require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.WildcardInfoWidget = InheritFrom( LUI.UIElement )
CoD.WildcardInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardInfoWidget )
	self.id = "WildcardInfoWidget"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 113 )
	self.anyChildUsesUpdateState = true
	
	local cacButtonBoxLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke:setLeftRight( true, true, 4, -1 )
	cacButtonBoxLrgInactiveStroke:setTopBottom( true, false, 30, 93 )
	self:addElement( cacButtonBoxLrgInactiveStroke )
	self.cacButtonBoxLrgInactiveStroke = cacButtonBoxLrgInactiveStroke
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( true, false, 11, 226 )
	descText:setTopBottom( true, false, 38.5, 54.5 )
	descText:setTTF( "fonts/escom.ttf" )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	descText:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descText:setText( Engine.Localize( GetUnlockDescription( controller, modelValue ) ) )
		end
	end )
	self:addElement( descText )
	self.descText = descText
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 4, 0 )
	TitleGlow1:setTopBottom( true, true, 4, -78 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0.85 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 11, 133 )
	nameLabel:setTopBottom( true, false, 7, 32 )
	nameLabel:setRGB( 0, 0, 0 )
	nameLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cacButtonBoxLrgInactiveStroke:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke:setAlpha( 1 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke, {} )
				descText:completeAnimation()
				self.descText:setAlpha( 1 )
				self.clipFinished( descText, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
			end
		},
		NameOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cacButtonBoxLrgInactiveStroke:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke, {} )
				descText:completeAnimation()
				self.descText:setAlpha( 0 )
				self.clipFinished( descText, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacButtonBoxLrgInactiveStroke:close()
		self.TitleGlow1:close()
		self.descText:close()
		self.nameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

