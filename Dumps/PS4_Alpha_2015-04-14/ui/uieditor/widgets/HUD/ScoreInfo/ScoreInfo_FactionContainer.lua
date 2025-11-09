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
	MaskGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MaskGlow )
	self.MaskGlow = MaskGlow
	
	local Emblem = CoD.ScoreInfo_Emblem.new( menu, controller )
	Emblem:setLeftRight( false, false, -36, 36 )
	Emblem:setTopBottom( false, false, -22.67, 21.34 )
	Emblem:setRGB( 1, 1, 1 )
	Emblem:setAlpha( 0 )
	Emblem:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local factionalliesAdd = LUI.UIImage.new()
	factionalliesAdd:setLeftRight( true, false, -7, 79 )
	factionalliesAdd:setTopBottom( true, false, -6, 80 )
	factionalliesAdd:setRGB( 1, 1, 1 )
	factionalliesAdd:setImage( RegisterImage( "uie_t7_mp_hud_faction_icon_faction1_widget" ) )
	factionalliesAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( factionalliesAdd )
	self.factionalliesAdd = factionalliesAdd
	
	local factionaxisAdd = LUI.UIImage.new()
	factionaxisAdd:setLeftRight( true, false, -8.5, 79.5 )
	factionaxisAdd:setTopBottom( true, false, -8.5, 79.5 )
	factionaxisAdd:setRGB( 1, 1, 1 )
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
				self:setupElementClipCounter( 2 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				Emblem:completeAnimation()
				self.Emblem:setAlpha( 1 )
				self.clipFinished( Emblem, {} )
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
				self.factionalliesAdd:setAlpha( 1 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
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
				self.factionalliesAdd:setAlpha( 0 )
				self.clipFinished( factionalliesAdd, {} )
				factionaxisAdd:completeAnimation()
				self.factionaxisAdd:setAlpha( 1 )
				self.clipFinished( factionaxisAdd, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "free" )
			end
		},
		{
			stateName = "Faction1",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "allies" )
			end
		},
		{
			stateName = "Faction2",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "factions.playerFactionName", "axis" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.playerFactionName" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.playerFactionName"
		} )
	end )
	self.close = function ( self )
		self.Emblem:close()
		CoD.ScoreInfo_FactionContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

