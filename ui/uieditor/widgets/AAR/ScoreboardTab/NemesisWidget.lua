-- d1cfc0cf28028203f3e80df3981d203f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisScoreWidget" )

CoD.NemesisWidget = InheritFrom( LUI.UIElement )
CoD.NemesisWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.NemesisWidget )
	self.id = "NemesisWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 228 )
	self:setTopBottom( true, false, 0, 102 )
	self.anyChildUsesUpdateState = true
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, false, 19, 170 )
	FEListHeaderGlow0:setTopBottom( true, false, -10.5, 12.5 )
	FEListHeaderGlow0:setRGB( 0.7, 0.07, 0.07 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local KilledBy = CoD.NemesisScoreWidget.new( menu, controller )
	KilledBy:setLeftRight( true, false, 95, 170 )
	KilledBy:setTopBottom( true, false, 13.5, 66.5 )
	KilledBy.ScoreTitle:setText( Engine.Localize( "MPUI_KILLED_BY_PRE_CAPS" ) )
	KilledBy:subscribeToGlobalModel( controller, "Scoreboard", "nemesisKilledBy", function ( model )
		local nemesisKilledBy = Engine.GetModelValue( model )
		if nemesisKilledBy then
			KilledBy.Score:setText( Engine.Localize( nemesisKilledBy ) )
		end
	end )
	self:addElement( KilledBy )
	self.KilledBy = KilledBy
	
	local Killed = CoD.NemesisScoreWidget.new( menu, controller )
	Killed:setLeftRight( true, false, 20, 95 )
	Killed:setTopBottom( true, false, 13.5, 66.5 )
	Killed.ScoreTitle:setText( Engine.Localize( "MENU_KILLED_CAPS" ) )
	Killed:subscribeToGlobalModel( controller, "Scoreboard", "nemesisKills", function ( model )
		local nemesisKills = Engine.GetModelValue( model )
		if nemesisKills then
			Killed.Score:setText( Engine.Localize( nemesisKills ) )
		end
	end )
	self:addElement( Killed )
	self.Killed = Killed
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -5.5, 194.5 )
	Glow:setTopBottom( true, false, -32, 40 )
	Glow:setRGB( 1, 0, 0 )
	Glow:setAlpha( 0.21 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 28, 125.5 )
	TextBox0:setTopBottom( true, false, -8, 11.5 )
	TextBox0:setRGB( 0, 0, 0 )
	TextBox0:setText( Engine.Localize( "MPUI_NEMESIS_TITLE_CAPS" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setLetterSpacing( 0.4 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -1, 20 )
	Arrow:setTopBottom( true, false, -10.5, 10.5 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_aar_redarrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Skull2 = LUI.UIImage.new()
	Skull2:setLeftRight( true, false, 125.5, 170.5 )
	Skull2:setTopBottom( true, false, -30.5, 14.5 )
	Skull2:setImage( RegisterImage( "uie_t7_headicon_dead" ) )
	self:addElement( Skull2 )
	self.Skull2 = Skull2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				TextBox0:completeAnimation()
				self.TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( TextBox0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DefaultStateArabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow0:close()
		element.KilledBy:close()
		element.Killed:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

