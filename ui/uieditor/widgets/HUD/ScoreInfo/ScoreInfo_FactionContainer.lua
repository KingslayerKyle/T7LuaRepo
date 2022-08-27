-- 37f50a7f53b624060a24321b0793cc4b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_Emblem" )

CoD.ScoreInfo_FactionContainer = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_FactionContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_FactionContainer )
	self.id = "ScoreInfo_FactionContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 73 )
	
	local MaskGlow = LUI.UIImage.new()
	MaskGlow:setLeftRight( false, false, -45.5, 43.5 )
	MaskGlow:setTopBottom( false, false, -44, 45 )
	MaskGlow:setRGB( 0, 0, 0 )
	MaskGlow:setAlpha( 0.5 )
	MaskGlow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( MaskGlow )
	self.MaskGlow = MaskGlow
	
	local Emblem = CoD.ScoreInfo_Emblem.new( menu, controller )
	Emblem:setLeftRight( false, false, -31.5, 31.5 )
	Emblem:setTopBottom( false, false, -19.25, 19.25 )
	Emblem:setAlpha( 0 )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local factionalliesAdd = LUI.UIImage.new()
	factionalliesAdd:setLeftRight( true, false, -7, 79 )
	factionalliesAdd:setTopBottom( true, false, -6, 80 )
	factionalliesAdd:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1_widget" ) )
	factionalliesAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( factionalliesAdd )
	self.factionalliesAdd = factionalliesAdd
	
	local factionaxisAdd = LUI.UIImage.new()
	factionaxisAdd:setLeftRight( true, false, -8.5, 79.5 )
	factionaxisAdd:setTopBottom( true, false, -8.5, 79.5 )
	factionaxisAdd:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction2_widget" ) )
	factionaxisAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( factionaxisAdd )
	self.factionaxisAdd = factionaxisAdd
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 0 )
				self.clipFinished( Emblem, {} )
				factionalliesAdd:completeAnimation()
				self.factionalliesAdd:setAlpha( 0 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setAlpha( 0 )
				self.clipFinished( factionaxisAdd, {} )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.69 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 1 )
				self.clipFinished( Emblem, {} )
				factionalliesAdd:completeAnimation()
				self.factionalliesAdd:setLeftRight( true, false, -7, 79 )
				self.factionalliesAdd:setTopBottom( true, false, -6, 80 )
				self.factionalliesAdd:setAlpha( 0 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setAlpha( 0 )
				self.clipFinished( factionaxisAdd, {} )
			end
		},
		Faction1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 0 )
				self.clipFinished( Emblem, {} )
				factionalliesAdd:completeAnimation()
				self.factionalliesAdd:setLeftRight( true, false, -7, 79 )
				self.factionalliesAdd:setTopBottom( true, false, -6, 80 )
				self.factionalliesAdd:setAlpha( 1 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setLeftRight( true, false, -8.5, 79.5 )
				self.factionaxisAdd:setTopBottom( true, false, -8.5, 79.5 )
				self.factionaxisAdd:setAlpha( 0 )
				self.clipFinished( factionaxisAdd, {} )
			end
		},
		Faction2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 0 )
				self.clipFinished( Emblem, {} )
				factionalliesAdd:completeAnimation()
				self.factionalliesAdd:setLeftRight( true, false, -7, 79 )
				self.factionalliesAdd:setTopBottom( true, false, -6, 80 )
				self.factionalliesAdd:setAlpha( 0 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setLeftRight( true, false, -8.5, 79.5 )
				self.factionaxisAdd:setTopBottom( true, false, -8.5, 79.5 )
				self.factionaxisAdd:setAlpha( 1 )
				self.clipFinished( factionaxisAdd, {} )
			end
		},
		Faction1CodCast = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 0 )
				self.clipFinished( Emblem, {} )
				factionalliesAdd:completeAnimation()
				self.factionalliesAdd:setLeftRight( true, false, -34.5, 105.5 )
				self.factionalliesAdd:setTopBottom( true, false, -6, 80 )
				self.factionalliesAdd:setAlpha( 1 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setLeftRight( true, false, -34.5, 105.5 )
				self.factionaxisAdd:setTopBottom( true, false, -8.5, 79.5 )
				self.factionaxisAdd:setAlpha( 0 )
				self.clipFinished( factionaxisAdd, {} )
			end
		},
		Faction2CodCast = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 0 )
				self.clipFinished( Emblem, {} )
				factionalliesAdd:completeAnimation()
				self.factionalliesAdd:setLeftRight( true, false, -34.5, 105.5 )
				self.factionalliesAdd:setTopBottom( true, false, -6, 80 )
				self.factionalliesAdd:setAlpha( 0 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setLeftRight( true, false, -34.5, 105.5 )
				self.factionaxisAdd:setTopBottom( true, false, -8.5, 79.5 )
				self.factionaxisAdd:setAlpha( 1 )
				self.clipFinished( factionaxisAdd, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return not IsTeamBasedOrInfect( controller )
			end
		},
		{
			stateName = "Faction1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "allies" ) and not IsCodCaster( controller )
			end
		},
		{
			stateName = "Faction2",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "axis" ) and not IsCodCaster( controller )
			end
		},
		{
			stateName = "Faction1CodCast",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "allies" )
			end
		},
		{
			stateName = "Faction2CodCast",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "axis" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MapVote.mapVoteMapPreviousGametype"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.playerFactionName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.playerFactionName"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

