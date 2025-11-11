CoD.Competitive_CharacterDraft_CharacterSelection = InheritFrom( LUI.UIElement )
CoD.Competitive_CharacterDraft_CharacterSelection.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_CharacterDraft_CharacterSelection )
	self.id = "Competitive_CharacterDraft_CharacterSelection"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local HeroLobbyClientExtraCamRender = LUI.UIImage.new()
	HeroLobbyClientExtraCamRender:setLeftRight( 0, 1, 0, 0 )
	HeroLobbyClientExtraCamRender:setTopBottom( 0, 1, 0, 0 )
	HeroLobbyClientExtraCamRender:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	HeroLobbyClientExtraCamRender:setShaderVector( 0, 0.19, 0, 0.18, 0.53 )
	self:addElement( HeroLobbyClientExtraCamRender )
	self.HeroLobbyClientExtraCamRender = HeroLobbyClientExtraCamRender
	
	self.HeroLobbyClientExtraCamRender:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HeroLobbyClientExtraCamRender:setupCharacterExtraCamRenderForLobbyClient( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.HeroLobbyClientExtraCamRender:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

