require( "ui.uieditor.widgets.AAR.ScoreboardTab.NemesisScoreWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

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
	self:setLeftRight( 0, 0, 0, 342 )
	self:setTopBottom( 0, 0, 0, 153 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( 0, 0, 28, 255 )
	FEListHeaderGlow0:setTopBottom( 0, 0, 18, 52 )
	FEListHeaderGlow0:setRGB( 0.7, 0.07, 0.07 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local KilledBy = CoD.NemesisScoreWidget.new( menu, controller )
	KilledBy:setLeftRight( 0, 0, 142, 255 )
	KilledBy:setTopBottom( 0, 0, 54, 134 )
	KilledBy.ScoreTitle:setText( Engine.Localize( "MPUI_KILLED_BY_PRE_CAPS" ) )
	KilledBy:subscribeToGlobalModel( controller, "Scoreboard", "nemesisKilledBy", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			KilledBy.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( KilledBy )
	self.KilledBy = KilledBy
	
	local Killed = CoD.NemesisScoreWidget.new( menu, controller )
	Killed:setLeftRight( 0, 0, 30, 143 )
	Killed:setTopBottom( 0, 0, 54, 134 )
	Killed.ScoreTitle:setText( Engine.Localize( "MENU_KILLED_CAPS" ) )
	Killed:subscribeToGlobalModel( controller, "Scoreboard", "nemesisKills", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Killed.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Killed )
	self.Killed = Killed
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, -8, 292 )
	Glow:setTopBottom( 0, 0, -14, 94 )
	Glow:setRGB( 1, 0, 0 )
	Glow:setAlpha( 0.21 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 42, 188 )
	TextBox0:setTopBottom( 0, 0, 22, 51 )
	TextBox0:setRGB( 0, 0, 0 )
	TextBox0:setText( Engine.Localize( "MPUI_NEMESIS_TITLE_CAPS" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setLetterSpacing( 0.4 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, -2, 30 )
	Arrow:setTopBottom( 0, 0, 18, 50 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_aar_redarrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Skull2 = LUI.UIImage.new()
	Skull2:setLeftRight( 0, 0, 188, 256 )
	Skull2:setTopBottom( 0, 0, -12, 56 )
	Skull2:setImage( RegisterImage( "uie_t7_headicon_dead" ) )
	self:addElement( Skull2 )
	self.Skull2 = Skull2
	
	self.resetProperties = function ()
		TextBox0:completeAnimation()
		TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DefaultStateArabic = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListHeaderGlow0:close()
		self.KilledBy:close()
		self.Killed:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

