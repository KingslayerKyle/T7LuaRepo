require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )

CoD.MissionRecordVault_PerformanceCollectible = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_PerformanceCollectible.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_PerformanceCollectible )
	self.id = "MissionRecordVault_PerformanceCollectible"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 105 )
	self:setTopBottom( true, false, 0, 95 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0.2 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 105 )
	Image0:setTopBottom( true, false, 0, 97 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 107 )
	TextBox0:setTopBottom( true, false, 0, 95 )
	TextBox0:setText( Engine.Localize( "?" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.Image0:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Unlocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Unlocked",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "unlocked" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveStroke:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.Image0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

