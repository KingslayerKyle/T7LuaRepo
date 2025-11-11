CoD.CombatRecordStatListHeader = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatListHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatListHeader )
	self.id = "CombatRecordStatListHeader"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 438 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( 0, 0, 0, 72 )
	WeaponLabel:setTopBottom( 0, 1, 0, 0 )
	WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatComparisonLabel = LUI.UIText.new()
	StatComparisonLabel:setLeftRight( 1, 1, -105, 0 )
	StatComparisonLabel:setTopBottom( 0, 1, 0, 0 )
	StatComparisonLabel:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	StatComparisonLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatComparisonLabel:setTTF( "fonts/default.ttf" )
	StatComparisonLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatComparisonLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatComparisonLabel )
	self.StatComparisonLabel = StatComparisonLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( 1, 1, -187, -82 )
	StatLabel:setTopBottom( 0, 1, 0, 0 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	self.resetProperties = function ()
		StatComparisonLabel:completeAnimation()
		StatLabel:completeAnimation()
		StatComparisonLabel:setAlpha( 1 )
		StatLabel:setLeftRight( 1, 1, -187, -82 )
		StatLabel:setTopBottom( 0, 1, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				StatComparisonLabel:completeAnimation()
				self.StatComparisonLabel:setAlpha( 0 )
				self.clipFinished( StatComparisonLabel, {} )
				StatLabel:completeAnimation()
				self.StatLabel:setLeftRight( 1, 1, -105, 0 )
				self.StatLabel:setTopBottom( 0, 1, -0.5, -0.5 )
				self.clipFinished( StatLabel, {} )
			end
		},
		Comparison = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StatLabel:completeAnimation()
				self.StatLabel:setLeftRight( 1, 1, -174, -69 )
				self.StatLabel:setTopBottom( 0, 1, -0.5, -0.5 )
				self.clipFinished( StatLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Comparison",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

